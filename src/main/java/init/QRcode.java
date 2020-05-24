package init;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.EnumMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
 
/**
 * @author Crunchify.com
 * Updated: 03/20/2016 - added code to narrow border size 
 */
 
public class QRcode {
 
	// Tutorial: http://zxing.github.io/zxing/apidocs/index.html
	
	public static String myCodeText = null;
	
//	public static String filePath = "D:\\spring\\QR\\CrunchifyQR.png";
	public static String filePath = "E:\\spring\\QR\\CrunchifyQR.png";  //宋用
//	public static String filePath = "/Users/paulchang/Desktop/CrunchifyQR.png";

	public static void main(String[] args) {
		
		File dir = new File(filePath); 
		
		if (!dir.exists()) {
			dir.mkdirs();
		}else {
			 System.out.println("创建目录失败！"); 
		}
		
		
		int size = 250;
		String fileType = "png";
		File myFile = new File(filePath);
		try {
			
			Map<EncodeHintType, Object> hintMap = new EnumMap<EncodeHintType, Object>(EncodeHintType.class);
			hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			
			// Now with zxing version 3.2.1 you could change border size (white border size to just 1)
			hintMap.put(EncodeHintType.MARGIN, 1); /* default = 4 */
			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
 
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix byteMatrix = qrCodeWriter.encode(myCodeText, BarcodeFormat.QR_CODE, size,
					size, hintMap);
			int CrunchifyWidth = byteMatrix.getWidth();
			BufferedImage image = new BufferedImage(CrunchifyWidth, CrunchifyWidth,
					BufferedImage.TYPE_INT_RGB);
			image.createGraphics();
 
			Graphics2D graphics = (Graphics2D) image.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, CrunchifyWidth, CrunchifyWidth);
			graphics.setColor(Color.BLACK);
 
			for (int i = 0; i < CrunchifyWidth; i++) {
				for (int j = 0; j < CrunchifyWidth; j++) {
					if (byteMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}
			ImageIO.write(image, fileType, myFile);
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("\n\nYou have successfully created QR Code.");
	}
	
	public static long parseTimeString2Date(String timeString) {
		if ((timeString == null) || (timeString.equals(""))) {
			return 0;
		}
		Date date2 = null;
		Date date = new Date();
		long day = 0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date2 = new Date(dateFormat.parse(timeString).getTime());
			day = (date.getTime()-date2.getTime())/(24*60*60*1000)>0 ? (date.getTime()-date2.getTime())/(24*60*60*1000):
				(date2.getTime()-date.getTime())/(24*60*60*1000);
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return day;
	}
	
}
