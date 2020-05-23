package com.pikachuMVC.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ILaunch_activityDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.service.IFoumService;

import init.GlobalService;

//本類別
//1.新增一筆文章到launch_activity表格
//2.查詢launch_activity表格內的單筆文章(個別member)
//3.查詢launch_activity表格內的所有文章(不分member)
@Repository
public class Launch_activityDaoImpl implements ILaunch_activityDao {
	@Autowired
	IFoumService foumService;
	@Autowired
	SessionFactory factory;
	int articleId = 0;
	private int recordsPerPage = 6; // 預設值：每頁2筆

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
		article.setSubject(bean.getSubject());

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

		if (list == null) {
			return list;
		}

		return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Launch_activityBean> getpageActivitys(Integer pageNo) {
		
		int startRecordNo = (pageNo - 1) * recordsPerPage ;//2
			


		
		List<Launch_activityBean> list = new ArrayList<Launch_activityBean>();
		String hql = "FROM Launch_activityBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setFirstResult(startRecordNo).setMaxResults(recordsPerPage).getResultList();
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

	

	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		Integer totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));


		return totalPages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM Launch_activityBean";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).getResultList();
		if (list.size() > 0) {
			count = list.get(0);


		}
		return count;
	}

	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Launch_activityBean> getpageActivitysByfame(Integer pageNo,Integer f_id) {
		
		int startRecordNo = (pageNo - 1) * recordsPerPage ;//2
		List<Launch_activityBean> list = new ArrayList<Launch_activityBean>();
		
		
		
		String hql = "FROM Launch_activityBean where f_id = :fid";
		
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setFirstResult(startRecordNo).setMaxResults(recordsPerPage).setParameter("fid", f_id).getResultList();
		
		return list;
	}
	
	
	@Override
	public int getTotalPagesByfname(Integer f_id) {
		// 注意下一列敘述的每一個型態轉換
		Integer totalPages = (int) (Math.ceil(getRecordCountsByfname(f_id) / (double) recordsPerPage));


		return totalPages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCountsByfname(Integer f_id) {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM Launch_activityBean where f_id =:fid";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).setParameter("fid", f_id).getResultList();
		if (list.size() > 0) {
			count = list.get(0);


		}
		return count;
	}
	
	@Override
	@Transactional
	public void addFirstSomeActivity() {
		Session session = factory.getCurrentSession();
	
		String line = "";
		
		File file = new File("C:\\_JSP\\workspace2020\\pikachuMVC\\data\\activity.txt"); //JAMES



		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				
				String[] token = line.split("<");
				
				Launch_activityBean lb = new Launch_activityBean();
				
				lb.setArticle_content(token[0]);
				lb.setArticle_m_id(token[1]);
				lb.setArticle_title(token[2]);
				

				
				
				lb.setLocation(token[5]);
				Integer popularity =0;
				lb.setPopularity(popularity);
				
				
				java.util.Date today = new  java.util.Date();
				
				lb.setPost_Time(today);
				
				
				
				
				lb.setSubject(token[9]);
				Date updateTime =null;
				lb.setUpdateTime(updateTime);
				
				String DecoderFname =token[11];
				FoumBean foumBean = foumService.getF_idByfname(DecoderFname);
				
				
				
				lb.setFoumBean(foumBean);
				

				
		
				
				
				String imgname = "C:\\_JSP\\workspace2020\\pikachuMVC\\data\\activityImgs\\" + token[3]; //JAMES

				Blob lb_img = GlobalService.fileToBlob(imgname);
				
				lb.setArticleimage(lb_img);
				
				
				
				Calendar calStartTime = Calendar.getInstance();
				calStartTime.setTime(today);
				calStartTime.add(Calendar.DATE, +3);
				Date newStartTime =  calStartTime.getTime();
				
				lb.setStartTime(newStartTime);
				
				
				
				Calendar calendTime = Calendar.getInstance();
				calendTime.setTime(newStartTime);
				calendTime.add(Calendar.DATE, +4);
				
				Date newendTime =  calendTime.getTime();
				lb.setEndTime(newendTime);
				
				
				
				
			
				
				
				

				
				session.save(lb);
				
				System.out.println("新增一筆Activity紀錄");
			}
			System.out.println("Activity資料新增成功");
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("新建Activity表格時發生IO例外: " + e.getMessage());
		}

		
	}

}
