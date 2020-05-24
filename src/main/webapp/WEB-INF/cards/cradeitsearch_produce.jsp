<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>信用卡詳細資訊</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/cradeitsearch_produce.css" />
<link rel="stylesheet" href="css/wickedcss.min.css">
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	 <!-- 上方標題logo列--->
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
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>


    <div class="credittitle">詳細資訊</div>

		<div class="row imgareatext">
			<!-- 信用卡上半部 -->
			<div class="col-8 imagecared">
				<!-- 信用卡圖片 -->
				<img
					src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${bean.c_id}"
					id="cradeitsearchproduce_img" width="300px" height="180px">
				<!--這id連資料庫-->
			</div>
			<div class="col-12 creditname">
				<span id="cradeitsearchproduce_title">${bean.c_name}</span>
				<!--信用卡名稱-->
			</div>
			<div class="row textarea">
				<div class="col-4">
					<span id="cradeitsearchproduce_req">${bean.annual_income}</span></br> <span
						style="color: #38618C; font-size: 16px;">最低年薪要求</span>
				</div>
				<div class="col-4">
					<span id="cradeitsearchproduce_dcbn">${bean.dcb}%</span></br> <span
						style="color: #38618C; font-size: 16px;">國內消費現金回饋</span>
				</div>
				<div class="col-4">
					<span id="cradeitsearchproduce_fcbn">${bean.fcb}%</span></br> <span
						style="color: #38618C; font-size: 16px;">國外消費現金回饋</span>
				</div>
				<div class="col-8" style="margin-top: 2%;">
					<a href="" id="cradeitsearchproduce_bank"><input type="button"
						value="立即申請" class="voiceBtn"></a>
				</div>
			</div>
		</div>

		<!--這裡為信用卡介紹的下半部-->
		<div class="col-8 creditareatext">
			<div>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						href="#cradeitsearchproduce_gift" data-toggle="tab">現金回饋備註</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#cradeitsearchproduce_dis" data-toggle="tab">哩程累積</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#cradeitsearchproduce_app" data-toggle="tab">電影折扣</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#cradeitsearchproduce_mon" data-toggle="tab">加油優惠</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#cradeitsearchproduce_es" data-toggle="tab">網路購物</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#cradeitsearchproduce_zero" data-toggle="tab">分期零利率</a></li>
				</ul>
				<div class="tab-content my-2 mx-2">
					<div class="tab-pane fade show active" id="cradeitsearchproduce_gift">
						<div class="row">
							<div class="col gifttext">
								國內消費現金回饋備註：<br><span class="test">${bean.dcb_n}</span>
							</div>
							<div class="col gifttext">
								國外消費現金回饋備註：<br><span class="test">${bean.fcb_n}</span>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="cradeitsearchproduce_dis">
						<!--哩程累積-->
						<div class="row">
							<div class="col gifttext">
								<div>
									<span>國內哩程累積</span>
								</div>
								<div class="test">${bean.dma}</div>
								<div>${bean.dma_n}</div>
							</div>
							<div class="col gifttext">
								<div>
									<span>國外哩程累積</span>
								</div>
								<div class="test">${bean.fma}</div>
								<div>${bean.fma_n}</div>
							</div>
						</div>

					</div>
					<div class="tab-pane fade" id="cradeitsearchproduce_app">
						<div class="row">
							<div class="col gifttext">
								<div>
									<span>平日電影折扣</span>
								</div>
								<div class="test">${bean.moviedis}</div>
								<div>${bean.moviedis_n}</div>
							</div>
							<div class="col gifttext">
								<div>
									<span>週未電影折扣</span>
								</div>
								<div class="test">${bean.wkdmoviedis}</div>
								<div>${bean.wkdmoviedis_n}</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="cradeitsearchproduce_mon">
						<div class="row">
							<div class="col gifttext">
								<div>
									<span>加油現金回饋</span>
								</div>
								<div class="test">${bean.refuel_cb}</div>
								<div>${bean.refuel_cb_n}</div>
							</div>
							<div class="col gifttext">
								<div>
									<span>加油優惠</span>
								</div>
								<div class="test">${bean.refuel_dis}</div>
								<div>${bean.refuel_dis_n}</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="cradeitsearchproduce_es">
						<div class="row">
							<div class="col gifttext">
								<div>
									<span>網購回饋</span>
								</div>
								<div class="test">${bean.onlinefb}</div>
								<div>${bean.onlinefb_n}</div>
							</div>
							<div class="col gifttext">
								<div>
									<span>數位通路回饋上限</span>
								</div>
								<div class="test">${bean.ditigalfb}</div>
								<div>${bean.ditigalfb_n}</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="cradeitsearchproduce_zero">
						<div class="row">
							<div class="col gifttext">
								<div>
									<span>分期零利率</span>
								</div>
								<div class="test">${bean.zeroins}</div>
								<div>${bean.zeroins_n}</div>
							</div>
							<div class="col gifttext">
								<div>
									<span>最低可分期金額</span>
								</div>
								<div class="test">${bean.minins}</div>
								<div>${bean.minins_n}</div>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>

		<!--這裡為謹慎理財區塊-->
		<div class="col-8 managermoney">
			<h2>謹慎理財 信用至上</h2>
			產品特色
			<p>
				<span id="cradeitsearchproduce_desc">一般消費（含悠遊自動加值）回饋0.5%；三大通路（國內加油、生鮮量販超市、餐廳）之前2萬元刷卡消費享額外1.5%現金回饋，當期帳單最高回饋NT$300元。活動期間：即日起~2020/06/30。
					現金紅利持卡期間有效！除了折抵帳單金額、紅利商品輕鬆換，還可兌換航空公司哩程。</span>
			</p>
			注意事項</br> <span id="cradeitsearchproduce_atten">詳細活動內容條件請詳花旗官網。</span>
		</div>


		<!--這裡再次提示使用比較的按鈕區塊-->
		<div class="col-8 butagain ">
			未找到你適合的信用卡? 沒關係~有比卡丘會協助你找出最丘的信用卡</br> <a
				href="cradeitsearch_minecredit.html">
				<button id="cradeitsearchmine_btn" class="floater searchbtn">
					<i class='bx bx-search-alt'></i>
				</button>
			</a>
		</div>



	  
	 
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
		var elements = document.getElementsByClassName("test");
		console.log(elements.length);
		for (var i = 0; i < elements.length; i++) {
			let s = elements[i].innerText;
			if (s.trim() == "") {
				elements[i].innerText = "無";
			} else if (s.trim() == "於國內消費" || s.trim() == "於國外消費") {
				elements[i].innerText = "無";
			}
		};
	</script>
</body>
</html>
