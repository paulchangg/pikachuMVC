package com.pikachuMVC.dao;

import java.util.List;

import com.pikachuMVC.model.OrdersBean;





public interface OrderDao {

	void insertOrder(OrdersBean ob);
	
	List<OrdersBean> getMemberOrders(String memberId, int pageNo,int orderDays);
	
	OrdersBean getOrder(int orderNo);
	
	long getRecordCounts(String m_id,int orderDays);
	
	public int getTotalPages(String m_id,int orderDays);
	
	
}