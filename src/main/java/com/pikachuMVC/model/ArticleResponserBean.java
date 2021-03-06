package com.pikachuMVC.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Article_responser")
public class ArticleResponserBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//回應文章Id
	private Integer res_id;
	
	//會員Id
	private String m_id;
	
	
	private Integer articleId;
	
	//回應內容
	private String res_content;
	
	@ManyToOne
	@JoinColumn(name = "article_Id")
	//此回應屬於哪一個文章    一對多的  多方
	private ArticleBean articleBean;
	
	
	private String res_post_time;
	
	
	public ArticleResponserBean() {}
	
	

	
	
	

	public ArticleResponserBean(Integer res_id, String m_id, Integer articleId, String res_content,
			ArticleBean articleBean,String res_post_time) {
		super();
		this.res_id = res_id;
		this.m_id = m_id;
		this.articleId = articleId;
		this.res_content = res_content;
		this.articleBean = articleBean;
		this.res_post_time = res_post_time;
	}


	
	
	public String getRes_post_time() {
		return res_post_time;
	}







	public void setRes_post_time(String res_post_time) {
		this.res_post_time = res_post_time;
	}







	public Integer getArticleId() {
		return articleId;
	}



	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
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

	public ArticleBean getLaunchActivityBean() {
		return articleBean;
	}

	public void setLaunchActivityBean(ArticleBean articleBean) {
		this.articleBean = articleBean;
	}
	
	

}
