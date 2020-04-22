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