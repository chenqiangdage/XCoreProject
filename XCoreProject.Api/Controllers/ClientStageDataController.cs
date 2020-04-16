using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XCoreProject.Api.AuthHelper.OverWrite;
using XCoreProject.Api.Common.Helper;
using XCoreProject.Api.Common.HttpContextUser;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model;
using XCoreProject.Api.Model.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Model.Dto;

namespace XCoreProject.Api.Controllers
{
    /// <summary>
    /// 客户端数据控制器，客户端展示的数据
    /// 舞台数据
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Permissions.Name)]
    public class ClientStageDataController : ControllerBase
    {
        public ClientStageDataController()
        {
            
        }
        /// <summary>
        ///  获取产品列表
        /// </summary>
        /// <param name="type"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public async Task<MessageModel<PageModel<ProductModel>>> GetProductList(string type,int? pageSize,int? pageIndex )
        {
            var data = new MessageModel<PageModel<ProductModel>>();
            PageModel<ProductModel> pageDatas = new PageModel<ProductModel>();
            // todo 

            data.response = pageDatas;
            return data;
        }

        
    }
}
