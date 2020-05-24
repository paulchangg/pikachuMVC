<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>優惠資訊網</title>
<link rel="stylesheet" type="text/css" href="css/slider-pro.css" media="screen"/>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/wickedcss.min.css"/>
<link rel="stylesheet" type="text/css" href="css/examples.css" media="screen"/>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.sliderPro.min.js"></script>
<script type="text/javascript" src="js/information.js"></script>
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/index.js"></script>
</head>
<body>
  <!-- 上方標題logo列----超連結待補----->
  <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <div class="row">
      <div class="col-sm">
        <span style="font-size: xx-large;">哪家的信用卡功能最丘？</span><br>
        <span style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </span>
      </div>
      <div class="row justify-content-around">
        <div class="col-sm">
          <a href="index copy.html">
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
             <c:choose>
				<c:when test="${empty LoginOK}">										
					<a class="nav-link" href="<c:url value="/member/member_login"/>" id="memberlogin" style="color: rgb(92, 41, 7);">會員登出</a>										
				</c:when>
				<c:otherwise>										
					<a class="nav-link" href="<c:url value="/member/member_logout"/>" id="memberlogout" style="color: rgb(92, 41, 7);">會員登出</a> 											
				</c:otherwise>
			 </c:choose>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="cardcompare" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/shopping/ShoppingCart' />" id="shoppingcart" style="color: rgb(92, 41, 7);">
            <i class="fas fa-shopping-cart"><span style="color:#FF5964" id="shoppingCartItem">${shoppingCart}</span> <!-- 加入購物車的商品數量 --></i>
         </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
   <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
    <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列  -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href='<c:url value="/news/lastestNews"/>'>資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

       <!-- 輪播圖區塊--------------------------->
	<div id="informationslider" class="slider-pro">
		<div class="sp-slides""><!--圖片開始區塊-->
		<c:forEach varStatus="stVar2"  var="cirnews"  items="${newslist2}" >
			<div class="sp-slide">
				<a href='<c:url  value="/news/NewsInfo?id=${cirnews.newsId}"/>' ><img class="sp-image" src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${cirnews.newsId}"  id="sliderimg1"></a>
			</div>
		</c:forEach>
		</div>

		<div class="sp-thumbnails"><!--文字內容區塊-->
		<c:forEach varStatus="stVar2"  var="cirnews2"  items="${newslist2}" >
			<div class="sp-thumbnail">
				<div class="sp-thumbnail-text">
				    <div class="sp-thumbnail-title"><span id="articaltitle">${cirnews2.title}</span></div>
				  </div>
			  </div>
		</c:forEach>
		</div>
	</div>
	
    <!-- 輪播圖區塊--------------------------->
	</div>		
    <div class="informationtext">
        <p>優惠訊息<p>
    </div>
    <img src="../news/image/定時更新.png" class="picktwoimage">
    <img src="../news/image/優惠比卡丘.png"  class="slideLeft pickoneimage">


       <!-- 顯示文章區塊--------------------------->
       <div class="bottomarea container">
		<div class="row">
		  <c:forEach varStatus="stVar"  var="entry"  items="${newslist}" >
		   <div class="col-6 downarticle">
		       <a href='<c:url  value="/news/NewsInfo?id=${entry.newsId}"/>'  target="_blank" id="ahrefstr"><img src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${entry.newsId}" class="articleimg"><!--以第一個為例-->
				 <h5><span id="strtitle">${entry.title}</span></h5>
			  </a>
		       <p><span id="strcontext">${entry.intro}</span>...</p>
		   </div>
		 </c:forEach>
		</div>	
		</div>	
<!-- 		<img src="C:/_JSP/workspaceJDBC_s/pikachuMVC/src/main/webapp/news/20200512/img/20200512/img/20200512-UCardu20200511175010.jpg"> -->
<!-- 		<img src="C:\_JSP\workspaceJDBC_s\pikachuMVC\src\main\webapp\news\20200512\img\20200512\img\20200512-UCardu20200511175010.jpg"> -->
<%-- 		<img src='<c:url  value="/news/20200512/img/20200512-UCardu20200511175010.jpg"/>'> --%>
<!-- 		<img src="20200512/img/20200512-UCardu20200511175010.jpg" > -->
    
		 <!-- 底部 ------>
     <div id="backtop" class="gotop" style="text-align: center !important; margin-top: 50px;">
      © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
    <div id="icons" >
      <ul>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-facebook"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-twitter"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-instagram"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-linkedin"></span>
        </li>
      </ul>
    </div> 

    <br />
    <button type="button" id="back_bt" class="btn btn-secondary">
      To the top
    </button>
    </div>
</body>
</html>