using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XCoreProject.Api.AuthHelper.OverWrite;
using XCoreProject.Api.Common.Helper;
using XCoreProject.Api.Common.HttpContextUser;
using XCoreProject.Api.IServices;
using XCoreProject.Api.Model;
using XCoreProject.Api.Model.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using XCoreProject.Api.Model.Dto;
using Microsoft.AspNetCore.Hosting;
using XCoreProject.Api.Common.Common;

namespace XCoreProject.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Permissions.Name)]
    public class ConstParamController : ControllerBase
    {
        readonly ICacheHelper _cacheHelper;
        readonly ISysParamServices _sysParamServices;
        IWebHostEnvironment _env;

        [HttpGet]
        /// <summary>
        /// 获取所有 选择器 的参数
        /// </summary>
        /// <param name="type">多个用分号隔开;</param>
        /// <returns></returns>
        public  async Task<MessageModel<PickerParmsModel>> GetPickerParams(string type)
        {
            var data = new MessageModel<PickerParmsModel>();
            
            if (string.IsNullOrEmpty(type))
            {
                data.msg = "没参数";
                return data;
            }
            PickerParmsModel ppdatas = new PickerParmsModel();
            //取出所有的类型
            string[] types = type.Split(";").ToArray();
            foreach(string st in types)
            {
                string[] stData = _cacheHelper.Get<string[]>(SystemConst.PREF_SYSCONF_PARAMS_FOR_TREE + st);
                if(stData!=null && stData.Length>0)
                {
                    ppdatas.Datas.Add(st, stData);
                }
                else //从数据库取，并放到缓存中
                {
                    // todo 可以做一次性全部拿出来
                    List<SysParam> dbDatas =  await _sysParamServices.GetSysParamsByConfigName(st);
                    if(dbDatas!=null && dbDatas.Count >0)
                    {
                        string[] keys = dbDatas.Select(u => u.Key).ToArray();
                        ppdatas.Datas.Add(st,keys);
                        _cacheHelper.Set(SystemConst.PREF_SYSCONF_PARAMS_FOR_TREE + st, keys, DateTime.Now.AddMonths(1));
                    }
                }
            }
            data.response = ppdatas;
            return data;
            
        }
        [HttpGet]
        /// <summary>
        /// 获取所有的 下拉框 的参数
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public async Task<MessageModel<DropDownParmsModel>> GetDropDownParams(string type)
        {
            var data = new MessageModel<DropDownParmsModel>();

            if (string.IsNullOrEmpty(type))
            {
                data.msg = "没参数";
                return data;
            }
            DropDownParmsModel ppdatas = new DropDownParmsModel();
            //取出所有的类型
            string[] types = type.Split(";").ToArray();
            foreach (string st in types)
            {
                Dictionary<string, string> stData = _cacheHelper.Get<Dictionary<string, string>>(SystemConst.PREF_SYSCONF_PARAMS_FOR_TREE+st);
                if (stData != null && stData.Count > 0)
                {
                    ppdatas.Datas.Add(st, stData);
                }
                else //从数据库取，并放到缓存中
                {

                    // todo
                    List<SysParam> dbDatas = await _sysParamServices.GetSysParamsByConfigName(st);
                    if (dbDatas != null && dbDatas.Count > 0)
                    {
                        Dictionary<string, string> Dict = new Dictionary<string, string>();
                        dbDatas.ForEach(u => Dict.Add(u.Key, u.Value));
                        _cacheHelper.Set(SystemConst.PREF_SYSCONF_PARAMS_FOR_TREE + st, Dict, DateTime.Now.AddMonths(1));
                    }
                }
            }
            data.response = ppdatas;
            return data;
        }

        public ConstParamController(ICacheHelper IcacheHelper, IWebHostEnvironment env, ISysParamServices sysParamServices)
        {
            _cacheHelper = IcacheHelper;
            _sysParamServices = sysParamServices;
            _env = env;
        }
    }
}
