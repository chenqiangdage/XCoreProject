using XCoreProject.Api.FrameWork.IRepository;
using XCoreProject.Api.Repository.Base;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository.UnitOfWork;

namespace XCoreProject.Api.Repository
{
    /// <summary>
    /// UserRoleRepository
    /// </summary>	
    public class UserRoleRepository : BaseRepository<UserRole>, IUserRoleRepository
    {
        public UserRoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
