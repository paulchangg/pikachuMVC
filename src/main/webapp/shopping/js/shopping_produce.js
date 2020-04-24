$(document).ready(function(){
    $(".test").click(function(){
        alert("已加入購物車按鈕");
    })
}
)

$(function(){
	var t = $("#shoppinproduce_quantity");
	$("#shoppinproduce_add").click(function(){
		t.val(parseInt(t.val())+1);
		$("#shoppinproduce_min").removeAttr("disabled");                 //當按加1時，解除$("#min")不可讀狀態
	})
	$("#shoppinproduce_min").click(function(){
               if (parseInt(t.val())>1) {                     //判斷數量值大於1時才可以減少
                t.val(parseInt(t.val())-1)
                }else{
                $("#shoppinproduce_min").attr("disabled","disabled")        //當$("#min")為1時，$("#min")不可讀狀態
      }
	})
});