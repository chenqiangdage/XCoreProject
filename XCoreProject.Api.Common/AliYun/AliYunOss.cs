using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Aliyun.OSS;
using Aliyun.OSS.Common;

namespace XCoreProject.Api.Common.AliYun
{
    public class AliYunOss
    {
        public static OssClient client;        
        public AliYunOss()
        {
            InitAliYunOss();
        }

        public void InitAliYunOss()
        {
            // 创建ClientConfiguration实例，按照您的需要修改默认参数。
            var conf = new ClientConfiguration();
            // 开启支持CNAME。CNAME是指将自定义域名绑定到存储空间上。
            conf.IsCname = true;             
            conf.MaxErrorRetry = 3;
            conf.ConnectionTimeout = 3000;
            client = new OssClient(AliYunOssConfig.Endpoint,AliYunOssConfig.AccessKeyId,AliYunOssConfig.AccessKeySecret, conf);
        }

        public bool PutFileToOss(Stream FileStream,string FileKey)
        {            
            try
            {
                // 上传文件。
                PutObjectResult pubResult = client.PutObject(AliYunOssConfig.BucketName, FileKey, FileStream);
                if (pubResult.HttpStatusCode == System.Net.HttpStatusCode.OK)
                {
                    Console.WriteLine("Put object succeeded :" + pubResult.ETag);
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Put object failed, {0}", ex.Message);
            }
            return false;
        }
    }
}
