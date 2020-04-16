using XCoreProject.Api.IRepository;
using XCoreProject.Api.IRepository.UnitOfWork;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Repository.Base;

namespace XCoreProject.Api.Repository
{
    public class SysParamRepository : BaseRepository<SysParam>, ISysParamRepository
    {
        public SysParamRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
