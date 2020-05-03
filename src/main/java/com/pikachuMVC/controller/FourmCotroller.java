package com.pikachuMVC.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import com.pikachuMVC.model.LaunchActivityBean;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.ResponserBean;
import com.pikachuMVC.service.FourmService;
import com.pikachuMVC.service.MemberService;

import init.GlobalService;

@Controller
@RequestMapping("/fourm")
public class FourmCotroller {
	
	
	
	@Autowired
	FourmService service;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext context ;
	
	@GetMapping("/listforum")
	public String listForum(HttpServletRequest request,HttpSession session) {
		
		MemberBean m = (MemberBean)session.getAttribute("LoginOK");
		
		MemberBean mb = memberService.queryMember(m.getM_id());
		
		Set<LaunchActivityBean> trackBeans = mb.getTrackLaunchActivity();
		
		List<Integer> trackArticle_responserCount = new ArrayList<Integer>();
		
		List<String> trackArticle_content = new ArrayList<String>();
		
		List<LaunchActivityBean> beans = service.listFourm();
		
		Map<Integer,Integer> responserCount = new HashMap<Integer, Integer>();
		
		
		
		List<String> article_content = new ArrayList<String>();
		
		
		for(  LaunchActivityBean b : trackBeans) {
			trackArticle_responserCount.add(b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				trackArticle_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				trackArticle_content.add(b.getArticle_content().substring(0,10));
			}
		}
		
		
		
		for(LaunchActivityBean b : beans) {
			responserCount.put(b.getArticle_Id(), b.getActivitys().size());
			if(b.getArticle_content().length() < 10) {
				article_content.add(b.getArticle_content().substring(0, b.getArticle_content().length()));
			}else {
				article_content.add(b.getArticle_content().substring(0,10));
			}		
		}
		
		
		session.setAttribute("trackBeans", trackBeans);
		
		session.setAttribute("trackArticle_responserCount", trackArticle_responserCount);

		session.setAttribute("trackArticle_content", trackArticle_content);
		
		session.setAttribute("article_content", article_content);
		
		session.setAttribute("responserCount", responserCount);
		
		session.setAttribute("LaunchActivityBean", beans);
		
		return "fourm/ForumServlet";
	}
	
	@PostMapping("/listforum")
	public String addForum(HttpServletRequest request,@RequestParam("imageFile") MultipartFile imageFile, HttpSession session) throws IllegalStateException, IOException, SQLException {
		String filePathPrefix = null;
		LaunchActivityBean bean = null;
		String fileName = imageFile.getOriginalFilename();
		int forum;
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		if (!imageFile.isEmpty()) {

			filePathPrefix = session.getServletContext().getRealPath("./");
			
			File dir = new File(filePathPrefix, "/static/uploads/" + fileName); 
			
			if (!dir.exists()) {
				dir.mkdirs();
			}else {
				 System.out.println("创建目录" + filePathPrefix + "/static/uploads/" + fileName + "失败！"); 
			}

			imageFile.transferTo(new File(filePathPrefix, "/static/uploads/" + fileName));
			
			Blob img = GlobalService.fileToBlob(filePathPrefix +  "/static/uploads/" + fileName);

			session.setAttribute("imagepath", "/static/uploads/" + fileName);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date today = new Date();   									// 新增訂單的時間

			String article_title = request.getParameter("article_title");
			String select_fourm = request.getParameter("select_fourm");
			String text = request.getParameter("text");
			
			bean = new LaunchActivityBean(null, mb, article_title,text, img, null, sdf.format(today), 0, fileName, null,null,mb.getM_id());
			
			try {
				forum = Integer.valueOf(text);
			}catch(Exception e) {
				forum = 1;
			}
			
			service.addFourm(forum, bean);
			
			return "redirect:/fourm/listforum";

			}
		
		return "forum\\ForumServlet";
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
		LaunchActivityBean bean = service.getSelectLaunchActivity(articletId);
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
		System.out.println("mediaType =" + mediaType);
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
		
		LaunchActivityBean launchActivityBean =  service.getSelectLaunchActivity(activityId);
		
		session.setAttribute("launchActivityBean", launchActivityBean);
		
		
		
		
		//取名要跟@GetMapping("/listforum")不一樣  不然session會因為同名蓋過
		
		List<ResponserBean>	beans =	service.getArticleResponse(activityId);
		
		
		
		
		session.setAttribute("responserBeans", beans);
		
		session.setAttribute("responserCount1", launchActivityBean.getActivitys().size());
		
		return "redirect:/fourm/reponseActivity";
	}
	
	@GetMapping("/reponseActivity")
	public String res() {
		
		
		
		return "fourm/Launch_activityServlet";
	}
	
	@PostMapping("/reponseActivity")
	public String addResponse(@RequestParam Integer article_Id,@RequestParam String m_id,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		
		String res_content = request.getParameter("content");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date today = new Date();
		
		
		ResponserBean bean = new ResponserBean(null, m_id, article_Id, res_content, null,sdf.format(today));
		
		service.saveResponse(bean);
		
		List<ResponserBean>	beans =	service.getArticleResponse(article_Id);
		
		LaunchActivityBean launchActivityBean =  service.getSelectLaunchActivity(article_Id);
		
		session.setAttribute("responserCount1", launchActivityBean.getActivitys().size());
		
		session.setAttribute("responserBeans", beans);
	
		
		return "redirect:/fourm/reponseActivity";
	}
	
	@PostMapping("/delete/{article_Id}")
	public String deleteArticle(@PathVariable Integer article_Id) {
		
		
		service.deleteArticle(article_Id);
		
		
		return "redirect:/fourm/listforum";
	}
	
	@PostMapping("/track/{article_Id}/{m_id}")
	public String trackArticle(@PathVariable Integer article_Id,@PathVariable String m_id) {
		
		
		service.saveTrackActivity(article_Id, m_id);
		
		return "redirect:/fourm/listforum";
	}
	
	@PostMapping("/deleteTrack/{article_Id}/{m_id}")
	public String deleteTrackArticle(@PathVariable Integer article_Id,@PathVariable String m_id) {
		
		service.deleteTrackActivity(article_Id, m_id);
		
		return "redirect:/fourm/listforum";
	}
	
	
}
