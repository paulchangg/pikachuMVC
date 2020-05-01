package test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNode;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlImage;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class Snippet 
  {
	@SuppressWarnings("resource")
	public static void main(String[] args) throws FailingHttpStatusCodeException, MalformedURLException, IOException 
	{  
	      
	    // 屏蔽HtmlUnit等系统 log  
	    java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);  
	
	    String url = "https://www.cardu.com.tw/message/list.php?mt_pk=2";  //要抓取的網址
	    System.out.println("開始抓優惠資訊");  
	      
	    // HtmlUnit 模拟浏览器
	    WebClient webClient = new WebClient(BrowserVersion.CHROME);  
	    webClient.getOptions().setUseInsecureSSL(true);					//支持https
	    webClient.getOptions().setJavaScriptEnabled(true);              //启用JS解释器，默认为true  
	    webClient.getOptions().setCssEnabled(false);                    //禁用css支持  
	    webClient.getOptions().setThrowExceptionOnScriptError(false);   //js运行错误时，是否抛出异常  
	    webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);  
	    webClient.getOptions().setTimeout(5 * 1000);                   	//设置连接超时时间  
	    
	    HtmlPage page = webClient.getPage(url); 
	    webClient.waitForBackgroundJavaScript(5 * 1000);               // 執行程式之後等待js運作去抓取網站的時間  
	    String pageAsXml = page.asXml();
	     
	    // Jsoup解析处理  
	    Document doc = Jsoup.parse(pageAsXml);    
	    Elements allJsLinks =doc.select("a[href^='https'][class*='img_div news_list_img']"); 	//AND 取得標題與分頁連結
	    Elements pcontext =doc.select("p[class*='phone_hidden']"); //這是取得P內容
	    Elements datatext =doc.select("span[class*='mb-1']"); //這是取得新聞日期內容
//	    Elements allJsLinks = doc.select("a[href^='https'],[class*='img_div news_list_img']");	//OR
	    Date date = new Date();//系統現在時間
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH");  //現在時間格式
        String dateNowStr = sdf.format(date);  //格式化現在時間
      
        File dir_file = new File("c:/information/pageitem"); //直接建立母資料夾與子資料夾
        if (dir_file.mkdirs()) 
        {
          System.out.println("已建立資料夾");
        } else 
        {
         System.out.println("已存在無法再建立資料夾");
        }
      
        File dir_file2 = new File("c:/information/page");   /*路徑跟檔名*/
        if (dir_file2.mkdir()) 
        {
          System.out.println("已建立資料夾");
        } else 
        {
         System.out.println("已存在無法再建立資料夾");
        }
        
        File dir_file3 = new File("c:/information/picture");   /*路徑跟檔名*/
        if (dir_file3.mkdir()) 
        {
          System.out.println("已建立資料夾");
        } else 
        {
         System.out.println("已存在無法再建立資料夾");
        }
        
        

        
        
        
        System.out.println("共"+allJsLinks.size()+"資料會輸出");
        
	    //首頁資訊
	   for (int i=0;i<allJsLinks.size();i++) 
	   {
	    	String titleValue = allJsLinks.get(i).attr("title").toString();		//URL
	    	String urlNews = allJsLinks.get(i).attr("abs:href").toString();		//URI	
	    	String pstr = pcontext.get(i).text();
	    	String datastr = datatext.get(i).text();
	    
	    	FileWriter fw1=new FileWriter("c:/information/pageitem/日期為"+dateNowStr+"時首頁優惠資訊.txt",true);//產生的路徑放置位置,true為不覆蓋檔案
	     	BufferedWriter bufferOut = new BufferedWriter(fw1,20);//20為一個緩衝區的字元可以自己設定
	     	
	       
	    	bufferOut.write(titleValue);//新聞標題
	    	bufferOut.newLine();//換行
	    	bufferOut.write(datastr);//新聞日期
	    	bufferOut.newLine();//換行
	    	bufferOut.write(pstr);//新聞內容
	    	bufferOut.newLine();//換行
	    	bufferOut.write(urlNews);//新聞連結
	    	bufferOut.newLine();//換行
	    	bufferOut.flush();//緩衝區內容立刻寫入檔案
	    	fw1.close();//關檔
	    	System.out.println("第"+(i+1)+"份首頁資料產生");
	    	
	    	
	    	
	    	//從連結網站再往裡面找一次要的資料
	        page = webClient.getPage(urlNews);
	        webClient.waitForBackgroundJavaScript(5 * 1000);
	        pageAsXml = page.asXml();
	        Document docNews = Jsoup.parse(pageAsXml);
	        Elements alltext =docNews.select("[class*='detail_title']").select("h2"); //文章標題
	        Elements acttime =docNews.select("[class*='detail_title']").select("p");//活動時間
	        Elements contextarea =docNews.select("[class*='detail_content']").select("p");//文章內容  
	        Elements imgarea =docNews.select("[class*='con_img']").select("img");//因為要找圖片所以要爬兩層
	      
	    
	        String textvalue=alltext.text();//標題
	        String acttext=acttime.text();//活動時間
	        String contextvalue=contextarea.get(3).text();//文章內容
	        String imgpicture = imgarea.attr("src").toString();//找出img src連結	
	         
	        
	    	FileWriter fw2=new FileWriter("c:/information/page/日期為"+dateNowStr+"時分頁優惠資訊.txt",true);//產生的路徑放置位置,true為不覆蓋檔案
		    BufferedWriter bufferOut2 = new BufferedWriter(fw2,20);//20為一個緩衝區的字元可以自己設定
		 
		    bufferOut2.write(textvalue);//標題
		    bufferOut2.newLine();//換行
		    bufferOut2.write(acttext);//活動時間
		    bufferOut2.newLine();//換行
		    bufferOut2.write(contextvalue);//文章內容
		    bufferOut2.newLine();//換行
		    bufferOut2.flush();//緩衝區內容立刻寫入檔案
            fw2.close();
            System.out.println("第"+(i+1)+"份分資料產生"); 
            
            url = imgpicture;
	        Download(url);

            
	     }
            System.out.println("全部資料皆以輸出(包含圖片)"); 
            webClient.close();
	    }
	
	     //抓圖片的方法
	     private static  String Download(String urlList) {
         URL url = null;
         String filepath="";
         
         try {
            url = new URL(urlList);
            DataInputStream dataInputStream = new DataInputStream(url.openStream());
            String newpaht ="c:/information/picture";
            try{
				File file = new File(newpaht);
				if(!file.exists()){
					file.mkdirs();					
				}
			}catch(Exception ex){
				System.out.println(ex);
			}
            filepath=newpaht+"\\"+urlList.substring(urlList.lastIndexOf("/")+1, urlList.length());//這句我看不懂為啥要加+1?
            FileOutputStream fileOutputStream = new FileOutputStream(new File(filepath));
            ByteArrayOutputStream output = new ByteArrayOutputStream();
 
            byte[] buffer = new byte[1024];
            int length;
 
            while ((length = dataInputStream.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
            fileOutputStream.write(output.toByteArray());
            dataInputStream.close();
            fileOutputStream.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return filepath;

	   }

	}
	 	 

	
	

	
	
