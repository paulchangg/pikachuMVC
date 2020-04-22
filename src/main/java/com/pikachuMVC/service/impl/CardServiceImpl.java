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
	public Map<Integer, CardBean> getCbPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getCbPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getMlPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getMlPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getOilPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getOilPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getMvPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getMvPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getOsPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getOsPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getZiPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getZiPageCards(pageNo);
		return map;
	}

	@Override
	@Transactional
	public Map<Integer, CardBean> getFgPageCards(int pageNo) {
		Map<Integer, CardBean> map = null;
		map = dao.getFgPageCards(pageNo);
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

}
