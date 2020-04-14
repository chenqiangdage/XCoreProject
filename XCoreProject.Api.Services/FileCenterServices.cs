using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using SqlSugar;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.Services.BASE;

namespace XCoreProject.Api.Services
{
    public class FileCenterServices : BaseServices<FileCenter>, IFileCenterServices
    {
         

        IFileCenterRepository _dal;
        public FileCenterServices(IFileCenterRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }
        /// <summary>
        /// 找到除了当前id 之外排序最前面的
        /// </summary>
        /// <param name="batchId"></param>
        /// <param name="fileId"></param>
        /// <returns></returns>
        public async Task<FileCenter> GetFirstOneExceptMe(string batchId,int fileId)
        {
          var result =  await  _dal.Query((u => u.BatchId == batchId && u.Id != fileId), (u => u.BatchSeq), false);
          return  result.FirstOrDefault();
          //  throw new NotImplementedException();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="batchId"></param>
        /// <param name="seq"></param>
        /// <returns></returns>
        public  bool UpdateThisFileUrlByBatchIdAndSeq(string batchId, int seq,string url)
        {
            string sql = "update filecenter set Url=@url where batchId=@batchId and BatchSeq=@batchSeq";

           bool ok=   _dal.Update(sql, new SugarParameter[]{
                              new SugarParameter("@url",url),
                              new SugarParameter("@batchSeq",seq));
            return ok;
        }
    }
}
