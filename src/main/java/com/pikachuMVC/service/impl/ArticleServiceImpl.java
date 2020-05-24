package com.pikachuMVC.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ArticleDao;
import com.pikachuMVC.model.ArticleClassificarionBean;
import com.pikachuMVC.model.ArticleBean;
import com.pikachuMVC.model.ArticleResponserBean;
import com.pikachuMVC.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	ArticleDao dao;

	@Override
	@Transactional
	public void addFourm(int fourm,ArticleBean launchActivity) {
		dao.addFourm(fourm, launchActivity);
	}

	@Override
	@Transactional
	public List<ArticleBean> listFourm(int page) {
		List<ArticleBean> beans = null;
		beans = dao.listFourm(page);
		return beans;
	}

	@Override
	@Transactional
	public ArticleBean getSelectLaunchActivity(int launchActivityID) {
		ArticleBean bean = null;
		bean = dao.getSelectLaunchActivity(launchActivityID);
		return bean;
	}

	@Override
	@Transactional
	public void saveResponse(ArticleResponserBean responser) {
		dao.saveResponse(responser);
		
	}

	@Override
	@Transactional
	public List<ArticleResponserBean> getArticleResponse(int launchActivityID) {
		List<ArticleResponserBean> beans = null;
		beans = dao.getArticleResponse(launchActivityID);
		return beans;
	}

	@Override
	@Transactional
	public void addAllWatch(int launchActivityID) {
		dao.addAllWatch(launchActivityID);
	}

	@Override
	@Transactional
	public void deleteArticle(int launchActivityID) {
		dao.deleteArticle(launchActivityID);
	}

	@Override
	@Transactional
	public void saveTrackActivity(int article_id, String m_id) {
		dao.saveTrackActivity(article_id, m_id);
		
	}

	@Override
	@Transactional
	public void deleteTrackActivity(int article_id, String m_id) {
		dao.deleteTrackActivity(article_id, m_id);
		
	}

	@Override
	@Transactional
	public Set<ArticleBean> listDifFourm(String fourm) {
		Set<ArticleBean> beans = dao.listDifFourm(fourm);
		return beans;
	}

	@Override
	@Transactional
	public List<ArticleClassificarionBean> getforumBean() {
		return dao.getforumBean();
	}

	@Override
	@Transactional
	public int getTotalPages() {
		
		return dao.getTotalPages();
	}

	@Override
	@Transactional
	public Map<Long, ArticleBean> getMemberCenterRecord(String m_id) {
		 Map<Long, ArticleBean> map = null;
		 map = dao.getMemberCenterRecord(m_id);
		return map;
	}

	

	
	
	

}
