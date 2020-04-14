using System;
using System.Collections.Generic;

namespace XCoreProject.Api.Model.Dto
{
    public class UploadFileModel
    {

      public   UploadFileModel()
        {
            files = new Dictionary<string, int>();
        }
        public string BatchId { get; set; }
        /// <summary>
        /// 主图 url
        /// </summary>
        public string MainPic { get; set; }
        /// <summary>
        /// 缩略图 url
        /// </summary>
        public string ThumbnailUrl { get; set; }
        public Dictionary<string,int> files { get; set; }
    }
    public class DeleteFileModel
    {

        public DeleteFileModel()
        {
            
        }
        public string BatchId { get; set; }
        /// <summary>
        /// 主图 url
        /// </summary>
        public string MainPic { get; set; }
        /// <summary>
        /// 缩略图 url
        /// </summary>
        public string ThumbnailUrl { get; set; }
        
    }
}
