package com.pikachuMVC.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.NewsDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.NewsBean;


@Repository
public class NewsDaoImpl implements NewsDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getAllNews() {
		String hql="FROM NewsBean order by createDate desc";
		Session session = factory.getCurrentSession();
	    Query<NewsBean> query = session.createQuery(hql);   
	    query.setMaxResults(20);
	    List<NewsBean> list = query.list();
	    return list;
	}
	
	@Override
	public NewsBean getNewsByTitle(String title) {
		String hql="FROM NewsBean n WHERE n.title = :title";
		NewsBean news = (NewsBean) factory.getCurrentSession()
				.createQuery(hql)
				.setParameter("title", title)
				.getSingleResult();
		return news;
	}
	
	@Override
	public void addNewsBean(NewsBean news) {
		Session session = factory.getCurrentSession();
		session.save(news);
		System.out.println("新增一則新聞："+news.getTitle()+"於資料庫");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getLastestNews() {
		List<NewsBean> list = new ArrayList<NewsBean>();
		Session session = factory.getCurrentSession();
		String hql ="FROM NewsBean n ORDER BY newsId DESC";
		list = session.createQuery(hql)
				 .setFirstResult(0)
		         .setMaxResults(6)
		         .getResultList();		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsBean> getLastestNews2() {
		List<NewsBean> list = new ArrayList<NewsBean>();
		Session session = factory.getCurrentSession();
		String hql ="FROM NewsBean n ORDER BY newsId DESC";
		list = session.createQuery(hql)
				 .setFirstResult(6)
		         .setMaxResults(4)
		         .getResultList();		
		return list;
	}

	@Override
	public NewsBean getNewsById(int id) {
		String hql="FROM NewsBean n WHERE n.newsId = :newsId";
		NewsBean news = (NewsBean) factory.getCurrentSession()
				.createQuery(hql)
				.setParameter("newsId", id)
				.getSingleResult();
		return news;
	}



	
}
