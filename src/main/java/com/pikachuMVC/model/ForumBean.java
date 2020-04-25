package com.pikachuMVC.model;

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

@Entity
@Table(name = "forum_name")
public class ForumBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//此看板的Id
	private	Integer f_id;
	
	
	//此看板的板名
	private String fname;
	
	
	//一個看板內有什麼文章       一對多的  一方
	@OneToMany(mappedBy="forumBean", cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	Set<LaunchActivityBean> activitys = new LinkedHashSet();
	
	public ForumBean() {}

	

	public ForumBean(Integer f_id, String fname, Set<LaunchActivityBean> activitys) {
		super();
		this.f_id = f_id;
		this.fname = fname;
		this.activitys = activitys;
	}



	public Integer getF_id() {
		return f_id;
	}

	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	

}
