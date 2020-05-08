package com.pikachuMVC.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.ProductDao;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ProductBean;
import com.pikachuMVC.service.ProductService;

@Service
public class ProductServiceImpl implements Serializable, ProductService {
	private static final long serialVersionUID = 1L;

	@Autowired
	ProductDao dao;

	@Override
	@Transactional
	public Map<Integer, ProductBean> getProduct() {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProduct();
		return beans;
	}

	@Override
	@Transactional
	public ProductBean getSelectBook(int productId) {
		ProductBean beans = null;
		beans = dao.getSelectBook(productId);
		return beans;
	}

	@Override
	@Transactional
	public long getRecordCounts() {
		long count;
		count = dao.getRecordCounts();
		return count;
	}

	@Override
	@Transactional
	public int getTotalPages() {
		int totalPages;
		totalPages = dao.getTotalPages();
		return totalPages;
	}

	@Override
	@Transactional
	public Map<Integer, ProductBean> getProductDescPrice() {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProductDescPrice();
		return beans;
	}

	@Override
	@Transactional
	public Map<Integer, ProductBean> getProductAscPrice() {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProductAscPrice();
		return beans;
	}

	@Override
	@Transactional
	public void saveTrackProduct(MemberBean member, int productId) {
		dao.saveTrackProduct(member, productId);
		return;

	}

	@Override
	@Transactional
	public Set<ProductBean> listTrackProduct(MemberBean member) {
		Set<ProductBean> beans = null;
		beans = dao.listTrackProduct(member);
		return beans;
	}
	
	@Override
	@Transactional
	public List<ProductBean> getProducts() {
		List<ProductBean> list = new ArrayList<ProductBean>();
		list = dao.getProducts();
		return list;
	}

	@Override
	@Transactional
	public List<String> getProducts_name(String p_name) {
		List<String> list = new ArrayList<String>();
		list = dao.getProducts_name(p_name);
		return list;
	}

	@Override
	@Transactional
	public List<ProductBean> getCategoryProducts(String category) {
		return dao.getCategoryProducts(category);
	}

	@Override
	@Transactional
	public void deleteTrack(String m_id, int p_id) {
		dao.deleteTrack(m_id, p_id);
		return;
	}

}
