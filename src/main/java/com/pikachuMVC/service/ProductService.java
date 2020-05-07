package com.pikachuMVC.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;



public interface ProductService {
	
	//上市日期 商品
	Map<Integer, ProductBean> getProduct(int pageNo);
	
	//升冪 價格排列
	public Map<Integer, ProductBean> getProductDescPrice(int pageNo);

	//降冪 價格排列
	public Map<Integer, ProductBean> getProductAscPrice(int pageNo);
	
	
	//總頁面  要進入商品詳細資訊用
	public ProductBean getSelectBook(int productId);
	
	
	//此member要追蹤的商品
	void saveTrackProduct(MemberBean member,int productId);
	
	
	//列出此member的追蹤商品
	Set<ProductBean> listTrackProduct(MemberBean member);
	
	
	//算總共商品有幾項
	public long getRecordCounts();
	
	//一開始要自動輸入用
	List<ProductBean> getProducts();
	
	
	//Ajax查詢商品用
	List<String> getProducts_name(String p_name);
	
	//總共分幾頁
	public int getTotalPages();
	
	//用分類去列商品
	List<ProductBean> getCategoryProducts(String category);
	
}

