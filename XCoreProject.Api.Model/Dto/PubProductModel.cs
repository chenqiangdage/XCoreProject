using System;
namespace XCoreProject.Api.Model.Dto
{
    public class PubProductBaseModel
    {
        /// <summary>
        /// 图片上传的批次ID
        /// </summary>
        public string BatchId { get; set; }
        /// <summary>
        /// 产品名称
        /// </summary>
        public string ProductName { get; set; }

        /// <summary>
        /// 产品重量 low
        /// </summary>
        public string ProductWeightL { get; set; }
        /// <summary>
        /// 产品高度 low
        /// </summary>
        public string ProductHeightL { get; set; }
        /// <summary>
        /// 产品宽度 low
        /// </summary>
        public string ProductWidthL { get; set; }
        /// <summary>
        /// 产品重量 high
        /// </summary>
        public string ProductWeightH { get; set; }
        /// <summary>
        /// 产品高度 high
        /// </summary>
        public string ProductHeightH { get; set; }
        /// <summary>
        /// 产品宽度 high
        /// </summary>
        public string ProductWidthH { get; set; }
        /// <summary>
        /// 价格
        /// </summary>
        public decimal ProductPrice { get; set; }
        /// <summary>
        /// 数量
        /// </summary>
        public decimal ProductStock { get; set; }
        /// <summary>
        /// 供货地
        /// </summary>
        public string Address { get; set; }
        /// <summary>
        /// 截止日期
        /// </summary>
        public DateTime EffecitiveTime { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remarks { get; set; }

       

    }
}
