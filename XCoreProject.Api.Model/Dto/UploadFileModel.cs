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

        public Dictionary<string,int> files { get; set; }
    }
}
