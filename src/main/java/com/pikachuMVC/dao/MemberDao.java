package com.pikachuMVC.dao;

import java.util.List;

import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.PreFriend;



public interface MemberDao {

	public int saveMember(MemberBean mb);

	public boolean idExists(String id);

	public MemberBean queryMember(String id);

	public MemberBean checkIdPassword(String userId, String password);
	
	public void enable(MemberBean mb);
	
	public int updatePassword(String email, String newPW);

	public void changePassword(MemberBean mb);
	
	public boolean emailExists(String email);
	
	public void updateM_img(MemberBean mb);

	public void updateMember(MemberBean mb);
	
	public void saveOrUpdate(MemberBean mb);
	
	public void addMyCard(CardBean cb, String m_id);
	
	public void rmMyCard(CardBean cb, String m_id);

	public void addPreFriend(String mId, PreFriend pf);
	
	public void rmPreFriend(String fId, String mId);
	
	public void addFriend(String mId,String fId);
	
	public void rmFriend(String mId,String fId);
	
	public boolean pair(String mId,String fId);

	void leaveMyActivity(Launch_activityBean article_Id, String m_id);

	List<MemberBean> getActivityPerson(int article_Id);

	void addMyActivity(Launch_activityBean article_Id, String m_id);

	List<MemberBean> getAllMember();

//	void addmember();
}
