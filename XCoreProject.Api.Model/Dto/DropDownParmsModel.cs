using System;
using System.Collections.Generic;

namespace XCoreProject.Api.Model.Dto
{
    public class DropDownParmsModel
    {
        public Dictionary<string,Dictionary<string,string>> Datas { get; set; } 
        public DropDownParmsModel()
        {
            Datas = new Dictionary<string, Dictionary<string, string>>();
        }
    }
}
