package com.pikachuMVC.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
public class ShoppingCart {   
	
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	
	private Map<Integer, OrderItemBean> track = new LinkedHashMap< >();
	
	public ShoppingCart() {
	}
	
	public Map<Integer, OrderItemBean>  getTrack() { // ${ShoppingCart.content}
		return track;
	}
	
	public Map<Integer, OrderItemBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int bookId, OrderItemBean  oib) {
		if (oib.getQty() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(bookId) == null ) {
		    cart.put(bookId, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean oiBean = cart.get(bookId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			oiBean.setQty(oib.getQty() + oiBean.getQty());
		}
	}
	
	public void addToTrack(int bookId, OrderItemBean  oib) {
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( track.get(bookId) == null ) {
			track.put(bookId, oib);
			System.out.println("---------------54546464646");
			System.out.println(track.size());
		} else {
			System.out.println("---------------54546464646");
			System.out.println(track.size());
		}
	}

	public boolean modifyQty(int bookId, int newQty) {
		if ( cart.get(bookId) != null ) {
		   OrderItemBean  bean = cart.get(bookId);
		   bean.setQty(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteBook(int bookId) {
		if ( cart.get(bookId) != null ) {
	       cart.remove(bookId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			OrderItemBean oib = cart.get(n);
			double price    = oib.getPrice();
			int qty      = oib.getQty();
			subTotal +=  price * qty;
		}
		return subTotal;
	}
}
