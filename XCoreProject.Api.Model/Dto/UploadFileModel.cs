using System;
using System.Collections.Generic;

namespace XCoreProject.Api.Model.Dto
{
    public class UploadFileModel
    {

      public   UploadFileModel()
        {
            files = new Dictionary<string, string>();
        }
        public string BatchId { get; set; }

        public Dictionary<string,string> files { get; set; }
    }
}
