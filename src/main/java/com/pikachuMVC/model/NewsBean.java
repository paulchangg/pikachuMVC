package com.pikachuMVC.model;

import java.io.Serializable;
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
	@Column(nullable = false)
	private String  	content;
	@Column(nullable = false)
	private String    	image;
		
	public NewsBean(Integer newsId, String title, Date createDate, String folder,String content, String image) {
		super();
		this.newsId = newsId;
		this.title = title;
		this.createDate = createDate;
		this.folder = folder;
		this.content = content;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
}
