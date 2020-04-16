using XCoreProject.Api.IRepository;
using XCoreProject.Api.IRepository.UnitOfWork;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Repository.Base;

namespace XCoreProject.Api.Repository
{
   public class ProductRepository : BaseRepository<Products>, IProductRepository
    {
        public ProductRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
