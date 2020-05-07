package com.pikachuMVC.dao;

import java.sql.Connection;
import java.util.List;

import com.pikachuMVC.model.ResponserBean;


public interface IResponserDao {

	//1.新增某一個文章的回覆文
	void insertRescontent(ResponserBean responser);


	//1.1.透過ID找到回復的內容
	ResponserBean getRes_id(int res_id);

	int updateArticle(int res_id, ResponserBean responser);

	int DeleteArticle(int res_id);


	//2.本類別負責讀取資料庫內responser表格內全部的紀錄(不分member)
	List<ResponserBean> getAllContent(int article_Id);

	//3.本類別負責讀取資料庫內responser表格內單筆的紀錄(個別member)
	List<ResponserBean> getMemberContent(String res_m_id);

	void setConnection(Connection con);
	
	
	
	
	

}