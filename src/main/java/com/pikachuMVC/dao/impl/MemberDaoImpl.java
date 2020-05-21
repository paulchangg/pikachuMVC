package com.pikachuMVC.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.sql.Date;

import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.MemberDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.PreFriend;

import init.GlobalService;



@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SessionFactory factory;

	
	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;
		return n;
	}

	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，
	// 否則傳回false，表示此id可使用。
	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.m_id = :id";
		Session session = factory.getCurrentSession();

		try {
			session.createQuery(hql).setParameter("id", id).getSingleResult();
			exist = true;
		} catch (NonUniqueResultException n) {
			exist = true;
		} catch (NoResultException e) {
			exist = false;
		}

		return exist;
	}

	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，
	// 如果找不到對應的會員資料，傳回值為null。
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.m_id = :id";
		Session session = factory.getCurrentSession();
		List<MemberBean> beans = null;

		beans = session.createQuery(hql).setParameter("id", id).getResultList();
		if (beans.size() > 0) {
			mb = beans.get(0);
		}

		return mb;
	}

	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// 否則傳回 null。
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		List<MemberBean> beans = null;
		String hql = "FROM MemberBean m WHERE m.m_id = :id and m.m_password = :pswd";
		Session session = factory.getCurrentSession();
		beans = session.createQuery(hql).setParameter("id", userId).setParameter("pswd", password).getResultList();

		if (beans.size() > 0) {
			mb = beans.get(0);
		}

		return mb;
	}

	//user忘記密碼時,依照他註冊時所填的email,更新其密碼
	// 成功回傳1
	@Override
	public int updatePassword(String email, String newPW) {
		int result = 0;
		String hql = "UPDATE MemberBean m SET m.m_password = :pw WHERE m.m_mail = :email";
		Session session = factory.getCurrentSession();
		result = session.createQuery(hql).setParameter("pw", newPW).setParameter("email", email).executeUpdate();
		return result;
	}
	//確認email是否存在
	@Override
	public boolean emailExists(String email) {
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.m_mail = :email";
		Session session = factory.getCurrentSession();

		try {
			session.createQuery(hql).setParameter("email", email).getSingleResult();
			exist = true;
		} catch (NonUniqueResultException n) {
			exist = true;
		} catch (NoResultException e) {
			exist = false;
		}

		return exist;
	}

//	//變更密碼
//	@Override
//	public int changePassword(MemberBean mb, String newPW) {
//		int result = 0;
//		String hql = "UPDATE MemberBean m SET m.m_password = :newPW WHERE m.m_id = :m_id";
//		Session session = factory.getCurrentSession();
//		result = session.createQuery(hql).setParameter("newPW", newPW).setParameter("m_id", mb.getM_id()).executeUpdate();
//		
//		return result;
//	}
	
	//變更密碼
	@Override
	public void changePassword(MemberBean mb) {
		MemberBean member = null;
		Session session = factory.getCurrentSession();
		member = (MemberBean)session.get(MemberBean.class, mb.getM_id());
		member.setM_password(mb.getM_password());
		
	}

	@Override
	public void updateM_img(MemberBean mb) {
		MemberBean member = null;
		Session session = factory.getCurrentSession();
		member = (MemberBean)session.get(MemberBean.class, mb.getM_id());
		member.setM_img(mb.getM_img());

	}

	@Override
	public void updateMember(MemberBean mb) {
		MemberBean member = null;
		Session session = factory.getCurrentSession();
		member = (MemberBean)session.get(MemberBean.class, mb.getM_id());
		member.setNickname(mb.getNickname());
		member.setIncome(mb.getIncome());
		member.setEducation(mb.getEducation());
		member.setCity(mb.getCity());
		
	}

	@Override
	public void saveOrUpdate(MemberBean mb) {
		Session session = factory.getCurrentSession();
		
		session.saveOrUpdate(mb);
		
	}

	@Override
	public void addMyCard(CardBean cb, String m_id) {	
		MemberBean mbean;
		CardBean cbean;
		Session session = factory.getCurrentSession();
		
		mbean = session.get(MemberBean.class, m_id);
		cbean = session.get(CardBean.class, cb.getC_id());
		
		Set<CardBean> cards = mbean.getCards();
		cards.add(cbean);
		mbean.setCards(cards);
		
		Set<MemberBean> members = cbean.getMembers();
		members.add(mbean);
		cbean.setMembers(members);		
		
	}

	@Override
	public void rmMyCard(CardBean cb, String m_id) {
		MemberBean mbean;
		CardBean cbean;
		Session session = factory.getCurrentSession();
		
		mbean = session.get(MemberBean.class, m_id);
		cbean = session.get(CardBean.class, cb.getC_id());
		
		Set<CardBean> cards = mbean.getCards();
		cards.remove(cbean);
		mbean.setCards(cards);
		
		Set<MemberBean> members = cbean.getMembers();
		members.remove(mbean);
		cbean.setMembers(members);		
		
	}

	@Override
	public void addPreFriend(String mId, PreFriend pf) {
		MemberBean mbean;
		Session session = factory.getCurrentSession();
		
		mbean = session.get(MemberBean.class, mId);
		pf.setMb(mbean);
		Set<PreFriend> pfset = mbean.getPreFriends();
		pfset.add(pf);
		mbean.setPreFriends(pfset);	

	}
	
	@Override
	public void rmPreFriend(String fId, String mId) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM PreFriend pf WHERE pf.m_id = :fId AND pf.fId = :mId";
		session.createQuery(hql).setParameter("fId", fId).setParameter("mId", mId).executeUpdate();
		
	}

	@Override
	public void addFriend(String mId, String fId) {
		MemberBean mbean;
		MemberBean fbean;
		
		Session session = factory.getCurrentSession();
		mbean = session.get(MemberBean.class, mId);
		fbean = session.get(MemberBean.class, fId);
		
		Set<MemberBean> mset = mbean.getFriends();
		mset.add(fbean);
		mbean.setFriends(mset);
		
		Set<MemberBean> fset = fbean.getFriends();
		fset.add(mbean);
		fbean.setFriends(fset);
	}

	@Override
	public boolean pair(String fId, String mId) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM PreFriend pf WHERE pf.m_id = :fId AND pf.fId = :mId";
		
		
		try {
			session.createQuery(hql).setParameter("fId", fId).setParameter("mId", mId).getSingleResult();
			exist = true;
		} catch (NonUniqueResultException n) {
			exist = true;
		} catch (NoResultException e) {
			exist = false;
		}

		return exist;
		
	}

	@Override
	public void rmFriend(String mId, String fId) {
		MemberBean mbean;
		MemberBean fbean;
		
		Session session = factory.getCurrentSession();
		mbean = session.get(MemberBean.class, mId);
		fbean = session.get(MemberBean.class, fId);
		
		Set<MemberBean> mset = mbean.getFriends();
		mset.remove(fbean);
		mbean.setFriends(mset);
		
		Set<MemberBean> fset = fbean.getFriends();
		fset.remove(mbean);
		fbean.setFriends(fset);
		
	}

	@Override
	public void addMyActivity(Launch_activityBean article_Id, String m_id) {
		MemberBean mbean;
		Launch_activityBean launchbean;

		Session session = factory.getCurrentSession();
		// mbean 是 以MemberBean的m_id 為參考依據(裡面包含Birthday city 等MemberBean的屬性)
		mbean = session.get(MemberBean.class, m_id);
		// launchbean 是 以Launch_activityBean的article_Id 為參考依據(裡面包含article_content
		// article_title等Launch_activityBean的屬性)

		launchbean = session.get(Launch_activityBean.class, article_Id.getArticle_Id());
		// mbean呼叫getLaunch_activityBean()方法 ，將呼叫的物件 存入變數launchset 的Set集合
		Set<Launch_activityBean> launchset = mbean.getLaunch_activityBean();

		// Set集合型態的launchset物件，將以Launch_activityBean 的 article_Id 為參考的物件launchbean
		// 加進去(launchset物件內)
		launchset.add(launchbean);
		// 將launchbean物件放入mbean物件內
		mbean.setLaunch_activityBean(launchset);

		// launchbean呼叫.getMembers()方法 ，將呼叫的參數 存入物件members 的Set集合
		Set<MemberBean> members = launchbean.getMembers();

		// Set集合型態的members物件，將以MemberBean 的 m_id 為參考的物件mbean 加進去( members物件內)
		members.add(mbean);
		// 將members物件放入launchbean物件內
		launchbean.setMembers(members);
		
	}

	@Override
	public List<MemberBean> getActivityPerson(int article_Id) {
		MemberBean mbean = null;
		List<MemberBean> joinActivityMember = new ArrayList<MemberBean>();
		Session session = factory.getCurrentSession();
		
		Launch_activityBean launch_activityBean = (Launch_activityBean) session.load(Launch_activityBean.class,article_Id);

		for (Iterator<?> iter = launch_activityBean.getMembers().iterator(); iter.hasNext();) {

			mbean = (MemberBean) iter.next();
			joinActivityMember.add(mbean);     
		}
		
		
		return joinActivityMember;  //List<String>
	}

	@Override
	public void leaveMyActivity(Launch_activityBean article_Id, String m_id) {
		MemberBean mbean;
		Launch_activityBean launchbean;

		Session session = factory.getCurrentSession();
		// mbean 是 以MemberBean的m_id 為參考依據(裡面包含Birthday city 等MemberBean的屬性)
		mbean = session.get(MemberBean.class, m_id);
		// launchbean 是 以Launch_activityBean的article_Id 為參考依據(裡面包含article_content
		// article_title等Launch_activityBean的屬性)

		launchbean = session.get(Launch_activityBean.class, article_Id.getArticle_Id());
		
		Set<Launch_activityBean> launchset =mbean.getLaunch_activityBean();
		launchset.remove(launchbean);
		
		
		Set<MemberBean> members = launchbean.getMembers();
		
		members.remove(mbean);
		launchbean.setMembers(members);
		
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMember() {
		List<MemberBean> reult = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean ";
		 reult=	session.createQuery(hql).getResultList();
		return  reult;
		
	}
	
	
//	@Override
//	@Transactional
//	public void addmember() {
//		Session session = factory.getCurrentSession();
//	
//		String line = "";
//		
//		File file = new File("C:\\_JSP\\workspace2020\\pikachuMVC\\data\\member.txt"); //JAMES
//
//
//
//		try (FileInputStream fis = new FileInputStream(file);
//				InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
//				BufferedReader br = new BufferedReader(isr);) {
//			while ((line = br.readLine()) != null) {
//				
//				String[] token = line.split("<");
//				MemberBean mb = new MemberBean();
//				mb.setM_id(token[0]);
//				mb.setBirthday(Date.valueOf(token[1]));
//				mb.setCity(token[2]);
//				mb.setEducation(token[3]);
//				mb.setGender(token[4]);
//				mb.setIncome(token[5]);
//				
//				
//				mb.setM_mail(token[7]);
////				mb.setM_password(token[8]);
//				String beforepassword ="Qazwsx@@12";
//				String	newpassword = GlobalService.getMD5Endocing(GlobalService.encryptString(beforepassword));
//				
//				mb.setM_password(newpassword);
//				
//				
//				
//				
//				
//				
//				mb.setName(token[9]);
//				mb.setNickname(token[10]);
//				mb.setPhone_num(token[11]);
//				
//				String imgname = "C:\\_JSP\\workspace2020\\pikachuMVC\\data\\memberImgs\\" + token[6]; //JAMES
//
//				Blob m_img = GlobalService.fileToBlob(imgname);
//				
//				mb.setM_img(m_img);
//				
//				
//
//				
//				session.save(mb);
//				
//				System.out.println("新增一筆Member紀錄");
//			}
//			System.out.println("Member資料新增成功");
//		} catch (Exception e) {
//			e.getStackTrace();
//			System.err.println("新建Member表格時發生IO例外: " + e.getMessage());
//		}
//
//		
//	}
	
	
	
}
