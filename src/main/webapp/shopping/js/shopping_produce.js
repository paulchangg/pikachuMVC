$(document).ready(function(){
    $("#addShop").click(function(){
        alert("已加入購物車");
        $.ajax({
			url: '/pikachuMVC/shopping/buyProductAjax',
			type: 'post',
			data: { productId: $(this).attr("productId"),
					qty: $('#shoppinproduce_quantity').val()
			},
			dataType: "html",
			success:function(response){
				console.log("55");
			}
		});
    })
     $("#addTrack").click(function(){
        alert("已加入追蹤");
        $.ajax({
			url: '/pikachuMVC/shopping/addtrackproductAjax',
			type: 'post',
			data: { productId: $(this).attr("productId"),
			},
			dataType: "html",
			success:function(response){
				console.log("55");
			}
		});
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