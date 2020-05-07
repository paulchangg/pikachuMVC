package com.pikachuMVC.dao;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.FoumBean;

public interface IForumDao {

	// 1.新增版名到forum表格，所有資訊
	int insertFoum(FoumBean forum);

	// 1-3刪除看板
	int DeleteFname(int f_id);

	// 透過id(流水號)找到版名
	FoumBean getF_id(int f_id);

	int getF_id();

	void setF_id(int f_id);

	// 2.查詢forum表格內的所有版名不分member)
	List<FoumBean> getAllfname(int f_id);

	void setConnection(Connection con);

	String getFname(int f_id);

	FoumBean getF_idByfname(String fname);

//	int addowner_m_id(String owner_m_id);
//
//	boolean checkid(String id);
//
//	// 1.新增版名到forum表格
//	int insertFoum(FoumBean forum);
//
//	// 1-2更新版名到forum表格
//	int updateFoumBean(int f_id, FoumBean forum);
//
//	// 1-3刪除看板
//	int DeleteFname(int f_id);
//
//	// 1-4刪除看板內特定文章
//	int DeleteFname_activityId(int f_id, int article_Id);
//
//	int DeleteFname_activityId_Res_id(int f_id, int article_Id, int res_id);
//
//	// 透過id(流水號)找到版名
//	FoumBean getF_id(int f_id);
//
//	String getOwner_m_id();
//
////	void setOwner_m_id(String owner_m_id);
//
//	int getF_id();
//
//	void setF_id(int f_id);
//
//	// 2.查詢forum表格內的所有版名不分member)
//	List<FoumBean> getAllfname(int f_id);
//
//	// 3.本類別負責讀取資料庫內forum表格內單筆的紀錄(個別板組(owner_m_id)的資料)
////	List<FoumBean> getOwner_m_id(String owner_m_id);
//
//	void setConnection(Connection con);
//
//	String getFname();
//
//	void setFname(String fname);

}