package com.pikachuMVC.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.service.IFoumService;
import com.pikachuMVC.service.ILaunch_activityService;
import com.pikachuMVC.service.impl.FoumServiceImpl;
import com.pikachuMVC.service.impl.Launch_activityServiceImpl;

@Controller
public class forumHomeController {

	@Autowired
	IForumDao formService;

	@GetMapping("/ForumHompage")
	public String getForumHompage(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		// 這邊是為了 點即所有活動按鈕時，啟動的
		if (session != null) {
			session.removeAttribute("sessionfname");
			session.removeAttribute("sessionf_id");
			session.removeAttribute("Newsessionfname");
		}

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		String loginmember = mb.getM_id();
		System.out.println("loginmember" + loginmember);// james123
		session.setAttribute("loginmember", loginmember);

		IFoumService service = new FoumServiceImpl();

		List<FoumBean> list = service.getAllfname();

		FoumBean foumbean = null;

		List<String> listFame = new ArrayList<>();

		for (int n = 0; n < list.size(); n++) {

			foumbean = list.get(n);

			String fname = foumbean.getFname();

			listFame.add(fname);

			session.setAttribute("sessionfname", listFame);

		}

		ILaunch_activityService service2 = new Launch_activityServiceImpl();

		List<Launch_activityBean> launchAll = service2.getAllArticles();

		session.setAttribute("launchAll", launchAll);

//		System.out.println("f_id="+listF_id);//[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

//		System.out.println(listFame); // [旅遊, 魯蛇卡, 加油回饋, 無限卡, 電影, 購物, 現金回饋, 宗教, 公益, 鈦金or御璽卡, 運動]

		return "forum/activity_page";
	}
}
