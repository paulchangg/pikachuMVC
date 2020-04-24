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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/common/wickedcss.min.csss"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>完成訂購</title>
</head>
<body>
    <div class="flex-container">
        <!----------------------head區塊------------------------------>
        <div class="header">
			${LoginOK.m_id}皮卡丘商標位置<!--這裡開始為上方,呈現商標log位置-->
		   <div class="row justify-content-end"> 
				<div class="col-4">    <!---------logo區塊----------->
				   <img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
			   </div>
			   <div class="col-4">     <!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
                        <div class="col-3">
							<a href="..webapp/member/member_login.jsp">
							  <i class="fa fa-user-circle" id="memberlogin">會員登出</i>
							</a>
					   </div>
						 <div class="col-3">
							 <a href="">
							  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-3"> 
							 <a href="#">
							  <i class="fa fa-question-circle" id="qanda">Q & A</i>
							</a>
					   </div>
				   </div>
			   </div>
		   </div>
	   </div>
       
       <section class="top_navi"><!--導覽列-->
        <nav>
            <a href="<c:url value="/shopping/orderList" />" >查詢訂單</a>
		     <a href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="<c:url value="/shopping/listProduct" />">購物商城</a>
			   <a href="#">資訊網</a>
         </nav>
     </section>
        
       <!--這裡為步驟購物圖檔-->
       <div class="stepimg"><img src="image/參考圖.png" height="300px"></div>

        <!--這裡為產生訂單編號區塊-->
       <div class="ordercneter">
           <div class="ordernumberarea" >
             <p>${LoginOK.m_id}的訂單已成功送出</p>
     
             <p>您的訂單編號為:<span id="shoppingcart3_ordernumber">${Orders.ordid}<span>
                歡迎至訂單頁面查看,謝謝</p>
            </div>
             <div class="return"> <!--返回區塊-->
             <a href="<c:url value='/' />"><button type="button" class="returnBtn">回首頁</button></a>
             <a href="<c:url value='/shopping/listProduct' />"><button type="button" class="returnBtn">繼續購物</button></a>
             <a href="<c:url value='/shopping/orderList' />"><button type="button" class="returnBtn">訂單查詢</button></a>
         </div>
       </div>
      
       <div class="site_footer"> <!--尾巴區塊-->
         <div class="gotop">
            <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
         </div>
      </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"></script>     
</body> 
</html> 