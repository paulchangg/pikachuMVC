<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/common/member_center.css" rel="stylesheet"
	type="text/css">
<link href="../css/common/wickedcss.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script
	src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<title>會員中心</title>
</head>
<body>
<!-- --------------------load區塊---------------------------- -->
	<div class="loadingone">
		<img src="../images/common/皮卡丘打招呼.png" class="aniimage slideUp">
	</div>
	<div class="flex-container">
		<!----------------------head區塊------------------------------>
		<div class="header">
			<div class="row justify-content-end">
				<div class="col-4">
					<!---------logo區塊----------->
					<img class="index_logo" src="../homepage/images/index_logo.jpg"
						alt="logo" />
				</div>
				<div class="col-4">
					<!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
						<div class="col-3">
							<a href="#"> <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-3">
							<a href="member_logout"> <i class="fa fa-question-circle"
								id="qanda">會員登出</i>
							</a>
						</div>
						<div class="col-3">
							<a href="#"> <i class="fa fa-shopping-cart" id="shoppingcart">shopping
									cart</i>
							</a>
						</div>
						<div class="col-3">
							<a href="#"> <i class="fa fa-question-circle" id="qanda">Q
									& A</i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 導覽列--------------------------->
		<section class="top_navi">
			<nav>
				<a href="#">關於我們</a> <a href="">會員中心</a> <a href="#">論壇交友</a> <a
					href="#">商城</a> <a href="#">資訊網</a>
			</nav>
		</section>

		<!-- 會員中心--------------------------->
		<div class="membercenter">
			<h2>
				會員中心
				</h3>
		</div>


		<div class="warp-center">
			<div class="row justify-content-center">
				<div class="col-5 personal">
					<!--個人動態-->
					<h3>個人動態</h3>
					<div class="human" id="MemberCenter-img">
						<!--顯示會員的圖像id-->
						<c:choose>
							<c:when test="${empty LoginOK.m_img}">
								<img src="../images/common/membephoto_0.png" width="160"
									height="160">
							</c:when>
							<c:otherwise>
								<img
									src='${pageContext.request.contextPath}/init/getMemberImage?id=${LoginOK.m_id}'
									width="160" height="160">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="personaltext">
						<!--顯示論壇貼文-->
						<ul>
							<li><i class='bx bx-message-alt-edit bx-sm'></i>最近發表貼文:<a
								href="" target="blank"><span id="membercenter_article">信用卡好像辦不過</span></a></li>
							<li><i class='bx bx-message-alt-edit bx-sm'></i>累積發表文章數:<a
								href="" target="blank"><span id="membercenter_number">33</span></a>篇</li>
							<li><i class='bx bx-message-rounded-minus bx-sm'></i>文章發表新回應:<a
								href="" target="blank"><span id="membercenter_answer">無</span></a>
							<li>
						</ul>
					</div>
				</div>

				<div class="col-5 friend">
					<!--顯示交友活動-->
					<h3>交友&活動</h3>
					<ul>
						<li><i class='bx bx-donate-heart'></i><a href=""
							target="blank">前往交友區</a></li>
						<li><i class='bx bxs-happy-heart-eyes'></i><a href=""
							target="blank" id="membercenter_goodfr">好友清單</a></li>
						<li><i class='bx bx-walk'></i><a href="" target="blank">活動頁面區</a></li>
						<i class='bx bx-calendar'></i>最近發起活動:
						<a href="" target="blank"><span id="membercenter_number">這周末去爬山</span></a>主題
						</li>
						<li><i class='bx bx-message-rounded-minus bx-sm'></i>活動最新回應:<a
							href="" target="blank"><span id="membercenter_answer">無</span></a>
						<li>
					</ul>
				</div>


				<div class="col-11 cridecart">
					<!--我的信用卡收藏-->
					<div class="col-12 onearea">
						<!--我的信用卡標題與說明-->
						<h3>我的信用卡配對</h3>
						<p>
							參加交友配對,必須填寫您手上擁有的信用卡,最多可加入<span class="threenumber">3張</span>!!會依照您增加的信用卡資料進行配對,找出屬於你的愛情呦<img
								src="heart-regular-24.png">
						</p>
						<!-- 					   <label><select id="college-list" onchange="changeBank(this.selectedIndex)"></select></label> -->
						<!--                         <label><select id="sector-list"></select></label> -->
						<!-- 					   <label><input type="button" value="增加信用卡" class="btn btn-outline-danger" id="center_Button2"></label> -->
						<label><select id="selectBank" onchange="getCard()">
							<option value="-1" label="請選擇..."></option>
							<c:forEach items="${banks}" var="s" varStatus="status">	
								<option value="${s}" label="${s}"></option>
							</c:forEach>
						</select></label>
						
						<label><select id="selectCard" >
							<option value="-1" label="請選擇..."></option>
		
						</select></label>
						<label><input type="button" value="增加信用卡" class="btn btn-outline-danger" id="center_Button2" onclick="addCard()"></label>
					</div>
					<!-- 						我的信用卡區塊  全部寫在JS裡面的第96行innerHTML中..選單的值不知如何送回以及取出 -->
					<div class="row" id="center_Box"></div>
				</div>
				<div class="col-5 container">
					<!--訂單資訊-->
					<h3>訂單資訊</h3>
					<ul>
						<li><i class='bx bx-shopping-bag'></i><a href=""
							target="blank">訂單查詢</a></li>
						<li><i class='bx bx-search'></i><a href="" target="blank">追蹤清單</a></li>
						<li><i class='bx bx-help-circle'></i><a href=""
							target="blank">聯絡客服</a></li>
					</ul>
				</div>

				<div class="col-5 memberdata">
					<!--會員資料-->
					<h3>會員資料</h3>
					<ul>
						<li><i class='bx bxs-comment-edit'></i><a href="member_edit"
							target="blank">修改</a></li>
						<li><i class='bx bx-show-alt'></i><a href="member_inquary"
							target="blank">查看</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--尾巴區塊-->
		<div class="col-12 site_footer">
			<div class="gotop">
				<h4>© Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script src="../js/member_center.js"></script>
</body>
</html>