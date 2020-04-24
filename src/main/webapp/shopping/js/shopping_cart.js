$(function(){
	var t = $("#shoppingcart_quantity");
	$("#shoppingcart_add").click(function(){
		t.val(parseInt(t.val())+1);
		$("#shoppingcart_min").removeAttr("disabled");                 //當按加1時，解除$("#min")不可讀狀態
	})
	$("#shoppingcart_min").click(function(){
               if (parseInt(t.val())>1) {                     //判斷數量值大於1時才可以減少
                t.val(parseInt(t.val())-1)
                }else{
                $("#shoppingcart_min").attr("disabled","disabled")        //當$("#min")為1時，$("#min")不可讀狀態
      }
	})
});

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