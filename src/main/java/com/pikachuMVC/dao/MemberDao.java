package com.pikachuMVC.dao;

import com.pikachuMVC.model.MemberBean;



public interface MemberDao {

	public int saveMember(MemberBean mb);

	public boolean idExists(String id);

	public MemberBean queryMember(String id);

	public MemberBean checkIdPassword(String userId, String password);
	
	public int updatePassword(String email, String newPW);

	public void changePassword(MemberBean mb);
	
	public boolean emailExists(String email);
	
	public void updateM_img(MemberBean mb);

	public void updateMember(MemberBean mb);
	
	public void saveOrUpdate(MemberBean mb);

}
