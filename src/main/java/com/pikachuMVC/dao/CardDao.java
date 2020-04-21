package com.pikachuMVC.dao;

import java.util.Map;

import com.pikachuMVC.model.CardBean;



public interface CardDao {

	//查詢現金回饋
	public Map<Integer, CardBean> getCbPageCards(int pageNo);
	
	//哩程回饋
	public Map<Integer, CardBean> getMlPageCards(int pageNo);
	
	//加油優惠
	public Map<Integer, CardBean> getOilPageCards(int pageNo);
	
	//電影優惠
	public Map<Integer, CardBean> getMvPageCards(int pageNo);
	
	//網購回饋
	public Map<Integer, CardBean> getOsPageCards(int pageNo);
	
	//分期零利率
	public Map<Integer, CardBean> getZiPageCards(int pageNo);
	
	//信用卡首刷禮
	public Map<Integer, CardBean> getFgPageCards(int pageNo);
	
	public CardBean getCard(int c_id);
	
}
