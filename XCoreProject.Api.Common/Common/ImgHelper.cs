using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Text;

namespace XCoreProject.Api.Common.Common
{
    class ImgHelper
    {

        /// <summary>
        /// 创建缩略图
        /// </summary>
        /// <param name="srcFileName"></param>
        /// <param name="destFileName"></param>
        private static void CreateThumbnailImage(string srcFileName, string destFileName,int widthHeight)
        {
            using (var img = new Bitmap(srcFileName))
            {
                Size originalSize = new Size(img.Width, img.Height);
                Size targetSize = new Size(widthHeight, widthHeight);
                targetSize = CalculateNewImageSize(originalSize, targetSize);
                using (
                    var bitmap = new Bitmap(targetSize.Width, targetSize.Height, PixelFormat.Format32bppArgb))
                {
                    using (Graphics g = Graphics.FromImage(bitmap))
                    {
                        g.InterpolationMode = InterpolationMode.Low;
                        using (var wrapmode = new ImageAttributes())
                        {
                            wrapmode.SetWrapMode(WrapMode.TileFlipXY);
                            g.DrawImage(img, new Rectangle(0, 0, targetSize.Width, targetSize.Height),
                                0, 0,
                                img.Width,
                                img.Height,
                                GraphicsUnit.Pixel,
                                wrapmode);
                        }
                    }
                    bitmap.Save(destFileName);
                }
            }
        }

        /// <summary>
        /// 计算缩略图的尺寸
        /// </summary>
        /// <param name="originalSize"></param>
        /// <param name="targetSize"></param>
        /// <returns></returns>
        private static Size CalculateNewImageSize(Size originalSize, Size targetSize)
        {
            if (originalSize.Width <= targetSize.Width &&
                originalSize.Height <= targetSize.Height)
            {
                //目标尺寸比原尺寸大，那么直接使用原尺寸
                return originalSize;
            }

            double targetRatio = GetRatio(targetSize);
            double originalRatio = GetRatio(originalSize);

            var size = new Size(targetSize.Width, targetSize.Height);

            if (originalRatio < targetRatio)
            {
                size.Width = (originalSize.Width * targetSize.Height) / originalSize.Height;
            }
            else
            {
                size.Height = (originalSize.Height * targetSize.Width) / originalSize.Width;
            }

            return size;
        }

        private static double GetRatio(Size size)
        {
            return (double)size.Width / size.Height;
        }
    }
}
