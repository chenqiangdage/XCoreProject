using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Model;
using System.IO;
using XCoreProject.Api.Common.Common;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    public class FileController : ControllerBase
    {
     
       [HttpPost]
        public MessageModel<string> PushPic()
        {
            var data = new MessageModel<string>();
            IFormFileCollection cols = Request.Form.Files;
            if (cols == null || cols.Count == 0)
            {
                data.msg= "没有上传文件";
                return data;
            }
            //to do 怎么知道是地几张
            string BatchId = IdCreatorHelper.CreateId("treeSupp_");

          //  var currentPictureWithoutExtension = Path.GetFileNameWithoutExtension(formFile.FileName);
           // var currentPictureExtension = Path.GetExtension(formFile.FileName).ToUpper();

            ///返回批次ID
            return "123";
        }

    }
}

