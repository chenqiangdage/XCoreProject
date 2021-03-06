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
    public class DepartmentController_Should
    {
        DepartmentController departmentController;



        public DepartmentController_Should()
        {
            departmentController = new DepartmentController();
        }

        [Fact]
        public void GetTest()
        {
            var data = departmentController.Get();
            Assert.True(data.Any());
        }
        [Fact]
        public void GetDetailsTest()
        {
            object blogs =departmentController.Get(1);

            Assert.NotNull(blogs);
        }

    }
}
