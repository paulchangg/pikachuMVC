package com.pikachuMVC.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.dao.FourmDao;
import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.ForumBean;
import com.pikachuMVC.model.ProductBean;
import com.pikachuMVC.service.CardService;
import com.pikachuMVC.service.FourmService;
import com.pikachuMVC.service.ProductService;

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

	private List<CardBean> list = new ArrayList<CardBean>();
	private List<ProductBean> productList = new ArrayList<ProductBean>();
	private List<ForumBean> fourmList = new ArrayList<ForumBean>();

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
		
		

		return "index";
	}
}
