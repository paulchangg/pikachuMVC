package com.pikachuMVC.service.impl;

import java.io.Serializable;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ILaunch_activityDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.service.ILaunch_activityService;

@Service
public class Launch_activityServiceImpl implements Serializable, ILaunch_activityService {

	private static final long serialVersionUID = 1L;
	@Autowired
	ILaunch_activityDao dao;

	@Override
	@Transactional
	public void insertArticle(Launch_activityBean article) {

		dao.insertArticle(article);

	}

	@Override
	@Transactional
	public int updateArticle(int article_Id, Launch_activityBean article) {

		int result = 0;

		result = dao.updateArticle(article_Id, article);

		return result;

	}

	@Override
	@Transactional
	public int DeleteArticle(int article_Id) {

		int result = 0;

		result = dao.DeleteArticle(article_Id);

		return result;

	}

	@Override
	@Transactional
	public Launch_activityBean getArticle_Id(int article_Id) {
		Launch_activityBean getaricle = null;

		getaricle = dao.getArticle_Id(article_Id);

		return getaricle;
	}

	@Override
	@Transactional
	public List<Launch_activityBean> getMemberArticles(String article_m_id) {

		List<Launch_activityBean> result = null;

		result = dao.getMemberArticles(article_m_id);

		return result;

	}

	@Override
	@Transactional
	public List<Launch_activityBean> getAllArticles() {

		List<Launch_activityBean> result = null;

		result = dao.getAllArticles();

		return result;

	}

	@Override
	@Transactional
	public void setConnection(Connection con) {
		dao.setConnection(con);
	}

	@Override
	@Transactional
	public FoumBean getF_ById(int f_id) {
		FoumBean foumbean = null;

		foumbean = dao.getF_ById(f_id);

		return foumbean;

	}

	@Override
	@Transactional
	public int addPopularity(int article_Id, int popularity) {

		int result = 0;

		result = dao.addPopularity(article_Id, popularity);

		return result;
	}
	@Override
	@Transactional
	public List<Launch_activityBean> getpageActivitys(Integer pageNo) {
		return dao.getpageActivitys(pageNo);
	}
	@Override
	@Transactional
	public int getTotalPages() {
		return dao.getTotalPages();
	}
	@Override
	@Transactional
	public long getRecordCounts() {
		return dao.getRecordCounts();
	}
	@Override
	@Transactional
	public List<Launch_activityBean> getpageActivitysByfame(Integer pageNo, Integer f_id) {
		return dao.getpageActivitysByfame(pageNo, f_id);
	}
	@Override
	@Transactional
	public int getTotalPagesByfname(Integer f_id) {
		return dao.getTotalPagesByfname(f_id);
	}
	@Override
	@Transactional
	public long getRecordCountsByfname(Integer f_id) {
		return dao.getRecordCountsByfname(f_id);
	}

	


//	@Override
//	@Transactional
//	public void addFirstSomeActivity() {
//		dao.addFirstSomeActivity();
//	}
	
	
	
	
	
	
	
	
	
	
	
	

}
