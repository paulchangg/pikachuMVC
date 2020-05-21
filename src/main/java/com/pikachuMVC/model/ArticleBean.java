package com.pikachuMVC.model;

import java.sql.Blob;
import java.sql.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "article")
public class ArticleBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//文章Id
	private Integer article_Id;

	
	private String member_id;
	
	
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
	private String post_time;
	
	//此文章的觀看數
	private Integer allWatch;
	
	//上傳圖片名稱
	private String articleImage_Name;
	
	
	//  此文章屬於哪個看板     一對多的   多方
	@ManyToOne
	@JoinColumn(name = "f_id")
	private ArticleClassificarionBean articleClassificarionBean;
	
	// 此文章有哪些回應文章      一對多的   一方
	@OneToMany(mappedBy = "articleBean",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	Set<ArticleResponserBean> activitys = new LinkedHashSet();
	
	
	//會員ID
	@ManyToOne
	@JoinColumn(name = "m_id")
	private MemberBean memberBean;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "member_article", catalog = "pikachudb",
	   joinColumns ={
			   @JoinColumn(name = "activity_id", nullable = false, updatable = false)
	   },
	   inverseJoinColumns = {
			   @JoinColumn(name = "m_id", nullable = false, updatable = false)
	   }
	   )
	private Set<MemberBean> memberBeans = new LinkedHashSet();
	
	public ArticleBean() {};
	
	
	

	


	public ArticleBean(Integer article_Id, MemberBean memberBean, String article_title, String article_content,
			Blob articleImage, String subject, String post_time, Integer allWatch, String articleImage_Name,
			ArticleClassificarionBean articleClassificarionBean, Set<ArticleResponserBean> activitys,String member_id) {
		super();
		this.article_Id = article_Id;
		this.memberBean = memberBean;
		this.article_title = article_title;
		this.article_content = article_content;
		this.articleImage = articleImage;
		this.subject = subject;
		this.post_time = post_time;
		this.allWatch = allWatch;
		this.articleImage_Name = articleImage_Name;
		this.articleClassificarionBean = articleClassificarionBean;
		this.activitys = activitys;
		this.member_id = member_id;
	}


	
	



	public Set<MemberBean> getMemberBeans() {
		return memberBeans;
	}







	public void setMemberBeans(Set<MemberBean> memberBeans) {
		this.memberBeans = memberBeans;
	}







	public String getMember_id() {
		return member_id;
	}







	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}







	public MemberBean getMemberBean() {
		return memberBean;
	}







	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}







	public String getArticleImage_Name() {
		return articleImage_Name;
	}







	public void setArticleImage_Name(String articleImage_Name) {
		this.articleImage_Name = articleImage_Name;
	}







	public String getPost_time() {
		return post_time;
	}


	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}


	public Set<ArticleResponserBean> getActivitys() {
		return activitys;
	}


	public void setActivitys(Set<ArticleResponserBean> activitys) {
		this.activitys = activitys;
	}


	public Integer getArticle_Id() {
		return article_Id;
	}

	public void setArticle_Id(Integer article_Id) {
		this.article_Id = article_Id;
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



	public ArticleClassificarionBean getForumBean() {
		return articleClassificarionBean;
	}



	public void setForumBean(ArticleClassificarionBean articleClassificarionBean) {
		this.articleClassificarionBean = articleClassificarionBean;
	}

	
	
	

}
