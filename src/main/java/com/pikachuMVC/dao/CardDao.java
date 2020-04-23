package com.pikachuMVC.dao;

import java.util.List;
import java.util.Map;

import com.pikachuMVC.model.CardBean;



public interface CardDao {

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
	
	public CardBean getCard(int c_id);
	//所有卡片的map
	public Map<Integer, CardBean> getAllCards();
	//modal表單查詢
    public Map<Integer, CardBean> getModalBean(String hql);
	//隨機取卡
	public Map<Integer, CardBean> getRandomBean();

	public List<CardBean> getCards();
	
	public void insertCards();
	
	public List<String> getAllBank();
	
	public List<CardBean> getCardsByBank(String bank);
	
	public CardBean getCard(String c_name);
	
}
