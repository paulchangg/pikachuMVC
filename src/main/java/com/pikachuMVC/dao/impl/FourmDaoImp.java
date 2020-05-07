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

import com.pikachuMVC.dao.FourmDao;
import com.pikachuMVC.model.ForumBean;
import com.pikachuMVC.model.LaunchActivityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.Responser_foumBean;

@Repository
public class FourmDaoImp implements FourmDao{
	
	
	@Autowired
    SessionFactory factory;

	@Override
	public void addFourm(int fourm,LaunchActivityBean launchActivity) {
		
		Session session = factory.getCurrentSession();
		
		ForumBean forumBean  = session.get(ForumBean.class,fourm);
		
		MemberBean memberbean  = session.get(MemberBean.class, launchActivity.getMemberBean().getM_id());
		
		launchActivity.setMemberBean(memberbean);
		
		launchActivity.setSubject(forumBean.getFname());
		
		launchActivity.setForumBean(forumBean);
		
		Set<LaunchActivityBean> beans = new LinkedHashSet();
		
		beans.add(launchActivity);
		
		forumBean.setActivitys(beans);
		
		memberbean.getLaunchActivity().add(launchActivity);
		
		
		session.save(launchActivity);
		session.save(forumBean);
		session.save(memberbean);
		
		
	}

	@Override
	public List<LaunchActivityBean> listFourm() {
		
//		Session session = factory.getCurrentSession();
//		
//		String hql = "FROM LaunchActivityBean";
//		
//		List<LaunchActivityBean> beans = session.createQuery(hql)
//										.getResultList();
		
		return factory.getCurrentSession().createQuery("FROM LaunchActivityBean").getResultList();
	}

	@Override
	public LaunchActivityBean getSelectLaunchActivity(int launchActivityID) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM LaunchActivityBean l where article_Id = :article_Id";
		
		LaunchActivityBean bean = (LaunchActivityBean)session.createQuery(hql)
															 .setParameter("article_Id", launchActivityID)
															 .getSingleResult();
		return bean;
	}

	@Override
	public void saveResponse(Responser_foumBean responser) {
		
		Set<Responser_foumBean> activitys = new LinkedHashSet();
		
		Session session = factory.getCurrentSession();
		
		LaunchActivityBean bean = session.get(LaunchActivityBean.class, responser.getArticleId());
		
		activitys = bean.getActivitys();
		activitys.add(responser);
		
		bean.setActivitys(activitys);
		
		responser.setLaunchActivityBean(bean);
		
		session.save(responser);
		session.save(bean);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Responser_foumBean> getArticleResponse(int launchActivityID) {
		
		
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Responser_foumBean r WHERE r.articleId = :articleId ORDER BY r.res_id";
		
		List<Responser_foumBean> beans	=session.createQuery(hql)
								   			.setParameter("articleId", launchActivityID)
								   			.getResultList();
		
		
		
		return beans;
	}

	@Override
	public void addAllWatch(int launchActivityID) {
		
		Session session = factory.getCurrentSession();
		
		LaunchActivityBean bean = session.get(LaunchActivityBean.class, launchActivityID);
		
		int count = bean.getAllWatch();
		
		count++;
		
		bean.setAllWatch(count);
		
		session.save(bean);
		
	}

	@Override
	public void deleteArticle(int launchActivityID) {
		Session session = factory.getCurrentSession();
		
		String hql1 = "DELETE FROM Responser_foumBean WHERE articleId = :articleId";
		
		String hql = "DELETE FROM LaunchActivityBean WHERE article_Id = :article_Id";
		
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
		
		LaunchActivityBean launchActivityBean = session.get(LaunchActivityBean.class, article_id);
		
		MemberBean memberBean = session.get(MemberBean.class, m_id);
		
		Set<LaunchActivityBean> launchActivityBeans = memberBean.getLaunchActivity();
		
		Set<MemberBean> memberBeans = launchActivityBean.getMemberBeans();
		
		launchActivityBeans.add(launchActivityBean);
		
		memberBeans.add(memberBean);
		
		memberBean.setLaunchActivity(launchActivityBeans);
		
		launchActivityBean.setMemberBeans(memberBeans);
		
		
		
	}

	@Override
	public void deleteTrackActivity(int article_id, String m_id) {
		Session session = factory.getCurrentSession();
		
		LaunchActivityBean launchActivityBean = session.get(LaunchActivityBean.class, article_id);
		
		MemberBean memberBean = session.get(MemberBean.class, m_id);
		
		launchActivityBean.getMemberBeans().remove(memberBean);
		
		memberBean.getLaunchActivity().remove(launchActivityBean);
		
	}

	@Override
	public Set<LaunchActivityBean> listDifFourm(String fourm) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ForumBean r WHERE r.fname = :fname ";
		
		ForumBean bean = (ForumBean)session.createQuery(hql)
								.setParameter("fname", fourm)
								.getSingleResult();
		
		
		return bean.getActivitys();
	}

	@Override
	public List<ForumBean> getforumBean() {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ForumBean";
		
		List<ForumBean> beans = session.createQuery(hql)
									   .getResultList();
		return beans;
	}

	@Override
	@Transactional
	public void insertFourm() {
		
		Session session = factory.getCurrentSession();
		
		ForumBean bean = new ForumBean(null,"信用卡",null);
		ForumBean bean1 = new ForumBean(null,"美食",null);
		ForumBean bean2 = new ForumBean(null,"感情",null);
		
		session.save(bean);
		session.save(bean1);
		session.save(bean2);
		
		
	}

	
}
