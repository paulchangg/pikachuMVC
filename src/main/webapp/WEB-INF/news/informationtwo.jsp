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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/common/wickedcss.min.csss"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/examplestwo.css" media="screen"/>
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

        

	   <!-- 顯示文章區塊--------------------------->
	    <div class="col-8 textartccal"> 
			<h3><span id="title">${news.title}</span></h3>
			<p><span id="acttime">${news.actTime}</span></p>
			<div class="textartccalimg">
			   <img src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${news.newsId}" width="500px" height="350px" id="newsimg">
	    	</div>
			<p><span id="contextstr">
				${content}
			  </span>
			</p>
		</div>
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