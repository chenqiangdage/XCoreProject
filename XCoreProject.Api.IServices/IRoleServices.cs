using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model.Models;
using System.Threading.Tasks;

namespace XCoreProject.Api.IServices
{	
	/// <summary>
	/// RoleServices
	/// </summary>	
    public interface IRoleServices :IBaseServices<Role>
	{
        Task<Role> SaveRole(string roleName);
        Task<string> GetRoleNameByRid(int rid);

    }
}
