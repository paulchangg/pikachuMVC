package com.pikachuMVC.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;


@Entity
@Table(name = "product")
public class ProductBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
	private Integer p_id;
	@Expose
	private String p_name;
	
	@Column(length = 65535,columnDefinition="Text")
	private String p_desc;
	@Expose
	private Double price;
	private Integer stock;
	private Blob p_img;
	private String p_img_name;
	private String p_category;
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "member_product", catalog = "pikachuDB",
			   joinColumns ={
					   @JoinColumn(name = "p_id", nullable = false, updatable = false)
			   },
			   inverseJoinColumns = {
					   @JoinColumn(name = "m_id", nullable = false, updatable = false)
			   }
			   )
	Set<MemberBean> members = new LinkedHashSet<>();
	
	
	
	public ProductBean(Integer p_id, String p_name, String p_desc, Double price, Integer stock, Blob p_img
			, String p_img_name ,String p_category) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_desc = p_desc;
		this.price = price;
		this.stock = stock;
		this.p_img = p_img;
		this.p_img_name = p_img_name;
		this.p_category = p_category;
	}

	

	public ProductBean() {
		
	}
	
	
	


	public Set<MemberBean> getMembers() {
		return members;
	}


	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}


	public String getP_img_name() {
		return p_img_name;
	}


	public void setP_img_name(String p_img_name) {
		this.p_img_name = p_img_name;
	}


	public Integer getP_id() {
		return p_id;
	}


	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_desc() {
		return p_desc;
	}


	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public Integer getStock() {
		return stock;
	}


	public void setStock(Integer stock) {
		this.stock = stock;
	}


	public Blob getP_img() {
		return p_img;
	}


	public void setP_img(Blob p_img) {
		this.p_img = p_img;
	}



	public String getP_category() {
		return p_category;
	}



	public void setP_category(String p_category) {
		this.p_category = p_category;
	}


	
	

}