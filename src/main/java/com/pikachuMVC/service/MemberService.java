package com.pikachuMVC.service;


import com.pikachuMVC.model.MemberBean;



public interface MemberService {

	int saveMember(MemberBean mb);
	boolean idExists(String id);
	MemberBean queryMember(String id);
	MemberBean checkIdPassword(String userId, String password);
	public int updatePassword(String email, String newPW);
	public void changePassword(MemberBean mb);
	public boolean emailExists(String email);
	public void sendMail(String email, String newPW);
	public void updateM_img(MemberBean mb);
	public void updateMember(MemberBean mb);
}
