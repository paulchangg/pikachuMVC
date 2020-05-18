$(document).ready(function() {
	var searchBar;
	$(".test").click(function() {
		alert("已加入購物車");
		$.ajax({
			url : '/pikachuMVC/shopping/buyProductAjax',
			type : 'post',
			data : {
				productId : $(this).attr("productId"),
				qty : $(this).attr("qty")
			},
			dataType : "text",
			success : function(response) {
				$('#shoppingCartItem').html('' + response);
			}

		});
	})
})

function b() {
	$('#searchblockone').html("");
}

function a() {
	// SELECT標籤
	$.ajax({
		url : '/pikachuMVC/shopping/queryProduct',
		type : 'get',
		data : {
			q : $('#shopping_keywords').val()
		},
		dataType : "json",
		success : function(response) {
			searchBar = response;
			var search = 0;
			var query = ""
			if (response.length > 5) {
				search = 5
			} else {
				search = response.length;
			}

			for (i = 0; i < search; i++) {

				query = query + "<li onclick='c()'><i class='bx bx-search' onclick='c(" + i +")'  id='search" + i + "'>" + response[i]+ "</i></li>";
			}

			$('#searchblockone').html(query);
		}

	});
}
function c(e) {
	$('#searchblockone').html("");
	$('#shopping_keywords').val(searchBar[e]);

}

function d(){
	$.ajax({
		url : '/pikachuMVC/shopping/searchProductAjax',
		type : 'post',
		data : {
			keywords : $('#shopping_keywords').val(),
		},
		dataType : "text",
		success : function(response) {
			console.log(response);
			document.forms[0].action = '/pikachuMVC/shopping/ajaxSearch';
			document.forms[0].method = 'get';
			document.forms[0].submit();
		}

	});
}