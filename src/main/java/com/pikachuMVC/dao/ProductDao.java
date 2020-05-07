package com.pikachuMVC.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;



public interface ProductDao {
	Map<Integer, ProductBean> getProduct(int pageNo);
	
	public ProductBean getSelectBook(int productId);
	
	public long getRecordCounts();
	
	public Map<Integer, ProductBean> getProductDescPrice(int pageNo);
	
	public Map<Integer, ProductBean> getProductAscPrice(int pageNo);
	
	void saveTrackProduct(MemberBean member,int productId);
	
	Set<ProductBean> listTrackProduct(MemberBean member);
	
	public int getTotalPages();
	
	List<ProductBean> getProducts();
	
	List<String> getProducts_name(String p_name);
	
	void insertProducts();
	
	List<ProductBean> getCategoryProducts(String category);
}
