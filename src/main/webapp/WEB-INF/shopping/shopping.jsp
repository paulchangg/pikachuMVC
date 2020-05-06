<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/shopping.css" rel="stylesheet"type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="css/common/wickedcss.min.css"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<title>購物商城首頁</title>
</head>
<body>
	<!----------------------load區塊------------------------------>

	<div class="flex-container">
		<!----------------------head區塊------------------------------>
		<div class="header">
			${LoginOK.m_id}皮卡丘商標位置<!--這裡開始為上方,呈現商標log位置-->
		   <div class="row justify-content-end"> 
				<div class="col-4">    <!---------logo區塊----------->
				   <img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
			   </div>
			   <div class="col-4">     <!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
						<div class="col-3">
							<a href="../member/member_login.jsp">
							  <i class="fa fa-user-circle" id="memberlogin">會員登入</i>
							</a>
					   </div>
						 <div class="col-3">
							 <a href="http://127.0.0.1:5500/web/login.html">
							  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-3"> 
							 <a href="#">
							  <i class="fa fa-question-circle" id="qanda">Q & A</i>
							</a>
					   </div>
					   <div class="col-3">
							<a href="<c:url value='/shopping/ShoppingCart' />">
							  <i class="fa fa-shopping-cart" id="shoppingcart">shopping cart</i>
						   </a>
					   </div>
				   </div>
			   </div>
		   </div>
	   </div>
		<!-- 導覽列--------------------------->
	   <section class="top_navi">
		   <nav>
			   <a href="<c:url value="/shopping/orderList" />" >查詢訂單</a>
		       <a href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>

       <!-- 購物商城標題--------------------------->
	   <div class="shopping">
		     <h2>購物商城</h3>
	   </div>

	   <div class="center "><!--輪播圖區塊包覆的開始-->
		    <div id="advarea" class="carousel slide" data-ride="carousel">
		       <ol class="carousel-indicators"><!--導引連結區-->
			    <li data-target="#advarea" data-slide-to="0" class="active"></li> <!--廣告數量,位置由0開始計算-->
			    <li data-target="#advarea" data-slide-to="1"></li>
			   <li data-target="#advarea" data-slide-to="2"></li>
		       </ol>
		       <div class="carousel-inner" ><!--輪播圖片顯示區-->
				<div class="carousel-item active"><!--輪播圖片項目區-->
					<img class="d-block w-100" src="image/400寬-1.jpg" alt="Photo1">
				</div>
				<div class="carousel-item">
				   <img class="d-block w-100" src="image/400寬-2.jpg" alt="Photo2">
				</div>
			   <div class="carousel-item">
				   <img class="d-block w-100 " src="image/400寬-3.jpg"  alt="Photo3">
			   </div>
		     </div>
			    <a class="carousel-control-prev" href="#advarea" role="button" data-slide="prev"><!--向前切換-->
			      <span class="carousel-control-prev-icon"></span>
			   </a>
			   <a class="carousel-control-next" href="#advarea" role="button" data-slide="next"><!--向後切換-->
			     <span class="carousel-control-next-icon"></span>
			 </a>
		  </div>
	   </div>

	 <div class="col-12 hottitle"><h2>本月熱賣品</h2></div>

	 <div class="row sider">
		   <div class="col-2 sidderrone"><!--左邊選單-->
			  <p><a href=""> <button type="button" class="sidderBtn">本月熱賣品</button></a></p>
			  <p><a href=""> <button type="button" class="sidderBtn">吃貨歡樂劵</button></a></p>
			  <p><a href=""> <button type="button" class="sidderBtn">放鬆娛樂劵</button></a></p>
			  <p><a href=""> <button type="button" class="sidderBtn">外出旅遊券</button></a></p>
		   </div>
		   <div class="col-10 sidderr2 "><!--中間商品-->
			   <div class="row sreach" id="shopping_totalsearch">
			       <div class="col-5 dropdown" id="shopping_dropdown"><!--右邊下拉式選單-->
				      <c:choose>
					      <c:when test="${modeState == 0}">
						     <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">上市日期(舊到新)</button>
							   <div class="dropdown-menu">
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
							 </div>
					    </c:when>
					    <c:when test="${modeState == 1}">
						     <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格高到低</button>
							  <div class="dropdown-menu">
							     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
							     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
							     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
							  </div>
					    </c:when>
					     <c:when test="${modeState == 2}">
						     <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格低到高</button>
							    <div class="dropdown-menu">
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
							      <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
							  </div>
					    </c:when>
				      </c:choose>
				   </div>
			        <div class="col-4 input-group"><!--搜尋關鍵字id-->
						 <input type="text" name="keywords" id="shopping_keywords" class="form-control col-8" placeholder="商品關鍵字" onkeyup="a()">
						<div class="input-group-append">
						   <button class="btn btn-default" type="submit">搜尋</button>
					   </div>
			       </div>
				</div>
				
			 
				<div class="producepoho mt-2"><!--商品圖呈現區塊-->
					<div class="row">
					<c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
					   <div class="col-md-6 col-lg-4 mb-2"> <!--商品1-->
							<div class="card">               <!--這個id是要連結到這個商品的頁面-->
								<a href="<c:url value='/shopping/listProduct?mode=show&productId=${entry.value.p_id}' />" id="shopping_page"><img style="width:452.08px;height: 300.55px;" class="card-img-top" src="<c:url value='/shopping/getPicture/${entry.value.p_id}' />" alt="歡樂旅遊劵不要對我尖叫"></a>
								 <div class="card-body">
								 	   <FORM  action="<c:url value='/shopping/buyProduct'/>" method="POST">
									      <h5 class="card-title"><span id="shopping_producename">${entry.value.p_name}</span></h5>
									      <p class="card-text">售價<span id="shopping_price">${entry.value.price}</span></p>
									      <Input type='hidden' name='qty' value='1'>
								          <Input type='hidden' name='productId' value='${entry.value.p_id}'>
									      <Input type='hidden' name='pageNo' value='${pageNo}'>
										  <Input type='submit' class="btn btn-info test" data-toggle="modal" data-target="#shoopingmodal"  value='購買'>
								     </FORM>
							    </div>
						   </div>
						</div>  <!---以下商品只是呈現這頁最多只能放8個商品 所以都不放id以第一個商品為主-->
					</c:forEach>    
				   </div>
			   </div> 
	     </div>
	 </div>	  
	      <div class="return" > <!--底部分頁-->	
			<ul class="pagination pagination-sm">
				<c:choose>
					<c:when test="${pageNo == 1}">
						  <li class="page-item"> 
							  <a class="page-link"  aria-label="Previous">
							   <span aria-hidden="true">&laquo;</span> 
						   </a>
						 </li>
					</c:when>
					<c:otherwise>
					   <li class="page-item"> 
						   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=1' />" aria-label="Previous">
							   <span aria-hidden="true">&laquo;</span> 
						   </a>
					   </li>
					</c:otherwise>
				</c:choose>
			   <c:forEach begin="1" end="${totalPages}" varStatus="vs">
				   <c:choose>
					   <c:when test="${pageNo == vs.index}">
						   <li class="page-item">
							   <a class="page-link"  id="shopping_pag1">${vs.index}</a>
						   </li>
					   </c:when>
					   <c:otherwise>
						   <li class="page-item">
							   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
						   </li>
					   </c:otherwise>
				   </c:choose>
			   </c:forEach>
			   <c:choose>
					<c:when test="${pageNo != totalPages}">
						  <li class="page-item"> 
						   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${totalPages}' />" aria-label="Previous">
							   <span aria-hidden="true">&raquo;</span> 
						   </a>
					   </li>
					</c:when>
					<c:otherwise>
					   <li class="page-item"> 
						   <a class="page-link" aria-label="Previous">
							   <span aria-hidden="true">&raquo;</span> 
						   </a>
					   </li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>


	   <!--尾巴區塊-->
	   <div class="site_footer">
		   <div class="gotop">
		      <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
	     </div>
	 </div>
	 
	 
        <!--這區塊是跳出視窗加入購物車視窗-->    
<!--             <div class="modal fade" id="shoopingmodal"> -->
<!--                 <div class="modal-dialog"> -->
<!--                   <div class="modal-content"> -->
<!--                     <div class="modal-body"> -->
<!--                       <p>商品已加入購物車</p> -->
<!--                        <button type="button" class="btn btn-default" data-dismiss="modal">確認</button> -->
<!--                    	</div> -->
<!--                   </div> -->
<!--              	</div> -->
<!--          	</div> -->
 </div>   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"></script>
<script src="js/shopping.js"></script>
<script type="text/javascript">
function a() {
	// SELECT標籤
	var words = document.getElementById("shopping_keywords");
	var xhr = new XMLHttpRequest();
	var url = "queryProduct?q=" + words.value;
	console.log(words.value)
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		// 向伺服器提出的請求已經收到回應
		if (xhr.readyState === 4) {
			// 伺服器回應成功
			if (xhr.status === 200) {
				var books = JSON.parse(xhr.responseText);
				cosole.log(books);
			}
		}
	}	
	
}

</script>
</body>
</html>