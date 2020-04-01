using XCoreProject.Api.Services.BASE;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;

namespace XCoreProject.Api.Services
{	
	/// <summary>
	/// ModuleServices
	/// </summary>	
	public class ModuleServices : BaseServices<Module>, IModuleServices
    {
	
        IModuleRepository _dal;
        public ModuleServices(IModuleRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }
       
    }
}
