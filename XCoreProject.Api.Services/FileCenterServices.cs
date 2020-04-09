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
    public class FileCenterServices : BaseServices<FileCenter>, IFileCenterServices
    {
         

        IFileCenterRepository _dal;
        public FileCenterServices(IFileCenterRepository dal)
        {
            this._dal = dal;
            base.BaseDal = dal;
        }
    }
}
