using SqlSugar;
using System;
namespace XCoreProject.Api.Model.Models
{
    public class SysParam:RootEntity
    {
        /// <summary>
        /// 显示名字
        /// </summary>
        public string ShowName { get; set; }
        /// <summary>
        /// 配置参数名
        /// </summary>
        public string ParamConfigName { get; set; }
        /// <summary>
        /// key健值
        /// </summary>
        public string Key { get; set; }
        /// <summary>
        /// value 
        /// </summary>
        public string Value { get; set; }
        /// <summary>
        /// 类型 pick的数据 ，只有key就可以了。dropdown key -value对应。通过ConfigName拿所有的
        /// </summary>
        public string Type { get; set; }
        /// <summary>
        /// Alpha1
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha1 { get; set; }
        /// <summary>
        /// Alpha2
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha2 { get; set; }
        /// <summary>
        /// Alpha3
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha3 { get; set; }
        /// <summary>
        /// Alpha4
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha4 { get; set; }
        /// <summary>
        /// Alpha5
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha5 { get; set; }
        /// <summary>
        /// Alpha6
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha6 { get; set; }
        /// <summary>
        /// Alpha7
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha7 { get; set; }
    }
}
