<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Order-item.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/common/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>訂單明細</title>
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
		       <a href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="<c:url value="/shopping/listProduct" />">購物商城</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>
            
        <!--這裡為顯示訂單查詢區塊的標題-->
        <div class="ordertitle">
               <h2>訂單詳細資料</h2>
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
    
           <!--這裡為底部區塊-->
           <div class="site_footer"> <!--尾巴區塊-->
              <div class="gotop">
                 <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
             </div>
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
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
     integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
     crossorigin="anonymous"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script type="text/javascript" src="js/jquery-barcode.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
     integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
     crossorigin="anonymous"></script>  
     <script src="js/qrcode.js"></script>
     <script src="js/jquery.qrcode.js"></script>
     <script src="js/orderitem.js"></script>
        
</body>
</html>      