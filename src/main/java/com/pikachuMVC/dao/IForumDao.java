package com.pikachuMVC.dao;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.FoumBean;

public interface IForumDao {

	// 1.新增版名到forum表格，所有資訊
	int insertFoum();

	// 1-3刪除看板
	int DeleteFname(int f_id);

	// 透過id(流水號)找到版名
	FoumBean getF_id(int f_id);

	int getF_id();

	void setF_id(int f_id);

	// 2.查詢forum表格內的所有版名不分member)
	List<FoumBean> getAllfname();

	void setConnection(Connection con);

	String getFname(int f_id);

	FoumBean getF_idByfname(String fname);



}