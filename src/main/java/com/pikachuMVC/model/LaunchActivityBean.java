package com.pikachuMVC.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "launch_activity")
public class LaunchActivityBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//文章Id
	private Integer article_Id;

	//會員Id
	private String m_id;
	
	//文章title
	@Column(length = 65535,columnDefinition="Text")
	private String article_title;
	
	//文章內容
	@Column(length = 65535,columnDefinition="Text")
	private String article_content;
	
	//文章圖片
	private Blob articleImage;
		
	//主題
	private String subject;
	
	//發文時間
	private Date post_time;
	
	//此文章的觀看數
	private Integer allWatch;
	
	
	
	//  此文章屬於哪個看板     一對多的   多方
	@ManyToOne
	@JoinColumn(name = "f_id")
	private ForumBean forumBean;
	
	// 此文章有哪些回應文章      一對多的   一方
	@OneToMany(mappedBy = "launchActivityBean",cascade = CascadeType.ALL)
	Set<ResponserBean> activitys = new LinkedHashSet();
	
	public LaunchActivityBean() {};
	
	
	public LaunchActivityBean(Integer article_Id, String m_id, String article_title, String article_content,
			Blob articleImage, String subject, Date post_time, Integer allWatch, ForumBean forumBean,
			Set<ResponserBean> activitys) {
		super();
		this.article_Id = article_Id;
		this.m_id = m_id;
		this.article_title = article_title;
		this.article_content = article_content;
		this.articleImage = articleImage;
		this.subject = subject;
		this.post_time = post_time;
		this.allWatch = allWatch;
		this.forumBean = forumBean;
		this.activitys = activitys;
	}





	public Integer getArticle_Id() {
		return article_Id;
	}

	public void setArticle_Id(Integer article_Id) {
		this.article_Id = article_Id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public Blob getArticleImage() {
		return articleImage;
	}

	public void setArticleImage(Blob articleImage) {
		this.articleImage = articleImage;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Integer getAllWatch() {
		return allWatch;
	}

	public void setAllWatch(Integer allWatch) {
		this.allWatch = allWatch;
	}



	public ForumBean getForumBean() {
		return forumBean;
	}



	public void setForumBean(ForumBean forumBean) {
		this.forumBean = forumBean;
	}

	
	
	

}
