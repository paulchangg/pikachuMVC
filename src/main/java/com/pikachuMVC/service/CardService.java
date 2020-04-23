package com.pikachuMVC.service;

import java.util.List;
import java.util.Map;

import com.pikachuMVC.model.CardBean;



public interface CardService {
     
	
	
	//查詢現金回饋
	public Map<Integer, CardBean> getCbPageCards();
	
	//哩程回饋
	public Map<Integer, CardBean> getMlPageCards();
	
	//加油優惠
	public Map<Integer, CardBean> getOilPageCards();
	
	//電影優惠
	public Map<Integer, CardBean> getMvPageCards();
	
	//網購回饋
	public Map<Integer, CardBean> getOsPageCards();
	
	//分期零利率
	public Map<Integer, CardBean> getZiPageCards();
	
	//信用卡首刷禮
	public Map<Integer, CardBean> getFgPageCards();
	
	public Map<Integer, CardBean> getAllCards();
	
	public CardBean getCard(int c_id);
	
	public Map<Integer, CardBean> getModalBean(String hql);
	
	public Map<Integer, CardBean> getRandomBean();
	
	public List<CardBean> getCards();
}
