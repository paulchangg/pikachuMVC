package com.pikachuMVC.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.model.OrderItemBean;
import com.pikachuMVC.model.OrdersBean;
import com.pikachuMVC.model.ProductBean;
import com.pikachuMVC.model.ShoppingCart;
import com.pikachuMVC.service.OrderService;
import com.pikachuMVC.service.ProductService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
public ShoppingController() {}
	
	@Autowired
	ProductService service;
	
	@Autowired
	ServletContext context ;
	
	@Autowired
	OrderService orderService;

	int pageNo = 1;
	int id = 1;
	int priceMode = 0;
	static int modeState = 0;
	
	@PostMapping("/UpdateItem")
	public String UpdateItem(HttpServletRequest request, Model model, HttpSession session) {
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "index.jsp";
        }
		
		
		String cmd = request.getParameter("cmd");
		String bookIdStr = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookIdStr.trim());		
		if (cmd.equalsIgnoreCase("DEL")) {
	        sc.deleteBook(bookId); // 刪除購物車內的某項商品
	        return "shopping/showShoppingCart";	
		} else if (cmd.equalsIgnoreCase("MOD")) {
			String newQtyStr = request.getParameter("newQty");
			int newQty = Integer.parseInt(newQtyStr.trim());
			sc.modifyQty(bookId, newQty);   // 修改某項商品的數項
			return "shopping/showShoppingCart";		
		}
		
		return "shopping/showShoppingCart";	
			
	}
	
	@PostMapping("/buyProduct")
	public String buyProduct(HttpServletRequest request, Model model, HttpSession session) {
		
		ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
		
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart);   
		}
		
		
		String productIdStr 	= request.getParameter("productId");
		int productId          = Integer.parseInt(productIdStr.trim());
		String qtyStr 		= request.getParameter("qty");
		Integer qty = 0 ;


		Map<Integer, ProductBean> productMap = (Map<Integer, ProductBean>) session.getAttribute("products_DPP");
		ProductBean bean = productMap.get(productId);
		String pageNo 		= request.getParameter("pageNo");
		if (pageNo == null || pageNo.trim().length() == 0){
			pageNo = (String) session.getAttribute("pageNo") ;
			if (pageNo == null){
			   pageNo = "1";
			} 
		} 
		
		try{
			// 進行資料型態的轉換
			qty = Integer.parseInt(qtyStr.trim());
		} catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		
		// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
		OrderItemBean oib = new  OrderItemBean(null,bean.getP_id(),bean.getPrice(),qty,bean.getP_name());
		// 將OrderItem物件內加入ShoppingCart的物件內
		cart.addToCart(productId, oib);
	
			return "shopping/shopping";
		
	}
	
	@GetMapping("/listProduct")
	public String listProduct(HttpServletRequest request, Model model, HttpSession session) {	
		String pageNoStr = request.getParameter("pageNo");
		String mode = request.getParameter("mode");
		String productId = request.getParameter("productId");
		String price = request.getParameter("priceMode");
		
		if( productId == null ) {
			id = 1;
		}else {
			try {
				id = Integer.parseInt(productId.trim());
			} catch (NumberFormatException e) {
				id = 1;
			}
		}
		
		if( price == null ) {
			priceMode = modeState;
		}else {
			try {
				priceMode = Integer.parseInt(price.trim());
				modeState = priceMode;
			} catch (NumberFormatException e) {
				priceMode = 0;
			}
		}
		
		if(mode != null) {
			mode = "show";
		}
		
		
		
		if( pageNoStr == null ) {
			pageNo = 1;
		}else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		
		Map<Integer, ProductBean> productMap = null;
		
		
		if(priceMode == 1) {
			productMap = service.getProductDescPrice(pageNo);
		}else if(priceMode == 2) {
			productMap = service.getProductAscPrice(pageNo);
		}else {
			productMap = service.getProduct(pageNo);
		}
		
		ProductBean pb = service.getSelectBook(id);
		request.setAttribute("totalPages", service.getTotalPages());
		request.setAttribute("mode", mode);
		session.setAttribute("modeState", modeState);
		session.setAttribute("product_INFO", pb);
		session.setAttribute("pageNo", String.valueOf(pageNo));
		session.setAttribute("products_DPP", productMap);
		if( mode == "show") {
			return "shopping/shopping_produce";
		}else {
			return "shopping/shopping";			
		}
		
	}
	
	@GetMapping("/getPicture/{productId}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable  Integer productId) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ProductBean bean = service.getSelectBook(productId);
		if (bean != null) {
			Blob blob = bean.getP_img();
			filename = bean.getP_img_name();
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
	
	
	@PostMapping("/ProcessOrder")
	public String ProcessOrder(HttpServletRequest request, Model model, HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) {
			return "index";
		}
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "index";
		}
		
		String memberId = mb.getM_id();   						// 取出會員代號
		double totalAmount = Math.round(sc.getSubtotal());  	// 計算訂單總金額 
		String shippingAddress = request.getParameter("ShippingAddress");  // 出貨地址
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		
		Map<Integer, OrderItemBean> content = sc.getContent();
		OrdersBean ob = new OrdersBean(null,memberId,sdf.format(today),totalAmount,null);		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for(Integer i : set) {
			OrderItemBean oib = content.get(i);
			oib.setOrdersBean(ob);
			items.add(content.get(i));
		}
		ob.setItems(items);
		try {
			orderService.persistOrder(ob);
			session.setAttribute("Orders", ob);
			session.removeAttribute("ShoppingCart");
			return "shopping/showShoppingCart2";
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			
			System.out.println(message);
			session.setAttribute("OrderErrorMessage", "處理訂單時發生異常: " + message  + "，請調正訂單內容" );
			return "shopping/showShoppingCart";
		}
	}
	
	@GetMapping("/orderList")
	public String orderList(HttpServletRequest request, Model model, HttpSession session){
		String pageNoStr = request.getParameter("pageNo");
		
		if( pageNoStr == null ) {
			pageNo = 1;
		}else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String m_id = mb.getM_id();
		
		List<OrdersBean> memberOrders = orderService.getMemberOrders(mb.getM_id(),pageNo);
		session.setAttribute("memberOrders", memberOrders);
		session.setAttribute("totalPages", orderService.getTotalPages(m_id));
		session.setAttribute("pageNo", pageNo);
		return "/shopping/orderQuery";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(HttpServletRequest request, Model model, HttpSession session) {
		String orderNo = request.getParameter("orderNo");
		int no = Integer.parseInt(orderNo.trim());
		OrdersBean ob = orderService.getOrder(no);
		request.setAttribute("OrderBean", ob);   // 將OrderBean物件暫存到請求物件內
		return "/shopping/orderItem";
	}
	
	@PostMapping("/addtrackproduct")
	public String addTrackproduct(HttpServletRequest request, Model model, HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		String productIdStr 	= request.getParameter("productId");
		int productId          = Integer.parseInt(productIdStr.trim());
		


		Map<Integer, ProductBean> productMap = (Map<Integer, ProductBean>) session.getAttribute("products_DPP");
		ProductBean bean = productMap.get(productId);
		
		
		service.saveTrackProduct(mb, productId);
		
		return "redirect:/shopping/listProduct?mode=show&productId="+bean.getP_id();
	}
	
	@GetMapping("/listtrackproduct")
	public String listTrackproduct(HttpServletRequest request, Model model, HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		
		
		Set<ProductBean> beans = service.listTrackProduct(mb) ;
		
		session.setAttribute("trackProduct", beans);
		
		
		return	"/shopping/track";
	}
	
	@GetMapping("/queryProduct")
	@ResponseBody
	public void queryProduct(HttpServletResponse response,HttpServletRequest request) {
		System.out.println("4777777777777777777777777777777");
		String p_name = request.getParameter("p");
		System.out.println(p_name);
		response.setContentType("application/json; charset=utf-8");
		try(
				PrintWriter out = response.getWriter();
		){
			List<String> list = service.getProducts_name(p_name);
			System.out.println(list.get(0));
			String categoriesJson = new Gson().toJson(list);
			System.out.println(list.get(0));
			out.write(categoriesJson);
			out.flush();
		}catch(Exception e) {
			
		}
	}
	
	@GetMapping("/ShoppingCart")
	public String shoppingCart() {
		return "shopping/showShoppingCart";
					
	}

}
