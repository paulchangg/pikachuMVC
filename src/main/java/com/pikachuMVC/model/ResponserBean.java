package com.pikachuMVC.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "responser_activity")
public class ResponserBean {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer res_id;
	@Column(name="res_m_id")
	private String res_m_id;
	private Date postTime;// 回應文章的時間 新增欄位
	private Date updateTime;
	@Column(name = "res_content" ,columnDefinition = "LONGTEXT")
	private String res_content;

	@Transient
	private Integer  article_Id;
	
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "article_Id", nullable = false)
	private Launch_activityBean launch_activityBean;

	public ResponserBean() {

	}
	
	

	public ResponserBean(Integer res_id, String res_m_id, Date postTime, Date updateTime, String res_content,
			Launch_activityBean launch_activityBean) {
		super();
		this.res_id = res_id;
		this.res_m_id = res_m_id;
		this.postTime = postTime;
		this.updateTime = updateTime;
		this.res_content = res_content;
		this.launch_activityBean = launch_activityBean;
	}

	public Integer getRes_id() {
		return res_id;
	}

	public void setRes_id(Integer res_id) {
		this.res_id = res_id;
	}

	public String getRes_m_id() {
		return res_m_id;
	}

	public void setRes_m_id(String res_m_id) {
		this.res_m_id = res_m_id;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getRes_content() {
		return res_content;
	}

	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}

	public Launch_activityBean getLaunch_activityBean() {
		return launch_activityBean;
	}

	public void setLaunch_activityBean(Launch_activityBean launch_activityBean) {
		this.launch_activityBean = launch_activityBean;
	}
	
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("ResponserBean [res_id=");
//		builder.append(res_id);
//		builder.append(", res_m_id=");
//		builder.append(res_m_id);
//		builder.append(", postTime=");
//		builder.append(postTime);
//		builder.append(", updateTime=");
//		builder.append(updateTime);
//		builder.append(", res_content=");
//		builder.append(res_content);
//		builder.append(", launch_activityBean=");
//		builder.append(launch_activityBean);
//		builder.append("]");
//		return builder.toString();
//	}

}
