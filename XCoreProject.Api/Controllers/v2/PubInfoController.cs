using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Model.Dto;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PubInfoController : ControllerBase
    {
        
        public void PushOne([FromBody] TreeOrderModel pubTreeModel)
        {

        }
    }
}
