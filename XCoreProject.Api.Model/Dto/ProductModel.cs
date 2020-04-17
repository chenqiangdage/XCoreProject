using System;
using System.Collections.Generic;
using System.Text;
using XCoreProject.Api.Model.Models;

namespace XCoreProject.Api.Model.Dto
{
    public class ProductModel
    {
        /// <summary>
        /// 产品名称
        /// </summary>
        public string ProductName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Seller { get; set; }
        /// <summary>
        /// 图片地址
        /// </summary>
        public string PicUr { get; set; }
        /// <summary>
        /// 距离
        /// </summary>
        public string Distance { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Address { get; set; }
        /// <summary>
        /// 价格
        /// </summary>
        public string Price { get; set; }
        /// <summary>
        /// 浏览数
        /// </summary>
        public long ViewCount { get; set; }
        /// <summary>
        /// vip 等级
        /// </summary>
        public int VipLevel { get; set; }
        /// <summary>
        /// 认证等级
        /// </summary>
        public int AuthenticationLevel { get; set; }
        /// <summary>
        /// 更新日期
        /// </summary>
        public string UpdateTime { get; set; }
        /// <summary>
        /// 属性1
        /// </summary>
        public string Prop1 { get; set; }
        /// <summary>
        /// 属性2
        /// </summary>
        public string Prop2 { get; set; }

       
    }
}

