package com.pikachuMVC.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.dao.FourmDao;
import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.ForumBean;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.ProductBean;
import com.pikachuMVC.service.CardService;
import com.pikachuMVC.service.FourmService;
import com.pikachuMVC.service.IFoumService;
import com.pikachuMVC.service.ProductService;
import com.pikachuMVC.service.impl.FoumServiceImpl;

@Controller
public class HomeController {
	public HomeController() {
	}

	@Autowired
	CardService service;

	@Autowired
	CardDao dao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FourmDao fourmDao;
	
	@Autowired
	FourmService fourmService;
	
	@Autowired
	IFoumService foumservice;
	
	@Autowired
	IForumDao iForumDao;

	private List<CardBean> list = new ArrayList<CardBean>();
	private List<ProductBean> productList = new ArrayList<ProductBean>();
	private List<ForumBean> fourmList = new ArrayList<ForumBean>();

	private List<FoumBean> forumList = new ArrayList<FoumBean>();
	
	@GetMapping({ "/", "/index" })
	public String home() {
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
			if (fourmService.getforumBean().size() == 0) {
				fourmDao.insertFourm();;
			}
			fourmList = fourmService.getforumBean();
		}
		
		if(forumList.size() ==0) {
			if(foumservice.getAllfname().size() ==0) {
				iForumDao.insertFoum();
			}
			forumList =foumservice.getAllfname();
		}
		
			
		

		return "index";
	}
}
