<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>會員中心</title>
     <link rel="stylesheet" href="../css/bootstrap.min.css">
     <link href="../css/member_center.css" rel="stylesheet" type="text/css">
     <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
     <link rel="stylesheet" href="../css/wickedcss.min.css">
     <script src="../js/jquery-3.4.1.js"></script>
     <script src="../js/popper.min.js"></script>
     <script src="../js/bootstrap.min.js"></script>
     <script src="../js/index.js"></script><!-- 捲動時固定瀏覽器在上方的js-->
     <script src="../js/member_center.js"></script>   
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
        <a class="et-hero-tab" href='<c:url value="/news/lastestNews"/>'>資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>


    <img src="../images/比卡丘02.gif" class="pickuimggif">
   

     <!-- 中間區塊1 -->
	  <img src="../images/會員中心.png" class="pickuimgthree">
	  <div class="warp-center">

			<!-- 討論區管理 -->
		<div class="containerbb">
			    <p>  <i class='bx bx-message-square-edit'></i> 最近發表文章:<br>
	                 <a href="" target="blank"><span id="membercenter_article">信用卡好像辦不過</span></a><br>
					 <i class='bx bx-message-square-detail'></i> 累積發表文章數:<br>
					 <a href="" target="blank"><span id="membercenter_number">33</span></a>篇<br>
			         <i class='bx bx-message-square-dots' ></i>文章發表新回應:<br>
                     <a href="" target="blank"><span id="membercenter_answer">無</span></a><br>
				</p>
			<div class="coverbb">
				<div class="frontbb"><p>討論區手札</p>
				</div>
				<div class="backbb">
					<div class="human" id="MemberCenter-img">
						<!--顯示會員的圖像id-->
						<c:choose>
							<c:when test="${empty LoginOK.m_img}">
								<img src="../images/membephoto_0.png" width="160"
									height="160">
							</c:when>
							<c:otherwise>
								<img
									src='${pageContext.request.contextPath}/init/getMemberImage?id=${LoginOK.m_id}'
									width="160" height="160">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- 交友與活動 -->
		<div class="containercc">
			<p> 
				<i class='bx bx-donate-heart'></i><a href='<c:url value="/friends/pair" />' target="blank">前往交友配對區<br></a>
			    <i class='bx bxs-happy-heart-eyes'></i><a href='<c:url value="/friends/friendList" />' target="blank" id="membercenter_goodfr">好友列表</a><br>
                <i class='bx bx-walk'></i><a href="" target="blank">活動頁面區</a><br>
                <i class='bx bx-calendar'></i>最近發起活動:<br>
                <a href="" target="blank"><span id="membercenter_number">這周末去爬山</span></a><br>
			    <i class='bx bx-message' ></i>發起活動最新回應:<br>
			    <a href="" target="blank"><span id="membercenter_answer">無</span></a><br>
			</p>
		  <div class="covercc">
			<div class="frontcc"><p>交友與活動手札</p>
			</div>
			<div class="backcc">
				<p>請勿從事任何<br>
					違反善良風俗的行為呦~</p>
			</div>
		</div>
     </div>
     
     	<!-- 商城 -->
		<div class="containeree">
			<p>   
				<i class='bx bx-shopping-bag'></i><a href="" target="blank">訂單查詢</a><br>
			    <i class='bx bx-search'></i><a href="" target="blank">追蹤清單</a><br>
			    <i class='bx bx-help-circle'></i><a href="" target="blank">聯絡客服</a><br>
		 <div class="coveree">
			<div class="frontee"><p>商城購物<br>手札</p>
			</div>
			<div class="backee">
				<p>為了提供更良好的服務<br>
					我們提供電子票卷可直接使用喔
				</p>
			</div>
		</div>
	   </div>
   
	   
			<!-- 會員 -->
		<div class="containerff">
			<p> 
				<br>
				<i class='bx bxs-comment-edit'></i>
				<a href="member_edit"target="blank">變更密碼與資料</a><br>
			   <i class='bx bx-show-alt'></i><a href="member_inquary"target="blank">查看會員資料</a>
		   </p>
		   <div class="coverff">
			    <div class="frontff"><p>會員手札</p></div>
			    <div class="backff"><p>據統計本站會員都有以下特徵...<br>花錢<br>喜歡花錢<br>比喜歡還喜歡花錢</p></div>
		   </div>
	  </div>
	 </div>
	 
	   <!-- 中間區塊2 -->
	   <div class="row towwarp">
		   <!--我的信用卡收藏-->
		   <div class="col-8 onearea">
			 <!--我的信用卡標題與說明-->
		 	<h3>我的信用卡配對</h3>
			<p>
				參加交友配對,必須填寫您手上擁有的信用卡,最多可加入<span class="threenumber">3張</span>!!會依照您增加的信用卡資料進行配對
			</p>
			<label><select id="selectBank" onchange="getCard()">
				<option value="-1" label="請選擇..."></option>
				<c:forEach items="${banks}" var="s" varStatus="status">	
					<option value="${s}" label="${s}"></option>
				</c:forEach>
			</select></label>
			
			<label><select id="selectCard" >
				<option value="-1" label="請選擇..."></option>

			</select></label>
			<label><input type="button" value="增加信用卡" class="center_Button2" id="center_Button2" onclick="addCard()"></label>
		   </div>
		<!-- 增加信用卡區塊-->
		<div class="row" id="center_Box"></div>	
	  </div>
	  <img src="../images/交友配對.png" class="pickuimgfour">
	  <img src="../images/比卡丘翻轉.gif"  class="pickuimggiftwo">
	  
	 
    <!-- 底部 ------>
    <div id="backtop" class="gotop">
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
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
  </body>
</html>
