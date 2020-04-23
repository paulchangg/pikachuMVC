package com.pikachuMVC.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pikachuMVC.model.CardBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.service.CardService;
import com.pikachuMVC.service.MemberService;

import init.GlobalService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	CardService cardservice;

	@Autowired
	ServletContext sc;

	@GetMapping("/member/member_register")
	public String register(Model model) {
		model.addAttribute("gender1", "checked");
		return "member/member_register";
	}

	@GetMapping("/member/member_login")
	public String login(HttpServletRequest request) {
		// **********Remember Me****************
		String cookieName = "";
		String user = "";
		String password = "";
		String rememberMe = "";
		// 取出瀏覽器送來的Cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null) { // 如果含有Cookie
			for (int i = 0; i < cookies.length; i++) { // 檢視每個Cookie
				cookieName = cookies[i].getName();
				if (cookieName.equals("user")) {
					// 找到user這個Cookie
					user = cookies[i].getValue();
				} else if (cookieName.equals("password")) {
					// 找到password這個Cookie
					String tmp = cookies[i].getValue();
					// 將密碼解密
					if (tmp != null) {
						password = GlobalService.decryptString(GlobalService.KEY, tmp);
					}
				} else if (cookieName.equals("rm")) {
					// 找到rm這個Cookie(rm: rememberMe)
					rememberMe = cookies[i].getValue();
				}
			}
		} else {
			// 找不到Cookie，沒有關係，就讓使用者輸入資料即可。
		}
		// 將這三項資料存入request物件
		request.setAttribute("rememberMe", rememberMe);
		request.setAttribute("user", user);
		request.setAttribute("password", password);

		return "member/member_login";
	}

	@GetMapping("/member/member_center")
	public String center() {

		return "member/member_center";
	}
	

	@GetMapping("/member/member_edit")
	public String edit() {
		return "member/member_edit";
	}

	@GetMapping("/member/member_inquary")
	public String inquary() {
		return "member/member_inquary";
	}

	@GetMapping("/member/member_logout")
	public String logout() {
		return "member/member_logout";
	}

	@PostMapping("/member/register.do")
	public String register(HttpServletRequest request, HttpSession session) {
		final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%!^'\"]).{8,})";
		final String EMAIL_PATTERN = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$";
		final String PHONE_PATTERN = "[0-9]{10}";

		Pattern pattern = null;
		Matcher matcher = null;
		String account = "";
		String password = "";
		String name = "";
		String email = "";
		String gender = "";
		String phone_num = "";
		String birthday = "";

		account = request.getParameter("account");
		password = request.getParameter("password");
		name = request.getParameter("name");
		email = request.getParameter("email");
		gender = request.getParameter("gender");
		phone_num = request.getParameter("phone_num");
		birthday = request.getParameter("birthday");

		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要
		// session物件來存放共用資料。

		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		if (account == null || account.trim().length() == 0) {
			errorMsg.put("errorIdEmpty", "帳號欄必須輸入");
		}
		if (password == null || password.trim().length() == 0) {
			errorMsg.put("errorPasswordEmpty", "密碼欄必須輸入");
		}
		if (name == null || name.trim().length() == 0) {
			errorMsg.put("errorNameEmpty", "姓名欄必須輸入");
		}
		if (email == null || email.trim().length() == 0) {
			errorMsg.put("errorEmailEmpty", "電子郵件欄必須輸入");
		}
		if (gender == null || gender.trim().length() == 0) {
			errorMsg.put("errorGenderEmpty", "性別欄必須輸入");
		}
		if (phone_num == null || phone_num.trim().length() == 0) {
			errorMsg.put("errorPhoneEmpty", "電話欄必須輸入");
		}
		if (birthday == null || birthday.trim().length() == 0) {
			errorMsg.put("errorBirthdayEmpty", "生日欄必須輸入");
		}

		if (errorMsg.isEmpty()) {
			pattern = Pattern.compile(PASSWORD_PATTERN);
			matcher = pattern.matcher(password);
			if (!matcher.matches()) {
				errorMsg.put("passwordError", "密碼至少含有一個大寫字母、小寫字母、數字與!@#$%!^'\"等四組資料組合而成，且長度不能小於八個字元");
			}

			pattern = Pattern.compile(EMAIL_PATTERN);
			matcher = pattern.matcher(email);
			if (!matcher.matches()) {
				errorMsg.put("emailError", "信箱格式錯誤");
			}

			pattern = Pattern.compile(PHONE_PATTERN);
			matcher = pattern.matcher(phone_num);
			if (!matcher.matches()) {
				errorMsg.put("phoneError", "手機格式錯誤");
			}
		}

		if (!errorMsg.isEmpty()) {

			return "member/member_register";
		}

		try {
			if (service.idExists(account)) {
				errorMsg.put("errorIdDup", "此帳號已存在，請換新帳號");
			} else if (service.emailExists(email)) {
				errorMsg.put("errorEmailDup", "此信箱已被註冊，請換新信箱");
			} else {
				password = GlobalService.getMD5Endocing(GlobalService.encryptString(password));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
				try {
					birthday = sdf.format(sdf1.parse(birthday));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				MemberBean mb = new MemberBean(account, password, name, phone_num, email, null, Date.valueOf(birthday),
						gender, null, null, null, null);

				int n = service.saveMember(mb);
				if (n == 1) {
					return "redirect:/index";
				} else {
					errorMsg.put("errorIdDup", "新增此筆資料有誤(RegisterServlet)");
				}

			}

			if (!errorMsg.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
//				System.out.println("log:errorMsg not empty!!!!!");
				return "member/member_register";
			}

		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorIdDup", e.getMessage());

			return "member/member_register";
		}

		return "member/member_register";

	}

	@PostMapping("/member/login.do")
	public String login(@RequestParam("account") String userId, @RequestParam("password") String password,
			@RequestParam(value = "rememberMe", defaultValue = "false") String rm, HttpSession session,
			HttpServletResponse response, Model model) {
		Map<String, String> errorMsgMap = new HashMap<String, String>();

		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		model.addAttribute("ErrorMsgKey", errorMsgMap);
		// 1. 讀取使用者輸入資料
		String servletPath = (String) session.getAttribute("servletPath");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		// 如果 userId 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		// 如果 password 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}

		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (!errorMsgMap.isEmpty()) {

			return "member/member_login";
		}

		// **********Remember Me****************************
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (rm != null) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookieUser.setPath(sc.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(sc.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(sc.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(sc.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(sc.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(sc.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		// ********************************************

		// 4. 進行 Business Logic 運算
		// 將MemberServiceImpl類別new為物件，存放物件參考的變數為 loginService

		// 將密碼加密兩次，以便與存放在表格內的密碼比對
		password = GlobalService.getMD5Endocing(GlobalService.encryptString(password));
		MemberBean mb = null;
		try {
			// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
			mb = service.checkIdPassword(userId, password);
			if (mb != null) {
				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				session.setAttribute("LoginOK", mb);
			} else {
				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
		} catch (RuntimeException ex) {
			errorMsgMap.put("LoginError", ex.getMessage());
		}

		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			if (servletPath != null) {
				servletPath = (servletPath.length() == 0 ? "/" : servletPath);

				return "redirect:" + servletPath;
			} else {

				return "redirect:/index";
			}
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp

			return "member/member_login";
		}
	}

	@PostMapping("/member/edit.do")
	public String edit(@RequestParam("nickname") String nickname, @RequestParam("income") String income,
			@RequestParam("education") String education, @RequestParam("city") String city, HttpSession session) {

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		mb.setNickname(nickname);
		mb.setIncome(income);
		mb.setEducation(education);
		mb.setCity(city);
		service.updateMember(mb);

		return "member/member_center";

	}

	@PostMapping("/member/changePassword.do")
	public String changePw(@RequestParam("password") String password, @RequestParam("newpassword") String newpassword,
			@RequestParam("newpassword2") String newpassword2, HttpSession session, Model model) {
		Map<String, String> errorMsg = new HashMap<String, String>();

		model.addAttribute("MsgMap", errorMsg);

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		password = GlobalService.getMD5Endocing(GlobalService.encryptString(password));
		if (!password.equals(mb.getM_password())) {
			errorMsg.put("pwError", "密碼錯誤");
		}

		if (!newpassword.equals(newpassword2)) {
			errorMsg.put("newPwError", "新密碼不一致");

		}

		if (!errorMsg.isEmpty()) {

			return "member/member_edit";
		}

		newpassword = GlobalService.getMD5Endocing(GlobalService.encryptString(newpassword));
		mb.setM_password(newpassword);
		service.changePassword(mb);

		return "redirect:/member/member_center";
	}

	@PostMapping("/member/editPhoto.do")
	public String editPhoto(HttpSession session, HttpServletRequest request) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		String imgname = "";
		String imgpath = "";
		Blob m_img = null;

		imgname = request.getParameter("m_img");
		imgpath = "/images/common/" + imgname + ".jpg";
		System.out.println(imgpath);

		try {
			m_img = GlobalService.fileToBlob(sc.getResourceAsStream(imgpath),
					sc.getResourceAsStream(imgpath).available());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		mb.setM_img(m_img);
		service.updateM_img(mb);

		return "redirect:/member/member_edit";
	}

	@GetMapping("/init/getMemberImage")
	@ResponseBody
	public void retrieveMemberImage(HttpServletRequest request, HttpServletResponse response) {
		OutputStream os = null;
		InputStream is = null;
		String fileName = null;
		String mimeType = null;
		Blob blob = null;
		try {
			// 讀取瀏覽器傳送來的主鍵
			String id = request.getParameter("id");
			// 讀取瀏覽器傳送來的type，以分辨要處理哪個表格

			MemberBean bean = service.queryMember(id);
			if (bean != null) {
				blob = bean.getM_img();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getName();
			}

			if (is == null) {
				fileName = "membephoto_0.png";
				is = sc.getResourceAsStream("/images/common/" + fileName);
			}

			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = sc.getMimeType(fileName);
			// 設定輸出資料的MIME型態
			response.setContentType(mimeType);
			// 取得能寫出非文字資料的OutputStream物件
			os = response.getOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
				if (os != null)
					os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	@PostMapping("/member/forgetPW.do")
	@ResponseBody
	public void checkEmail(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		response.setContentType("application/json; charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {
			if (email == null || email.trim().length() == 0) {
				out.println(false);

			} else {
				if (service.emailExists(email)) {
					String newPW = GlobalService.getRandomPassword();
					service.updatePassword(email, GlobalService.getMD5Endocing(GlobalService.encryptString(newPW)));

					service.sendMail(email, newPW);
					out.println(true);
					out.close();

				} else {
					out.println(false);

				}

			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@PostMapping("/member/getCardList.do")
	@ResponseBody
	public void getCardlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String bank = request.getParameter("bank");
		List<CardBean> list = cardservice.getCardsByBank(bank);
		List<String> cardname = new ArrayList<String>();
		for(CardBean c : list) {
			cardname.add(c.getC_name());
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String cardJson = new Gson().toJson(cardname);
		out.write(cardJson);
		out.flush();

	}
	
	@PostMapping("/member/addCard.do")
	@ResponseBody
	public void addCard(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String cardname = request.getParameter("cardname");
		CardBean cb = cardservice.getCard(cardname);
		String mId = ((MemberBean)session.getAttribute("LoginOK")).getM_id();
		
		service.addMyCard(cb, mId);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String cardJson = new Gson().toJson(cb);
		System.out.println(cardJson);
		out.write(cardJson);
		out.flush();
		
		
	}

	@ModelAttribute("banks")
	public List<String> getAllBank() {
		List<String> list = cardservice.getAllBank();
		return list;
	}

}
