package com.pikachuMVC.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.pikachuMVC.service.NewsService;

@Controller
public class HomeController {
	public HomeController() {
	}
	
	@Autowired
	NewsService newsService;
	
//	@Autowired
//	CardService service;
//
//	@Autowired
//	CardDao dao;
//	
//	@Autowired
//	ProductDao productDao;
//	
//	@Autowired
//	ProductService productService;
//	
//	@Autowired
//	ArticleDao articleDao;
//	
//	@Autowired
//	ArticleService articleService;
//
//	@Autowired
//	IFoumService foumservice;
//	
//	@Autowired
//	IForumDao iForumDao;	

//	@Autowired
//	MemberDao memberDao;
//
//	@Autowired
//	MemberService memberService;
//
//	@Autowired
//	ILaunch_activityDao launch_activityDao;
//
//	@Autowired
//	ILaunch_activityService launch_activityService;
	
//	private List<CardBean> list = new ArrayList<CardBean>();
//	private List<ProductBean> productList = new ArrayList<ProductBean>();
//	private List<ArticleClassificarionBean> fourmList = new ArrayList<ArticleClassificarionBean>();
//	private List<FoumBean> forumList = new ArrayList<FoumBean>();
//	private List<MemberBean> memberList = new ArrayList<MemberBean>();
//	private List<Launch_activityBean> activityList = new ArrayList<>();
	@GetMapping({ "/", "/index" })
	public String home() throws FailingHttpStatusCodeException, MalformedURLException, IOException, ParseException {
		

		if (!judgeNewsFolder()) {
			newsService.newsCrawler();
		}

//		
//		if (list.size() == 0) {
//			if (service.getCards().size() == 0) {
//				dao.insertCards();
//			}
//			list = service.getCards();
//		}
//		
//		if (productList.size() == 0) {
//			if (productService.getProducts().size() == 0) {
//				productDao.insertProducts();
//			}
//			productList = productService.getProducts();
//		}
//		
//		if (fourmList.size() == 0) {
//			if (articleService.getforumBean().size() == 0) {
//				articleDao.insertFourm();
//			}
//			fourmList = articleService.getforumBean();
//		}
//		
//		
//		if(forumList.size() ==0) {
//			if(foumservice.getAllfname().size() ==0) {
//				iForumDao.insertFoum();
//			}
//			forumList =foumservice.getAllfname();
//		}
//		if (memberList.size() == 0) {
//
//			
//			if (memberService.getAllMember().size() == 0) {
//				memberDao.addmember();
//			}
//			memberList = memberService.getAllMember();
//		}
//
//		if (activityList.size() == 0) {
//			
//			if (launch_activityService.getAllArticles().size() == 0) {
//			
//				launch_activityDao.addFirstSomeActivity();
//			}
//			
//			activityList = launch_activityService.getAllArticles();
//
//		}
				
		return "index";
	}
	
	@GetMapping("/about_us")
	public String aboutUs() {
		return "about_us";
	}
	
	private Boolean judgeNewsFolder() {
	    	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
			String today = sdFormat.format(new Date());
//			String txtPath = "C:\\_JSP\\workspaceJDBC\\pikachuMVC\\src\\main\\webapp\\news\\" + today;  //song
			String txtPath = "/Users/paulchang/jsp_workspace/pikachuMVC/src/main/webapp/news/" + today;
			File file = new File(txtPath);
			return file.exists();
	}
}
