using System;
using XCoreProject.Api.Model.Models;

namespace XCoreProject.Api.Model.Dto
{
    public class TreeOrderModel:PubProductBaseModel
    {
        /// <summary>
        /// 属性1 杆径
        /// </summary>
        public string Prop1 { get; set; }
        /// <summary>
        /// 属性2 种植状态
        /// </summary>
        public string Prop2 { get; set; }
        /// <summary>
        /// 属性3 是否热门推荐
        /// </summary>
        public string Prop3 { get; set; }
        /// <summary>
        /// 属性4 树冠
        /// </summary>
        public string Prop4 { get; set; }
        /// <summary>
        /// 属性5 品质
        /// </summary>
        public string Prop5 { get; set; }
        /// <summary>
        /// 属性6  土质
        /// </summary>
        public string Prop6 { get; set; }
        /// <summary>
        /// 属性7 树形
        /// </summary>
        public string Prop7 { get; set; }
        /// <summary>
        /// 属性8 茂密度
        /// </summary>
        public string Prop8 { get; set; }
        /// <summary>
        /// 属性9 苗木形态
        /// </summary>
        public string Prop9 { get; set; }
        /// <summary>
        /// 属性10 报价方式
        /// </summary>
        public string Prop10 { get; set; }
        /// <summary>
        /// 分枝点 low
        /// </summary>
        public string Prop11 { get; set; }
        /// <summary>
        /// 分枝点 high
        /// </summary>
        public string Prop12 { get; set; }
        /// <summary>
        /// 热门推荐天数
        /// </summary>
        public string Prop13 { get; set; }
        public string Prop14 { get; set; }
        public string Prop15 { get; set; }
        /// <summary>
        /// 茎秆公分
        /// </summary>
        public string Prop16 { get; set; }

        public Products ToDbEntity()
        {
            Products p = new Products();
            p.CreateTime = DateTime.Now;
            p.EffecitiveTime = this.EffecitiveTime;
            p.Latitude = this.Latitude.HasValue ? this.Latitude.Value : 0.00;
            p.Longitude = this.Longitude.HasValue ? this.Longitude.Value : 0;          
            p.PicBatchId = this.BatchId;
            p.ProductAddress = this.Address;
            p.ProductHeightH = this.ProductHeightH.HasValue?this.ProductHeightH.Value:0;
            p.ProductHeightL = this.ProductHeightL.HasValue?this.ProductHeightL.Value:0;
            p.ProductImgUrl = this.ProductImgUrl;
            p.ThumbImgUrl = this.ThumbImgUrl;
            p.ProductName = this.ProductName;
            p.ProductPrice = this.ProductPrice;
            p.ProductStock = this.ProductStock.HasValue?this.ProductStock.Value:0;
            p.ProductUnit = this.ProductUnit;
            p.ProductWeightH = this.ProductWeightH.HasValue?this.ProductWeightH.Value:0;
            p.ProductWeightL = this.ProductWeightL.HasValue?this.ProductWeightL.Value:0;
            p.ProductWidthH = this.ProductWidthH.HasValue?this.ProductWidthH.Value:0;
            p.ProductWidthL = this.ProductWidthL.HasValue ? this.ProductWidthL.Value : 0;
            p.Prop1 = this.Prop1;
            p.Prop2 = this.Prop2;
            p.Prop3 = this.Prop3;
            p.Prop4 = this.Prop4;
            p.Prop5 = this.Prop5;
            p.Prop6 = this.Prop6;
            p.Prop7 = this.Prop7;
            p.Prop8 = this.Prop8;
            p.Prop9 = this.Prop9;
            p.Prop10 = this.Prop10;
            p.Prop11 = this.Prop11;
            p.Prop12 = this.Prop12;
            p.Prop13 = this.Prop13;
            p.Prop14 = this.Prop14;
            p.Prop15 = this.Prop15;
            p.Prop16 = this.Prop16;
            return p;
        }
    }
}
