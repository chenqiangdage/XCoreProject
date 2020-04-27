using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Common.Common;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model;
using XCoreProject.Api.Model.Dto;
using XCoreProject.Api.Model.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [Produces("application/json")]
    [ApiController]
    public class PubInfoController : ControllerBase
    {
       
        readonly IProductServices _PruductServices;
        IWebHostEnvironment _env;

        public PubInfoController(IWebHostEnvironment env, IProductServices pruductServices)
        {
            _PruductServices = pruductServices;
            _env = env;
        }
        [HttpPost]
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pubTreeModel"></param>
        public async Task<MessageModel<string>> PushOneSupport(TreeOrderModel pubTreeModel)
        {
            var responseData = new MessageModel<string>();
            if (string.IsNullOrEmpty(pubTreeModel.BatchId))
            {
                responseData.msg = "没有上传图片";
                return responseData;
            }
            //build dbdata
            Products product = pubTreeModel.ToDbEntity();
            product.Creator  = "todo";
            product.OwnerName = "todo";
            product.OwnerId = 1;
            product.ProductType = (int)SysEnum.Enum_Tree_ProductType.SUPPORT;
            product.ProductStatus = (int)SysEnum.Enum_ProductStatus.ON;
            //sava data
            bool isok= await _PruductServices.AddIsIdentity(product);
            return responseData;

        }

        [HttpPost]
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pubTreeModel"></param>
        public async Task<MessageModel<string>> PushDemand(TreeOrderModel pubTreeModel)
        {
            var responseData = new MessageModel<string>();
            if (string.IsNullOrEmpty(pubTreeModel.BatchId))
            {
                responseData.msg = "没有上传图片";
                return responseData;
            }
            //build dbdata
            Products product = pubTreeModel.ToDbEntity();
            product.Creator = "todo";
            product.OwnerName = "todo";
            product.OwnerId = 1;
            product.ProductType = (int)SysEnum.Enum_Tree_ProductType.DEMAND;
            product.ProductStatus = (int)SysEnum.Enum_ProductStatus.ON;
            //sava data
            bool isok = await _PruductServices.AddIsIdentity(product);
            return responseData;

        }

    }
}
