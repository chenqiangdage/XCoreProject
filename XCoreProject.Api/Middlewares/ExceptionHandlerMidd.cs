﻿using XCoreProject.Api.AuthHelper.Policys;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Threading.Tasks;

namespace XCoreProject.Api.Middlewares
{
    public class ExceptionHandlerMidd
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionHandlerMidd> _logger;

        public ExceptionHandlerMidd(RequestDelegate next, ILogger<ExceptionHandlerMidd> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception e)
        {
            if (e == null) return;

            _logger.LogError(e, e.GetBaseException().ToString());

            await WriteExceptionAsync(context, e).ConfigureAwait(false);
        }

        private static async Task WriteExceptionAsync(HttpContext context, Exception e)
        {
            if (e is UnauthorizedAccessException)
                context.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
            else if (e is Exception)
                context.Response.StatusCode = (int)HttpStatusCode.BadRequest;

            context.Response.ContentType = "application/json";

            await context.Response.WriteAsync(JsonConvert.SerializeObject(new ApiResponse(StatusCode.CODE500,e.Message))).ConfigureAwait(false);
        }
    }
}
