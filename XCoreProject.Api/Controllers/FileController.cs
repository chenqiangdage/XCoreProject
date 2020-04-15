using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Model;
using System.IO;
using XCoreProject.Api.Common.Common;
using XCoreProject.Api.Common.AliYun;
using XCoreProject.Api.Model.Dto;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Common.Helper;
using Microsoft.AspNetCore.Hosting;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        readonly IFileCenterServices _fileCenterServices;
        readonly ICacheHelper _cacheHelper;
        IWebHostEnvironment _env;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="IFileCenterServices"></param>
        /// <param name="userRoleServices"></param>
        /// <param name="roleServices"></param>
        public FileController(IFileCenterServices fileCenterServices, ICacheHelper IcacheHelper, IWebHostEnvironment env)
        {
            this._fileCenterServices = fileCenterServices;
            _cacheHelper = IcacheHelper;
            _env = env;
        }

        [HttpPost]
        public async  Task<MessageModel<UploadFileModel>> PushPic()
        {
            var data = new MessageModel<UploadFileModel>();
            int currentIndex = 1;
            UploadFileModel upfileModels = new UploadFileModel();
            string batchId = Request.Form["batchId"];
            //先检查有没有batchid,如果有，说明已开始存入过，那么不需要new batchid
            if (string.IsNullOrEmpty(batchId))
            {
                batchId = IdCreatorHelper.CreateId("treeSupp_");
            }else
            {
                //找到此batchid 已累计增加的index ,用缓存缓住
                string currindex =_cacheHelper.Get<string>(batchId);
                currentIndex = int.Parse(string.IsNullOrEmpty(currindex)?"1":currindex);
            }
             
            IFormFileCollection cols = Request.Form.Files;       
            if (cols == null || cols.Count == 0)
            {
                data.msg= "没有上传文件";
                return data;
            }
            //上传到oss
            string AliossFolder = DateTime.Now.ToString("yyyyMMddHH");
            List<FileCenter> dbfiles = new List<FileCenter>();
            upfileModels.BatchId = batchId;
            List<IFormFile> postFiles = cols.ToList();
            for(int i=0;i<postFiles.Count;i++)
            {
                var tfile = postFiles[i];

                string fileName = AliossFolder + "/" + IdCreatorHelper.CreateIdNoTimestrap("pubtree", 6) + ".jpg";
                AliYunOss.Instance.PutFileToOss(tfile.OpenReadStream(), fileName);               
                FileCenter f = new FileCenter();
                if (currentIndex == 1)//默认第一个设置缩略图，设为主图 
                {
                    string filethumbName = IdCreatorHelper.CreateIdNoTimestrap("thumbpubtree", 6) + ".jpg";
                    FileCenter  thumbfile =await  CreateThumb(tfile, batchId, AliossFolder+"/"+filethumbName);
                    dbfiles.Add(thumbfile);
                    upfileModels.ThumbnailUrl = thumbfile.Url;
                    upfileModels.MainPic = AliYunOssConfig.Endpoint +"/"+ fileName;//第一个默认主图
                    f.ExterndAtt = "THUMBONTHIS"; //设置浮标，标明 缩略图建立在这个图上
                }

                f.BatchId = batchId;
                f.BatchSeq = currentIndex;
                f.CreateTime = DateTime.Now;
                f.FileName = tfile.FileName;
                f.FileSize = tfile.Length;
                f.Status = 0;
                f.OssKey = fileName;
                f.Url = AliYunOssConfig.Endpoint + "/"+ fileName;
                dbfiles.Add(f);
                currentIndex++;
                
            }
            _cacheHelper.Set<string>(batchId, currentIndex.ToString(),DateTime.Now.AddHours(1));
            try
            {
                  bool isok = await _fileCenterServices.AddIsIdentity(dbfiles);
                dbfiles.ForEach(u=> upfileModels.files.Add(u.FileName, u.Id));
             
            }
            catch(Exception ex)
            {
                string e = ex.ToString();
            }
            //返回这一批次ID，返回已上传的ID

            data.response = upfileModels;
            return  data;
        }
        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="fileId"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<MessageModel<UploadFileModel>> DeleteThisFile(int? fileId)
        {
            var data = new MessageModel<UploadFileModel>();
            UploadFileModel upfileModels = new UploadFileModel();
            if (!fileId.HasValue)
            {
                data.msg = "没参数";
                return data;
            }
           
            FileCenter tfile = await _fileCenterServices.QueryById(fileId.Value);
           
            if(tfile!=null && tfile.ExterndAtt== "THUMBONTHIS")
            {
                //检测一下，如果是主图，要重新生成主图和缩略图信息
                //下载下来这个批次中排首的图，重新生成缩略图
               FileCenter  nextfile = await  _fileCenterServices.GetFirstOneExceptMe(tfile.BatchId, tfile.Id);
                //更新这个图为主图
               Stream s = AliYunOss.Instance.GetFileFromAliOss(nextfile.Url.Replace(AliYunOssConfig.Endpoint,""));
                if (nextfile != null)
                {
                    string filethumbName = IdCreatorHelper.CreateIdNoTimestrap("thumbpubtree", 6) + ".jpg";
                    string AliossFolder = DateTime.Now.ToString("yyyyMMddHH");
                    string  newthumbUrl =  await CreateThumb(s, nextfile.BatchId, AliossFolder + "/" + filethumbName);
                    nextfile.ExterndAtt = "THUMBONTHIS";
                    //更新这个批次的缩略图信息

                    bool thumbok =  await _fileCenterServices.UpdateThisFileUrlByBatchIdAndSeq(nextfile.BatchId,0,newthumbUrl);
                    bool isOk = await _fileCenterServices.Update(nextfile);
                    upfileModels.MainPic = nextfile.Url;
                    upfileModels.ThumbnailUrl = newthumbUrl;
                }

            }
            bool isOK = await _fileCenterServices.DeleteById(fileId.Value);
            data.msg = isOK ? "删除成功" : "删除失败";
            return data;
        }


        private async Task<FileCenter> CreateThumb(IFormFile tfile,string batchId,string fileName)
        {
            string timepre= Guid.NewGuid().ToString().Replace("-","");
            string tempfolder = _env.WebRootPath + "/" + "thumbTemp";
            if(!Directory.Exists(tempfolder))
            {
                Directory.CreateDirectory(tempfolder);
            }
            string tempfile = tempfolder + "/" + timepre + "temp.jpg";
            string tempthumbfile = tempfolder +"/"+ timepre + "tempthumb.jpg";
            var stream = System.IO.File.Create(tempfile);
            await tfile.CopyToAsync(stream);
            stream.Close();
            //压缩
            ImageHelper.CompressImage(tempfile, tempthumbfile, 50,10);
            var thumbstream = System.IO.File.Open(tempthumbfile, FileMode.Open);
            AliYunOss.Instance.PutFileToOss(thumbstream,   fileName);
            thumbstream.Close();
         
            System.IO.File.Delete(tempfile);
            System.IO.File.Delete(tempthumbfile);
            FileCenter f = new FileCenter();
            f.BatchId = batchId;
            f.BatchSeq = 0;//序号0 一定设置是缩略图
            f.CreateTime = DateTime.Now;
            f.FileName = "thumb"+tfile.FileName;
            f.FileSize = tfile.Length;
            f.Status = 0;
            f.OssKey = fileName;
            f.Url = AliYunOssConfig.Endpoint +"/"+  fileName;
            f.ExterndAtt = "THUMB";
            return f;
        }

        private async Task<string> CreateThumb(Stream fileStream, string batchId, string fileName)
        {
            string timepre = Guid.NewGuid().ToString().Replace("-", "");
            string tempfolder = _env.WebRootPath + "/" + "thumbTemp";
            if (!Directory.Exists(tempfolder))
            {
                Directory.CreateDirectory(tempfolder);
            }
            string tempfile = tempfolder + "/"+timepre + "temp.jpg";
            string tempthumbfile = tempfolder +"/" + timepre + "tempthumb.jpg";
            var stream = System.IO.File.Create(tempfile);
            await fileStream.CopyToAsync(stream);
            //压缩
            ImageHelper.CompressImage(tempfile, tempthumbfile, 50,10);
            var thumbstream = System.IO.File.Open(tempthumbfile, FileMode.Open);
            AliYunOss.Instance.PutFileToOss(thumbstream, fileName);
            thumbstream.Close();
            stream.Close();
            System.IO.File.Delete(tempfile);
            System.IO.File.Delete(tempthumbfile);
            
            return  AliYunOssConfig.Endpoint + fileName;
             
        }
    }
}

