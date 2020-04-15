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
    public interface IFileCenterServices : IBaseServices<FileCenter>
    {
        Task<FileCenter> GetFirstOneExceptMe(string batchId,int fileId);
        Task<bool> UpdateThisFileUrlByBatchIdAndSeq(string batchId, int seq,string url);
    }
}
