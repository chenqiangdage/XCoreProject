using System;
using System.Collections.Generic;
using System.Text;

namespace XCoreProject.Api.Common.Common
{
    public static class IdCreatorHelper
    {
        /// <summary>
        /// 制定有规则的ID
        /// </summary>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static string CreateId(string prefix)
        {
            string date = DateTime.Now.ToString("yyyyMMddHHmmss");
            string rand =  Guid.NewGuid().ToString().Replace("-", "").Substring(0, 5);
            return prefix + date + rand;
        }
    }
}
