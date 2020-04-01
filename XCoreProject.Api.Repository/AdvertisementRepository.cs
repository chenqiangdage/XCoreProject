using XCoreProject.Api.IRepository;
using XCoreProject.Api.IRepository.UnitOfWork;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Repository.Base;

namespace XCoreProject.Api.Repository
{
    public class AdvertisementRepository : BaseRepository<Advertisement>, IAdvertisementRepository
    {
        public AdvertisementRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
