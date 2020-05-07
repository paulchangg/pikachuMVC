package com.pikachuMVC.model;

import java.sql.Blob;
import java.util.Date;
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
@Table(name = "launch_activity_activity")
public class Launch_activityBean {

	public Blob getArticleimage() {
		return articleimage;
	}

	public void setArticleimage(Blob articleimage) {
		this.articleimage = articleimage;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer article_Id;

	@Column(name = "article_m_id")
	private String article_m_id;

	@Column(name = "article_title" ,columnDefinition = "LONGTEXT")
	private String article_title;
	
	@Column(name = "article_content" ,columnDefinition = "LONGTEXT")
	private String article_content;

	private Blob articleimage;
	private String subject;
	private String location;
	private Date post_Time;// 發布文章的時間

	private Date updateTime;// 更新文章的時間

	private Date startTime;// 發布活動的時間 新增欄位

	private Date endTime;// 結束活動的時間

	private Integer popularity;

	@Transient
	private Integer f_id;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "member_launch_activity", catalog = "pikachutestdb", 
	
	joinColumns = {
					@JoinColumn(name = "article_Id", nullable = false, updatable = false) }, 
	
	inverseJoinColumns = {
					@JoinColumn(name = "m_id", nullable = false, updatable = false) })
	Set<MemberBean> members = new LinkedHashSet<>();

	
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "f_id", nullable = false)
	private FoumBean foumBean; // 一方

	@OneToMany(mappedBy = "launch_activityBean", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Set<ResponserBean> items = new LinkedHashSet<>();

	public Launch_activityBean() {

	}
	

	public Launch_activityBean(Integer article_Id, String article_m_id, String article_title, String article_content,
			Blob articleimage, String subject, String location, Date post_Time, Date updateTime, Date startTime,
			Date endTime, Integer popularity, FoumBean foumBean, Set<ResponserBean> items) {
		super();
		this.article_Id = article_Id;
		this.article_m_id = article_m_id;
		this.article_title = article_title;
		this.article_content = article_content;
		this.articleimage = articleimage;
		this.subject = subject;
		this.location = location;
		this.post_Time = post_Time;
		this.updateTime = updateTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.popularity = popularity;
		this.foumBean = foumBean;
		this.items = items;
	}

	public Integer getF_id() {
		return f_id;
	}

	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}

	
	
	
	
	
	
	
	public Set<MemberBean> getMembers() {
		return members;
	}

	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}

	public Integer getArticle_Id() {
		return article_Id;
	}

	public void setArticle_Id(Integer article_Id) {
		this.article_Id = article_Id;
	}

	public String getArticle_m_id() {
		return article_m_id;
	}

	public void setArticle_m_id(String article_m_id) {
		this.article_m_id = article_m_id;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getPost_Time() {
		return post_Time;
	}

	public void setPost_Time(Date post_Time) {
		this.post_Time = post_Time;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getPopularity() {
		return popularity;
	}

	public void setPopularity(Integer popularity) {
		this.popularity = popularity;
	}

	public FoumBean getFoumBean() {
		return foumBean;
	}

	public void setFoumBean(FoumBean foumBean) {
		this.foumBean = foumBean;
	}

	public Set<ResponserBean> getItems() {
		return items;
	}

	public void setItems(Set<ResponserBean> items) {
		this.items = items;
	}

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("Launch_activityBean [article_Id=");
//		builder.append(article_Id);
//		builder.append(", article_m_id=");
//		builder.append(article_m_id);
//		builder.append(", article_title=");
//		builder.append(article_title);
//		builder.append(", article_content=");
//		builder.append(article_content);
//		builder.append(", subject=");
//		builder.append(subject);
//		builder.append(", location=");
//		builder.append(location);
//		builder.append(", post_Time=");
//		builder.append(post_Time);
//		builder.append(", updateTime=");
//		builder.append(updateTime);
//		builder.append(", startTime=");
//		builder.append(startTime);
//		builder.append(", endTime=");
//		builder.append(endTime);
//		builder.append(", popularity=");
//		builder.append(popularity);
//		builder.append(", foumBean=");
//		builder.append(foumBean);
//		builder.append(", items=");
//		builder.append(items);
//		builder.append("]");
//		return builder.toString();
//	}

	public void setF_id(FoumBean foumBean2) {
		// TODO Auto-generated method stub

	}

}
