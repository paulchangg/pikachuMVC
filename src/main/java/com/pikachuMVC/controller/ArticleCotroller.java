package com.pikachuMVC.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.pikachuMVC.model.ArticleBean;
import com.pikachuMVC.model.ArticleResponserBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.service.ArticleService;
import com.pikachuMVC.service.MemberService;

import init.GlobalService;

@Controller
@RequestMapping("/articleForum")
public class ArticleCotroller {
	
	
	
	@Autowired
	ArticleService service;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext context ;
	
	int pageNo = 1;
	
	@GetMapping("/listforum")
	public String listForum(HttpServletRequest request,HttpSession session) {
		
		String pageNoStr = request.getParameter("pageNo");
		
		if( pageNoStr == null ) {
			pageNo = 1;
		}else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (Exception e) {
				pageNo = 1;
			}
		}
		
		MemberBean m = (MemberBean)session.getAttribute("LoginOK");
		
		MemberBean mb = memberService.queryMember(m.getM_id());
		
		Set<ArticleBean> trackBeans = mb.getTrackLaunchActivity();
		
		List<Integer> trackArticle_responserCount = new ArrayList<Integer>();
		
		List<String> trackArticle_content = new ArrayList<String>();
		
		List<ArticleBean> beans = service.listFourm(pageNo);
		
		List<Integer> responserCount1 = new ArrayList<Integer>();
		
		List<String> article_content = new ArrayList<String>();
		
		
		for(  ArticleBean b : trackBeans) {
			trackArticle_responserCount.add(b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				trackArticle_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				trackArticle_content.add(b.getArticle_content().substring(0,10));
			}
		}
		
		
		
		for(ArticleBean b : beans) {
			responserCount1.add(b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				article_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				article_content.add(b.getArticle_content().substring(0,10));
			}		
		}
		
		session.setAttribute("ArticleTotalPages", service.getTotalPages());
		
		session.setAttribute("ArticlepageNo", pageNo);
		
		session.setAttribute("trackBeans", trackBeans);
		
		session.setAttribute("trackArticle_responserCount", trackArticle_responserCount);

		session.setAttribute("trackArticle_content", trackArticle_content);
		
		session.setAttribute("article_content", article_content);
		
		session.setAttribute("responserCount", responserCount1);
		
		session.setAttribute("LaunchActivityBean", beans);
		
		return "articleForum/ForumServlet";
	}
	
	@PostMapping("/listforum")
	public String addForum(HttpServletRequest request,@RequestParam("imageFile") MultipartFile imageFile, HttpSession session) throws IllegalStateException, IOException, SQLException {
		String filePathPrefix = null;
		ArticleBean bean = null;
		String fileName = imageFile.getOriginalFilename();
		int forum;
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		if (!imageFile.isEmpty()) {

			filePathPrefix = session.getServletContext().getRealPath("./");
			
			File dir = new File(filePathPrefix, "\\static\\uploads\\" + fileName); 

			if (!dir.exists()) {
				dir.mkdirs();
			}else {
				 System.out.println("创建目录" + filePathPrefix + "\\static\\uploads\\" + fileName + "失败！"); 
			}

			imageFile.transferTo(new File(filePathPrefix, "\\static\\uploads\\" + fileName));
			
			Blob img = GlobalService.fileToBlob(filePathPrefix +  "\\static\\uploads\\" + fileName);

			session.setAttribute("imagepath", "\\static\\uploads\\" + fileName);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date today = new Date();   									// 新增訂單的時間

			String article_title = request.getParameter("article_title");
			String select_fourm = request.getParameter("select_fourm");
			String text = request.getParameter("text");
			
			bean = new ArticleBean(null, mb, article_title,text, img, null, sdf.format(today), 0, fileName, null,null,mb.getM_id());
			
			try {
				forum = Integer.valueOf(select_fourm);
			}catch(Exception e) {
				forum = 1;
			}
			
			service.addFourm(forum, bean);
			
			dir.delete();
			
			
			return "redirect:/articleForum/listforum";

			}
		
		return "articleForum/ForumServlet";
	}
	
	@GetMapping("/getPicture/{articletId}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable  Integer articletId) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ArticleBean bean = service.getSelectLaunchActivity(articletId);
		if (bean != null) {
			Blob blob = bean.getArticleImage();
			filename = bean.getArticleImage_Name();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);   
		MediaType mediaType = MediaType.valueOf(mimeType);
		
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = 
				new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	@GetMapping("/reponseActivity/{activityId}")
	public String reponseActivity(HttpServletRequest request,HttpSession session,@PathVariable Integer activityId) {
				
		
		
		
		service.addAllWatch(activityId);
		
		ArticleBean articleBean =  service.getSelectLaunchActivity(activityId);
		
		session.setAttribute("launchActivityBean", articleBean);
		
		
		
		
		//取名要跟@GetMapping("/listforum")不一樣  不然session會因為同名蓋過
		
		List<ArticleResponserBean>	beans =	service.getArticleResponse(activityId);
		
		
		
		
		session.setAttribute("responserBeans", beans);
		
		session.setAttribute("responserCount1", articleBean.getActivitys().size());
		
		return "redirect:/articleForum/reponseActivity";
	}
	
	@GetMapping("/reponseActivity")
	public String res() {
		
		
		
		return "articleForum/Launch_activityServlet";
	}
	
	@PostMapping("/reponseActivity")
	public String addResponse(@RequestParam Integer article_Id,@RequestParam String m_id,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		
		String res_content = request.getParameter("content");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date today = new Date();
		
		
		ArticleResponserBean bean = new ArticleResponserBean(null, m_id, article_Id, res_content, null,sdf.format(today));
		
		service.saveResponse(bean);
		
		List<ArticleResponserBean>	beans =	service.getArticleResponse(article_Id);
		
		ArticleBean articleBean =  service.getSelectLaunchActivity(article_Id);
		
		session.setAttribute("responserCount1", articleBean.getActivitys().size());
		
		session.setAttribute("responserBeans", beans);
	
		
		return "redirect:/articleForum/reponseActivity";
	}
	
	@PostMapping("/delete/{article_Id}")
	public String deleteArticle(@PathVariable Integer article_Id) {
		
		
		service.deleteArticle(article_Id);
		
		
		return "redirect:/articleForum/listforum";
	}
	
	@PostMapping("/track/{article_Id}/{m_id}")
	public String trackArticle(@PathVariable Integer article_Id,@PathVariable String m_id) {
		
		
		service.saveTrackActivity(article_Id, m_id);
		
		return "redirect:/articleForum/listforum";
	}
	
	@PostMapping("/deleteTrack/{article_Id}/{m_id}")
	public String deleteTrackArticle(@PathVariable Integer article_Id,@PathVariable String m_id) {
		
		service.deleteTrackActivity(article_Id, m_id);
		
		return "redirect:/articleForum/listforum";
	}
	
	@GetMapping("/allboards")
	public String listBoards() {
		
		return "articleForum/allboards";
	}
	
	@GetMapping("/listforum/{fourmName}")
	public String listDifferentforum(@PathVariable String fourmName,HttpServletRequest request,HttpSession session) {
		
		int recordPage = 10;
		
		int pageNo = 1;
		
		String listDifFourmPage = request.getParameter("listDifFourmPage");
		
		
		
		try {
			pageNo = Integer.parseInt(listDifFourmPage.trim());
		} catch (Exception e) {
			pageNo = 1;
		}
		
		MemberBean m = (MemberBean)session.getAttribute("LoginOK");
		
		MemberBean mb = memberService.queryMember(m.getM_id());
		
		Set<ArticleBean> trackBeans = mb.getTrackLaunchActivity();
		
		List<Integer> trackArticle_responserCount = new ArrayList<Integer>();
		
		List<String> trackArticle_content = new ArrayList<String>();
		
		List<ArticleBean> beans = service.listDifFourm(fourmName);
		
		int startRecordNo = (pageNo - 1) * recordPage;
		int count = 0;
		int count1 = 0;
		
		Set<ArticleBean> otherBeans = new LinkedHashSet<ArticleBean>();
		
		for(ArticleBean bean: beans) {
			
			if( count >= startRecordNo && count1 <=9) {
				otherBeans.add(bean);
				count1++;
			}
			
			count++;
			
		}
		
		int totalPage = (int)(Math.ceil(beans.size()/(double)recordPage));
		
		
		
		List<Integer> responserCount1 = new ArrayList<Integer>();
		
		List<String> article_content = new ArrayList<String>();
		
		
		for(  ArticleBean b : trackBeans) {
			trackArticle_responserCount.add(b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				trackArticle_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				trackArticle_content.add(b.getArticle_content().substring(0,10));
			}
		}
		
		
		
		for(ArticleBean b : otherBeans) {
			
			responserCount1.add(b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				article_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				article_content.add(b.getArticle_content().substring(0,10));
			}		
		}
		
		
		
		session.setAttribute("trackBeans", trackBeans);
		
		session.setAttribute("trackArticle_responserCount", trackArticle_responserCount);

		session.setAttribute("trackArticle_content", trackArticle_content);
		
		session.setAttribute("article_content_love", article_content);
		
		session.setAttribute("responserCount_love", responserCount1);
		
		session.setAttribute("LaunchActivityBean_love", otherBeans);
		
		session.setAttribute("fourmName", fourmName);
		
		session.setAttribute("listDifTotalPage", totalPage);
		
		
		session.setAttribute("listDifPage", pageNo);
		
		return "redirect:/articleForum/article_board";
	}
	
	@GetMapping("/article_board")
	public String article_board() {
		return "articleForum/article_board";
	}
	
	@PostMapping("/checkData")
	@ResponseBody
	public void check(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		String postArticle_fourm = request.getParameter("postArticle_fourm");
		String postArticle_title = request.getParameter("postArticle_title");
		String postArticle_content = request.getParameter("postArticle_content");
		String img = request.getParameter("imgSize");
		int imgSize = 0;
		Boolean check = true;
		Map<String,String> errorMsg = new HashMap<String, String>();
		
		
		
		
		
		try {
			imgSize = Integer.parseInt(img.trim());
		} catch (NumberFormatException e) {
			imgSize = 1;
		}
		
		
		
		
		
		try(
				PrintWriter out = response.getWriter();
		){		
			if ("4".equals(postArticle_fourm)) {
				errorMsg.put("postArticle_fourm", "請選擇看板");
				check = false;
			}else{
				errorMsg.put("postArticle_fourm", "");
				
			}
			
			if (postArticle_title == null || postArticle_title.trim().length() < 6) {
				errorMsg.put("postArticle_title", "標題需5個字以上");
				check = false;
			}else{
				errorMsg.put("postArticle_title", "");
				
			}
			
			if (postArticle_content == null || postArticle_content.trim().length() < 11) {
				errorMsg.put("postArticle_content", "內文需10個字以上");
				check = false;
			}else{
				errorMsg.put("postArticle_content", "");
				
			}
			
			if (imgSize == 0 ) {
				errorMsg.put("imgSize", "內文請附上一張圖");
				check = false;
			}else{
				errorMsg.put("imgSize", "");
			}
			
			errorMsg.put("check", ""+check);
			
			response.setContentType("application/json; charset=utf-8");
			String errorMessage = new Gson().toJson(errorMsg);
			out.write(errorMessage);
			out.flush();
		}catch(Exception e) {
			
		}
	}
}
