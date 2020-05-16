<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物清單</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="css/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
</head>
<body>
    <form>
       <input type="hidden" name="a"/>
    </form>
    <c:choose>
       <c:when test="${ShoppingCart.subtotal > 0}">
          <c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元"/>
          <c:set var="subtotal" value="${ShoppingCart.subtotal}" scope="application"/>  
       </c:when>
       <c:otherwise>
          <c:set var="subtotalMessage" value="金額小計:  0 元"/>
          <c:set var="subtotal" value="0" scope="application"/>                
       </c:otherwise>
    </c:choose>

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
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href='<c:url value="/shopping/orderList" />' style="color: rgb(92, 41, 7);">查詢訂單</a>
          </li>
          <li class="nav-item">
                <a class="nav-link" href="<c:url value="/shopping/listtrackproduct" />">追蹤商品</a>
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
   
     <!--這裡為步驟購物圖檔-->
    <div class="stepimg"><img src="../shopping/image/參考圖.png"></div>

    <!-- 中間區塊 -->
    <div class="wrap">
        <!--這裡為購物清單-->
        <div class="col-10 tablearea">
            <h4>購物清單</h4>
                <table class="table table-hover ">
                   <thead><!--購物清單表格標題-->
                      <tr>
                         <th>商品名稱</th>
                         <th>優惠價</th>
                         <th>購買數量</th>
                         <th>目前庫存</th>
                         <th>商品小計</th>
                         <th>變更明細</th>
                     </tr>
                    </thead>
                    <tbody><!--表格內呈現資料-->
                    <c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
                      <tr>
                          <td><a href="<c:url value='/listProduct/DisplayPageProducts?mode=show&productId=${entry.value.p_id}' />" id="shoppingcart_page">
                              <img src="<c:url value='/shopping/getPicture/${anEntry.value.p_id}' />"  id="shoppingcart_img">
                             ${anEntry.value.p_name} </a>
                          </td>
                          <td>NT<sapn id="shoppingcart_orp">${anEntry.value.price}</sapn>元
                          </td>
                          <td>
                          <!--<input id="shoppingcart_min" name="qty" type="button" value="-" />  按鈕的方法是用id寫得所以如果有第二筆物件就必須把方法裡面的id更換掉 -->
                          <%--<input id="shoppingcart_quantity" name="newQty${vs.index}" type="text" value="${anEntry.value.qty}" /> --%>
                              <Input id="newQty${vs.index}" class="newQinput" style="width:70px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" name="qty" onkeypress="return isNumberKey(event)"  />
                          <!--<input id="shoppingcart_add" name="qty" type="button" value="+" /> -->
                         </td>
                          <td><span id="shoppingcart_stock">30</span></td>
                          <td>小計:<span id="shoppingcart_total">${anEntry.value.qty * anEntry.value.price}</span></td>
                          <td>
                                <Input type="button" name="delete" value="刪除" onclick="confirmDelete(${anEntry.key})" class="addBTn">
                                <Input type="button" name="delete" value="修改" onclick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})" class="addBTn">
                         </td>
                      </tr>
                      </c:forEach>
                        <tr><td colspan="5" align="right">訂單小計</td>
                            <td><span id="shoppingcart_money">${subtotal}</span>元</td>
                        </tr>
                    </tbody>
             </table>
        </div>
         <div class="return "> <!--繼續購物-->
            <form action="<c:url value='/shopping/ProcessOrder' />" method="POST" >
               <Input type='hidden' name='finalDecision' value='Order'>
                <a href="<c:url value='/shopping/listProduct' />"><button type="button" class="returnBtn">繼續購物</button></a>
                <Input type='submit' class="returnBtn" data-toggle="modal" data-target="#shoopingmodal" id="shopping_addButton" value='結帳'>
            </form>
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
</div>
    
        <!--這區塊是點選結算跳出視窗-->    
        <div class="modal fade" id="shoppingcart_paymoney">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <p>確認送出訂單?</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a href="shopping_cart2.html"><button type="button" class="btn btn-default">確認</button></a>
                    </div>
                </div>
            </div>
        </div>
               <script src="/js/jquery-3.4.1.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/index.js"></script>
        <script src="js/shopping_cart.js"></script>
        <script type="text/javascript">
        function confirmDelete(n) {
        	if (confirm("確定刪除此項商品 ? ") ) {
        		document.forms[0].action="<c:url value='/shopping/UpdateItem?cmd=DEL&bookId=" + n +"' />" ;
        		document.forms[0].method="POST";
        		document.forms[0].submit();
        	} else {
        	
        	}
        }
        
        function modify(key, qty, index) {
        	var x = "newQty" + index;
        	var newQty = document.getElementById(x).value;
        	if  (newQty < 0 ) {
        		window.alert ('數量不能小於 0');
        		return ; 
        	}
        	if  (newQty == 0 ) {
        		window.alert ("請執行刪除功能來刪除此項商品");
        		document.getElementById(x).value = qty;
        		return ; 
        	}
        	if  (newQty == qty ) {
        		window.alert ("新、舊數量相同，不必修改");
        		return ; 
        	}
        	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
        		document.forms[0].action="<c:url value='/shopping/UpdateItem?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
        		document.forms[0].method="POST";
        		document.forms[0].submit();
        	} else {
        		document.getElementById(x).value = qty;
        	}
        }
        </script>
</body>
</html>