using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Services.BASE;

namespace XCoreProject.Api.Services
{
    public class AdvertisementServices : BaseServices<Advertisement>, IAdvertisementServices
    {
        IAdvertisementRepository _dal;
        public AdvertisementServices(IAdvertisementRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }

        public async  Task<List<Advertisement>> GetAdvertisementByOwner(string owner)
        {
            return await _dal.Query(u => u.Owner == owner);
        }

        public void ReturnExp()
        {

            int a = 1;
            int b = 0;

            int c = a / b;
        }

        //public IAdvertisementRepository dal = new AdvertisementRepository();
        //public int Sum(int i, int j)
        //{
        //    return base.Sum(i, j);

        //}


        //public int Add(Advertisement model)
        //{
        //    return base.Add(model);
        //}

        //public bool Delete(Advertisement model)
        //{
        //    return base.Delete(model);
        //}

        //public List<Advertisement> Query(Expression<Func<Advertisement, bool>> whereExpression)
        //{
        //    return base.Query(whereExpression);

        //}

        //public bool Update(Advertisement model)
        //{
        //    return base.Update(model);
        //}

    }
}
