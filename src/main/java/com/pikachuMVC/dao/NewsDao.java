package com.pikachuMVC.dao;

import java.util.List;

import com.pikachuMVC.model.NewsBean;

public interface NewsDao {
	List<NewsBean> getAllNews();
	public NewsBean getNewsByTitle(String title);
	public NewsBean getNewsById(int id);
	void addNewsBean(NewsBean news);
	public List<NewsBean> getLastestNews();
	public List<NewsBean> getLastestNews2();
	public boolean titleExists(String title);
}
