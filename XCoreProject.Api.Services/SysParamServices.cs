using XCoreProject.Api.Services.BASE;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model;
using System.Threading.Tasks;
using XCoreProject.Api.Model.Dto;
using System.Collections.Generic;

namespace XCoreProject.Api.Services
{
    public class SysParamServices : BaseServices<SysParam>, ISysParamServices
    {
        ISysParamRepository _dal;
        public SysParamServices(ISysParamRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }

        public async Task<List<SysParam>> GetSysParamsByConfigName(string configName)
        {
           return  await _dal.Query((u => u.ParamConfigName == configName));
        }
    }
}
