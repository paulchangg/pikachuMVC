package com.pikachuMVC.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//本類別封裝單筆訂單資料
@Entity
@Table(name = "orderitem")
public class OrderItemBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemid;
	private Integer p_id;
	private Double price;
	private Integer qty;
	private Blob QRcode;
	
	@ManyToOne
	@JoinColumn(name = "ordid")
	OrdersBean ordersBean;
	
	private String p_name;
	
	
	public OrderItemBean() {
		
	}
	
	
	public OrderItemBean(Integer itemid, Integer p_id, Double price, Integer qty,String p_name) {
		super();
		this.itemid = itemid;
		
		this.p_id = p_id;
		this.price = price;
		this.qty = qty;
		
		
		this.p_name = p_name;
	}


	


	public Blob getQRcode() {
		return QRcode;
	}


	public void setQRcode(Blob qRcode) {
		QRcode = qRcode;
	}


	public OrdersBean getOrdersBean() {
		return ordersBean;
	}





	public void setOrdersBean(OrdersBean ordersBean) {
		this.ordersBean = ordersBean;
	}





	public String getP_name() {
		return p_name;
	}



	public void setP_name(String p_name) {
		this.p_name = p_name;
	}



	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	
	
	
}