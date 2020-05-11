package com.pikachuMVC.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.service.IFoumService;
import com.pikachuMVC.service.impl.FoumServiceImpl;

//1.本類別新增版名到forum表格
//2.本類別負責讀取資料庫內forum表格內全部的紀錄(不分管理員member)
//3.本類別負責讀取資料庫內forum表格內單筆的紀錄(個別管理員(owner_m_id)的資料)
@Repository
public class ForumDaoImpl implements IForumDao {

	private int f_id = 0;

	@Autowired
	SessionFactory factory;

	// 1.新增版名到forum表格，所有資訊
	@Override
	@Transactional
	public int insertFoum() {
		int x = 0;
		
		Session session = factory.getCurrentSession();
		
		FoumBean forum = null;
		String [] n= {"旅遊踏青","聚會吃喝","電影咖","愛車聚會"};
		
		for(String fname:n) { 
		forum = new FoumBean(null, fname, null);
		session.save(forum);
		System.out.println("新增一筆forumActivity紀錄");
		}
		return x;
	}

	// 1-3刪除看板
	@Override
	public int DeleteFname(int f_id) {
		int result = 0;

		String hql = "DELETE FoumBean  WHERE f_id = :fid";

		Session session = factory.getCurrentSession();

		result = session.createQuery(hql).setParameter("fid", f_id).executeUpdate();
		return result;

	}

	// 透過id(流水號)找到版名
	@Override
	public FoumBean getF_id(int f_id) {
		FoumBean fname = null;
		Session session = factory.getCurrentSession();

		fname = session.get(FoumBean.class, f_id);

		return fname;

	}

	@Override
	public int getF_id() {
		return f_id;
	}

	@Override
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	// 2.查詢forum表格內的所有版名不分member)
	@Override
	@SuppressWarnings("unchecked")
	public List<FoumBean> getAllfname() {
		List<FoumBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM FoumBean ";

		list = (List<FoumBean>) session.createQuery(hql).getResultList();

		return list;

	}

	@Override
	public void setConnection(Connection con) {
		throw new RuntimeException("Launch_activityBeane類別不用實作此方法");
	}

	@Override
	public String getFname(int f_id) {

		String fname = null;

		Session session = factory.getCurrentSession();
		String hql = "FROM FoumBean WHERE f_id = :fid ";

		fname = (String) session.createQuery(hql).setParameter("f_id", f_id).getSingleResult();

		return fname;
	}

	@Override
	public FoumBean getF_idByfname(String fname) {

		FoumBean foumbean = null;
		Session session = factory.getCurrentSession();

		String hql = "FROM FoumBean WHERE fname =:fname";
		System.out.println(fname);
		foumbean = (FoumBean) session.createQuery(hql).setParameter("fname", fname).getSingleResult();

		return foumbean;

	}

}
