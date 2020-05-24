<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>信用卡比較首頁</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/cradeitsearch_page.css" />
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<!--要放前面-->
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--要放前面-->

</head>
<body>
	<!-- 上方標題logo列----超連結待補----->
	<div class="container-fluid"
		style="height: 160px; background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
		<div class="row">
			<div class="col-sm">
				<span style="font-size: xx-large;">哪家的信用卡功能最丘？</span><br>
				<span style="font-size: medium; padding-top: 10px;">
				  快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
				</span>
			</div>
			<div class="row justify-content-around">
				<div class="col-sm">
					<a href='<c:url value="/" />'> <img src="../images/logo2.png"
						alt="logo" style="height: 140px;" />
					</a>
				</div>
			</div>
			<!-- 右上區塊 -->
			<div class="col-sm">
				<ul class="nav justify-content-end"
					style="font-size: 18px; font-weight: bold;">
					<li class="nav-item"><c:choose>
							<c:when test="${empty LoginOK}">
								<a class="nav-link"
									href='<c:url value="/member/member_login" />' id="memberlogin"
									style="color: rgb(92, 41, 7);">會員登入</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link"
									href='<c:url value="/member/member_logout" />'
									id="memberlogout" style="color: rgb(92, 41, 7);">會員登出</a>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/member_center" />' id="cardcompare"
						style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle'></i>會員中心</a>
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
			<a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a> <a
				class="et-hero-tab"
				href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a> <a
				class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
			<a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
			<a class="et-hero-tab" href="#infoweb">資訊網</a> <span
				class="et-hero-tab-slider"></span>
		</div>
	</div>



	<!-- 輪播圖  -->
	<div class="swiper-container" id="swiper_Name">
		<div class="swiper-wrapper">
			<div class="swiper-slide"
				style="background-image: url(../cards/image/信用卡優惠廣告01.jpg)"></div>
			<div class="swiper-slide"
				style="background-image: url(../cards/image/信用卡優惠廣告02.jpg)"></div>
			<div class="swiper-slide"
				style="background-image: url(../cards/image/信用卡優惠廣告03.jpg)"></div>
			<div class="swiper-slide"
				style="background-image: url(../cards/image/信用卡優惠廣告04.jpg)"></div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>


	<main class="main"><!--主要區塊--> <!--這裡為信用卡選單區塊-->
	<div class="row creditbtnarea">
		<div class="col-3 offset-1 btnareaone">
			<!--信用卡搜尋結果-->
			<span id="cradeitsearchpage_number">${cardCounts}項搜尋結果</span>
			<div class="dropdown" id="cradeitsearchpage_btnone">
				<button class="btn btn-default dropdown-toggle" type="button"
					data-toggle="dropdown" id="dropdownbtn">
					<c:choose>
						<c:when test="${empty qt_c}">
						<span id="dropdownspan">精選推薦<span>
						</c:when>
						<c:otherwise>
						<span id="dropdownspan">${qt_c}<span>
						</c:otherwise>
					</c:choose>
	
				</button>
				<div class="dropdown-menu" id="cradeitsearchpage_btninn">
					<!--下拉式選單-->

					<a class="dropdown-item" id="hyper1"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=all">全部</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=cb">現金回饋</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=ml">哩程回饋</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=oil">加油卡優惠</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=mv">電影優惠</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=zi">分期零利率優惠</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=os">網路購物</a>
					<a class="dropdown-item"
						href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=fg">信用卡首刷禮</a>
				</div>
			</div>
		</div>
	</div>

	<!--這裡為信用卡中間區塊-->
	<div class="row justify-content-around">
		<div class="col-12 searchbtn">
			60秒內找到屬於我的信用卡<i class='bx bxs-chevrons-right'></i> <a
				href="<c:url value="/cards/cradeitsearch_minecredit"/>"> <%-- <a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_minecredit.jsp"> --%>
				<button class="button" style="vertical-align: middle"
					id="mycreditbtn">
					<span>點我</span>
				</button></a>
		</div>

		<div class="col-2 creditsider">
			<!--為側邊選單共34間銀行機構-->
			<div class="creditsidertext">按需要機構/銀行篩選</div>
			<div>
				<label> <input type="checkbox" name="bank" class="checkbox"
					value="花旗銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">花旗銀行</span>
				</label></br>
				<!--                 <label >
                  <input type="checkbox" name="bank" class="checkbox" value="匯豐銀行">
                  <span class="btn-box">
                    <span class="btn"></span>      
                  </span>
                 <span class="text">匯豐銀行</span>
                </label></br> -->
				<label> <input type="checkbox" name="bank" class="checkbox"
					value="渣打銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">渣打銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="星展銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">星展銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="王道銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">王道銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="新光銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">新光銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="中國信託"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">中國信託</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="國泰世華"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">國泰世華</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="玉山銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">玉山銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="台新銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">台新銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="聯邦銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">聯邦銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="美國運通"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">美國運通</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="遠東商銀"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">遠東商銀</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="臺灣企銀"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">臺灣企銀</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="彰化銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">彰化銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="永豐銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">永豐銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="華泰銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">華泰銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="華南銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">華南銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="台北富邦"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">台北富邦</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="第一銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">第一銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="高雄銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">高雄銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="安泰銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">安泰銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="合作金庫"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">合作金庫</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="兆豐銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">兆豐銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="凱基銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">凱基銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="台灣樂天"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">台灣樂天</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="臺灣銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">臺灣銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="台中商銀"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">台中商銀</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="日盛銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">日盛銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="元大銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">元大銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="土地銀行"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">土地銀行</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="三信銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">三信銀行</span>
				</label></br> <label> <input type="checkbox" name="bank" class="checkbox"
					value="上海商銀"> <span class="btn-box"> <span
						class="btn"></span>
				</span> <span class="text">上海商銀</span>
				</label></br> <label> <input type="checkbox" name="bank"
					class="checkbox" value="陽信銀行"> <span class="btn-box">
						<span class="btn"></span>
				</span> <span class="text">陽信銀行</span>
				</label></br>
			</div>
		</div>

		<div class="col-9 contentcenter" >
			<!--為中間顯示區塊-->
 		 <img src='<c:url value="/cards/image/loading3.gif"/>' class="loadingarea" id="loadingimg" alt="loadpic"/>
 		
		<div id="divcont">
			<c:choose>
				<c:when test="${qt == 'cb'|| qt == 'main' }">
				
					<!--第1種：現金回饋-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">

						<div class="box">
							<!--特效區塊需要當外層-->
					<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
                    <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1260" y1="0" x2="1260"
									y2="160" />
                  </svg>


							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.fcb}%</span>
											</div>
											<div>國外消費現金回饋</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.dcb}%</span>
											</div>
											<div>國內消費現金回饋</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<!--商品連結頁面-->
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=> 詳細資訊 </a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>


				<c:when test="${qt == 'ml'}">
					<!--第2種：哩程回饋-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
                    <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
                 </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.fma}</span>
											</div>
											<div>國外消費累積哩程</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.dma}</span>
											</div>
											<div>國內消費累積哩程</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'oil'}">
					<!--第3種：加油回饋-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
                  <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
                </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.refuel_cb}</span>
											</div>
											<div>加油現金回饋</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.refuel_dis}</span>
											</div>
											<div>加油優惠</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'mv'}">
					<!--第4種：電影優惠-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
           <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
            </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.wkdmoviedis}</span>
											</div>
											<div>週未電影折扣</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.moviedis}</span>
											</div>
											<div>平日電影折扣</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'os'}">
					<!--第5種：網購回饋-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
        <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
            </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.ditigalfb}</span>
											</div>
											<div>數位通路回饋上限</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.fcb}%</span>
											</div>
											<div>國外消費現金回饋</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.onlinefb}</span>
											</div>
											<div>網購回饋</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'zi'}">
					<!--第6種：分期零利率-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
            <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
            </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.zeroins}</span>
											</div>
											<div>最高分期數</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.minins}</span>
											</div>
											<div>最底可分期金額</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'fg'}">
					<!--第7種：首刷-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
         <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
            </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.mileagefb}</span>
											</div>
											<div>首刷哩程回饋</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.cashfb}</span>
											</div>
											<div>首刷(類)現金回饋</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:when test="${qt == 'all'}">
					<!--第8種：全部-->
					<c:forEach varStatus="stVar" var="entry" items="${card_m}">
						<div class="box">
							<!--特效區塊需要當外層-->
							<svg xmlns="http://www.w3.org/2000/svg" width="100%"
								height="100%">
          <line class="top" x1="0" y1="0" x2="1300" y2="0" />
                      <line class="left" x1="4" y1="160" x2="4" y2="0" />
                      <line class="bottom" x1="0" y1="160" x2="1300"
									y2="160" />
                      <line class="right" x1="1271" y1="0" x2="1271"
									y2="160" />
            </svg>
							<div class="onecard" name="${entry.value.bank}">
								<span id="">${entry.value.c_name}</span>
								<!--卡名-->
								<div class="row">
									<div class="col-2 creditimg">
										<!--信用卡商品圖-->
										<img
											src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"
											width="160px" height="110px">
									</div>
									<div class="col credittext">
										<div class="col-4 creditinner">
											<!--年費-->
											<div>
												<span>${entry.value.annlfee}</span>
											</div>
											<div>年費</div>
										</div>
										<div class="col-4 creditinner">
											<!--國外消費-->
											<div>
												<span>${entry.value.fcb}%</span>
											</div>
											<div>國外消費現金回饋</div>
											<div></div>
										</div>
										<div class="col-4 creditinner">
											<!--國內消費-->
											<div>
												<span>${entry.value.dcb}%</span>
											</div>
											<div>國內消費現金回饋</div>
											<div></div>
										</div>
									</div>
									<div class="col-2 creditbtn">
										<a
											href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}"
											class="btn btn-primary" target="_blank" id=>詳細資訊</a>
									</div>
									<!--商品連結頁面-->
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
			</div>
		</div>
	</div>
	</main>


	  <!-- 回到置頂------>
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

	<script src="js/jquery-3.4.1.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/cradeitsearch_page.js"></script>
	<script>
		$("#hyper1").click(function()
			{			  
			    event.preventDefault();
			    $("#divcont").empty();
			    
			    $("#loadingimg").css("display", "inline");
			    
			    $.ajax({
			        url: '/pikachuMVC/cards/getAll',                        // url位置
			        type: 'get',                   // post/get	  
			        dataType : 'json',              // 預期從server接收的資料型態	      
			        success: function (response) {  // 成功後要執行的函數
			        	 $("#loadingimg").css("display", "none");
			        let content="";	
			        let divct= 0;
			        	 $.each(response, function(key, val) {
			        		 divct++;
			        content+='<div class="box">' +	
			    			 '<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">'+
			                 '<line class="top" x1="0" y1="0" x2="1300" y2="0" />'+
			                  '<line class="left" x1="4" y1="160" x2="4" y2="0" />'+
			                  '<line class="bottom" x1="0" y1="160" x2="1300" y2="160" />'+
			                  '<line class="right" x1="1271" y1="0" x2="1271" y2="160" />'+
			                  '</svg>'+
			                  '<div class="onecard" name="'+val.bank+'">'+
			                  '<span id="">'+val.c_name+'</span>'+
			                  '<div class="row">'+ 
			                  '<div class="col-2 creditimg">'+
			                  '<img src="/pikachuMVC/cards/RetrieveCardImg?id='+val.c_id+'" width="160px" height="110px">'+
			                  '</div>'+
			                  '<div class="col credittext">'+
			                  '<div class="col-4 creditinner">'+
			                  '<div>'+
			                  '<span>'+val.annlfee+'</span>'+
			                  '</div>'+
			                  '<div>年費</div>'+
			                  '</div>'+
			                  '<div class="col-4 creditinner">'+
			                  '<div>'+
			                  '<span>'+val.fcb+'%</span>'+
			                  '</div>'+
			                  '<div>國外消費現金回饋</div>'+ 
			                  '<div></div>'+
			                  '</div>'+
			                  '<div class="col-4 creditinner">'+
			                  '<div>'+
			                  '<span>'+val.dcb+'%</span>'+
			                  '</div>'+
			                  '<div>國內消費現金回饋</div>'+
			                  '<div></div>'+     
			                  '</div>'+
			                  '</div>'+
			                  '<div class="col-2 creditbtn">'+
     						  '<a href="/pikachuMVC/cards/cradeitsearch_produce?id='+val.c_id+'" class="btn btn-primary" target="_blank" id=> 詳細資訊 </a>'+
			                  '</div>'+
			                  '</div>'+
			                  '</div>'+
			                  '</div>' ;      	      
			        	 });   
			        	 $("#divcont").html(content);
			        	 let cntcard = document.getElementById('cradeitsearchpage_number');
			 			 cntcard.innerText = divct + "項搜尋結果";
			 			 let dropdown = document.getElementById('dropdownspan');
			 			 dropdown.innerText = "全部";
			 			 $(".checkbox").prop('checked', false);
			        }
			    });		    
			});
	
		var checkValue = document.getElementsByName("bank");//上網查使用checkbox用這個方式取得

		for (var i = 0; i < checkValue.length; i++) {
			checkValue[i].addEventListener("click", show, false);
		};

		function show() {

			let checkarray = [];

			for (let i = 0; i < checkValue.length; i++) {
				if (checkValue[i].checked) {
					checkarray.push(checkValue[i].value);
				}

			}

			let cdiv = document.getElementsByClassName("onecard");
			let cnt = 0;
			if (checkarray.length == 0) { //如果全部都沒勾選，就全顯示
				for (let x = 0; x < cdiv.length; x++) {
					cdiv[x].style.display = 'block';
					cnt++;
				}
			} else { //不是全部沒勾(即有任一勾選)
				for (let x = 0; x < cdiv.length; x++) {

					if (checkarray.indexOf(cdiv[x].getAttribute('name')) != -1) { //!= -1 代表有在陣列裡
						cdiv[x].style.display = 'block';
						cnt++;
					} else {
						cdiv[x].style.display = 'none';
					}
				}
			}
			console.log(cnt);
			let cntcard = document.getElementById('cradeitsearchpage_number');
			cntcard.innerText = cnt + "項搜尋結果";
		}

		var swiper = new Swiper('.swiper-container', {
			effect : 'cube', /*效果*/
			direction : 'vertical',
			grabCursor : true,
			loop : true, /*是否循環*/
			autoplay : {
				disableOnInteraction : false, /*false為碰到就會自動切換不會停止*/
			},

			cubeEffect : {
				shadow : true,
				slideShadows : true, /*當滑動時顯示陰影*/
				shadowOffset : 20, /*陰影偏移*/
				shadowScale : 0.94, /*投影缩放比例*/
				speed : 6000,
				autoplay : 600,

			},
			pagination : {
				el : '#swiper_Name .swiper-pagination', //分頁物件
			},

		});
	</script>
</body>
</html>


