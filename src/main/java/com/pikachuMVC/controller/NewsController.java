package com.pikachuMVC.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pikachuMVC.model.NewsBean;
import com.pikachuMVC.service.NewsService;

@RequestMapping("/news")
@Controller
public class NewsController {
	@Autowired
	NewsService service;

	
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
	
	if(file != null) {
		System.out.println("OK");
	}else {
		System.out.println("GG");
	}
	
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


}
