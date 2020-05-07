package com.pikachuMVC.model;
//會議上說不要管理著 所以取消管理員
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
@Table(name = "forum_activity")
public class FoumBean {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer f_id;
	private String fname;//版名
//	private Date startdate_datetime;//開版日期
//	private Date update_datetime; // 更新版的日期 資料庫要新增欄位
//	
//	@Column(name="owner_m_id")
//	private String owner_m_id;//版主會員

	@OneToMany(mappedBy = "foumBean", cascade = CascadeType.ALL,fetch=FetchType.EAGER )
	Set<Launch_activityBean> items = new LinkedHashSet<>();

	public FoumBean() {
		super();
	}

	public FoumBean(Integer f_id, String fname, Set<Launch_activityBean> items) {
		super();
		this.f_id = f_id;
		this.fname = fname;
		this.items = items;
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

	public Set<Launch_activityBean> getItems() {
		return items;
	}

	public void setItems(Set<Launch_activityBean> items) {
		this.items = items;
	}

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("FoumBean [f_id=");
//		builder.append(f_id);
//		builder.append(", fname=");
//		builder.append(fname);
//		builder.append(", items=");
//		builder.append(items);
//		builder.append("]");
//		return builder.toString();
//	}
	
	



	
	
	
	
	

}
