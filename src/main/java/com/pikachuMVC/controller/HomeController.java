package com.pikachuMVC.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.pikachuMVC.dao.ArticleDao;
import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.ArticleClassificarionBean;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.ProductBean;
import com.pikachuMVC.service.NewsService;
import com.pikachuMVC.service.ArticleService;
import com.pikachuMVC.service.CardService;
import com.pikachuMVC.service.IFoumService;
import com.pikachuMVC.service.ProductService;

@Controller
public class HomeController {
	public HomeController() {
	}
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	CardService service;

	@Autowired
	CardDao dao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ArticleDao articleDao;
	
	@Autowired
	ArticleService articleService;

	@Autowired
	IFoumService foumservice;
	
	@Autowired
	IForumDao iForumDao;
	
	private List<CardBean> list = new ArrayList<CardBean>();
	private List<ProductBean> productList = new ArrayList<ProductBean>();
	private List<ArticleClassificarionBean> fourmList = new ArrayList<ArticleClassificarionBean>();
	private List<FoumBean> forumList = new ArrayList<FoumBean>();
	@GetMapping({ "/", "/index" })
	public String home() throws FailingHttpStatusCodeException, MalformedURLException, IOException, ParseException {
		
		if (!judgeNewsFolder()) {
			newsService.newsCrawler();
	}
		
		if (list.size() == 0) {
			if (service.getCards().size() == 0) {
				dao.insertCards();
			}
			list = service.getCards();
		}
		
		if (productList.size() == 0) {
			if (productService.getProducts().size() == 0) {
				productDao.insertProducts();
			}
			productList = productService.getProducts();
		}
		
		if (fourmList.size() == 0) {
			if (articleService.getforumBean().size() == 0) {
				articleDao.insertFourm();;
			}
			fourmList = articleService.getforumBean();
		}
		
		
		if(forumList.size() ==0) {
			if(foumservice.getAllfname().size() ==0) {
				iForumDao.insertFoum();
			}
			forumList =foumservice.getAllfname();
		}
		
		
		
		return "index";
	}
	
	private Boolean judgeNewsFolder() {
		LocalTime nineOC = LocalTime.of(9, 0, 0);
	    LocalTime nH = LocalTime.now();
	    if (nH.isAfter(nineOC)) {
	    	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
			String today = sdFormat.format(new Date());
			File file = new File("C:\\Users\\Rubylulu\\pikachuMVC\\src\\main\\webapp\\news\\" + today);
			return file.exists();
			
	    } else {
	    	Calendar   cal   =   Calendar.getInstance();
	    	cal.add(Calendar.DATE, -1);
	    	String yesterday = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
	    	File file = new File("C:\\Users\\Rubylulu\\pikachuMVC\\src\\main\\webapp\\news\\" + yesterday);
	    	return file.exists();
	    }
	}
}
