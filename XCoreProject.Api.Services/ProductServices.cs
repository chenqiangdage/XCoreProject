using XCoreProject.Api.Services.BASE;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model;
using System.Threading.Tasks;
using XCoreProject.Api.Model.Dto;

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

        public Task<PageModel<ProductModel>> GetList(string type, string key, int pageSize, int pageIndex)
        {
            // to do 联合用户信息查询，要排序
            //_dal.QueryPage((u =>u.ProductType == type ),pageIndex,pageSize,[""])
            return null;
        }
    }
}
