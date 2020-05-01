package com.pikachuMVC.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.PreFriend;
import com.pikachuMVC.service.MemberService;

@Controller
@RequestMapping("/friends")
public class FriendsController {
	
	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/f1")
	public String oxFriend(HttpSession session) {
//		String mId = ((MemberBean)session.getAttribute("LoginOK")).getM_id();
//		MemberBean mb = memberService.queryMember(mId);
//		if(mb.getNickname() == null || mb.getNickname().trim().length() == 0 ||
//			mb.getIncome() == null || mb.getIncome().trim().length() == 0 ||
//			mb.getEducation() == null || mb.getEducation().trim().length() == 0 ||
//			mb.getCity() == null || mb.getCity().trim().length() == 0 
//				) {
//			return "redirect:/member/member_edit";
//		}
		
		return "friends/f1";
	}
	
	@GetMapping("/f2")
	public String getFriendList(HttpSession session) {
		return "friends/f2";
	}
	
	//回傳推薦好友清單
	@PostMapping("/getPreFriends.do")
	@ResponseBody
	public void getPreFriends(HttpServletResponse response,HttpSession session) throws IOException {
		String mId = ((MemberBean)session.getAttribute("LoginOK")).getM_id();
		//此為推薦好友清單
		Set<CardBean> cset = memberService.queryMember(mId).getCards();
		Set<MemberBean> mset = new HashSet<MemberBean>();
		for(CardBean card : cset) {
			//把所有自己持有的卡片的所有持卡人加進mset
			mset.addAll(card.getMembers());
		}
		//此作法必須去override MemberBean類別的equals 和 hashCode方法 這樣才有辦法比對MemberBean物件是否一致 
		MemberBean mb = memberService.queryMember(mId);	
		//把自己從推薦清單中移除
		mset.remove(mb);
		Set<PreFriend> pfset = mb.getPreFriends();
		for(PreFriend pf : pfset) {
			//把已按過喜歡的準好友從推薦清單中移除
			mset.remove(memberService.queryMember(pf.getfId()));
		}
		//把自己的好友從推薦清單中移除
		mset.removeAll(memberService.queryMember(mId).getFriends());
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		//在memberBean 的欄位 增加Expose annotation 此行讓gson去掃這些註解 
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String membersJson = gson.toJson(mset);
		System.out.println(membersJson);
		out.write(membersJson);
		out.flush();	
	}
	
	//前端按下喜歡後的處理事件
	@PostMapping("/addPreFriend.do")
	@ResponseBody
	public void addPreFriend(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		String mId = ((MemberBean)session.getAttribute("LoginOK")).getM_id();
		String friendId = request.getParameter("friendId");
		PreFriend pf = new PreFriend(null,friendId,null);
		//判斷此人是否也按過我喜歡
		Boolean rs = memberService.pair(friendId, mId);
		if(rs) {
			//把他加入好友
			memberService.addFriend(mId, friendId);
			//並把自己從他的準好友清單中移除
			memberService.rmPreFriend(friendId, mId);			
		}else {
			//把他加入自己的準好友清單	
			memberService.addPreFriend(mId, pf);	
		}		
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(true);
		out.flush();
	}
	
	@PostMapping("/getFriendList.do")
	@ResponseBody
	public void getFriendList(HttpSession session,HttpServletResponse response) throws IOException {
		String mId = ((MemberBean)session.getAttribute("LoginOK")).getM_id();
		Set<MemberBean> fset = memberService.queryMember(mId).getFriends();
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		//在memberBean 的欄位 增加Expose annotation 此行讓gson去掃這些註解 
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String membersJson = gson.toJson(fset);
		System.out.println(membersJson);
		out.write(membersJson);
		out.flush();
		
		
	}
	
}