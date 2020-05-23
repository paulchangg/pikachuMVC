package com.pikachuMVC.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pikachuMVC.dao.OrderDao;
import com.pikachuMVC.model.OrdersBean;

import init.QRcode;


@Repository
public class OrderDaoImpl implements OrderDao{

	private int recordsPerPage = init.GlobalService.RECORDS_PER_PAGE;
	private String memberId = null;
	private int totalPages;
	
	@Autowired
	SessionFactory factory;
	int orderNo = 0;

	
	@Override
	public void insertOrder(OrdersBean ob) {
		Session session = factory.getCurrentSession();
        session.save(ob);	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersBean> getMemberOrders(String memberId, int pageNo,int orderDays) {
		List<OrdersBean> list = null;
		List<OrdersBean> list1 = new ArrayList<OrdersBean>();
		Session session = factory.getCurrentSession();
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "FROM OrdersBean ob WHERE ob.m_id = :mid ORDER BY ordid desc";
		list = session.createQuery(hql)
						.setParameter("mid", memberId)
						.setFirstResult(startRecordNo)
	                    .setMaxResults(recordsPerPage)
						.getResultList();
		
		if(orderDays == 0) {
			list1 = list;
		}else {
			for(OrdersBean bean : list) {
				if((int)QRcode.parseTimeString2Date(bean.getOrderdate()) < orderDays) {
					
					list1.add(bean);
				}else {
					
				}
			}
		}
		
		
		return list1;
	}

	@Override
	public OrdersBean getOrder(int ordid) {
		System.out.println(ordid);
		OrdersBean ob = null;
        Session session = factory.getCurrentSession();
        ob = session.get(OrdersBean.class, ordid);
        ob.getItems();
        return ob;
	}
	
	@Override
	public long getRecordCounts(String m_id,int orderDays) {
		long count = 0; // 必須使用 long 型態
        String hql = "FROM OrdersBean o WHERE o.m_id = :m_id";
        List<OrdersBean> list = new ArrayList<OrdersBean>();
        List<OrdersBean> list2 = new ArrayList<OrdersBean>();
        Session session = factory.getCurrentSession();
        list = session.createQuery(hql)
        			  .setParameter("m_id", m_id)
        			  .getResultList();
        if(orderDays == 0) {
        	count = list.size();
		}else {
			for(OrdersBean bean : list) {
				if((int)QRcode.parseTimeString2Date(bean.getOrderdate()) < orderDays) {
					
					list2.add(bean);
				}else {
					
				}
			}
			count = list2.size();
		}
        
        
        return count;
	}
	
	@Override
	public int getTotalPages(String m_id,int orderDays) {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts(m_id,orderDays) / (double) recordsPerPage));

		return totalPages;
	}


}
