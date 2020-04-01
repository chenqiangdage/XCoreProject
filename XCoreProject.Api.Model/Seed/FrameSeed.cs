using XCoreProject.Api.Common;
using XCoreProject.Api.Common.Helper;
using XCoreProject.Api.Model.Models;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace XCoreProject.Api.Model.Models
{
    public class FrameSeed
    {

        /// <summary>
        /// 生成Model层
        /// </summary>
        /// <param name="myContext"></param>
        /// <returns></returns>
        public static bool CreateModels(MyContext myContext)
        {

            try
            {
                myContext.Create_Model_ClassFileByDBTalbe($@"C:\my-file\XCoreProject.Api.Model", "XCoreProject.Api.Model.Models", new string[] {  }, "");
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        /// <summary>
        /// 生成IRepository层
        /// </summary>
        /// <param name="myContext"></param>
        /// <returns></returns>
        public static bool CreateIRepositorys(MyContext myContext)
        {

            try
            {
                myContext.Create_IRepository_ClassFileByDBTalbe($@"C:\my-file\XCoreProject.Api.IRepository", "XCoreProject.Api.IRepository", new string[] {  }, "");
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }



        /// <summary>
        /// 生成 IService 层
        /// </summary>
        /// <param name="myContext"></param>
        /// <returns></returns>
        public static bool CreateIServices(MyContext myContext)
        {

            try
            {
                myContext.Create_IServices_ClassFileByDBTalbe($@"C:\my-file\XCoreProject.Api.IServices", "XCoreProject.Api.IServices", new string[] { "Module" }, "");
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }



        /// <summary>
        /// 生成 Repository 层
        /// </summary>
        /// <param name="myContext"></param>
        /// <returns></returns>
        public static bool CreateRepository(MyContext myContext)
        {

            try
            {
                myContext.Create_Repository_ClassFileByDBTalbe($@"C:\my-file\XCoreProject.Api.Repository", "XCoreProject.Api.Repository", new string[] { "Module" }, "");
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }



        /// <summary>
        /// 生成 Service 层
        /// </summary>
        /// <param name="myContext"></param>
        /// <returns></returns>
        public static bool CreateServices(MyContext myContext)
        {

            try
            {
                myContext.Create_Services_ClassFileByDBTalbe($@"C:\my-file\XCoreProject.Api.Services", "XCoreProject.Api.Services", new string[] { "Module" }, "");
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
