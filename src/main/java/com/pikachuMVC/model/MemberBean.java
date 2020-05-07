package com.pikachuMVC.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;




@Entity
@Table(name="members")
public class MemberBean {
	@Id
	@Expose
	String m_id;
	String m_password;
	@Expose
	String name;
	String phone_num;
	@Column(unique = true)
	String m_mail;
	@Expose
	String nickname;
	Date birthday;
	@Expose
	String gender;
	Blob m_img;
	@Expose
	String income;
	@Expose
	String city;
	@Expose
	String education;
	
	@OneToMany(mappedBy = "mb",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	Set<PreFriend> preFriends;
	
	@ManyToMany(fetch = FetchType.EAGER,mappedBy = "members")
	Set<ProductBean> products = new LinkedHashSet<>();
	

	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "members")
	Set<CardBean> cards = new LinkedHashSet<>();
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "friends", catalog = "pikachuDB",
			   joinColumns ={
					   @JoinColumn(name = "m_id", nullable = false, updatable = false)
			   },
			   inverseJoinColumns = {
					   @JoinColumn(name = "friend_id", nullable = false, updatable = false)
			   }
			   )
	Set<MemberBean> friends = new LinkedHashSet<MemberBean>();
	
	@OneToMany(mappedBy = "memberBean",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	Set<LaunchActivityBean> launchActivity = new LinkedHashSet<LaunchActivityBean>();
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "memberBeans")
	Set<LaunchActivityBean> trackLaunchActivity = new LinkedHashSet<LaunchActivityBean>();
	
//--------------------------活動的開始-------------------------------------	
	@ManyToMany(fetch = FetchType.EAGER,mappedBy = "members")
	Set<Launch_activityBean> launch_activityBean = new LinkedHashSet<>();
	
	

	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinColumn(name="res_m_id",referencedColumnName = "m_id")
	private Set<ResponserBean> responserBean = new LinkedHashSet<>();
//--------------------------活動的結束-------------------------------------		
	
	
	
	
	
	
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
	
	

	public Set<LaunchActivityBean> getLaunchActivity() {
		return launchActivity;
	}

	public void setLaunchActivity(Set<LaunchActivityBean> launchActivity) {
		this.launchActivity = launchActivity;
	}

	public Set<LaunchActivityBean> getTrackLaunchActivity() {
		return trackLaunchActivity;
	}

	public void setTrackLaunchActivity(Set<LaunchActivityBean> trackLaunchActivity) {
		this.trackLaunchActivity = trackLaunchActivity;
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

	public Set<PreFriend> getPreFriends() {
		return preFriends;
	}

	public void setPreFriends(Set<PreFriend> preFriends) {
		this.preFriends = preFriends;
	}

	public Set<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductBean> products) {
		this.products = products;
	}

	public Set<CardBean> getCards() {
		return cards;
	}

	public void setCards(Set<CardBean> cards) {
		this.cards = cards;
	}

	public Set<MemberBean> getFriends() {
		return friends;
	}

	public void setFriends(Set<MemberBean> friends) {
		this.friends = friends;
	}
	
	

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof MemberBean) {
			MemberBean mb = (MemberBean) obj;
			return this.m_id.equals(mb.m_id);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return m_id.hashCode();
	}

	public Set<Launch_activityBean> getLaunch_activityBean() {
		return launch_activityBean;
	}

	public void setLaunch_activityBean(Set<Launch_activityBean> launch_activityBean) {
		this.launch_activityBean = launch_activityBean;
	}

	public Set<ResponserBean> getResponserBean() {
		return responserBean;
	}

	public void setResponserBean(Set<ResponserBean> responserBean) {
		this.responserBean = responserBean;
	}
	
	
	
	
	
	
	

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("MemberBean [m_id=");
//		builder.append(m_id);
//		builder.append(", m_password=");
//		builder.append(m_password);
//		builder.append(", name=");
//		builder.append(name);
//		builder.append(", phone_num=");
//		builder.append(phone_num);
//		builder.append(", m_mail=");
//		builder.append(m_mail);
//		builder.append(", nickname=");
//		builder.append(nickname);
//		builder.append(", birthday=");
//		builder.append(birthday);
//		builder.append(", gender=");
//		builder.append(gender);
//		builder.append(", m_img=");
//		builder.append(m_img);
//		builder.append(", income=");
//		builder.append(income);
//		builder.append(", city=");
//		builder.append(city);
//		builder.append(", education=");
//		builder.append(education);
//		builder.append(", preFriends=");
//		builder.append(preFriends);
//		builder.append(", products=");
//		builder.append(products);
//		builder.append(", cards=");
//		builder.append(cards);
//		builder.append(", friends=");
//		builder.append(friends);
//		builder.append("]");
//		return builder.toString();
//	}

	
	
}