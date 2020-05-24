package com.pikachuMVC.service;

import java.util.List;

import com.pikachuMVC.model.OrdersBean;



// 本介面處理訂單。一張訂單的所有資訊是存放在OrderBean內，而訂單明細是存放在  
// Set<OrderItemBean> items 屬性內。
// 
// 新增一筆訂單時，必須進行下列兩項檢查：
// (1)計算訂單總金額，以便計算會員的未付款金額(原未付款金額+本訂單總金額)，此金額不能超過某一上限。
// 如果超過此上限，系統將拒絕此訂單。
// (2)扣除訂單明細購買商品的庫存數量，如果商品的庫存不足，系統將拒絕此訂單。
// 
// 如果訂單明細沒有任何問題，則寫入此筆訂單。
// 此介面提供訂單查詢的功能，依照訂單編號來查詢單筆訂單
//
// 實作此介面的類別為 _04_ShoppingCart.model.service.impl.OrderServiceImpl
// 
public interface OrderService {
	void persistOrder(OrdersBean ob);

	OrdersBean getOrder(int orderNo);
//
//	List<OrdersBean> getAllOrders();
//
	List<OrdersBean> getMemberOrders(String memberId, int pageNo,int orderDays);
	
	long getRecordCounts(String m_id,int orderDays);

	int getTotalPages(String m_id,int orderDays);
	
	
}
