﻿using System;
using System.Collections.Generic;
using System.Text;

namespace XCoreProject.Api.Model
{
    /// <summary>
    /// 通用返回信息类
    /// </summary>
    public class MessageModel<T>
    {
        public MessageModel()
        {
            Code = 200;
            msg = "success";
        }

        /// <summary>
        /// 操作是否成功
        /// </summary>
        public bool success { get; set; } = false;
        /// <summary>
        /// 返回信息
        /// </summary>
        public string msg { get; set; } = "服务器异常";

        public int Code { get; set; }
        /// <summary>
        /// 返回数据集合
        /// </summary>
        public T response { get; set; }

    }
}
