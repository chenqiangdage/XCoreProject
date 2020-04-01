using XCoreProject.Api.IRepository;
using XCoreProject.Api.Repository.Base;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository.UnitOfWork;

namespace XCoreProject.Api.Repository
{
    /// <summary>
    /// RoleRepository
    /// </summary>	
    public class RoleRepository : BaseRepository<Role>, IRoleRepository
    {
        public RoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
