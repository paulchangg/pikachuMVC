package com.pikachuMVC.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PreFriend {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer pfId;
	String fId;
	String m_id;
	
	@ManyToOne
	@JoinColumn(name = "fk_members_mId",nullable = false)
	MemberBean mb;
	
	
	public PreFriend() {
		super();
	}

	public PreFriend(Integer pfId, String fId, MemberBean mb) {
		super();
		this.pfId = pfId;
		this.fId = fId;
		this.mb = mb;
	}

	public Integer getPfId() {
		return pfId;
	}

	public void setPfId(Integer pfId) {
		this.pfId = pfId;
	}

	public String getfId() {
		return fId;
	}

	public void setfId(String fId) {
		this.fId = fId;
	}

	public MemberBean getMb() {
		return mb;
	}

	public void setMb(MemberBean mb) {
		this.m_id = mb.getM_id();
		this.mb = mb;
	}
	
	
}
