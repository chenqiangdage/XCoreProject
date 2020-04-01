using XCoreProject.Api.Repository.Base;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IRepository.UnitOfWork;

namespace XCoreProject.Api.Repository
{
    /// <summary>
    /// ModuleRepository
    /// </summary>	
    public class ModuleRepository : BaseRepository<Module>, IModuleRepository
    {
        public ModuleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
