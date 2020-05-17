$(document).ready(function(){
    $(".test").click(function(){
        alert("已加入購物車");
    	$.ajax({
			url: '/pikachuMVC/shopping/buyProductAjax',
			type: 'post',
			data: { productId: $(this).attr("productId"),
					qty: $(this).attr("qty")
			},
			dataType: "html",
			success:function(response){
				console.log("55");
			}

		});
    })
})


