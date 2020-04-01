    

using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model.Models;
using System.Threading.Tasks;

namespace XCoreProject.Api.IServices
{	
	/// <summary>
	/// sysUserInfoServices
	/// </summary>	
    public interface ISysUserInfoServices :IBaseServices<sysUserInfo>
	{
        Task<sysUserInfo> SaveUserInfo(string loginName, string loginPwd);
        Task<string> GetUserRoleNameStr(string loginName, string loginPwd);
    }
}
