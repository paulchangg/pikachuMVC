<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/Order-inquary.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>訂單查詢</title>
</head>
<body>

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
					<a class="nav-link" href="<c:url value="/member/member_login"/>" id="memberlogin" style="color: rgb(92, 41, 7);">會員登出</a>										
				</c:when>
				<c:otherwise>										
					<a class="nav-link" href="<c:url value="/member/member_logout"/>" id="memberlogout" style="color: rgb(92, 41, 7);">會員登出</a> 											
				</c:otherwise>
			 </c:choose>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/member_center" id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="<c:url value="/shopping/listtrackproduct" />" style="color: rgb(92, 41, 7);">追蹤商品</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/shopping/listProduct" id="shoppingcart" style="color: rgb(92, 41, 7);"><span>5</span> <!-- 加入購物車的商品數量 -->
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
        <a class="et-hero-tab" href="#">關於我們</a>
        <a class="et-hero-tab" href="/cards/cradeitCb?qt=main">信用卡比較</a>
        <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
        <a class="et-hero-tab" href="<c:url value="/shopping/listProduct" />">商城</a>
        <a class="et-hero-tab" href="">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>
   
       <!--這裡為顯示訂單查詢區塊-->
       <div class="ordertitle">
           <img src="../shopping/image/訂單查詢.png">
       </div>
      

        <!--這裡為輸入條件區塊-->
       <div class="col-6 orderone" id="Orderinquary_haveorder">
           <table>
               <tr>
                   <td>查詢條件:</td>
                   <td><input type="radio" name="orderitem" value="onemonth" id="Orderinquary_onemonth" class="radioBtn">一個月內訂單</td>
                   <td><input type="radio" name="orderitem" value="nouse" id="Orderinquary_nouse"  class="radioBtn">三個月內訂單</td>
                   <td><input type="radio" name="orderitem" value="use" id="Orderinquary_use"  class="radioBtn">已使用訂單</td>
                   <td><input type="radio" name="orderitem" value="sixmonth" id="Orderinquary_sixmonth"  class="radioBtn">六個月內訂單</td>
               </tr>
               <p>目前僅提供六個月內的交易資料，若您欲查詢六個月前的資料，請您與<a href=""><i class='bx bx-help-circle' ></i>客服中心</a>聯繫</p>
           </table>
           <input type="submit" value="查詢" id="Orderinquary_orderbutton">
       </div>

          <!--這裡為顯示搜尋結果為有訂單時的區塊-->
       <div class="ordertwo">
          <!-- <span id="Orderinquary_onemonth" style="margin: 0 auto;">一個月內訂單共7筆</span> -->
          <table class="twotable">
             <tr>
                <td>訂單編號</td>
                <td>訂購時間</td>  
                <td>訂單金額</td>
                <td>使用狀態</td>
                <td>訂單狀態</td>
            </tr>
          <c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
            <tr> 
                <!--此頁面可呈現8筆 用第1筆為主-->
                <td>
            	  <span id="Orderinquary_ordid">${anOrderBean.ordid}</span></br>
             		  <a  href='<c:url value='orderDetail.do?memberId=${LoginOK.m_id}&orderNo=${anOrderBean.ordid}' />'>
				    	看完整內容
			    	 </a>
			   </td>
                <td>
            	   <span id="Orderinquary_time"> 
                   ${anOrderBean.orderdate}</span>
               </td>
                <td><span id="Orderinquary_money"> ${anOrderBean.total}</span></td>
                <td><span id="Orderinquary_tick">已使用</span></td>
                <td><span id="Orderinquary_status">正常</span></td>
            </tr>
          </c:forEach>                                                                                                    
          </table>

          <div class="return"> <!--底部分頁-->
                 <ul class="pagination pagination-sm">
                 	<c:choose>
                 		<c:when test="${pageNo == 1}">
                 			  <li class="page-item"> 
                 			  	<a class="page-link"  aria-label="Previous">
                        			<span aria-hidden="true">&laquo;</span> 
                        		</a>
                        	  </li>
                 		</c:when>
                 		<c:otherwise>
                    		<li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=1' />" aria-label="Previous">
                        			<span aria-hidden="true">&laquo;</span> 
                        		</a>
                        	</li>
                 		</c:otherwise>
                 	</c:choose>
                    <c:forEach begin="1" end="${totalPages}" varStatus="vs">
                    	<c:choose>
                    		<c:when test="${pageNo == vs.index}">
                    			<li class="page-item">
                    				<a class="page-link"  id="shopping_pag1">${vs.count}</a>
                    			</li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item">
                    				<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                 		<c:when test="${pageNo != totalPages}">
                 			  <li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=${totalPages}' />" aria-label="Previous">
                        			<span aria-hidden="true">&raquo;</span> 
                        		</a>
                        	</li>
                 		</c:when>
                 		<c:otherwise>
                    		<li class="page-item"> 
                    			<a class="page-link" aria-label="Previous">
                        			<span aria-hidden="true">&raquo;</span> 
                        		</a>
                        	</li>
                 		</c:otherwise>
                 	</c:choose>
                 </ul>
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