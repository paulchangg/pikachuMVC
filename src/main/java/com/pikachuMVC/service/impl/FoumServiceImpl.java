package com.pikachuMVC.service.impl;

import java.io.Serializable;
import java.sql.Connection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.service.IFoumService;

@Service
public class FoumServiceImpl implements Serializable, IFoumService {

	private static final long serialVersionUID = 1L;
	@Autowired
	IForumDao dao;
//	SessionFactory factory;

	@Override
	@Transactional
	public int insertFoum() {

		int result = 0;

		result = dao.insertFoum();

		return result;

	}

	@Override
	@Transactional
	public int DeleteFname(int f_id) {

		int result = 0;

		result = dao.DeleteFname(f_id);

		return result;

	}

	@Override
	@Transactional
	public int getF_id() {
		int result = 0;
		result = dao.getF_id();

		return result;
	}

	@Override
	@Transactional
	public void setF_id(int f_id) {
		dao.setF_id(f_id);
	}

	
	
	@Override
	@Transactional
	public List<FoumBean> getAllfname() {
	
		
		return dao.getAllfname();
	}

	@Override
	@Transactional
	public FoumBean getF_idByfname(String fname) {

		FoumBean foumbean = null;

		foumbean = dao.getF_idByfname(fname);

		return foumbean;
	}

	@Override
	@Transactional
	public void setConnection(Connection con) {
		dao.setConnection(con);
	}

	@Override
	@Transactional
	public String getFname() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void setFname(String fname) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public String getFname(int f_id) {

		String fname = null;

		fname = dao.getFname(f_id);

		return fname;
	}

	

}
