/*package com.pikachuMVC.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.NewsDao;
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

	
}*/
