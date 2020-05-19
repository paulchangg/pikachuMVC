<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="css/Order-love.css" rel="stylesheet" type="text/css">
    <title>追蹤清單</title>
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
          <a class="nav-link" href="<c:url value="/member/member_center" />" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="<c:url value="/shopping/orderList" />" style="color: rgb(92, 41, 7);">查詢訂單</a>
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
      <a class="et-hero-tab"href="<c:url value="/shopping/listProduct" />">商城</a>
      <a class="et-hero-tab" href="#infoweb">資訊網</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </div>
     
   <div class="imagelike">
     <span class="wordone">喜愛的東西快帶回家~</span>
     <span class="wordonetwo">例如我</span>
     <img src="../shopping/image/狗狗比卡丘.png" class="imageone">
   </div>
    
    <!--這裡為顯示追蹤清單區塊-->
     <div class="ordertitle">
         <h2>追蹤清單</h2>
    </div>

     <!--這裡為追蹤清單內容-->
       <div class="Ordercontent"> 
            <table class="tablearea">
               <tr>
                 <th>商品名稱</th>
                 <th>優惠價</th>
                 <th>庫存</th>
                 <th></th>
               </tr> 
               	  <c:forEach varStatus="stVar"  var="entry"  items="${trackProduct}" >
               	 <tr>
                 <td>  <!--這裡顯示兩筆 第一筆為主-->
                  
                     <img src="<c:url value='/shopping/getPicture/${entry.p_id}' />" id="shoppingproduce_img" style="float: left;">
                     <a href="<c:url value='/shopping/listProduct?mode=show&productId=${entry.p_id}' />" id="orderlove_ul"  style="line-height: 99px;"><span id="orderlove_name">${entry.p_name}</span></a>
                 </td>
                 <td><span id="orderlove_price">${entry.price}</span></td>
                 <td><span id="orderlove_stock">${entry.stock}</span></td>
                 <td>
                 	<form action='<c:url value='/shopping/deleteTrack'/>' style="margin: 0px;display: inline;" method="post">
                  		<input type="submit" value="取消追蹤" id="orderlove_delete">
                  		<input type="hidden" name="id"  value="${entry.p_id}" >
                 	</form>
                </td>
                  </tr>
                 </c:forEach>
            </table>
         </div>
           
          <!--這裡為說明區-->
       <div class="Orderunder">
          <div class="Orderundertwo">
           <h5>注意事項</h5>
         <ul>   
             <li><i class='bx bxs-hand-right'></i>追蹤清單中的商品優惠價金額與供貨狀況是已更新的訊息。</li>
             <li><i class='bx bxs-hand-right'></i>商品售價以訂單成立時之即時價格為準。</li>
             <li><i class='bx bxs-hand-right'></i>追蹤清單買不保留商品之優惠價及優先購買權。</li>
             <li><i class='bx bxs-hand-right'></i>部份商品若若斷貨而無法再提供購買，將由系統自動刪除，不另外通知。</li>
        </ul>
       </div>
      </div>


       <!--這裡為返回按鈕區塊-->
      <div class="col-12 footerbutton">
<!--         <a href="../member/member_center.jsp"><input type="button" value="返回" class="backbtn"></a> 這裡為返回會員中心畫面 -->
        <a href="<c:url value="/shopping/listProduct" />"><input type="button" value="返回商城" class="backbtn"></a><!--這裡為返回購物中心畫面-->
      </div>
   


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
      </div>
   <script src="js/jquery-3.4.1.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/inquaryindex2.js"></script>
</body>
</html>