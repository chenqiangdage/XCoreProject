using System;
using System.Collections.Generic;
using System.Text;

namespace XCoreProject.Api.Common.Common
{
    public class SysEnum
    {
        /// <summary>
        /// tree 类型
        /// </summary>
        public enum  Enum_Tree_ProductType { 
            /// <summary>
            /// 供应
            /// </summary>
            SUPPORT = 0,
            /// <summary>
            /// 求购
            /// </summary>
            DEMAND = 1
        };

        /// <summary>
        /// 产品状态
        /// </summary>
        public enum Enum_ProductStatus
        {
           
            /// <summary>
            /// 0,上线
            /// </summary>
            ON = 0,
            /// <summary>
            /// 5下线
            /// </summary>
            OFF = 5,
            /// <summary>
            /// 10过期
            /// </summary>
            EXPIRE = 10,
            /// <summary>
            ///  20 非法
            /// </summary>
            ILLEGAL = 20
        }
    }

}
