using System;
using System.Collections.Generic;

namespace XCoreProject.Api.Model.Dto
{
    public class DropDownParmsModel
    {
        public Dictionary<string,List<DropDownModel> >Datas { get; set; } 
        public DropDownParmsModel()
        {
            Datas = new Dictionary<string, List<DropDownModel>>();
        }
    }
    public class DropDownModel
    {
        public DropDownModel(string ttext,string tvalue)
        {
            text = ttext;
            value = tvalue;
        }
        public string text { get; set; }
        public string value { get; set; }
    }
}
