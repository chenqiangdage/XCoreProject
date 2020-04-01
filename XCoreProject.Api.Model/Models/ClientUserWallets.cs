using SqlSugar;
using System;
namespace XCoreProject.Api.Model.Models
{
    public class ClientUserWallets:RootEntity
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int ClientUserId { get; set; }
        /// <summary>
        /// 可用积分
        /// </summary>
        public int AvailablePoints { get; set; }
        /// <summary>
        /// 可用奖金
        /// </summary>
        public decimal AvailableBonus { get; set; }
        /// <summary>
        /// 冻结积分
        /// </summary>
        public int FreezePoints { get; set; }
        /// <summary>
        /// 冻结奖金
        /// </summary>
        public decimal FreezeBonus { get; set; }
    }
}
