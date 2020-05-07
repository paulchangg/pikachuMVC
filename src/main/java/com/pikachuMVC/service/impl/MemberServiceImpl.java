package com.pikachuMVC.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pikachuMVC.dao.MemberDao;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.PreFriend;
import com.pikachuMVC.service.MemberService;

import init.SendEmail;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;

	@Override
	@Transactional
	public int saveMember(MemberBean mb) {
		int count = 0;
		dao.saveMember(mb);
		count++;
		return count;
	}

	@Override
	@Transactional
	public boolean idExists(String id) {
		boolean result;
		result = dao.idExists(id);
		return result;
	}

	@Override
	@Transactional
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		mb = dao.queryMember(id);
		return mb;
	}

	@Override
	@Transactional
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		mb = dao.checkIdPassword(userId, password);
		return mb;
	}

	@Override
	@Transactional
	public int updatePassword(String email, String newPW) {
		int r = 0;
		r = dao.updatePassword(email, newPW);
		return r;
	}

	@Override
	@Transactional
	public boolean emailExists(String email) {
		boolean result;
		result = dao.emailExists(email);
		return result;
	}

//	@Override
//	public boolean sendMail(String email, String newPW) {
//		boolean r = false;
//		String host = "smtp.gmail.com";
//		int port = 587;
//		String from = "ntutjava013.2@gmail.com";
//		String to = email;
//		final String username = "ntutjava013.2@gmail.com";
//		final String password = "Do!ng123";
//
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		javax.mail.Session session = javax.mail.Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//
//		try {
//
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(from));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//			message.setSubject("PIKACHU : update passowrd successfully");
//			message.setText("This is your new password : [ " + newPW + " ] !!!");
//
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
//
//			Transport.send(message);
//
//			System.out.println("寄送email結束.");
//			r = true;
//		} catch (MessagingException e) {
//			throw new RuntimeException(e);
//		}
//		
//		return r;
//	}

	@Override
	public void sendMail(String email, String newPW) {
		SendEmail se = new SendEmail(email, newPW);
		se.start();
	}

	@Override
	@Transactional
	public void changePassword(MemberBean mb) {
		dao.changePassword(mb);

	}

	@Override
	@Transactional
	public void updateM_img(MemberBean mb) {
		dao.updateM_img(mb);
	}

	@Override
	@Transactional
	public void updateMember(MemberBean mb) {
		dao.updateMember(mb);

	}

	@Override
	@Transactional
	public void saveOrUpdate(MemberBean mb) {
		dao.saveOrUpdate(mb);
	}

	@Override
	@Transactional
	public void addMyCard(CardBean cb, String m_id) {
		dao.addMyCard(cb, m_id);
	}

	@Override
	@Transactional
	public void rmMyCard(CardBean cb, String m_id) {
		dao.rmMyCard(cb, m_id);
	}

	@Override
	@Transactional
	public void addPreFriend(String mId, PreFriend pf) {
		dao.addPreFriend(mId, pf);

	}

	@Override
	@Transactional
	public void addFriend(String mId, String fId) {
		dao.addFriend(mId, fId);

	}

	@Override
	@Transactional
	public boolean pair(String mId, String fId) {
		return dao.pair(mId, fId);
	}

	@Override
	@Transactional
	public void rmPreFriend(String fId, String mId) {
		dao.rmPreFriend(fId, mId);
	}

	@Override
	@Transactional
	public void addMyActivity(Launch_activityBean article_Id, String m_id) {

		dao.addMyActivity(article_Id, m_id);
	}

	@Override
	public List<MemberBean> getActivityPerson(int article_Id) {
		List<MemberBean> joinActivityMember = null;
		joinActivityMember = dao.getActivityPerson(article_Id);
		return joinActivityMember;
	}

	@Override
	public void leaveMyActivity(Launch_activityBean article_Id, String m_id) {
		dao.leaveMyActivity(article_Id, m_id);
		return;

	}

}
