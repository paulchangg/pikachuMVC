package com.pikachuMVC.filter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pikachuMVC.model.MemberBean;



// 每個請求送達Server端時，都由本過濾器來檢查該請求所要求的資源是否需要登入才能使用。
// 檢查的邏輯為：
// 判斷該請求所要求的資源是否需要登入才能使用， 
// 如果需要登入
//		判斷是否已經登入，
//		如果已經登入，
//			可以使用該資源
//		否則要求他登入
// 否則
//		可以使用該資源
// 所有需要登入才能使用的資源都以『前置路徑的對應關係』定義在本過濾器的起始參數。經由過濾器的init()
// 方法讀入，放入List型別的實例變數 url 內。
@WebFilter(
//		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "mustLogin1", value = "/shopping/*"), 
				@WebInitParam(name = "mustLogin2", value = "/member/member_edit"), 
				@WebInitParam(name = "mustLogin3", value = "/member/member_center"), 
				@WebInitParam(name = "mustLogin4", value = "/member/member_inquary"), 
//				@WebInitParam(name = "mustLogin3", value = "/_05_orderProcess/*"),
//				@WebInitParam(name = "mustLogin4", value = "/_20_productMaintain/*")				
		})
public class LoginCheckingFilter implements Filter {
	List<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	
	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();

			if (mustLogin()) {           
				if (checkLogin(req)) {   
					//  需要登入，但已經登入
					chain.doFilter(request, response);
				} else {				
					//  需要登入，尚未登入，所以送回登入畫面
					HttpSession session = req.getSession();
				    
					//判斷是否使用已逾時，如果否
					if ( ! isRequestedSessionIdValid ) {
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					} else {
						// 記住原本的"requestURI"，稍後如果登入成功，系統可以自動轉入
						// 原本要執行的程式。
						session.setAttribute("servletPath", servletPath);	
					}
					resp.sendRedirect( contextPath + "/member/member_login");
					return;
				}
			} else {   //不需要登入，直接去執行他要執行的程式
				chain.doFilter(request, response);
				resp.setHeader("Cache-Control", "no-cache");

				// 通知瀏覽器絕對不要將本網頁儲存在快取區內
				resp.setHeader("Cache-Control", "no-store");

				// Causes the proxy cache to see the page as "stale",
				// 0 表示該網頁的有效期限為  1970/01/01 00:00:00 GMT，若現在時間超過它，就不能再使用
				// 快取出內的網頁
				resp.setDateHeader("Expires", 0);

				// 為了與 HTTP 1.0 相容，加入此回應標頭 
				resp.setHeader("Pragma", "no-cache");
			}
		} else {
			throw new ServletException("Request/Response 型態錯誤(極不可能發生)");
		}
	}
	// 判斷Session物件內是否含有識別字串為LoginOK的屬性物件，如果有，表示已經登入，否則尚未登入
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}

	// 如果請求的ServletPath的前導字是以某個必須登入才能使用之資源的路徑，那就必須登入。
	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				sURL = sURL.substring(0, sURL.length() - 1); // 除去掉最後一個字元的剩餘字串
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}
	@Override
	public void destroy() {
	}
}