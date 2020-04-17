using System;
namespace XCoreProject.Api.Model.Models
{
    public class Products:RootEntity
    {
        /// <summary>
        /// 产品名称
        /// </summary>
        public string ProductName { get; set; }
        /// <summary>
        /// 产品分类
        /// </summary>
        public int CategoryId { get; set; }
        /// <summary>
        /// 产品分类名称
        /// </summary>
        public string CategoryName { get; set; }
        /// <summary>
        /// 产品主图 
        /// </summary>
        public string ProductImgUrl { get; set; }
        /// <summary>
        /// 产品缩略图地址
        /// </summary>
        public string ThumbnailUrl { get; set; }
        /// <summary>
        /// 产品描述
        /// </summary>
        public string ProductDesc { get; set; }
        /// <summary>
        /// 图片批次Id
        /// </summary>
        public string PicBatchId { get; set; }
        /// <summary>
        /// 价格
        /// </summary>
        public decimal ProductPrice { get; set; }
        /// <summary>
        /// 单位
        /// </summary>
        public string ProductUnit { get; set; }
        /// <summary>
        /// 产品库存
        /// </summary>
        public int ProductStock { get; set; }
        /// <summary>
        /// 产品类型
        /// </summary>
        public int ProductType { get; set; }
        /// <summary>
        /// 产品状态(0,上线，5下线 10过期 20 非法）
        /// </summary>
        public int ProductStatus { get; set; }
        /// <summary>
        /// 产品所在地
        /// </summary>
        public string ProductAddress { get; set; }
        /// <summary>
        /// 产品重量
        /// </summary>
        public decimal ProductWeightL { get; set; }
        /// <summary>
        /// 产品高度
        /// </summary>
        public decimal ProductHeightL { get; set; }
        /// <summary>
        /// 产品宽度
        /// </summary>
        public decimal ProductWidthL { get; set; }
        /// <summary>
        /// 产品重量
        /// </summary>
        public decimal ProductWeightH { get; set; }
        /// <summary>
        /// 产品高度
        /// </summary>
        public decimal ProductHeightH { get; set; }
        /// <summary>
        /// 产品宽度
        /// </summary>
        public decimal ProductWidthH { get; set; }
        /// <summary>
        /// 产品被浏览次数
        /// </summary>
        public long ProductWatched { get; set; }
        /// <summary>
        /// 产品拥有者
        /// </summary>
        public string OwnerId { get; set; }
        /// <summary>
        /// 拥有者的名字
        /// </summary>
        public string OwnerName { get; set; }
        /// <summary>
        /// 有效截止时间
        /// </summary>
        public DateTime EffecitiveTime { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remarks { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 创建者（可以是系统帮忙创建）
        /// </summary>
        public string Creator { get; set; }
        /// <summary>
        /// 更新时间
        /// </summary>
        public DateTime ModifyTime { get; set; }
        /// <summary>
        /// 更新人
        /// </summary>
        public string ModifyBy { get; set; }
        /// <summary>
        /// 经度
        /// </summary>
        public double Longitude { get; set; }
        /// <summary>
        /// 纬度
        /// </summary>
        public double Latitude { get; set; }
        /// <summary>
        /// 属性1
        /// </summary>
        public string Prop1 { get; set; }
        /// <summary>
        /// 属性2
        /// </summary>
        public string Prop2 { get; set; }
        /// <summary>
        /// 属性3
        /// </summary>
        public string Prop3 { get; set; }
        /// <summary>
        /// 属性4
        /// </summary>
        public string Prop4 { get; set; }
        /// <summary>
        /// 属性5
        /// </summary>
        public string Prop5 { get; set; }
        /// <summary>
        /// 属性6
        /// </summary>
        public string Prop6 { get; set; }
        /// <summary>
        /// 属性7
        /// </summary>
        public string Prop7 { get; set; }
        /// <summary>
        /// 属性8
        /// </summary>
        public string Prop8 { get; set; }
        /// <summary>
        /// 属性9
        /// </summary>
        public string Prop9 { get; set; }
        /// <summary>
        /// 属性10
        /// </summary>
        public string Prop10 { get; set; }
        /// <summary>
        /// 属性11
        /// </summary>
        public string Prop11 { get; set; }
        /// <summary>
        /// 属性12
        /// </summary>
        public string Prop12 { get; set; }
        /// <summary>
        /// 属性13
        /// </summary>
        public string Prop13 { get; set; }
        /// <summary>
        /// 属性14
        /// </summary>
        public string Prop14 { get; set; }
        /// <summary>
        /// 属性15
        /// </summary>
        public string Prop15 { get; set; }
        /// <summary>
        /// 属性16
        /// </summary>
        public string Prop16 { get; set; }
    }
}
