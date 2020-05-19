<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>修改個人資料</title>
     <link rel="stylesheet" href="../css/bootstrap.min.css">
	 <link href="../css/member_inquary.css" rel="stylesheet" type="text/css">
	 <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
     <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
	 <link rel="stylesheet" href="../css/wickedcss.min.css">
  </head>
   <body>
  <!-- 上方標題logo列----超連結待補----->
  <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <!-- <div class="container-fluid" style="height: 160px;background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);"> -->
    <!-- <div class="container-fluid" style="height: 160px;background-image: linear-gradient(to top, #f0f18f 25%, #f7a773 75%);"> -->

    <div class="row">
      <div class="col-sm">
        <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
        <p style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </p>
      </div>
      <div class="row justify-content-around">
        <div class="col-sm">
          <a href='<c:url value="/" />'>
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_logout" />' id="member_logout" style="color: rgb(92, 41, 7);">會員登出</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="cardcompare" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/shopping/listProduct" />' id="shoppingcart" style="color: rgb(92, 41, 7);">
              <i class="fas fa-shopping-cart"></i>
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
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>


    <!-- 會員框圖片 -->
	<div style="height:8rem"><img src="../images/查看.png" class="imageone"></div>

	<div class="middle">
	  <div class="wrap">
		  <div class="front "> <!--正面-->
			 <h3>
				 會員帳號ID:<span id="memberinquary_id">${LoginOK.m_id}</span>
			</h3>
			<div class="photo" id="memberinquary_img">
				<c:choose>
					<c:when test="${empty LoginOK.m_img}">
						<img src="../images/membephoto_0.png" width="160" height="160">
				   </c:when>
				  <c:otherwise>
					<img
						src='${pageContext.request.contextPath}/init/getMemberImage?id=${LoginOK.m_id}' width="160" height="160">
				  </c:otherwise>
			   </c:choose>
			</div>
		 </div>
		  <div class="back ">  <!--反面-->
			   <h2>詳細資訊</h2>
			 <div class="personaldata ">
				 姓名:<span id="memberinquary_name">${LoginOK.name}</span><br>
				 暱稱:<span id="memberinquary_nickname">${LoginOK.nickname}</span><br>
				<i class="fas fa-birthday-cake"></i>生日<span id="memberinquary_birthday">${LoginOK.birthday}</span><br>
				<i class="fas fa-mobile-alt"></i>手機:<span id="memberinquary_phone_num">${LoginOK.phone_num}</span><br>
				<i class="fas fa-envelope"></i>信箱:<span id="memberinquary_m_mail">${LoginOK.m_mail}</span><br>
				<i class="fas fa-child"></i>性別:<span id="memberinquary_gender">${LoginOK.gender}</span><br>
				<i class="far fa-money-bill-alt"></i>年收入:<span id="memberinquary_income">${LoginOK.income}<br>
				<i class="fas fa-graduation-cap"></i>最高學歷:<span id="memberinquary_education">${LoginOK.education}<br>
				<i class="far fa-building"></i>居住區:<span id="memberinquary_city">${LoginOK.city}
			</div>
		 </div>
	 </div> 
	</div>

	 <!--返回區塊-->
	 <div class="footerbutton">
		<a href="member_center"><input type="button" value="返回" id="Button2"></a>
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
    
	<script src="../js/jquery-3.4.1.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/inquaryindex2.js"></script><!-- 捲動時固定瀏覽器在上方的js-->
 </body>
</html>