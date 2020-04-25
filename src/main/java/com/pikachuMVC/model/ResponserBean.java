package com.pikachuMVC.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "responser")
public class ResponserBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//回應文章Id
	private Integer res_id;
	
	//會員Id
	private String m_id;
	
	
	//回應內容
	private String res_content;
	
	@ManyToOne
	@JoinColumn(name = "article_Id")
	//此回應屬於哪一個文章    一對多的  多方
	private LaunchActivityBean launchActivityBean;
	
	
	public ResponserBean() {}
	
	

	public ResponserBean(Integer res_id, String m_id, String res_content, LaunchActivityBean launchActivityBean) {
		super();
		this.res_id = res_id;
		this.m_id = m_id;
		this.res_content = res_content;
		this.launchActivityBean = launchActivityBean;
	}

	public Integer getRes_id() {
		return res_id;
	}

	public void setRes_id(Integer res_id) {
		this.res_id = res_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getRes_content() {
		return res_content;
	}

	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}

	public LaunchActivityBean getLaunchActivityBean() {
		return launchActivityBean;
	}

	public void setLaunchActivityBean(LaunchActivityBean launchActivityBean) {
		this.launchActivityBean = launchActivityBean;
	}
	
	

}
