using XCoreProject.Api.Model.Models;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace XCoreProject.Api.Extensions
{
    /// <summary>
    /// Db 启动服务
    /// </summary>
    public static class DbSetup
    {
        public static void AddDbSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            
            services.AddScoped<MyContext>();
        }
    }
}
