using System.Threading.Tasks;
using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model;
using XCoreProject.Api.Model.Dto;
using XCoreProject.Api.Model.Models;

namespace XCoreProject.Api.IServices
{
    public partial interface IProductServices :IBaseServices<Products>
    {
        public Task<PageModel<ProductModel>> GetList(string type,string key, int pageSize, int pageIndex);
    }
}
