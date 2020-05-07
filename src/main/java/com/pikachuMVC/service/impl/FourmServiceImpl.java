package com.pikachuMVC.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.FourmDao;
import com.pikachuMVC.model.ForumBean;
import com.pikachuMVC.model.LaunchActivityBean;
import com.pikachuMVC.model.Responser_foumBean;
import com.pikachuMVC.service.FourmService;

@Service
public class FourmServiceImpl implements FourmService {
	
	@Autowired
	FourmDao dao;

	@Override
	@Transactional
	public void addFourm(int fourm,LaunchActivityBean launchActivity) {
		dao.addFourm(fourm, launchActivity);
	}

	@Override
	@Transactional
	public List<LaunchActivityBean> listFourm() {
		List<LaunchActivityBean> beans = null;
		beans = dao.listFourm();
		return beans;
	}

	@Override
	@Transactional
	public LaunchActivityBean getSelectLaunchActivity(int launchActivityID) {
		LaunchActivityBean bean = null;
		bean = dao.getSelectLaunchActivity(launchActivityID);
		return bean;
	}

	@Override
	@Transactional
	public void saveResponse(Responser_foumBean responser) {
		dao.saveResponse(responser);
		
	}

	@Override
	@Transactional
	public List<Responser_foumBean> getArticleResponse(int launchActivityID) {
		List<Responser_foumBean> beans = null;
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
	public Set<LaunchActivityBean> listDifFourm(String fourm) {
		Set<LaunchActivityBean> beans = dao.listDifFourm(fourm);
		return beans;
	}

	@Override
	@Transactional
	public List<ForumBean> getforumBean() {
		return dao.getforumBean();
	}

	
	
	

}
