package com.pikachuMVC.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;

@Repository
public class ProductDaoImpl implements Serializable, ProductDao{
	private static final long serialVersionUID = 1L;
	@Autowired
	SessionFactory factory;
	private int recordsPerPage = init.GlobalService.RECORDS_PER_PAGE; // 預設值：每頁三筆
	private int totalPages = -1;

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, ProductBean> getProduct(int pageNo) {
		Map<Integer, ProductBean> map = new HashMap<>();
		
		List<ProductBean> list = new ArrayList<ProductBean>();
        String hql = "FROM ProductBean";
        Session session = factory.getCurrentSession();
        int startRecordNo = (pageNo - 1) * recordsPerPage;

        list = session.createQuery(hql)
        			  .setFirstResult(startRecordNo)
                      .setMaxResults(recordsPerPage)
                      .getResultList();
        for(ProductBean bean : list) {
        	map.put(bean.getP_id(), bean);
        	System.out.println(bean.getP_id());
        }
		return map;
	}
	
	@Override
	public ProductBean getSelectBook(int productId) {
		ProductBean bean = null;
		String hql = "FROM ProductBean b WHERE b.p_id = :product_id";
		Session session = factory.getCurrentSession();
		bean = (ProductBean)session.createQuery(hql)
					  		.setParameter("product_id", productId)
					  		.getSingleResult();
			
		return bean;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
        String hql = "SELECT count(*) FROM ProductBean";
        Session session = factory.getCurrentSession();
        List<Long> list = session.createQuery(hql).getResultList();
        if (list.size() > 0) {
            count = list.get(0);
        }
        return count;
	}
	
	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, ProductBean> getProductDescPrice(int pageNo) {
		Map<Integer, ProductBean> map = new LinkedHashMap<Integer, ProductBean>();
		
		List<ProductBean> list = new ArrayList<ProductBean>();
        String hql = "FROM ProductBean order by price desc";
        Session session = factory.getCurrentSession();
        int startRecordNo = (pageNo - 1) * recordsPerPage;

        list = session.createQuery(hql)
        			  .setFirstResult(startRecordNo)
                      .setMaxResults(recordsPerPage)
                      .getResultList();
        for(ProductBean bean : list) {
        	map.put(bean.getP_id(), bean);
        	System.out.println(bean.getP_id());
        }
		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, ProductBean> getProductAscPrice(int pageNo) {
		Map<Integer, ProductBean> map = new LinkedHashMap<Integer, ProductBean>();
		
		List<ProductBean> list = new ArrayList<ProductBean>();
        String hql = "FROM ProductBean order by price";
        Session session = factory.getCurrentSession();
        int startRecordNo = (pageNo - 1) * recordsPerPage;

        list = session.createQuery(hql)
        			  .setFirstResult(startRecordNo)
                      .setMaxResults(recordsPerPage)
                      .getResultList();
        for(ProductBean bean : list) {
        	map.put(bean.getP_id(), bean);
        	System.out.println(bean.getP_id());
        }
		return map;
	}

	@Override
	public void saveTrackProduct(MemberBean member, int productId) {
		
		ProductBean bean;
		MemberBean  beans;
		
		String hql = "FROM ProductBean p WHERE p.p_id = :p_id";
		
		Session session = factory.getCurrentSession();
		
		bean = session.get(ProductBean.class, productId);
		
		beans = session.get(MemberBean.class, member.getM_id());
		
		Set<ProductBean> products = beans.getProducts();
		
		products.add(bean);
		
		beans.setProducts(products);
		
		Set<MemberBean> members = bean.getMembers();
		
		members.add(beans);
		
		bean.setMembers(members);	
	}

	@Override
	public Set<ProductBean> listTrackProduct(MemberBean member) {
		Session session = factory.getCurrentSession();
		
		MemberBean  beans = session.get(MemberBean.class, member.getM_id());
		
		
		return beans.getProducts();
	}


}
