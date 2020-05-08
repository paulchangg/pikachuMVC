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