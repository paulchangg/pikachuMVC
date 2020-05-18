<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Order-item.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/wickedcss.min.css">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>訂單明細</title>
</head>
<body>
    <body>
  <!-- 上方標題logo列----超連結待補----->
  <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
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
           <a class="nav-link" href="<c:url value="/shopping/listtrackproduct" />"  style="color: rgb(92, 41, 7);">追蹤商品</a>
         </li>
         <li class="nav-item">
           <a class="nav-link"  href="<c:url value="/shopping/listProduct" />" id="shoppingcart" style="color: rgb(92, 41, 7);"><span>5</span> <!-- 加入購物車的商品數量 -->
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
       <a class="et-hero-tab" href="#infoweb">資訊網</a>
       <span class="et-hero-tab-slider"></span>
     </div>
   </div>
            
    <!--這裡為顯示訂單查詢區塊的標題-->
     <div class="ordertitle">
         <img src="../shopping/image/訂單詳細資料.png">
      </div>
          
           <!--這裡為訂單詳細狀態區-->
        <div class="ordertable">
            <table class="tableText">
             <tr>
                <td colspan="3">訂單編號:${OrderBean.ordid}</td>
                <td colspan="2">訂購時間:<span id="orderitem_time">${OrderBean.orderdate}</span></td> <!--這個應該從資料庫抓訂單成立時間-->
                <td colspan="2"><a href=""><i class='bx bx-help-circle' ></i>詢問客服</a></td>
             </tr>
             <tr><!--這裡為訂單商品標題-->
                 <td style="display:none"></td>  
                 <td>商品名稱</td>
                 <td>單價</td>
                 <td>數量</td>
                 <td>商品總額</td>
                 <td>使用狀態</td>
                 <td>電子票卷</td>
             </tr>
                <c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
             <tr><!--這裡為訂單內容-->
                <td><span id="orderitem_item">${stat.count}</span></td>
                <td><a href="<c:url value='/shopping/listProduct?mode=show&productId=${aBean.p_id}' />" id="orderitem_page"><span id="orderitem_name">${aBean.p_name}</span></a></td>
                <td><span id="orderitem_money">${aBean.qty}</span></td>
                <td><span id="orderitem_qty">${aBean.price}</span></td>
                <td><span id="orderitem_totalmomey">未使用</span></td>
     
                <td><input type="button" id="orderitem_rqcode" value="查看"></td>
             </tr>
                </c:forEach>
             <tr>
                <td colspan="5">訂單總金額<span id="orderitem_total">NT${OrderBean.total}元</TD></span></td>
                <td colspan="2">發票資訊<a href="#">檢視</a></td>
            </tr>
             </table>
           </div>

           <div class="insText">
              <h5>備註/說明<i class='bx bx-message-detail' ></i></h5>
                <ul>
                  <li class="liText">「已使用」之商品，訂單已不可異動。</li>
                  <li class="liText"> 已付款商品無法修改若需修改只能請您至客服中心，由客服人員為您連絡處理取消訂單，謝謝您！</li>
               </ul>   
           </div>
        
             <!--這裡返回訂單查詢頁面按鈕區塊-->
             <div class="footerbutton">
                <a href='<c:url value="/shopping/orderList" />'><input type="button" value="返回" class="fobutton"></a>
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

        <!--這裡為查看電子票卷跳出視窗-->
        <div class="modal fade" id="orderitem_myModal" tabindex="-1" role="dialog" aria-labelledby="orderitem_myModalLabel">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                 <div class="modal-header">
                  <h4 class="modal-title" id="orderitem_myModalLabel">您的電子票卷</h4>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                 <div class="modal-body">
                    <p>使用時請告知此兌換碼:<span id="qrcodeNum">WTR123456789</span></p>
                    <p>並且出示以下QRcode提供給店家進行兌換兌換</p>
                    <img alt="" src="" id="qrCodeImg">
                    <div id="qrcodeCanvas"></div>
                 <div class="modal-footer">
                    <input type="button" value="列印" id="print">
                 </div>
             </div>
          </div>
       </div>

  </div>      
     <script src="js/jquery-3.4.1.js"></script>
     <script src="js/popper.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/index.js"></script>
     <script src="js/qrcode.js"></script>
     <script src="js/jquery.qrcode.js"></script>
     <script src="js/orderitem.js"></script>
        
</body>
</html>      