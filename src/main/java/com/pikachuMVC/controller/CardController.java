package com.pikachuMVC.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.service.CardService;




@Controller
@RequestMapping("/cards")
public class CardController {
	
	@Autowired
	CardService service;
	
	@Autowired
	CardDao dao;
	
	@Autowired
	ServletContext context ;
	
//	@Autowired
//	CardBean bean;
	
@GetMapping("/cradeitsearch_produce")	
public String CardDetail(HttpServletRequest request) {
	
	String id = request.getParameter("id");
	int nId = Integer.parseInt(id);
	CardBean bean = service.getCard(nId);
	request.setAttribute("bean", bean);

	return "/cards/cradeitsearch_produce";
		
}

@GetMapping("/cradeitCb")	
public String CbPageCardsServlet(HttpServletRequest request) {
	
	String queryType = request.getParameter("qt");
	
	Map<Integer, CardBean> CardMap;
	
	switch(queryType){
	
	case "main":
	CardMap = service.getRandomBean();
	break;
	
	case "cb":
	CardMap = service.getCbPageCards();
	break;

	case "ml":
	CardMap = service.getMlPageCards();
	break;

	case "oil":
	CardMap = service.getOilPageCards();
	break;
	
	case "mv":
	CardMap = service.getMvPageCards();
	break;
	
	case "os":
	CardMap = service.getOsPageCards();
	break;
	
	case "zi":
	CardMap = service.getZiPageCards();
	break;
	
	case "fg":
	CardMap = service.getFgPageCards();
	break;
	
	case "all":
	CardMap = service.getAllCards();
	break;

	default:
	CardMap = service.getCbPageCards();
	}
	int cardCounts = CardMap.size();
	request.setAttribute("cardCounts", cardCounts);
	request.setAttribute("qt", queryType);	
	request.setAttribute("products_DPP", CardMap);

	return "/cards/cradeitsearch_page";		
}

@PostMapping("*.do")
public String ModalSearch(HttpServletRequest request) throws UnsupportedEncodingException {
	
	System.out.println("----------------------------------");
	//取得modal選單查詢的條件
	
	String ops1="";
	String ops2="";
	String ops3="";
	ops1 = request.getParameter("opt1");
	ops2 = request.getParameter("opt2");
	ops3 = request.getParameter("opt3");
	String sal =  request.getParameter("sal");
	
	
	//組合查詢條件
	List<String> op = new ArrayList<>();
	op.add(ops1);
	op.add(ops2);
	op.add(ops3);
	
	String al = "";
	for(String s :op) {
		if(s.indexOf("c.") != -1) {
			al=al +" and " +s; 
		}			
	}
	//成為一個完整的hql
	String ql = "From CardBean c WHERE " + sal + al;
	System.out.println(ql);
	
	Map<Integer, CardBean> CardMap = service.getModalBean(ql);
	request.setAttribute("products_DPP", CardMap);
	
	return "cards/cradeitsearch_minecredit";
	
}

@GetMapping("/RetrieveCardImg")	
@ResponseBody
public byte[] RetrieveCardImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
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
		CardBean bean = service.getCard(nId);
		if (bean != null) {
			blob = bean.getC_img();
			if (blob != null) {
				is = blob.getBinaryStream();
			}
			fileName = "cards.jpg";
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
@GetMapping("/cradeitsearch_minecredit")
public String trans() {
	return "cards/cradeitsearch_minecredit";
}

@PostMapping("/cradeitsearch_minecredit")
@ResponseBody
public void ajaxModel(HttpServletRequest request, HttpServletResponse response) throws IOException {
	String ops1="";
	String ops2="";
	String ops3="";
	ops1 = request.getParameter("opt1");
	ops2 = request.getParameter("opt2");
	ops3 = request.getParameter("opt3");
	String sal =  request.getParameter("sal");
	
	
	//組合查詢條件
	List<String> op = new ArrayList<>();
	op.add(ops1);
	op.add(ops2);
	op.add(ops3);
	
	String al = "";
	for(String s :op) {
		if(s.indexOf("c.") != -1) {
			al=al +" and " +s; 
		}			
	}
	//成為一個完整的hql
	String ql = "From CardBean c WHERE " + sal + al;
	System.out.println(ql);
	
	Map<Integer, CardBean> CardMap = service.getModalBean(ql);
	
	response.setContentType("application/json; charset=utf-8");
	PrintWriter out = response.getWriter();
	String cardJson = new Gson().toJson(CardMap);
	out.write(cardJson);
	out.flush();

}







}
