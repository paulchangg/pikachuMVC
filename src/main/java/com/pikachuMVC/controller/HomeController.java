package com.pikachuMVC.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.service.CardService;

@Controller
public class HomeController {
	public HomeController() {
	}

	@Autowired
	CardService service;

	@Autowired
	CardDao dao;

	private List<CardBean> list = new ArrayList<CardBean>();

	@GetMapping({ "/", "/index" })
	public String home() {
		if (list.size() == 0) {
			if (service.getCards().size() == 0) {
				dao.insertCards();
			}
			list = service.getCards();
		}

		return "index";
	}
}
