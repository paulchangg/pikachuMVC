package com.pikachuMVC.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name="members")
public class MemberBean {
	@Id
	String m_id;
	String m_password;
	String name;
	String phone_num;
	String m_mail;
	String nickname;
	Date birthday;
	String gender;
	Blob m_img;
	String income;
	String city;
	String education;
	
	@ManyToMany(fetch = FetchType.EAGER,mappedBy = "members")
	Set<ProductBean> products = new LinkedHashSet<>();
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(String m_id, String m_password, String name, String phone_num, String m_mail, String nickname,
			Date birthday, String gender, Blob m_img, String income, String city, String education) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.name = name;
		this.phone_num = phone_num;
		this.m_mail = m_mail;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.m_img = m_img;
		this.income = income;
		this.city = city;
		this.education = education;
	}
	
	public Set<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductBean> products) {
		this.products = products;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Blob getM_img() {
		return m_img;
	}
	public void setM_img(Blob m_img) {
		this.m_img = m_img;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberBean [m_id=");
		builder.append(m_id);
		builder.append(", m_password=");
		builder.append(m_password);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone_num=");
		builder.append(phone_num);
		builder.append(", m_mail=");
		builder.append(m_mail);
		builder.append(", nickname=");
		builder.append(nickname);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", m_img=");
		builder.append(m_img);
		builder.append(", income=");
		builder.append(income);
		builder.append(", city=");
		builder.append(city);
		builder.append(", education=");
		builder.append(education);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
}