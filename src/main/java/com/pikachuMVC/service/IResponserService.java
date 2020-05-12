package com.pikachuMVC.service;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.ResponserBean;

public interface IResponserService {

	void insertRescontent(ResponserBean responser);

	ResponserBean getRes_id(int res_id);

	int updateArticle(int res_id, ResponserBean responser);

	int DeleteArticle(int res_id);

	List<ResponserBean> getAllContent(int article_Id);

	List<ResponserBean> getMemberContent(String res_m_id);

	void setConnection(Connection con);

}