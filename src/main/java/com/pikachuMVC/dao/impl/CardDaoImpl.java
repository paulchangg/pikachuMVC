package com.pikachuMVC.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.model.CardBean;


@Repository
public class CardDaoImpl implements Serializable, CardDao {

	private static final long serialVersionUID = 1L;
	private int recordsPerPage = 8;
	private int totalPages = -1;
	
	@Autowired
    SessionFactory factory;
    
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getCbPageCards(int pageNo) {
        Map<Integer, CardBean> map = new HashMap<>();
		
		List<CardBean> list = new ArrayList<CardBean>();
		String hql = "FROM CardBean c WHERE c.fcb > 0 AND c.dcb >0";
//		String hql = "FROM CardBean";
        Session session = factory.getCurrentSession();

        int startRecordNo = (pageNo - 1) * recordsPerPage;

        list = session.createQuery(hql)
                      .setFirstResult(startRecordNo)
                      .setMaxResults(recordsPerPage)
                      .getResultList();
        for(CardBean bean : list) {
        	map.put(bean.getC_id(), bean);
        }
		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getMlPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.fma LIKE 'NT%' OR c.dma LIKE 'NT%'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getOilPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.refuel_dis LIKE 'NT%' OR refuel_cb > 0.0001;";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getMvPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE wkdmoviedis LIKE '%折' OR moviedis LIKE '%折'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getOsPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.onlinefb >0.001";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getZiPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.zeroins LIKE '%期'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getFgPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "SELECT * FROM CardBean c WHERE c.cashfb LIKE '%0' OR mileagefb LIKE '%里'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}
	   @Override
	   public CardBean getCard(int c_id){
	        CardBean bean = null;
	        Session session = factory.getCurrentSession();
	        bean = session.get(CardBean.class, c_id);
	        return bean;
	    }
	
}
