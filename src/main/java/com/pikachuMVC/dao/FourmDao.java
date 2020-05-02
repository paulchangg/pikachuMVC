package com.pikachuMVC.dao;

import java.util.List;
import java.util.Set;

import com.pikachuMVC.model.LaunchActivityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ResponserBean;

public interface FourmDao {
	void addFourm(int fourm,LaunchActivityBean launchActivity);
	
	List<LaunchActivityBean> listFourm();
	
	LaunchActivityBean getSelectLaunchActivity(int launchActivityID);
	
	void saveResponse(ResponserBean responser);
	
	List<ResponserBean> getArticleResponse(int launchActivityID);
	
	void addAllWatch(int launchActivityID);
	
	void deleteArticle(int launchActivityID);
	
	void saveTrackActivity(int article_id,String m_id);
	
	void deleteTrackActivity(int article_id,String m_id);
	
}
