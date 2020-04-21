<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/shopping_cart.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>購物車清單</title>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='/_04_ShoppingCart/UpdateItem.do?cmd=DEL&bookId=" + n +"' />" ;
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
		document.forms[0].action="<c:url value='/_04_ShoppingCart/UpdateItem.do?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>
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
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/shopping_cart.js"></script>
<div class="container">
    <div class="row ">
        <div class="col-12 p-3 logarea"><!--這裡開始為上方,呈現商標log位置-->
            ${LoginOK.m_id}皮卡丘商標位置
       </div>
       
       <nav class="col-12 navbar sticky-top navbar-expand-lg "><!--這裡開始為導覽頁-->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navConetnt">
           <span class="navbar-toggler-icon"></span>
          </button>
         <div class="collapse navbar-collapse " id="shopping_navContent">
            <ul class="navbar-nav ">
                 <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                 <li class="nav-item"><a class="nav-link" href="../trackproduct/listTrack">追蹤商品</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                 <li class="nav-item"><a class="nav-link" href="../listProduct/DisplayPageProducts">購物商城</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                 <li class="nav-item"><a class="nav-link" href="<c:url value='../orderProcess/orderList.do' />">我的訂單</a></li>
            </ul>
        </div>
       </nav>
        
       <!--這裡為步驟購物圖檔-->
       <div class="col-12 stepimg"><img src="image/參考圖.png" height="200px"></div>

       <!--這裡為購物清單-->
       <div class="col p-7">
           <h4>購物清單</h4>
              <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>商品名稱</th>
                        <th>優惠價</th>
                        <th>購買數量</th>
                        <th>剩餘庫存</th>
                        <th>商品小計</th>
                        <th>變更明細</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
                  <tr>
                     <td><a href="<c:url value='/listProduct/DisplayPageProducts?mode=show&productId=${entry.value.p_id}' />" id="shoppingcart_page"><img src="${pageContext.servletContext.contextPath}/init/getBookImage?id=${anEntry.value.p_id}" width="100px" id="shoppingcart_img">
                        ${anEntry.value.p_name} </a>
                     </td>
                     <td>原價<sapn id="shoppingcart_orp">${anEntry.value.price}</sapn>元
                     </td>
                     <td>
<!--                         <input id="shoppingcart_min" name="qty" type="button" value="-" />  按鈕的方法是用id寫得所以如果有第二筆物件就必須把方法裡面的id更換掉 -->
<%--                         <input id="shoppingcart_quantity" name="newQty${vs.index}" type="text" value="${anEntry.value.qty}" /> --%>
                        <Input id="newQty${vs.index}" style="width:70px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" name="qty" onkeypress="return isNumberKey(event)"  />
<!--                         <input id="shoppingcart_add" name="qty" type="button" value="+" /> -->
                     </td>
                     <td><span id="shoppingcart_stock">30</span></td>
                     <td>小計:<span id="shoppingcart_total">${anEntry.value.qty * anEntry.value.price}</span></td>
                     <td>
                        	<Input type="button" name="delete" value="刪除" onclick="confirmDelete(${anEntry.key})"><!--麻煩你寫了...智商過低我已經要陣亡Q_Q-->
                        	<Input type="button" name="delete" value="修改" onclick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})"><!--麻煩你寫了...智商過低我已經要陣亡Q_Q-->
                     </td>
                     
                  </tr>
                  </c:forEach>
                    <tr><td colspan="5" align="right">訂單小計</td>
                        <td><span id="shoppingcart_money">${subtotal}</span>元</td>
                    </tr>
                   
                   
                   
                </tbody>
             </table>
       </div>
        <div class="col-12 return"> <!--返回區塊-->
       
        <form action="<c:url value='../_04_ShoppingCart/ProcessOrder.do' />" method="POST" >
        	  <Input type='hidden' name='finalDecision' value='Order'>
        	  <a href="<c:url value='../listProduct/DisplayPageProducts' />"><button type="button" class="btn btn-warning">繼續購物</button></a>
        	  <Input type='submit' class="btn btn-warning" data-toggle="modal" data-target="#shoopingmodal" id="shopping_addButton" value='結帳'>
		</form>
        </div>
        <div class="col-12 footer" >尾巴</div><!--這區塊首頁出來套版-->
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
</body> 
</html>    