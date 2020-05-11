package com.pikachuMVC.service.impl;

import java.sql.Connection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.IResponserDao;
import com.pikachuMVC.model.ResponserBean;
import com.pikachuMVC.service.IResponserService;

@Service

public class ResponserServiceImpl implements IResponserService {

	@Autowired
	IResponserDao dao;

	@Override
	@Transactional
	public void insertRescontent(ResponserBean responser) {

		dao.insertRescontent(responser);

	}

	@Override
	@Transactional
	public ResponserBean getRes_id(int res_id) {

		ResponserBean result = null;

		result = dao.getRes_id(res_id);

		return result;

	}

	@Override
	@Transactional
	public int updateArticle(int res_id, ResponserBean responser) {

		int result = 0;

		result = dao.updateArticle(res_id, responser);

		return result;

	}

	@Override
	@Transactional
	public int DeleteArticle(int res_id) {

		int result = 0;

		result = dao.DeleteArticle(res_id);

		return result;

	}

	@Override
	@Transactional
	public List<ResponserBean> getAllContent(int article_Id) {

		List<ResponserBean> result = null;

		result = dao.getAllContent(article_Id);

		return result;

	}

	@Override
	@Transactional
	public List<ResponserBean> getMemberContent(String res_m_id) {

		List<ResponserBean> result = null;

		result = dao.getMemberContent(res_m_id);

		return result;

	}

	@Override
	@Transactional
	public void setConnection(Connection con) {
		dao.setConnection(con);
	}

}
