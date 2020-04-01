using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model.Models;
using System.Threading.Tasks;

namespace XCoreProject.Api.IServices
{	
	/// <summary>
	/// UserRoleServices
	/// </summary>	
    public interface IUserRoleServices :IBaseServices<UserRole>
	{

        Task<UserRole> SaveUserRole(int uid, int rid);
        Task<int> GetRoleIdByUid(int uid);
    }
}

