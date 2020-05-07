package com.pikachuMVC.service;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.FoumBean;

public interface IFoumService {

	int insertFoum(FoumBean forum);

	int DeleteFname(int f_id);

	int getF_id();

	void setF_id(int f_id);

	List<FoumBean> getAllfname(int f_id);

	void setConnection(Connection con);

	String getFname();

	void setFname(String fname);

	FoumBean getF_idByfname(String fname);

	String getFname(int f_id);

//	int addowner_m_id(String owner_m_id);
//	
//	
//	boolean checkid(String id);
//
//	int insertFoum(FoumBean forum);
//
//	int updateFoumBean(int f_id, FoumBean forum);
//
//	int DeleteFname(int f_id);
//
//	int DeleteFname_activityId(int f_id, int article_Id);
//
//	int DeleteFname_activityId_Res_id(int f_id, int article_Id, int res_id);
//
//	FoumBean getF_id(int f_id);
//
//	String getOwner_m_id();
//
//	void setOwner_m_id(String owner_m_id);
//
//	int getF_id();
//
//	void setF_id(int f_id);
//
//	List<FoumBean> getAllfname(int f_id);
//
//	List<FoumBean> getOwner_m_id(String owner_m_id);
//
//	void setConnection(Connection con);
//
//	String getFname();
//
//	void setFname(String fname);

}