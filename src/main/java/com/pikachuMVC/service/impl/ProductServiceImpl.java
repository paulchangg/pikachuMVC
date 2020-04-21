package com.pikachuMVC.service.impl;

import java.io.Serializable;
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
	public Map<Integer, ProductBean> getProduct(int pageNo) {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProduct(pageNo);
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
	public Map<Integer, ProductBean> getProductDescPrice(int pageNo) {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProductDescPrice(pageNo);
		return beans;
	}

	@Override
	@Transactional
	public Map<Integer, ProductBean> getProductAscPrice(int pageNo) {
		Map<Integer, ProductBean> beans = null;
		beans = dao.getProductAscPrice(pageNo);
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

}
