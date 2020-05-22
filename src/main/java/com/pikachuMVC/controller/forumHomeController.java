package com.pikachuMVC.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pikachuMVC.dao.IForumDao;
import com.pikachuMVC.model.FoumBean;
import com.pikachuMVC.model.Launch_activityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ResponserBean;
import com.pikachuMVC.service.IFoumService;
import com.pikachuMVC.service.ILaunch_activityService;
import com.pikachuMVC.service.IResponserService;
import com.pikachuMVC.service.MemberService;

import init.GlobalService;

@Controller
public class forumHomeController {

	@Autowired
	IForumDao forumDao;

	@Autowired
	IFoumService foumService;

	@Autowired
	ILaunch_activityService launch_activityService;

	@Autowired
	IResponserService responserService;

	@Autowired
	MemberService memberservice;

	@Autowired
	ServletContext sc;

	@GetMapping("/forum/ForumHompage")
	public String getForumHompage(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		session.setAttribute("loginmember", mb.getM_id());

		List<FoumBean> list = foumService.getAllfname();

		FoumBean foumbean = null;

		Map<String, Integer> listFame_listFid = new LinkedHashMap<String, Integer>();

		for (int n = 0; n < list.size(); n++) {

			foumbean = list.get(n);

			listFame_listFid.put(foumbean.getFname(), foumbean.getF_id());

			session.setAttribute("listFame_listFid", listFame_listFid);

		}

		List<Launch_activityBean> launchAll = launch_activityService.getpageActivitys(pageNo);// 有6個

		List<Launch_activityBean> subList1 = new LinkedList<Launch_activityBean>();
		List<Launch_activityBean> subList2 = new LinkedList<Launch_activityBean>();

		int articleNo = 0;

		for (Launch_activityBean bean : launchAll) {
			if (articleNo < 3) {
				subList1.add(bean);
			} else {
				subList2.add(bean);
			}
			articleNo++;
		}

		session.setAttribute("subList1", subList1);
		session.setAttribute("subList2", subList2);

		session.setAttribute("pageNo", pageNo);

		session.setAttribute("totalPage", launch_activityService.getTotalPages());

		return "forum/activity_page";
	}

	@GetMapping("/forum/ConnectionForum_launch")

	public String ConnectionForum_launch(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("fname") String query, @RequestParam("fid") Integer fid, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		if (session != null) {

			session.removeAttribute("launchAll");

		}

		request.setAttribute("loginmember", mb.getM_id());

//		 QueryString是中文，所以解碼-------------------開始-------------------------
		String DecoderFname = "";
		if (query != null) {
			try {
				DecoderFname = URLDecoder.decode(query, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			session.setAttribute("Newsessionfname", DecoderFname);
		}
//		 QueryString是中文，所以解碼-------------------結束-------------------------

		List<Launch_activityBean> pageActivitysByfame = launch_activityService.getpageActivitysByfame(pageNo, fid);

		List<Launch_activityBean> subList1 = new LinkedList<Launch_activityBean>();
		List<Launch_activityBean> subList2 = new LinkedList<Launch_activityBean>();
		int articleNo = 0;
		for (Launch_activityBean bean : pageActivitysByfame) {
			if (articleNo < 3) {
				subList1.add(bean);
			} else {
				subList2.add(bean);
			}
			articleNo++;
		}

		session.setAttribute("subList1", subList1);
		session.setAttribute("subList2", subList2);
//				session.setAttribute("pageActivitysByfame", pageActivitysByfame);

		model.addAttribute("pageNo", pageNo);

		model.addAttribute("totalPage", launch_activityService.getTotalPagesByfname(fid));

		return "forum/activity_page";

	}

	@GetMapping("/forum/QueryLaunchALL")
	public String QueryLaunchALL(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "pageNo") Integer pageNo, Model model) {

//  點選 頁面activity_page的 所有活動時按鈕，並且按取 我要發文，不會遺留上一個Newsessionfname ----開始
		if (session != null) {
			session.removeAttribute("Newsessionfname");
		}

//  點選 頁面activity_page的 所有活動時按鈕，並且按取 我要發文，不會遺留上一個Newsessionfname ----結束

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		session.setAttribute("loginmember", mb.getM_id());

		List<Launch_activityBean> launchAll = launch_activityService.getpageActivitys(pageNo);// 有6個

		List<Launch_activityBean> subList1 = new LinkedList<Launch_activityBean>();
		List<Launch_activityBean> subList2 = new LinkedList<Launch_activityBean>();

		int articleNo = 0;

		for (Launch_activityBean bean : launchAll) {
			if (articleNo < 3) {
				subList1.add(bean);
			} else {
				subList2.add(bean);
			}
			articleNo++;
		}

		session.setAttribute("subList1", subList1);
		session.setAttribute("subList2", subList2);

		model.addAttribute("pageNo", pageNo);

		model.addAttribute("totalPage", launch_activityService.getTotalPages());

		return "forum/activity_page";

	}

	// 要用的時候需要改 return "forum/QueryLaunchMember"; 這字串
	@GetMapping("/forum/QueryLaunchMember")
	public String QueryLaunchMember(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {

		if (session == null) { // 使用逾時
			return "/";
		}

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		request.setAttribute("loginmember", mb.getM_id());

		String DecoderFname = (String) session.getAttribute("DecoderFname");

		session.setAttribute("DecoderFname", DecoderFname);

		List<Launch_activityBean> launchMembers = launch_activityService.getMemberArticles(mb.getM_id());
		session.setAttribute("launchMembers", launchMembers);

		Integer article_Id = null;
		List<ResponserBean> responAll = new ArrayList<>();
		for (Launch_activityBean LaunchId : launchMembers) {

			article_Id = LaunchId.getArticle_Id();

			System.out.println("article_Id" + article_Id);

			responAll.addAll(responserService.getAllContent(article_Id, pageNo));

		}

		session.setAttribute("responAll", responAll);

		session.setAttribute("pageNo", pageNo);

		session.setAttribute("totalPage", responserService.getTotalPages(article_Id));

		return "forum/QueryLaunchMember";

	}

	@PostMapping("/forum/Launch_activityServlet")
	public String Launch_activityServlet(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model, @RequestParam("imageFile") MultipartFile imageFile,
			@RequestParam("article_title") String article_title,
			@RequestParam("article_content") String article_content, @RequestParam("subject") String subject,
			@RequestParam("Location") String Location, @RequestParam("starteTimeStr") String starteTimeStr,
			@RequestParam("endTimeStr") String endTimeStr,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws IOException, ServletException {

		// @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo

		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);// 顯示錯誤訊息
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (article_title == null || article_title.trim().length() <= 5) {
			errorMsg.put("TitleError", "標題不能少於5個字");
		}
		if (article_content == null || article_content.trim().length() <= 50) {
			errorMsg.put("ContentError", "內容不能少於50個字");
		}

		if (subject == null || subject.trim().length() == 0) {
			errorMsg.put("subjectError", "主題不可空白");
		}

		if (Location == null || Location.trim().length() == 0) {
			errorMsg.put("locationError", "活動地點不可空白");
		}

		if (starteTimeStr == null || starteTimeStr.trim().length() == 0) {
			errorMsg.put("starte_TimeError", "活動開始時間不可空白");
		}

		if (endTimeStr == null || endTimeStr.trim().length() == 0) {

			errorMsg.put("endTimeError", "活動結束時間不可空白");

		}

		Date starteTime = null;
		String newstarteTimeStr = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {

			newstarteTimeStr = starteTimeStr.replace("T", " ");

			starteTime = sdf.parse(newstarteTimeStr);

		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Date endTime = null;
		String newendTimeStr = null;
		try {

			newendTimeStr = endTimeStr.replace("T", " ");

			endTime = sdf.parse(newendTimeStr);

		} catch (Exception e) {
		}

//		 如果有錯誤
		if (!errorMsg.isEmpty()) {

			return "forum/activity_page";
		}

		Timestamp ts = new Timestamp(System.currentTimeMillis());

		long sizeInBytes = 0;
		InputStream is = null;

		String fileName = imageFile.getOriginalFilename();
		fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);

		if (fileName != null && fileName.trim().length() > 0) {
			sizeInBytes = imageFile.getSize();
			is = imageFile.getInputStream();
		}

		Blob articleimage = null;
		if (is != null) {
			try {
				articleimage = GlobalService.fileToBlob(is, sizeInBytes);
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		String DecoderFname = (String) session.getAttribute("Newsessionfname");

		request.setAttribute("loginmember", mb.getM_id());

		FoumBean foumBean = foumService.getF_idByfname(DecoderFname);

		Integer popularity = 0;

		Launch_activityBean article = new Launch_activityBean(null, mb.getM_id(), article_title, article_content,
				articleimage, subject, Location, ts, null, starteTime, endTime, popularity, foumBean, null);

		launch_activityService.insertArticle(article);

		model.addAttribute("pageNo", pageNo);

		model.addAttribute("totalPage", launch_activityService.getTotalPages());

		return "redirect:/forum/QueryLaunchALL?pageNo= " + pageNo;

	}

	@GetMapping("/forum/activity_info_page")
	public String activity_info_page(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("article_IdStr") Integer article_Id,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,

			@RequestParam(value = "mode", defaultValue = "null") String mode

	) throws IOException, ServletException {

		Launch_activityBean bean = launch_activityService.getArticle_Id(article_Id);
		// mode無法透過@RequestParam綁定會有錯誤
//		String mode = request.getParameter("mode");

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<ResponserBean> responAll = new ArrayList<>();
		List<MemberBean> JoinPersonName = null;

		// 以下是為了留言回覆後 回到同一頁面準備的
		if (mode == null) {
//			ResponserBean b = (ResponserBean) session.getAttribute("newresponser");

//			Launch_activityBean article_Id2 = b.getLaunch_activityBean();

			responAll.addAll(responserService.getAllContent(article_Id, pageNo));

			session.setAttribute("responAll", responAll);
			session.setAttribute("pageNo", pageNo);

			session.setAttribute("totalPage", responserService.getTotalPages(article_Id));

			return "forum/activity_info_page";

		}

		if (mode.equalsIgnoreCase("add_activity")) {

//---------------------------參加人數顯示開始------------------------------------------------	

			try {
				JoinPersonName = memberservice.getActivityPerson(article_Id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String querymemberid = null;

			List<String> joinmember = new ArrayList<String>();
			for (MemberBean b : JoinPersonName) {

				querymemberid = b.getM_id();// 取出JoinPersonNameList集合內的會員id

				joinmember.add(querymemberid);
			}

			session.setAttribute("gdfg", joinmember.contains(mb.getM_id()));

//			String loginmember_id = ((MemberBean) session.getAttribute("LoginOK")).getM_id();
			// joinmember 是參加活動的會員所有id 以下做 登入的會員ID 是否有在資料庫內的參加活動人員ID
			// 沒有的話 Popularity+1

			if (!joinmember.contains(mb.getM_id())) {
				Integer Popularity = bean.getPopularity();
				Popularity++;
				launch_activityService.addPopularity(article_Id, Popularity);

			}
			session.setAttribute("activity_info_page", bean);

//---------------------------參加人數顯示結束--------------------------	

//---------------------------右下角參加人的資訊開始 存入資料庫--------------------				
			Launch_activityBean member_launch_activity_article_Id = launch_activityService.getArticle_Id(article_Id);

			// 將資料寫入 member_launch_activity table(多對多的table)
			memberservice.addMyActivity(member_launch_activity_article_Id, mb.getM_id());// 此動作會存入文章活動的id ， 參加的人員

			String enterpage ="enterpage";
			return "redirect:/forum/activity_info_page?article_IdStr=" + article_Id + "&mode=" + enterpage;
			
			
		} else if (mode.equalsIgnoreCase("enterpage")) {

			session.setAttribute("activity_info_page", bean);
		} else if (mode.equalsIgnoreCase("leave_activity")) {

			try {
				JoinPersonName = memberservice.getActivityPerson(article_Id);
			} catch (Exception e) {
				e.printStackTrace();
			}

			String querymemberid = null;

			List<String> joinmember = new ArrayList<String>();

			for (MemberBean b : JoinPersonName) {
				querymemberid = b.getM_id();// 取出JoinPersonNameList集合內的會員id

				joinmember.add(querymemberid);
			}

			Integer Popularity = bean.getPopularity();
			if (joinmember.contains(mb.getM_id())) {
				Popularity--;
				if (Popularity < 0) {
					Popularity = 0;
				}
				launch_activityService.addPopularity(article_Id, Popularity);

			}

			Launch_activityBean member_launch_activity_article_Id = launch_activityService.getArticle_Id(article_Id);

			session.setAttribute("activity_info_page", bean);

			// 將資料寫入 member_launch_activity table(多對多的table) 圖片會消失
			memberservice.leaveMyActivity(member_launch_activity_article_Id, mb.getM_id());
			String enterpage ="enterpage";
			return "redirect:/forum/activity_info_page?article_IdStr=" + article_Id + "&mode=" + enterpage;
		}

//以下是所有判斷式共用的

		responAll.addAll(responserService.getAllContent(article_Id, pageNo));

		
		
		session.setAttribute("responAll", responAll);

		session.setAttribute("pageNo", pageNo);

		session.setAttribute("totalPage", responserService.getTotalPages(article_Id));

		try {
			JoinPersonName = memberservice.getActivityPerson(article_Id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String querymemberid = null;
		List<String> joinmember = new ArrayList<String>();
		for (MemberBean b : JoinPersonName) {

			querymemberid = b.getM_id();// 取出JoinPersonNameList集合內的會員id

			joinmember.add(querymemberid);
		}

		session.setAttribute("joinmember", joinmember.contains(mb.getM_id()));

		List<MemberBean> FristJoinPerson = new LinkedList<MemberBean>();
		List<MemberBean> SecondJoinPerson = new LinkedList<MemberBean>();

		int articleNo = 0;

		for (MemberBean bean2 : JoinPersonName) {
			if (articleNo < 5) {
				FristJoinPerson.add(bean2);
			} else {
				SecondJoinPerson.add(bean2);
			}

			articleNo++;
		}

		session.setAttribute("FristJoinPerson", FristJoinPerson);
		session.setAttribute("SecondJoinPerson", SecondJoinPerson);

		return "forum/activity_info_page";

	}

	@GetMapping("/forum/RetrieveLaunchImageServlet")

	public void RetrieveLaunchImageServlet(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam("article_IdStr") Integer article_Id) throws IOException {

		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;

		try {
			// 讀取瀏覽器傳送來的主鍵
//			String id = request.getParameter("article_IdStr");
			// 讀取瀏覽器傳送來的type，以分辨要處理哪個表格

			Launch_activityBean bean = launch_activityService.getArticle_Id(article_Id);
			if (bean != null) {
				blob = bean.getArticleimage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}

			}
			os = response.getOutputStream();

			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			if (is != null)
				is.close();
			if (os != null)
				os.close();

		}

	}

	@PostMapping("/forum/DeLItem.do")

	public String DeLIArticleServlet(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("article_IdStr") Integer article_Id, 
			
//			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam("mode") String mode)
			throws IOException, ServletException {
		if (mode.equalsIgnoreCase("DEL")) {
			launch_activityService.DeleteArticle(article_Id);// 刪除活動的某文章
		}
		return "redirect:/forum/ForumHompage ";
	}

	@PostMapping("/forum/UpdateItem.do")
	public String UpdateArticleServlet(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("article_IdStr") Integer article_Id,

			@RequestParam("mode") String mode,

			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,

			@RequestParam("imageFile") MultipartFile imageFile,

			@RequestParam("article_title") String article_title,
			@RequestParam("article_content") String article_content, @RequestParam("subject") String subject,
			@RequestParam("Location") String Location, @RequestParam("starteTimeStr") String starteTimeStr,
			@RequestParam("endTimeStr") String endTimeStr,

			Model model) throws IOException, ServletException {

		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg); // 顯示錯誤訊息

//		if (mode.equalsIgnoreCase("DEL")) {
//			launch_activityService.DeleteArticle(article_Id);// 刪除活動的某文章
//
//			// 要用新頁面的
//
//			return "redirect:/forum/ForumHompage ";
//
//		} 
		if (mode.equalsIgnoreCase("MOD")) {

			long sizeInBytes = 0;
			InputStream is = null;

			String fileName = imageFile.getOriginalFilename();
			fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);

			if (fileName != null && fileName.trim().length() > 0) {
				sizeInBytes = imageFile.getSize();
				is = imageFile.getInputStream();
			}

			Blob articleimage = null;
			if (is != null) {
				try {
					articleimage = GlobalService.fileToBlob(is, sizeInBytes);
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}

			if (article_title == null || article_title.trim().length() <= 5) {
				errorMsg.put("TitleError", "標題不能少於5個字");
			}
			if (article_content == null || article_content.trim().length() <= 50) {
				errorMsg.put("ContentError", "內容不能少於50個字");
			}

			if (subject == null || subject.trim().length() == 0) {
				errorMsg.put("subjectError", "主題不可空白");
			}

			if (Location == null || Location.trim().length() == 0) {
				errorMsg.put("locationError", "活動地點不可空白");
			}

			if (starteTimeStr == null || starteTimeStr.trim().length() == 0) {
				errorMsg.put("starte_TimeError", "活動開始時間不可空白");
			}

			if (endTimeStr == null || endTimeStr.trim().length() == 0) {

				errorMsg.put("endTimeError", "活動結束時間不可空白");

			}

			if (!errorMsg.isEmpty()) {

				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				return "forum/activity_info_page";
			}

			Date starteTime = null;
			String newstarteTimeStr = null;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			try {

				newstarteTimeStr = starteTimeStr.replace("T", " ");

				starteTime = sdf.parse(newstarteTimeStr);

			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			Date endTime = null;
			String newendTimeStr = null;
			try {

				newendTimeStr = endTimeStr.replace("T", " ");

				endTime = sdf.parse(newendTimeStr);

			} catch (Exception e) {
			}

			Timestamp updateTime = new Timestamp(System.currentTimeMillis());

			Launch_activityBean article = new Launch_activityBean();

			article.setArticle_title(article_title);
			article.setArticle_content(article_content);

			article.setArticleimage(articleimage);
			article.setStartTime(starteTime);
			article.setEndTime(endTime);

			article.setUpdateTime(updateTime);

			article.setLocation(Location);
			article.setSubject(subject);

			launch_activityService.updateArticle(article_Id, article);
		}

		String enterpage = "enterpage";

		return "redirect:/forum/activity_info_page?article_IdStr=" + article_Id + "&mode=" + enterpage;

	}

	
	
	
	
	
	
	
	@PostMapping("/forum/ResponserServlet")

	public String ResponserServlet(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			RedirectAttributes attr, @RequestParam("article_IdStr") Integer article_Id,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam("res_contentStr") String res_contentStr, Model model) {

		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);// 顯示錯誤訊息
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		session.getAttribute("activity_info_page");

		if (res_contentStr == null || res_contentStr.trim().length() <= 10) {
			errorMsg.put("res_contentError", "回復內容不能少於10個字");
		}

		if (!errorMsg.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			return "forum/activity_info_page";
		}

		Date ts = new Date(System.currentTimeMillis());

		
		
		Launch_activityBean launch_activityBean = launch_activityService.getArticle_Id(article_Id);

		ResponserBean responser = new ResponserBean(null, mb.getM_id(), ts, null, res_contentStr, launch_activityBean);

		responserService.insertRescontent(responser);

		attr.addAttribute("article_IdStr", article_Id);

		return "redirect:/forum/activity_info_page?pageNo=" + pageNo;
	}

	
	
	@GetMapping("/forum/DelResponerServlet")
	
	public String DelResponerServlet(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam("res_idStr") Integer res_id, 
			@RequestParam("mode") String mode,
			@RequestParam("article_IdStr") Integer article_Id,
			Model model) {
		
		if (mode.equalsIgnoreCase("DEL")) {

			// 刪除活動的某文章的回覆
			responserService.DeleteArticle(res_id);
		}
		
		
		String enterpage = "enterpage";
		return "redirect:/forum/activity_info_page?article_IdStr=" + article_Id + "&mode=" + enterpage;
		
	}
	
	@PostMapping("/forum/UpdateResponerServlet")
	public String UpdateResponerServlet(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam("res_idStr") Integer res_id, 
			@RequestParam("mode") String mode,
			@RequestParam("article_IdStr") Integer article_Id,
			@RequestParam("res_content") String res_content,Model model) {

//		if (mode.equalsIgnoreCase("DEL")) {
//
//			// 刪除活動的某文章的回覆
//			responserService.DeleteArticle(res_id);
//			return "/forum/activity_info_page ";
//		}

		 if (mode.equalsIgnoreCase("MOD")) {
			
			
			Map<String, String> errorMsg = new HashMap<String, String>();
			model.addAttribute("MsgMap", errorMsg);// 顯示錯誤訊息
			
			
			if (res_content == null || res_content.trim().length() <= 10) {
				errorMsg.put("res_contentError", "回復內容不能少於10個字");
			}

			if (!errorMsg.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				return "forum/activity_info_page";
			}

	
			
			Timestamp updateTime = new Timestamp(System.currentTimeMillis());
			
			
			
			
			
			

			ResponserBean responbean = new ResponserBean();
			responbean.setUpdateTime(updateTime);
			responbean.setRes_content(res_content);
			
			
//			model.addAttribute("updateTime",updateTime);
			

			responserService.updateArticle(res_id, responbean);

		}
		String enterpage = "enterpage";
		return "redirect:/forum/activity_info_page?article_IdStr=" + article_Id + "&mode=" + enterpage;

	}

}
