package com.pikachuMVC.service;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;

public interface ILaunch_activityService {
//	boolean idExists(Launch_activityBean article_Id);

	void insertArticle(Launch_activityBean article);

	int updateArticle(int article_Id, Launch_activityBean article);

	int DeleteArticle(int article_Id);

	Launch_activityBean getArticle_Id(int article_Id);

	List<Launch_activityBean> getMemberArticles(String article_m_id);

	List<Launch_activityBean> getAllArticles();

	void setConnection(Connection con);

	int addPopularity(int article_Id, int popularity);

	FoumBean getF_ById(int f_id);

	List<Launch_activityBean> getpageActivitys(Integer pageNo);

	int getTotalPages();

	long getRecordCounts();

	List<Launch_activityBean> getpageActivitysByfame(Integer pageNo,Integer f_id);

	int getTotalPagesByfname(Integer f_id);

	long getRecordCountsByfname(Integer f_id);

//	void addFirstSomeActivity();


}