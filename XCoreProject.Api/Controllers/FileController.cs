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

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        readonly IFileCenterServices _fileCenterServices;

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="IFileCenterServices"></param>
        /// <param name="userRoleServices"></param>
        /// <param name="roleServices"></param>
        public FileController(IFileCenterServices fileCenterServices)
        {
            this._fileCenterServices = fileCenterServices;
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
                // to do 
                currentIndex = 1;
            }
             
            IFormFileCollection cols = Request.Form.Files;       
            if (cols == null || cols.Count == 0)
            {
                data.msg= "没有上传文件";
                return data;
            }
            //上传到oss
            List<FileCenter> dbfiles = new List<FileCenter>();
            upfileModels.BatchId = batchId;
            foreach (var tfile in cols.ToList())
            {
                string fileName = IdCreatorHelper.CreateIdNoTimestrap("pubtree", 6) + ".jpg";
                AliYunOss.Instance.PutFileToOss(tfile.OpenReadStream(), fileName);
                upfileModels.files.Add(tfile.FileName, fileName);
               
                FileCenter f = new FileCenter();
                f.BatchId = batchId;
                f.BatchSeq = currentIndex;
                f.CreateTime = DateTime.Now;
                f.FileName = fileName;
                f.FileSize = tfile.Length;
                f.Status = 0;
                dbfiles.Add(f);
                currentIndex++;
                //to do set to cache
            }
            try
            {
                await _fileCenterServices.Add(dbfiles);
            }catch(Exception ex)
            {
                string e = ex.ToString();
            }
            //返回这一批次ID，返回已上传的ID

            data.response = upfileModels;

            //  var currentPictureWithoutExtension = Path.GetFileNameWithoutExtension(formFile.FileName);
            // var currentPictureExtension = Path.GetExtension(formFile.FileName).ToUpper();

            ///返回批次ID
            return  data;
        }

    }
}

