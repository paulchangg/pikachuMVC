package com.pikachuMVC.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.sql.Blob;
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
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;

import init.GlobalService;

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
	
	@Override
	@Transactional
	public void insertProducts() {
		Session session = factory.getCurrentSession();
	
		String line = "";
		int count = 0;
		File file = new File("D:\\ttt\\product.txt");
//		File file = new File("C:\\_JSP\\workspaceJDBC\\pikachuMVC\\data\\card0414.csv");
//		File file = new File("C:\\_JSP\\workspaceJDBC_s\\pikachuMVC\\data\\card0414.csv");  ////宋用

		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				
				String[] token = line.split("<");
				ProductBean cb = new ProductBean();
				cb.setP_name(token[0]);
				
				cb.setP_desc(token[1]);

				cb.setPrice(Double.valueOf(token[2]));

				cb.setStock(Integer.valueOf(token[3]));
		
				String imgname = "D:\\ttt\\" + token[4];
//				String imgname = "C:\\_JSP\\workspaceJDBC\\pikachuMVC\\data\\imgs\\" + token[1] + ".jpg";
//				String imgname = "C:\\_JSP\\workspaceJDBC_s\\pikachuMVC\\data\\imgs\\" + token[1] + ".jpg"; //宋用

				Blob c_img = GlobalService.fileToBlob(imgname);
				cb.setP_img(c_img);
				
				cb.setP_img_name(token[5]);
				
				cb.setP_category(token[6]);


				session.save(cb);

				System.out.println("新增一筆Product紀錄");
			}
			System.out.println("Product資料新增成功");
		} catch (Exception e) {
			System.err.println("新建Product表格時發生IO例外: " + e.getMessage());
		}

		
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getProducts() {
		List<ProductBean> list = new ArrayList<ProductBean>();
		String hql = "FROM ProductBean c";
        Session session = factory.getCurrentSession();
        list = session.createQuery(hql).getResultList();
		return list;
	}


}
