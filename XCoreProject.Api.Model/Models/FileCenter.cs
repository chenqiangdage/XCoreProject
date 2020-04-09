using SqlSugar;
using System;
namespace XCoreProject.Api.Model.Models
{
    public class FileCenter:RootEntity
    {
        /// <summary>
        /// 文件批次id
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string BatchId { get; set; }
        /// <summary>
        /// 批次中的序号
        /// </summary>
        public int BatchSeq { get; set; }
        /// <summary>
        /// 文件名
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string FileName { get; set; }
        /// <summary>
        /// 文件大小
        /// </summary>
        public long FileSize { get; set; }
        /// <summary>
        /// 文件的网络地址
        /// </summary>
        [SugarColumn(Length = 500, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Url { get; set; }
        /// <summary>
        /// 文件状态（0 有效，10无效）
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        [SugarColumn(Length = 50, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Remarks { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 类型
        /// </summary>
        public string FileType { get; set; }
        /// <summary>
        /// 附加属性
        /// </summary>
        public string ExterndAtt { get; set; }
    }
}
