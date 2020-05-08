package com.pikachuMVC.dao.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ArticleDao;
import com.pikachuMVC.model.ArticleClassificarionBean;
import com.pikachuMVC.model.ArticleBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ArticleResponserBean;

@Repository
public class ArticleDaoImpl implements ArticleDao{
	
	
	@Autowired
    SessionFactory factory;

	@Override
	public void addFourm(int fourm,ArticleBean launchActivity) {
		
		Session session = factory.getCurrentSession();
		
		ArticleClassificarionBean articleClassificarionBean  = session.get(ArticleClassificarionBean.class,fourm);
		
		MemberBean memberbean  = session.get(MemberBean.class, launchActivity.getMemberBean().getM_id());
		
		launchActivity.setMemberBean(memberbean);
		
		launchActivity.setSubject(articleClassificarionBean.getFname());
		
		launchActivity.setForumBean(articleClassificarionBean);
		
		Set<ArticleBean> beans = new LinkedHashSet();
		
		beans.add(launchActivity);
		
		articleClassificarionBean.setActivitys(beans);
		
		memberbean.getLaunchActivity().add(launchActivity);
		
		
		session.save(launchActivity);
		session.save(articleClassificarionBean);
		session.save(memberbean);
		
		
	}

	@Override
	public List<ArticleBean> listFourm() {
		
		
		return factory.getCurrentSession().createQuery("FROM ArticleBean").getResultList();
	}

	@Override
	public ArticleBean getSelectLaunchActivity(int launchActivityID) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ArticleBean l where l.article_Id = :article_Id";
		
		ArticleBean bean = (ArticleBean)session.createQuery(hql)
															 .setParameter("article_Id", launchActivityID)
															 .getSingleResult();
		return bean;
	}

	@Override
	public void saveResponse(ArticleResponserBean responser) {
		
		Set<ArticleResponserBean> activitys = new LinkedHashSet();
		
		Session session = factory.getCurrentSession();
		
		ArticleBean bean = session.get(ArticleBean.class, responser.getArticleId());
		
		activitys = bean.getActivitys();
		activitys.add(responser);
		
		bean.setActivitys(activitys);
		
		responser.setLaunchActivityBean(bean);
		
		session.save(responser);
		session.save(bean);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleResponserBean> getArticleResponse(int launchActivityID) {
		
		
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ArticleResponserBean r WHERE r.articleId = :articleId ORDER BY r.res_id";
		
		List<ArticleResponserBean> beans	=session.createQuery(hql)
								   			.setParameter("articleId", launchActivityID)
								   			.getResultList();
		
		
		
		return beans;
	}

	@Override
	public void addAllWatch(int launchActivityID) {
		
		Session session = factory.getCurrentSession();
		
		ArticleBean bean = session.get(ArticleBean.class, launchActivityID);
		
		int count = bean.getAllWatch();
		
		count++;
		
		bean.setAllWatch(count);
		
		session.save(bean);
		
	}

	@Override
	public void deleteArticle(int launchActivityID) {
		Session session = factory.getCurrentSession();
		
		String hql1 = "DELETE FROM ArticleResponserBean WHERE articleId = :articleId";
		
		String hql = "DELETE FROM ArticleBean WHERE article_Id = :article_Id";
		
		session.createQuery(hql1)
				.setParameter("articleId", launchActivityID)
				.executeUpdate();
		
		session.createQuery(hql)
				.setParameter("article_Id", launchActivityID)
				.executeUpdate();
		
	}

	@Override
	public void saveTrackActivity(int article_id, String m_id) {
		Session session = factory.getCurrentSession();
		
		ArticleBean articleBean = session.get(ArticleBean.class, article_id);
		
		MemberBean memberBean = session.get(MemberBean.class, m_id);
		
		Set<ArticleBean> articleBeans = memberBean.getLaunchActivity();
		
		Set<MemberBean> memberBeans = articleBean.getMemberBeans();
		
		articleBeans.add(articleBean);
		
		memberBeans.add(memberBean);
		
		memberBean.setLaunchActivity(articleBeans);
		
		articleBean.setMemberBeans(memberBeans);
		
		
		
	}

	@Override
	public void deleteTrackActivity(int article_id, String m_id) {
		Session session = factory.getCurrentSession();
		
		ArticleBean articleBean = session.get(ArticleBean.class, article_id);
		
		MemberBean memberBean = session.get(MemberBean.class, m_id);
		
		articleBean.getMemberBeans().remove(memberBean);
		
		memberBean.getLaunchActivity().remove(articleBean);
		
	}

	@Override
	public Set<ArticleBean> listDifFourm(String fourm) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ArticleClassificarionBean r WHERE r.fname = :fname ";
		
		ArticleClassificarionBean bean = (ArticleClassificarionBean)session.createQuery(hql)
								.setParameter("fname", fourm)
								.getSingleResult();
		
		
		return bean.getActivitys();
	}

	@Override
	public List<ArticleClassificarionBean> getforumBean() {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ArticleClassificarionBean";
		
		List<ArticleClassificarionBean> beans = session.createQuery(hql)
									   					.getResultList();
		return beans;
	}

	@Override
	@Transactional
	public void insertFourm() {
		
		Session session = factory.getCurrentSession();
		
		ArticleClassificarionBean bean = new ArticleClassificarionBean(null,"信用卡",null);
		ArticleClassificarionBean bean1 = new ArticleClassificarionBean(null,"美食",null);
		ArticleClassificarionBean bean2 = new ArticleClassificarionBean(null,"感情",null);
		
		session.save(bean);
		session.save(bean1);
		session.save(bean2);
		
		
	}

	
}
