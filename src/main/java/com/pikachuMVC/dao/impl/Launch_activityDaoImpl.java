package com.pikachuMVC.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.ILaunch_activityDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;

//本類別
//1.新增一筆文章到launch_activity表格
//2.查詢launch_activity表格內的單筆文章(個別member)
//3.查詢launch_activity表格內的所有文章(不分member)
@Repository
public class Launch_activityDaoImpl implements ILaunch_activityDao {

	@Autowired
	SessionFactory factory;
	int articleId = 0;

	// 1.新增一筆文章到launch_activity表格
	@Override
	public void insertArticle(Launch_activityBean article) {
		Session session = factory.getCurrentSession();

		session.save(article);
	}

	// 1-2更新某一個文章 所以用id

	@Override
	public int updateArticle(int article_Id, Launch_activityBean bean) {

		int result = 0;
		Launch_activityBean article = null;
		Session session = factory.getCurrentSession();
		article = session.get(Launch_activityBean.class, article_Id);
		article.setArticle_content(bean.getArticle_content());
		article.setArticle_title(bean.getArticle_title());

		article.setArticleimage(bean.getArticleimage());
		article.setStartTime(bean.getStartTime());
		article.setEndTime(bean.getEndTime());

		article.setUpdateTime(bean.getUpdateTime());

		article.setLocation(bean.getLocation());

		return result;
	}

	// 1-3刪某一個文章 所以用id

	@Override
	public int DeleteArticle(int article_Id) {

		int result = 0;

		String hql = "DELETE  Launch_activityBean  WHERE article_Id = :articleId";

		Session session = factory.getCurrentSession();

		result = session.createQuery(hql).setParameter("articleId", article_Id).executeUpdate();
		return result;

	}

	// 透過id找到發布的文章

	@Override
	public Launch_activityBean getArticle_Id(int article_Id) {
		Launch_activityBean article = null;
		Session session = factory.getCurrentSession();
		article = session.get(Launch_activityBean.class, article_Id);
		return article;
	}

	// 2.查詢launch_activity表格內的單筆文章(個別member)
	@SuppressWarnings("unchecked")
	@Override
	public List<Launch_activityBean> getMemberArticles(String article_m_id) {
		List<Launch_activityBean> launc_member = null;
		Session session = factory.getCurrentSession();

		String hql = "FROM Launch_activityBean  WHERE Article_m_id = :amid";
		launc_member = session.createQuery(hql).setParameter("amid", article_m_id).getResultList();
		return launc_member;
	}

	// 3.查詢launch_activity表格內的所有文章(不分member)
	@Override
	@SuppressWarnings("unchecked")

	public List<Launch_activityBean> getAllArticles() {
		List<Launch_activityBean> list = null;
		String hql = "FROM Launch_activityBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void setConnection(Connection con) {
		throw new RuntimeException("Launch_activityBeane類別不用實作此方法");
	}

	@Override
	public FoumBean getF_ById(int f_id) {
		Session session = factory.getCurrentSession();
		FoumBean foumbean = null;
		String hql = "FROM FoumBean b WHERE b.f_id = :fid";
		foumbean = (FoumBean) session.createQuery(hql).setParameter("fid", f_id).getSingleResult();
		return foumbean;
	}

	@Override
	public int addPopularity(int article_Id, int popularity) {
		int result = 0;
		Launch_activityBean article = null;
		Session session = factory.getCurrentSession();
		article = session.get(Launch_activityBean.class, article_Id);

		article.setPopularity(popularity);
		return result;
	}

}
