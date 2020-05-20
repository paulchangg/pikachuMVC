package com.pikachuMVC.service.impl;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.pikachuMVC.dao.NewsDao;
import com.pikachuMVC.model.NewsBean;
import com.pikachuMVC.service.NewsService;

@Transactional
@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	NewsDao dao;
	
	@Override
	public List<NewsBean> getAllNews() {
		return dao.getAllNews();
	}
	
	@Override
	public NewsBean getNewsByTitle(String title) {
		return dao.getNewsByTitle(title);
	}

//	@Scheduled(cron = "0 0 9-18/3 ? * MON-FRI")
	@Scheduled(cron = "0 0 8 * * ?")
	@Override
	public void newsCrawler() throws 
	FailingHttpStatusCodeException, MalformedURLException, IOException, ParseException {
		
		// 屏蔽HtmlUnit等系统 log
		java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);

		String url = "https://www.cardu.com.tw/message/list.php?mt_pk=2";
		System.out.println("開始抓優惠資訊");

		// HtmlUnit 模拟浏览器
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		webClient.getOptions().setUseInsecureSSL(true); // 支援https協定
		webClient.getOptions().setJavaScriptEnabled(true); // 啟用javascript直譯器，預設本來就是為true
		webClient.getOptions().setCssEnabled(false); // 不啟用css直譯器，HtmlUnit弱項...
		webClient.getOptions().setThrowExceptionOnScriptError(false); // javascript錯誤時，是否丟出異常
		webClient.getOptions().setThrowExceptionOnFailingStatusCode(false); // WebClient錯誤時，是否丟出異常(EX: HTTP 404 Not
																			// Found)
		webClient.getOptions().setTimeout(5 * 1000); // setTimeout...5~10秒差不多
		
		HtmlPage page = webClient.getPage(url);
		webClient.waitForBackgroundJavaScript(5 * 1000); // 等待javascript後台處理時間(5s)...也是5~10秒差不多
		Document doc = Jsoup.parse(page.asXml());
		//抓今天時間
		SimpleDateFormat sdfOfFolder = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String today = sdfOfFolder.format(date);  //轉變今天日期的格式
		String txtPath = "C:\\_JSP\\workspaceJDBC\\pikachuMVC\\src\\main\\webapp\\news\\" + today + "\\content\\";
		File txtFolder = new File(txtPath);
		
		if(!txtFolder.exists()) {
		txtFolder.mkdirs();
		}
		
		for (Element newsLink : doc.select("a[href][class*='img_div news_list_img']")) {     //取得dom 陣列
			//[class*='img_div news_list_img']
			NewsBean news = new NewsBean();
			url = "https://www.cardu.com.tw"+newsLink.attr("href");                 //各新聞的超連結
			System.out.println(url);
			page = webClient.getPage(url);						//連到該新聞網頁(開第二層)
			webClient.waitForBackgroundJavaScript(5 * 1000);
			Document docC = Jsoup.parse(page.asXml());         //第二層網頁再分析
			
			// 新聞標題
			String newsTitle = newsLink.attr("title");   //該dom的title屬性
			System.out.println(newsTitle);
			//檢查新聞title有沒有在資料庫，若有就跳過此次迴圈，不寫入
			if(dao.titleExists(newsTitle)){
				continue;
			}else {
				news.setTitle(newsTitle);	
			}
			
			
//			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			news.setCreateDate(date);
			news.setFolder("/"+today);
			// 抓取內文
			Element contentE2 = docC.select("[class='pb-3 mx-3 detail_content']").get(0);
			// 準備刪除的部份
			Element p = contentE2.select("p").get(1);
			
			// 抓取img
			Element contentE3 = docC.select("[class='con_img']").get(0);
			//活動時間
			Elements acttime =docC.select("[class*='detail_title']").select("p");
			String acttext=acttime.text();//活動時間
			
			String content = contentE2.text().toString().replace(p.text().toString(), "").trim();   //內容
			String txtName = ("[" + today + "]" + newsTitle + ".txt").replaceAll("[\\/:*?><|\"]", "");
//			String txtPath = "C:\\Users\\Rubylulu\\pikachuMVC\\src\\main\\webapp\\news\\" + today + "\\content\\";
//			news.setContent("/content/"+txtName);  
			news.setActTime(acttext);
			news.setContent(txtPath+txtName);
			news.setIntro(content.substring(0, 80));
			BufferedInputStream in = null;
			ByteArrayOutputStream out = null;
			HttpURLConnection httpUrlConnection = null;
			FileOutputStream file = null;

			try {
				
				File txt = new File(txtPath + txtName);
				if (!txt.exists() || txt.length() == 0) {   //沒有文字檔 或有檔沒內容					
					OutputStreamWriter otTxt = new OutputStreamWriter(new FileOutputStream(txt), "UTF-8");
					otTxt.write(content);
					otTxt.flush();
					otTxt.close();
				} else {
					continue;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 抓取圖片url
			try {
			String imgLink = contentE3.select("img").get(0).attr("src");
//			System.out.println(imgLink);			
//			String imgName = today + "-" + imgLink.substring(imgLink.lastIndexOf('/') + 1);
//			String imgPath = "C:\\_JSP\\workspaceJDBC_s\\pikachuMVC\\src\\main\\webapp\\news\\" + today + "\\img\\";
//			System.out.println(imgPath);
//			news.setImage("/img/"+imgName);
//			news.setImage(today+"/img/"+imgName);
			in = null;
			out = null;
			httpUrlConnection = null;
			file = null;
			Blob n_img;
				if (imgLink.startsWith("https://")) {
					// HTTPS時
					httpUrlConnection = getHttpURLConnectionFromHttps(imgLink);
				}

				if (httpUrlConnection == null) {
					// 如果不是HTTPS或是沒成功得到httpUrlConnection，用HTTP的方法
					httpUrlConnection = (HttpURLConnection) (new URL(imgLink)).openConnection();
				}

				// 設置User-Agent，偽裝成一般瀏覽器，不然有些伺服器會擋掉機器程式請求
				httpUrlConnection.setRequestProperty("User-Agent",
						"Mozilla/5.0 (Linux; Android 4.2.1; Nexus 7 Build/JOP40D) "
								+ "AppleWebKit/535.19 (KHTML, like Gecko) " + "Chrome/18.0.1025.166  Safari/535.19");
				httpUrlConnection.connect();

				if (httpUrlConnection.getResponseCode() == 200) {

					in = new BufferedInputStream(httpUrlConnection.getInputStream());
					out = new ByteArrayOutputStream();

					// 建立串流Buffer
					byte[] buffer = new byte[819200];
//					File imgFolder = new File(imgPath);
//					File img = new File(imgPath + imgName);
//					if (!img.exists() || img.length() == 0) {
//						try {
//							imgFolder.mkdirs();
//						} catch (Exception e) {
//							e.printStackTrace();
//						}
//						file = new FileOutputStream(img);

						int readByte;
						while ((readByte = in.read(buffer)) != -1) {
							// 輸出檔案
							out.write(buffer, 0, readByte);
						}
//						out.writeTo(file);
						byte[] response = out.toByteArray();
//						file.write(response);
						
						try {
							n_img = new SerialBlob(response);
							news.setN_img(n_img);
						} catch (SerialException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
//					} else {
//						continue;
//					}
//
				}
//		        //下載成功後，返回檔案路徑
//		        filePath = fileDirectoryPath + File.separator + fileNameWithoutFormat + "." + imageType;
//		       }
				
				addNews(news);		
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IndexOutOfBoundsException e) {
				continue;
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				// 關閉各種串流
				try {
					if (out != null) {
						out.close();
					}
					if (in != null) {
						in.close();
					}
					if (httpUrlConnection != null) {
						httpUrlConnection.disconnect();
					}
					if (file != null) {
						file.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		webClient.close();
	}

	public static HttpURLConnection getHttpURLConnectionFromHttps(String url) {
		HttpURLConnection httpUrlConnection = null;
		// 建立一個信認所有憑證的X509TrustManager，放到TrustManager裡面
		TrustManager[] trustAllCerts;
		try {
			trustAllCerts = new TrustManager[] { new X509TrustManager() {

				public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException { 
				}

				public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException { 
				}

				public X509Certificate[] getAcceptedIssuers() {
					return null;
				}
			} };

			// 設置SSL設定
			SSLContext sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());
			// 跟HTTP一樣，用Url建立連線
			httpUrlConnection = (HttpURLConnection) (new URL(url)).openConnection();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return httpUrlConnection;
	}

	@Override
	public void addNews(NewsBean news) {
		dao.addNewsBean(news);	
	}

	@Override
	public List<NewsBean> getLastestNews() {
	
		return dao.getLastestNews();
	}

	@Override
	public NewsBean getNewsById(int id) {
		
		return dao.getNewsById(id);
	}

	@Override
	public List<NewsBean> getLastestNews2() {
		return dao.getLastestNews2();
	}
}
