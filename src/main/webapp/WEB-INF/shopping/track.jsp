<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Order-love.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous" />
   <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
   <link rel="stylesheet" href="css/wickedcss.min.css"/>
   <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
   <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>追蹤清單</title>
</head>
<body>
   <div class="flex-container">
      <!----------------------head區塊------------------------------>
        <div class="header">
         <!--這裡開始為上方,呈現商標log位置-->
         <div class="row justify-content-end"> 
           <div class="col-4">    <!---------logo區塊----------->
               <a href='<c:url value='/' />'>
				   		<img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
			   </a>
            </div>
          <div class="col-4">     <!---------左上角超連結區塊----------->
            <div class="row justify-content-end">
          <div class="col-3">
          
          					<c:choose>
								<c:when test="${empty LoginOK}">								
									<a href="<c:url value="/member/member_login"/>"> 
										<i class="fa fa-user-circle" id="memberlogin">會員登入</i>
									</a>								
								</c:when>
								<c:otherwise>								
									<a href="<c:url value="/member/member_logout"/>"> 
									<i class="fa fa-user-circle" id="memberlogout">會員登出</i>
									</a>								
								</c:otherwise>
							</c:choose>
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
      <!-- 導覽列--------------------------->
        <section class="top_navi">
       <nav>
         		<a href="<c:url value="/shopping/orderList" />" >查詢訂單</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="<c:url value="/shopping/listProduct" />">購物商城</a>
			   <a href="#">資訊網</a>
      </nav>
        </section>

      <!--這裡為顯示追蹤清單區塊-->
       <div class="ordertitle">
         <h2>追蹤清單</h2>
      </div>

          <!--這裡為追蹤清單內容-->
         <div class="Ordercontent"> 
            <table border="1">
               <tr>
                 <td>商品明細</td>
                 <td>優惠價</td>
                 <td>庫存</td>
                 <td></td>
               </tr> 
               	  <c:forEach varStatus="stVar"  var="entry"  items="${trackProduct}" >
               	 <tr>
                 <td>  <!--這裡顯示兩筆 第一筆為主-->
                  
                     <img src="<c:url value='/shopping/getPicture/${entry.p_id}' />" width="150" height="150" class="img-fluid"  id="shoppingproduce_img" style="float: left;">
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
      <div class="footerbutton">
<!--         <a href="../member/member_center.jsp"><input type="button" value="返回" class="backbtn"></a> 這裡為返回會員中心畫面 -->
        <a href="<c:url value="/shopping/listProduct" />"><input type="button" value="返回商城" class="backbtn"></a><!--這裡為返回購物中心畫面-->
      </div>


      <div class="site_footer"> <!--尾巴區塊-->
          <div class="gotop">
            <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script type="text/javascript" src="/js/jquery-barcode.min.js"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"></script>  
</div>

</body>
</html>