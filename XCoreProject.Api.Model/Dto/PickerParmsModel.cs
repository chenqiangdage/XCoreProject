using System;
using System.Collections.Generic;

namespace XCoreProject.Api.Model.Dto
{
    public class PickerParmsModel
    {
        public Dictionary<string,string[]> Datas { get; set; }

        public PickerParmsModel()
        {
            Datas = new Dictionary<string, string[]>();
        }
    }
}
