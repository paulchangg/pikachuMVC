package com.pikachuMVC.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.List;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.pikachuMVC.model.NewsBean;

public interface NewsService {
	
	// 定時爬蟲
	void newsCrawler() throws FailingHttpStatusCodeException, MalformedURLException, IOException, ParseException;
	//取得資料庫內的所有新聞(清單)
	List<NewsBean> getAllNews();
	//取得資料庫內的單則新聞(靠新聞標題尋找)
	NewsBean getNewsByTitle(String title);
	public NewsBean getNewsById(int id);
	public void addNews(NewsBean news);

	public List<NewsBean> getLastestNews();
	public List<NewsBean> getLastestNews2();

}
