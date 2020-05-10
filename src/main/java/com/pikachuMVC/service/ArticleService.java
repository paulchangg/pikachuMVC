package com.pikachuMVC.service;

import java.util.List;
import java.util.Set;

import com.pikachuMVC.model.ArticleClassificarionBean;
import com.pikachuMVC.model.ArticleBean;
import com.pikachuMVC.model.ArticleResponserBean;

public interface ArticleService {
	
	void addFourm(int fourm,ArticleBean launchActivity);
	
	List<ArticleBean> listFourm();
	
	ArticleBean getSelectLaunchActivity(int launchActivityID);
	
	void saveResponse(ArticleResponserBean responser);
	
	List<ArticleResponserBean> getArticleResponse(int launchActivityID);
	
	void addAllWatch(int launchActivityID);
	
	void deleteArticle(int launchActivityID);
	
	void saveTrackActivity(int article_id,String m_id);
	
	void deleteTrackActivity(int article_id,String m_id);
	
	Set<ArticleBean> listDifFourm(String fourm);
	
	List<ArticleClassificarionBean> getforumBean();
	
}