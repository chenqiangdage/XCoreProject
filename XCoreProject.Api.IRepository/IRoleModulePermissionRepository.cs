using XCoreProject.Api.IRepository.Base;
using XCoreProject.Api.Model.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace XCoreProject.Api.IRepository
{	
	/// <summary>
	/// IRoleModulePermissionRepository
	/// </summary>	
	public interface IRoleModulePermissionRepository : IBaseRepository<RoleModulePermission>//类名
    {
        Task<List<RoleModulePermission>> WithChildrenModel();
        Task<List<TestMuchTableResult>> QueryMuchTable();
        Task<List<RoleModulePermission>> RoleModuleMaps();
    }
}
