using XCoreProject.Api.Services.BASE;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;

namespace XCoreProject.Api.Services
{
   public  class ProductServices : BaseServices<Products>, IProductServices
    {
        IProductRepository _dal;
        public ProductServices(IProductRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }
    }
}
