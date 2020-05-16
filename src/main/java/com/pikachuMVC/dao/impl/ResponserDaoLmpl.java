package com.pikachuMVC.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.IResponserDao;
import com.pikachuMVC.model.ResponserBean;

//1.本類別新增回復到responser表格
//-----------------------------------------------------------------
//2.本類別負責讀取資料庫內responser表格內全部的紀錄(不分member)
//3.本類別負責讀取資料庫內responser表格內單筆的紀錄(個別member)
//-----------------------------------------------------------------
@Repository
public class ResponserDaoLmpl implements IResponserDao {

	@Autowired
	SessionFactory factory;
	
	private int recordsPerPage = 4; // 預設值：每頁2筆
	
	
	// 1.新增某一個文章的回覆文
	@Override
	public void insertRescontent(ResponserBean responser) {

		Session session = factory.getCurrentSession();

		session.save(responser);
	}

	// 1.1.透過ID找到回復的內容
	@Override
	public ResponserBean getRes_id(int res_id) {
		ResponserBean res_content = null;
		Session session = factory.getCurrentSession();
		res_content = session.get(ResponserBean.class, res_id);
		return res_content;
	}

	// 1-2更新某一個文章的回覆文

	@Override
	public int updateArticle(int res_id, ResponserBean bean) {

		int result = 0;
		ResponserBean responser = null;
		Session session = factory.getCurrentSession();

		responser = session.get(ResponserBean.class, res_id);

		responser.setRes_content(bean.getRes_content());
		responser.setUpdateTime(bean.getUpdateTime());

		return result;

	}

	// 1-3刪除某一個文章的回覆文

	@Override
	public int DeleteArticle(int res_id) {

		int result = 0;

		String hq2 = "DELETE  ResponserBean  WHERE res_id = :resid";

		Session session = factory.getCurrentSession();

		result = session.createQuery(hq2).setParameter("resid", res_id).executeUpdate();

		return result;

	}

	// 2.本類別負責讀取資料庫內responser表格內全部的紀錄(不分member)
	@Override
	@SuppressWarnings("unchecked")
	// 查詢某一篇文章的全部回覆
	public List<ResponserBean> getAllContent(int article_Id,Integer pageNo) {
		
		List<ResponserBean> list = null;
		
		int startRecordNo = (pageNo - 1) * recordsPerPage ;//2
		String hql = "FROM ResponserBean WHERE article_Id=:articleId";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).setParameter("articleId", article_Id).setFirstResult(startRecordNo).setMaxResults(recordsPerPage).getResultList();
		return list;
	}

	
	@Override
	public int getTotalPages(int article_Id) {
		// 注意下一列敘述的每一個型態轉換
		Integer totalPages = (int) (Math.ceil(getRecordCounts(article_Id) / (double) recordsPerPage));


		return totalPages;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts(int article_Id) {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM ResponserBean WHERE article_Id=:articleId";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).setParameter("articleId", article_Id).getResultList();
		if (list.size() > 0) {
			count = list.get(0);


		}
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 3.本類別負責讀取資料庫內responser表格內單筆的紀錄(個別member)
	// 查詢會員 回覆的文章
	@Override
	@SuppressWarnings("unchecked")
	public List<ResponserBean> getMemberContent(String res_m_id) {
		List<ResponserBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ResponserBean rsb WHERE rsb.res_m_id = :rsmid";
		list = session.createQuery(hql).setParameter("rsmid", res_m_id).getResultList();
		return list;
	}

	@Override
	public void setConnection(Connection con) {
		throw new RuntimeException("ResponserBean類別不用實作此方法");
	}

}
