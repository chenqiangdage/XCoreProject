using SqlSugar;
using System;

namespace XCoreProject.Api.Model.Models
{
    public class Advertisement : RootEntity
    {

        /// <summary>
        /// 广告图片
        /// </summary>
        [SugarColumn(Length = 512, IsNullable = true, ColumnDataType = "nvarchar")]
        public string ImgUrl { get; set; }

        /// <summary>
        /// 广告标题
        /// </summary>
        [SugarColumn(Length = 64, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Title { get; set; }

        /// <summary>
        /// 广告链接
        /// </summary>
        [SugarColumn(Length = 512, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Url { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [SugarColumn(Length = 250, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Remark { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime Createdate { get; set; } = DateTime.Now;
        /// <summary>
        /// 创建人
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string Creator { get; set; }
        /// <summary>
        /// 更新时间
        /// </summary>
        public DateTime ModifyTime { get; set; }
        /// <summary>
        /// 更新人
        /// </summary>
        [SugarColumn(Length = 20, IsNullable = true, ColumnDataType = "nvarchar")]
        public string ModifyBy { get; set; }
        /// <summary>
        /// 是否上线
        /// </summary>
        public int Online { get; set; }
        /// <summary>
        /// 有效截止时间
        /// </summary>
        public DateTime EffecitiveTime { get; set; }

        public int Type { get; set; }

        public string Owner { get; set; }


    }
}
