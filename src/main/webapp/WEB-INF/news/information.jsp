<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<title>優惠資訊網</title>

<link rel="stylesheet" type="text/css" href="css/slider-pro.min.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/examples.css" media="screen"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/wickedcss.min.csss"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.sliderPro.min.js"></script>
<script type="text/javascript" src="js/information.js"></script>

</head>
<body>
<div class="flex-container">
		<!----------------------head區塊------------------------------>
		<div class="header">
		      
		</div>
		<!-- 導覽列--------------------------->
	   <section class="top_navi">
		   <nav>
			   <a href="#" >關於我們</a>
			   <a href="">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="#">購物商城</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>

       <!-- 優惠資訊標題--------------------------->
	   <div class="shopping">
		     <h2>優惠資訊快報</h3>
	   </div>

       <!-- 輪播圖區塊--------------------------->
	<div id="informationslider" class="slider-pro">
		<div class="sp-slides"><!--圖片開始區塊-->
		<c:forEach varStatus="stVar2"  var="cirnews"  items="${newslist2}" >
			<div class="sp-slide">
				<a href='<c:url  value="/news/NewsInfo?id=${cirnews.newsId}"/>' ><img class="sp-image" src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${cirnews.newsId}" class="articleimg" id="sliderimg1"></a>
			</div>
		</c:forEach>
		</div>

		<div class="sp-thumbnails"><!--文字內容區塊-->
		<c:forEach varStatus="stVar2"  var="cirnews2"  items="${newslist2}" >
			<div class="sp-thumbnail">
				<div class="sp-thumbnail-text">
				    <div class="sp-thumbnail-title"><span id="articaltitle">${cirnews2.title}</span></div><!--以第一個為例-->
					   <div class="sp-thumbnail-description"><span id="articalstr"></span></div>
				  </div>
			  </div>
		</c:forEach>
		</div>
	</div>		


       <!-- 顯示文章區塊--------------------------->
    <div class="container articlearea">
		<div class="row articleareatwo">
<!--  		 <div class="downarticle">
			<a href><img src="20200512/img/20200512-UCardu20200511175010.jpg" class="articleimg">
			 <h5>台茂購物母親節特賣　最優贈16 (滙豐銀行)</h5></a>
			 <p>活動日期：2020-04-23~2020-05-10
			  活動期間內，持滙豐銀行信用卡於台茂購物中心刷卡，單店/單館當日消費(含分期消費)，累積達指定門檻，即...</p>
		 </div>  -->
		  <c:forEach varStatus="stVar"  var="entry"  items="${newslist}" >
		   <div class="downarticle">
		       <a href='<c:url  value="/news/NewsInfo?id=${entry.newsId}"/>' id="ahrefstr"><img src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${entry.newsId}" class="articleimg"><!--以第一個為例-->
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
		<div class="site_footer"> <!--尾巴區塊-->
			<div class="gotop">
			   <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
		  </div>
		</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"></script>
</body>
</html>