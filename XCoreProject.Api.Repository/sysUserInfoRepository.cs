using XCoreProject.Api.IRepository;
using XCoreProject.Api.IRepository.UnitOfWork;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Repository.Base;

namespace XCoreProject.Api.Repository
{
    /// <summary>
    /// sysUserInfoRepository
    /// </summary>	
    public class sysUserInfoRepository : BaseRepository<sysUserInfo>, IsysUserInfoRepository
    {
        public sysUserInfoRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
