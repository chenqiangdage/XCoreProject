using XCoreProject.Api.Common;
using XCoreProject.Api.Controllers;
using XCoreProject.Api.IRepository;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model.Models;
using Moq;
using Xunit;
using System;
using Microsoft.Extensions.Logging;
using Autofac;
using System.Linq;

namespace XCoreProject.Api.Tests
{
    public class ClaimsController_Should
    {
        ClaimsController claimsController;



        public ClaimsController_Should()
        {
            claimsController = new ClaimsController();
        }

        [Fact]
        public void GetTest()
        {
            var data = claimsController.Get();
            Assert.True(data.Any());
        }
        [Fact]
        public void GetDetailsTest()
        {
            object blogs =claimsController.Get(1);

            Assert.NotNull(blogs);
        }

    }
}
