$(document).ready(function(){
	var searchBar;
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


function b(){
   		 $('#searchblockone').html("");
   	  }
   	  
   	  
   
      function a() {
        // SELECT標籤
    	  $.ajax({
  			url: '/pikachuMVC/shopping/queryProduct',
  			type: 'get',
  			data: { q: $('#shopping_keywords').val()
  			},
  			dataType: "json",
  			success:function(response){
  				  searchBar = response;
  	              var search = 0;
  	              var query = ""
  	              if( response.length > 5){
  	            	  search = 5
  	              }else{
  	            	  search = response.length;
  	              }
  	              
  	              for( i=0 ; i<search ; i++){
  	            	  
  	            	  query = query + "<li><i class='bx bx-search' onclick='c("+i+")'  id='search"+i+"'>"+response[i]+"</i></li>";
  	              }
  	              
  	              
  	              $('#searchblockone').html(query);  
  			}

  		});
      }
      function c(e){
    	  $('#searchblockone').html("");
    	  $('#shopping_keywords').val(searchBar[e]);
    	  
    	  console.log(searchBar[e]);
      }
