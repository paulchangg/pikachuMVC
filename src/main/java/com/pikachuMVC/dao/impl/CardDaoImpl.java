package com.pikachuMVC.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.CardDao;
import com.pikachuMVC.model.CardBean;

import init.GlobalService;


@Repository
public class CardDaoImpl implements Serializable, CardDao {

	private static final long serialVersionUID = 1L;
	private int recordsPerPage = 8;
	private int totalPages = -1;
	
	@Autowired
    SessionFactory factory;
    
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getCbPageCards(int pageNo) {
        Map<Integer, CardBean> map = new HashMap<>();
		
		List<CardBean> list = new ArrayList<CardBean>();
		String hql = "FROM CardBean c WHERE c.fcb > 0 AND c.dcb >0";
//		String hql = "FROM CardBean";
        Session session = factory.getCurrentSession();

        int startRecordNo = (pageNo - 1) * recordsPerPage;

        list = session.createQuery(hql)
                      .setFirstResult(startRecordNo)
                      .setMaxResults(recordsPerPage)
                      .getResultList();
        for(CardBean bean : list) {
        	map.put(bean.getC_id(), bean);
        }
		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getMlPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.fma LIKE 'NT%' OR c.dma LIKE 'NT%'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getOilPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.refuel_dis LIKE 'NT%' OR refuel_cb > 0.0001;";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getMvPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE wkdmoviedis LIKE '%折' OR moviedis LIKE '%折'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getOsPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.onlinefb >0.001";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getZiPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "FROM CardBean c WHERE c.zeroins LIKE '%期'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, CardBean> getFgPageCards(int pageNo) {
		  Map<Integer, CardBean> map = new HashMap<>();
			
			List<CardBean> list = new ArrayList<CardBean>();
			String hql = "SELECT * FROM CardBean c WHERE c.cashfb LIKE '%0' OR mileagefb LIKE '%里'";
	        Session session = factory.getCurrentSession();

	        int startRecordNo = (pageNo - 1) * recordsPerPage;

	        list = session.createQuery(hql)
	                      .setFirstResult(startRecordNo)
	                      .setMaxResults(recordsPerPage)
	                      .getResultList();
	        for(CardBean bean : list) {
	        	map.put(bean.getC_id(), bean);
	        }
			return map;
	}
	   @Override
	   public CardBean getCard(int c_id){
	        CardBean bean = null;
	        Session session = factory.getCurrentSession();
	        bean = session.get(CardBean.class, c_id);
	        return bean;
	    }

	@SuppressWarnings("unchecked")
	@Override
	public List<CardBean> getCards() {
		List<CardBean> list = new ArrayList<CardBean>();
		String hql = "FROM CardBean c";
        Session session = factory.getCurrentSession();
        list = session.createQuery(hql).getResultList();
     
		return list;
		
	}

	@Override
	@Transactional
	public void insertCards() {
		Session session = factory.getCurrentSession();
	
		String line = "";
		int count = 0;
		File file = new File("C:\\_JSP\\workspaceJDBC\\pikachuMVC\\data\\card0405.csv");
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "BIG5");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				count++;
				if (count < 2) {
					continue;
				}
				System.out.println("line=" + line);

				String[] token = line.split("<");

				CardBean cb = new CardBean();
//				cb.setC_id();
				cb.setC_name(token[1]);
				token[2] =  token[1].substring(0, token[1].indexOf(" ")); 
				cb.setBank(token[2]);
				cb.setAnnlfee(token[3]);
				String imgname = "C:\\_JSP\\workspaceJDBC\\pikachuMVC\\data\\imgs\\" + token[1] + ".jpg";
				Blob c_img = GlobalService.fileToBlob(imgname);
				cb.setC_img(c_img);

				if (token[5]== null || token[5].trim().length() == 0) {
					token[5] = "0";
				}
				token[5] = token[5].replace("%", "");
				cb.setFcb(Double.parseDouble(token[5].trim()));

				if (token[6]== null || token[6].trim().length() == 0) {
					token[6] = "0";
				}

				token[6] = token[6].replace("%", "");
				cb.setDcb(Double.parseDouble(token[6].trim()));
				cb.setFcb_n(token[7]);
				cb.setDcb_n(token[8]);
				cb.setFma(token[9]);
				cb.setDma(token[10]);
				cb.setFma_n(token[11]);
				cb.setDma_n(token[12]);

				if (token[13]== null || token[13].trim().length() == 0) {
					token[13] = "0";
				}
				cb.setRefuel_cb(Double.parseDouble(token[13].trim()));

				cb.setRefuel_dis(token[14]);
				cb.setRefuel_cb_n(token[15]);
				cb.setRefuel_dis_n(token[16]);
				cb.setWkdmoviedis(token[17]);
				cb.setMoviedis(token[18]);
				cb.setWkdmoviedis_n(token[19]);
				cb.setMoviedis_n(token[20]);
				cb.setDitigalfb(token[21]);
				cb.setOnlinefb(token[22]);
				cb.setDitigalfb_n(token[23]);
				cb.setOnlinefb_n(token[24]);
				cb.setZeroins(token[25]);
				cb.setMinins(token[26]);
				cb.setZeroins_n(token[27]);
				cb.setMinins_n(token[28]);
				cb.setMileagefb(token[29]);
				cb.setCashfb(token[30]);
				cb.setMileagefb_n(token[31]);
				cb.setCashfb_n(token[32]);

				if (token[33]== null || token[33].trim().length() == 0) {
					token[33] = "0";
				}
				cb.setAnnual_income(Integer.parseInt(token[33].trim()));
				cb.setC_type(token[34]);


				session.save(cb);

				System.out.println("新增一筆Cards紀錄");
			}
			System.out.println("Cards資料新增成功");
		} catch (Exception e) {
			System.err.println("新建Cards表格時發生IO例外: " + e.getMessage());
		}

		
	}
	
}
