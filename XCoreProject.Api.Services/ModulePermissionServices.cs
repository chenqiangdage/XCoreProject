using XCoreProject.Api.Services.BASE;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;

namespace XCoreProject.Api.Services
{	
	/// <summary>
	/// ModulePermissionServices
	/// </summary>	
	public class ModulePermissionServices : BaseServices<ModulePermission>, IModulePermissionServices
    {
	
        IModulePermissionRepository _dal;
        public ModulePermissionServices(IModulePermissionRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }
       
    }
}
