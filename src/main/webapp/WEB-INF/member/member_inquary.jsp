<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人資料頁面</title>
<link
rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous"/>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/wickedcss.min.css"/>
<link href="../css/common/member_inquary.css" rel="stylesheet" type="text/css">
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <div class="flex-container">
      <!----------------------head區塊------------------------------>
	  <div class="header">
		 <div class="row justify-content-end"> 
		      <div class="col-4">    <!---------logo區塊----------->
			     <img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
		     </div>
		     <div class="col-4">     <!---------左上角超連結區塊----------->
			      <div class="row justify-content-end">
				       <div class="col-4">
					       <a href="http://127.0.0.1:5500/web/login.html">
							<i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
				          </a>
			          </div>
			          <div class="col-4"> 
		                   <a href="#">
			                <i class="fa fa-question-circle" id="qanda">Q & A</i>
		                  </a>
		             </div>
		             <div class="col-3">
		                  <a href="#">
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
		     <a href="#" >關於我們</a>
		     <a href="">會員中心</a>
		     <a href="#">論壇交友</a>
		     <a href="#">商城</a>
		     <a href="#">資訊網</a>
	 	 </nav>
	  </section>

	  <!--標題區塊-->
      <div class="Memberinquary">
		 <h3>個人資料</h3>
	 </div>

	 <!--動畫整體區塊-->
     <div class="middle">
	      <div class="wrap">
              <div class="front "> <!--正面-->
			     <h3>
			 	    會員帳號ID:<span id="memberinquary_id">${LoginOK.m_id}</span>
			    </h3>
			    <div class="photo" id="memberinquary_img">
				    <c:choose>
					    <c:when test="${empty LoginOK.m_img}">
						    <img src="../images/common/membephoto_0.png" width="160" height="160">
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
	
		<a href="member_center.jsp"><input type="button" value="返回" id="Button2"></a>
	</div>
	
	   <!--尾巴區塊-->
	<div class="site_footer">
		 <div class="gotop">
		    <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
		   </br>
		</div>
   </div>
   </div> 
	
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
           integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
           crossorigin="anonymous">
   </script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
   </script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
           integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
           crossorigin="anonymous">
   </script>
   <script src="js/member_inquery.js"></script>
</body>
</html>