package com.pikachuMVC.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyToOne;
// 本類別存放訂單資料
@Entity
@Table(name = "orders")
public class OrdersBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ordid; 
	private String m_id; 
	private Date orderdate; 
	private Double total;
	@OneToMany(mappedBy="ordersBean", cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	Set<OrderItemBean> items = new LinkedHashSet<>();
	
	public OrdersBean() {
		
	}
	
	
	public OrdersBean(Integer ordid, String m_id, Date orderdate, Double total, Set<OrderItemBean> items) {
		super();
		this.ordid = ordid;
		this.m_id = m_id;
		this.orderdate = orderdate;
		this.total = total;
		this.items = items;
	}
	
	
	
	public Set<OrderItemBean> getItems() {
		return items;
	}



	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}



	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	} 
		
	
}
