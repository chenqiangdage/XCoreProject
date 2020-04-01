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
        /// 产品主图(在文件中心里的id)
        /// </summary>
        public string ProductImgId { get; set; }
        /// <summary>
        /// 产品缩略图(文件中心里的id)
        /// </summary>
        public string ThumbnailId { get; set; }
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
        public string ProductPrice { get; set; }
        /// <summary>
        /// 单位
        /// </summary>
        public string ProductUnit { get; set; }
        /// <summary>
        /// 产品库存
        /// </summary>
        public string ProductStock { get; set; }
        /// <summary>
        /// 产品类型
        /// </summary>
        public string ProductType { get; set; }
        /// <summary>
        /// 产品状态(0,上线，5下线 10过期 20 非法）
        /// </summary>
        public string ProductStatus { get; set; }
        /// <summary>
        /// 产品所在地
        /// </summary>
        public string ProductAddress { get; set; }
        /// <summary>
        /// 产品重量
        /// </summary>
        public string ProductWeight { get; set; }
        /// <summary>
        /// 产品高度
        /// </summary>
        public string ProductHeight { get; set; }
        /// <summary>
        /// 产品宽度
        /// </summary>
        public string ProductWidth { get; set; }
        /// <summary>
        /// 产品被浏览次数
        /// </summary>
        public string ProductWatched { get; set; }
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
        public string EffecitiveTime { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public string CreateTime { get; set; }
        /// <summary>
        /// 创建者（可以是系统帮忙创建）
        /// </summary>
        public string Creator { get; set; }
        /// <summary>
        /// 更新时间
        /// </summary>
        public string ModifyTime { get; set; }
        /// <summary>
        /// 更新人
        /// </summary>
        public string ModifyBy { get; set; }
        /// <summary>
        /// 经度
        /// </summary>
        public string Longitude { get; set; }
        /// <summary>
        /// 纬度
        /// </summary>
        public string Latitude { get; set; }
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
    }
}
