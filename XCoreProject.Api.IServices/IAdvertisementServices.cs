using XCoreProject.Api.IServices.BASE;
using XCoreProject.Api.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace XCoreProject.Api.IServices
{
    public interface IAdvertisementServices :IBaseServices<Advertisement>
    {
        //int Sum(int i, int j);
        //int Add(Advertisement model);
        //bool Delete(Advertisement model);
        //bool Update(Advertisement model);
        //List<Advertisement> Query(Expression<Func<Advertisement, bool>> whereExpression);
        Task<List<Advertisement>> GetAdvertisementByOwner(string owner);
        void ReturnExp();
    }
}
