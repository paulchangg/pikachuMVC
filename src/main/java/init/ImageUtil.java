package init;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageUtil {

	/**
	 * 將圖形縮小後回傳，如果發生錯誤就直接回傳原圖， 例如：imageSize值<=1、無法取得圖的寬高、發生Exception
	 * 
	 * @param srcImageData
	 *            來源圖形資料
	 * @param newSize
	 *            欲將圖形縮至多少尺寸以下，50代表將尺寸縮小至50x50以內
	 * @return 縮小完畢的圖形資料
	 */
	public static byte[] shrink(byte[] srcImageData, int newSize) {
		ByteArrayInputStream bais = new ByteArrayInputStream(srcImageData);
		// 縮小比例，4代表除以4
		double sampleSize = 1;
		int imageWidth = 0;
		int imageHeight = 0;

		// 如果欲縮小的尺寸過小，就直接定為50
		if (newSize <= 50) {
			newSize = 50;
		}

		try {
			BufferedImage srcBufferedImage = ImageIO.read(bais);
			int type = srcBufferedImage.getType();
			String format = "";
			if (type == BufferedImage.TYPE_4BYTE_ABGR || type == BufferedImage.TYPE_4BYTE_ABGR_PRE
					|| type == BufferedImage.TYPE_INT_ARGB || type == BufferedImage.TYPE_INT_ARGB_PRE) {
				format = "png";
			} else {
				format = "jpg";
			}
			imageWidth = srcBufferedImage.getWidth();
			imageHeight = srcBufferedImage.getHeight();
			if (imageWidth == 0 || imageHeight == 0) {
				return srcImageData;
			}
			// 只要圖檔較長的一邊超過指定長度(desireSize)，就計算欲縮小的比例
			// 並將圖檔寬高都除以欲縮小比例
			int longer = Math.max(imageWidth, imageHeight);
			if (longer > newSize) {
				sampleSize = longer / (long) newSize;
				imageWidth = (int) (srcBufferedImage.getWidth() / sampleSize);
				imageHeight = (int) (srcBufferedImage.getHeight() / sampleSize);
			}

			BufferedImage scaledBufferedImage = new BufferedImage(imageWidth, imageHeight, type);
			Graphics graphics = scaledBufferedImage.createGraphics();
			graphics.drawImage(srcBufferedImage, 0, 0, imageWidth, imageHeight, null);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(scaledBufferedImage, format, baos);
			return baos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			return srcImageData;
		}
	}
}
