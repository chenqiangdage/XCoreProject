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

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        readonly IFileCenterServices _fileCenterServices;
        readonly ICacheHelper _cacheHelper;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="IFileCenterServices"></param>
        /// <param name="userRoleServices"></param>
        /// <param name="roleServices"></param>
        public FileController(IFileCenterServices fileCenterServices, ICacheHelper IcacheHelper)
        {
            this._fileCenterServices = fileCenterServices;
            _cacheHelper = IcacheHelper;
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

                string fileName = IdCreatorHelper.CreateIdNoTimestrap("pubtree", 6) + ".jpg";
                AliYunOss.Instance.PutFileToOss(tfile.OpenReadStream(), AliossFolder+"/"+ fileName);               
                FileCenter f = new FileCenter();
                if (i == 0)//默认第一个设置缩略图，设为主图 
                {
                    //压缩一个缩略图，
                    //上传这个图片
                    //TODO 
                    f.ExterndAtt = "THUMB";
                }

                f.BatchId = batchId;
                f.BatchSeq = currentIndex;
                f.CreateTime = DateTime.Now;
                f.FileName = tfile.FileName;
                f.FileSize = tfile.Length;
                f.Status = 0;
                f.Url = AliYunOssConfig.Endpoint + "/" + fileName;
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
        public async Task<MessageModel<string>> DeleteThisFile(int? fileId)
        {
            var data = new MessageModel<string>();
            if (!fileId.HasValue)
            {
                data.msg = "没参数";
                return data;
            }
            //检测一下，如果是主图，要重新生成主图和缩略图信息 TODO

            bool isOK = await _fileCenterServices.DeleteById(fileId.Value);
            data.msg = isOK ? "删除成功" : "删除失败";
            return data;
        }
        
    }
}

