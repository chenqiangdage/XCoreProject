using System;
namespace XCoreProject.Api.Model.Dto
{
    public class PubProductBaseModel
    {
        /// <summary>
        /// 图片上传的批次ID
        /// </summary>
        public string BatchId { get; set; }

        public string ProductImgUrl { get; set; }
        public string ThumbImgUrl { get; set; }
        /// <summary>
        /// 产品名称
        /// </summary>
        public string ProductName { get; set; }

        /// <summary>
        /// 产品重量 low
        /// </summary>
        public decimal ProductWeightL { get; set; }
        /// <summary>
        /// 产品高度 low
        /// </summary>
        public decimal ProductHeightL { get; set; }
        /// <summary>
        /// 产品宽度 low
        /// </summary>
        public decimal ProductWidthL { get; set; }
        /// <summary>
        /// 产品重量 high
        /// </summary>
        public decimal ProductWeightH { get; set; }
        /// <summary>
        /// 产品高度 high
        /// </summary>
        public decimal ProductHeightH { get; set; }
        /// <summary>
        /// 产品宽度 high
        /// </summary>
        public decimal ProductWidthH { get; set; }
        /// <summary>
        /// 价格
        /// </summary>
        public decimal ProductPrice { get; set; }
        /// <summary>
        /// 数量
        /// </summary>
        public int ProductStock { get; set; }

        public string ProductUnit { get; set; }
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

        /// <summary>
        /// 经度
        /// </summary>
        public double Longitude { get; set; }
        /// <summary>
        /// 纬度
        /// </summary>
        public double Latitude { get; set; }



    }
}
