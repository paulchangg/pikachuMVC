package com.pikachuMVC.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pikachuMVC.model.NewsBean;
import com.pikachuMVC.service.NewsService;


@Controller
public class NewsController {
	@Autowired
	NewsService service;

	@GetMapping("/newslist")
	public String List(Model model) {
		List<NewsBean> list = service.getAllNews();
		model.addAttribute("newslist", list);
		return "newslist";
	}
	
	@GetMapping("/news")
	public String getProductById(@RequestParam("title") String title,Model model) {
		model.addAttribute("news", service.getNewsByTitle(title));
		return "news";
	}
	
}
