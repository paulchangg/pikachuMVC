package com.pikachuMVC.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.OrderDao;
import com.pikachuMVC.dao.OrderItemDao;
import com.pikachuMVC.model.OrderItemBean;
import com.pikachuMVC.model.OrdersBean;
import com.pikachuMVC.service.OrderService;

@Service

public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderItemDao oidao;
	@Autowired
	private OrderDao odao;

	@Override
	// 這是一個交易
	@Transactional
	public void persistOrder(OrdersBean ob) {
		// 檢查每筆訂單明細所訂購之商品的庫存數量是否足夠
		
		// 儲存該筆訂單
		odao.insertOrder(ob);

	}
	
	
	
//	public void checkStock(OrdersBean ob) {
//		Set<OrderItemBean> items = ob.getItems();
//		for (OrderItemBean oib : items) {
//			oidao.updateProductStock(oib);
//		}
//	}

//	@Override
//	// 本方法為過渡版本
//	public OrderBean getOrder(int orderNo) {
//		OrderBean bean = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
//			bean = odao.getOrder(orderNo);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
//		return bean;
//	}


	@Override
	@Transactional
	public OrdersBean getOrder(int orderNo) {
		OrdersBean bean = null;
		bean = odao.getOrder(orderNo);
		return bean;
	}

//	@Override
//	public List<OrderBean> getAllOrders() {
//		List<OrderBean> list = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
//			list = odao.getAllOrders();
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
//		return list;
//	}
//
	@Override
	@Transactional
	public List<OrdersBean> getMemberOrders(String memberId, int pageNo,int orderDays) {
		List<OrdersBean> list = null;
		list = odao.getMemberOrders(memberId, pageNo,orderDays);
		return list;
	}

	@Override
	@Transactional
	public long getRecordCounts(String m_id,int orderDays) {
		long recordCounts = 0;
		recordCounts = odao.getRecordCounts(m_id,orderDays);
		return recordCounts;
	}

	@Override
	@Transactional
	public int getTotalPages(String m_id,int orderDays) {
		int totalPages = 1;
		totalPages = odao.getTotalPages(m_id,orderDays);
		return totalPages;
	}



	
}
