package com.pikachuMVC.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="News")
public class NewsBean implements Serializable {

	private static final long serialVersionUID = 2984481093702035343L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer		newsId ;
	@Column(nullable = false)
	private String  	title;
	@Column(nullable = false)
	private Date 		createDate;
	@Column(nullable = false)
	private String  	folder;
	@Column(nullable = false, length = 65535, columnDefinition="Text")
	private String  	content;
	@Column(nullable = false, length = 65535, columnDefinition="Text")
	private String  	intro;
//	@Column(nullable = false)
//	private String    	image;
	@Column(nullable = false)
	private String    	actTime;

	private	Blob		n_img 	;		
		
	public Blob getN_img() {
		return n_img;
	}



	public void setN_img(Blob n_img) {
		this.n_img = n_img;
	}



	public NewsBean(Integer newsId, String title, Date createDate, String folder, String content, String intro,
			String image, String actTime) {
		super();
		this.newsId = newsId;
		this.title = title;
		this.createDate = createDate;
		this.folder = folder;
		this.content = content;
		this.intro = intro;
//		this.image = image;
		this.actTime = actTime;
	}



	public String getActTime() {
		return actTime;
	}



	public void setActTime(String actTime) {
		this.actTime = actTime;
	}



	public NewsBean() {
		super();
	}
	
	public Integer getNewsId() {
		return newsId;
	}
	
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	
	public String getIntro() {
		return intro;
	}



	public void setIntro(String intro) {
		this.intro = intro;
	}




	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

//	public String getImage() {
//		return image;
//	}
//
//	public void setImage(String image) {
//		this.image = image;
//	}

	
}
