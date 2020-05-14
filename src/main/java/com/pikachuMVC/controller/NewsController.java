package com.pikachuMVC.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.NewsBean;
import com.pikachuMVC.service.NewsService;

@RequestMapping("/news")
@Controller
public class NewsController {
	@Autowired
	NewsService service;
	@Autowired
	ServletContext context ;

	
@GetMapping("/lastestNews")	
public String getLastestNews(HttpServletRequest request) {
	List<NewsBean> list = service.getLastestNews();
	List<NewsBean> list2 = service.getLastestNews2();
	request.setAttribute("newslist", list);
	request.setAttribute("newslist2", list2);
	
	return "/news/information";
}	
@SuppressWarnings("unused")
@GetMapping("/NewsInfo")	
public String getNews(HttpServletRequest request) throws IOException {
	String nId = request.getParameter("id");
	int id =Integer.parseInt(nId);
	
	NewsBean news = service.getNewsById(id);
	String txtPath = news.getContent();
	File file = new File(txtPath);
	
//	if(file != null) {
//		System.out.println("OK");
//	}else {
//		System.out.println("GG");
//	}
	
	InputStreamReader reader = new InputStreamReader(new FileInputStream(file),"UTF-8");
	BufferedReader br = new BufferedReader(reader); 
	String line = null;
	String cont = "";
	while ((line=br.readLine()) != null) {
		cont+=line;
	}
	br.close();
//	System.out.println(cont);
	request.setAttribute("news", news);
	request.setAttribute("content", cont);
	
	

	return "/news/informationtwo";
}		
@GetMapping("/RetrieveNewsImg")	
@ResponseBody
public byte[] RetrieveNewsImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	OutputStream os = null;
	InputStream is = null;
	String fileName = null;
	String mimeType = null;
	Blob blob = null;
	byte[] bytes = new byte[8192];
	try {
		// 讀取瀏覽器傳送來的主鍵
		String id = request.getParameter("id");
		// 讀取瀏覽器傳送來的type，以分辨要處理哪個表格
		int nId = 0;
		try {
			nId = Integer.parseInt(id);
		} catch(NumberFormatException ex) {
			;
		}
		NewsBean bean = service.getNewsById(nId);
		if (bean != null) {
			blob = bean.getN_img();
			if (blob != null) {
				is = blob.getBinaryStream();
			}
			fileName = "picture.jpg";
		}
		// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.jpg)	
		if (is == null) {
			fileName = "NoImage.jpg" ; 
			is = context.getResourceAsStream(
					"/images/" + fileName);
		}
		
		// 由圖片檔的檔名來得到檔案的MIME型態
		mimeType = context.getMimeType(fileName);
		// 設定輸出資料的MIME型態
		response.setContentType(mimeType);
		// 取得能寫出非文字資料的OutputStream物件
		os = response.getOutputStream();	
		// 由InputStream讀取位元組，然後由OutputStream寫出
		int len = 0;
//		byte[] bytes = new byte[8192];
		while ((len = is.read(bytes)) != -1) {
			os.write(bytes, 0, len);
		}
	} catch(SQLException ex) {
		ex.printStackTrace();
		throw new RuntimeException("RetrieveBCardImgServlet#doGet()發生SQLException: " + ex.getMessage());
	} finally{
		if (is != null) is.close();
		if (os != null) os.close();		
	}		
		
		return bytes;
}

}

