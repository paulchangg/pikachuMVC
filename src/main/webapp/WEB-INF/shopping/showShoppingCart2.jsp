<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/shopping_cart2.css" rel="stylesheet" type="text/css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/wickedcss.min.css">
    <title>完成訂購</title>
</head>
<body>
     <!-- 上方標題logo列----超連結待補----->
   <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <div class="row">
      <div class="col-sm">
        <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
        <p style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </p>
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
					<a href="<c:url value="/member/member_login"/>"> 
						<i class="fa fa-user-circle" id="memberlogin">會員登入</i>
					</a>								
				</c:when>
				<c:otherwise>								
					<a href="<c:url value="/member/member_logout"/>"> 
					<i class="fa fa-user-circle" id="memberlogout">會員登出</i>
					</a>								
				</c:otherwise>
			 </c:choose>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href='<c:url value="/shopping/orderList" />'  style="color: rgb(92, 41, 7);">查詢訂單</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href=href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
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
        <a class="et-hero-tab" href="#">關於我們</a>
        <a class="et-hero-tab" href="/cards/cradeitCb?qt=main">信用卡比較</a>
        <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
        <a class="et-hero-tab" href="<c:url value="/shopping/listProduct" />">商城</a>
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

        <!--這裡為步驟購物圖檔-->
		<div class="stepimg"><img src="../shopping/image/參考圖.png"></div>

	   <!--這裡為產生訂單編號區塊-->
	  <div class="wrap">
           <div class="ordernumberarea" >
             <p>${LoginOK.m_id}的訂單已成功送出</p>
     
             <p>您的訂單編號為:<span id="shoppingcart3_ordernumber">${Orders.ordid}</span>
                歡迎至訂單頁面查看您的電子票卷,謝謝</p>
            </div>
             <div class="return"> <!--返回區塊-->
             <a href="<c:url value='/' />"><button type="button" class="returnBtn">回首頁</button></a>
             <a href="<c:url value='/shopping/listProduct' />"><button type="button" class="returnBtn">繼續購物</button></a>
             <a href="<c:url value='/shopping/orderList' />"><button type="button" class="returnBtn">訂單查詢</button></a>
         </div>
	   </div>
      
     	<!-- 底部 ------>
		 <div id="backtop" class="gotop">
			<h4>
			  © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
			</h4>
			<div class="footer">
			  <ul> 
				<li>
					<span></span>
					<span></span>
					<span class="fab fa-facebook"></span>
				</li>
				<li>
					<span></span>
					<span></span>
					<span class="fab fa-twitter"></span>
				</li>
				<li>
					<span></span>
					<span></span>
					<span class="fab fa-instagram"></span>
				</li>
				<li>
					<span></span>
					<span></span>
					<span class="fab fa-linkedin"></span>
				</li>
			  </ul>  
			</div> 
			
			<br />
			<button type="button" id="back_bt" class="btn btn-secondary" >To the top</button>
		  </div>
	  <script src="js/jquery-3.4.1.js"></script>
		  <script src="js/popper.min.js"></script>
		  <script src="js/bootstrap.min.js"></script>
		  <script src="js/index.js"></script>
</body> 
</html> 