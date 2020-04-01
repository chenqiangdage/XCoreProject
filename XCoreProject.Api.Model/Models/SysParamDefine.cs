using SqlSugar;
using System;
namespace XCoreProject.Api.Model.Models
{
    public class SysParamDefine:RootEntity
    {
        /// <summary>
        /// 别名
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string AliasName { get; set; }
        /// <summary>
        /// 配置参数名
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string ParamConfigName { get; set; }
        /// <summary>
        /// key描述
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string KeyDesc { get; set; }
        /// <summary>
        /// 值描述
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string ValueDesc { get; set; }
        /// <summary>
        /// Alpha1Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha1Desc { get; set; }
        /// <summary>
        /// Alpha2Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha2Desc { get; set; }
        /// <summary>
        /// Alpha3Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha3Desc { get; set; }
        /// <summary>
        /// Alpha4Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha4Desc { get; set; }
        /// <summary>
        /// Alpha5Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha5Desc { get; set; }
        /// <summary>
        /// Alpha6Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha6Desc { get; set; }
        /// <summary>
        /// Alpha7Desc
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Alpha7Desc { get; set; }
    }
}
