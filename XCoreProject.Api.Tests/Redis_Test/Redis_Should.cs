using XCoreProject.Api.Common;
using XCoreProject.Api.Controllers;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model.Models;
using Moq;
using Xunit;
using System;
using Autofac;

namespace XCoreProject.Api.Tests
{
    public class Redis_Should
    {
        private IRedisCacheManager _redisCacheManager;
        DI_Test dI_Test = new DI_Test();

        public Redis_Should()
        {
            //var container = dI_Test.DICollections();
            //_redisCacheManager = container.Resolve<IRedisCacheManager>();

        }

        [Fact]
        public void Connect_Redis_Test()
        {

            //var redisBlogCache = _redisCacheManager.Get<object>("Redis.Blog");

            //Assert.Null(redisBlogCache);
        }

    }
}
