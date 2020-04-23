package com.pikachuMVC.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.service.CardService;

@Service
public class CardServiceImpl implements CardService {
	@Autowired
	CardDao dao;

	@Override
	@Transactional
	public Map<Integer, CardBean> getCbPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getCbPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getMlPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getMlPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getOilPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getOilPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getMvPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getMvPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getOsPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getOsPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getZiPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getZiPageCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getFgPageCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getFgPageCards();
		return map;
	}

	@Override
	@Transactional
	public CardBean getCard(int c_id) {
		CardBean bean = null;
		bean = dao.getCard(c_id);
		return bean;

	}

	@Override
	@Transactional
	public List<CardBean> getCards() {
		List<CardBean> list = new ArrayList<CardBean>();
		list = dao.getCards();
		return list;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getAllCards() {
		Map<Integer, CardBean> map = null;
		map = dao.getAllCards();
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getModalBean(String hql) {
		Map<Integer, CardBean> map = null;
		map = dao.getModalBean(hql);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getRandomBean() {
		Map<Integer, CardBean> map = null;
		map = dao.getRandomBean();
		return map;
	}

}
