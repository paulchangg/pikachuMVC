package com.pikachuMVC.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;



public interface ProductService {

	Map<Integer, ProductBean> getProduct(int pageNo);
	
	public Map<Integer, ProductBean> getProductDescPrice(int pageNo);

	public Map<Integer, ProductBean> getProductAscPrice(int pageNo);
	
	public ProductBean getSelectBook(int productId);
	
	void saveTrackProduct(MemberBean member,int productId);
	
	Set<ProductBean> listTrackProduct(MemberBean member);
	
	public long getRecordCounts();
	
	List<ProductBean> getProducts();
	
	public int getTotalPages();
}

