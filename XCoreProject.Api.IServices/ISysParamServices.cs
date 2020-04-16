using System.Threading.Tasks;
using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model;
using XCoreProject.Api.Model.Dto;
using XCoreProject.Api.Model.Models;
using System.Collections.Generic;
namespace XCoreProject.Api.IServices
{
    public interface ISysParamServices : IBaseServices<SysParam>
    {
        Task<List<SysParam>> GetSysParamsByConfigName(string configName);
    }
}
