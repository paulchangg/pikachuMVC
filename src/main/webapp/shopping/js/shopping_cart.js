 $(document).ready(function(){
        	$('#shopping_addButton').click(function(){
        		$.ajax({
        			url: '/pikachuMVC/shopping/checkData',
        			type: 'post',
        			data: { 
        			},
        			dataType:"text",
        			success:function(response){
        				var flag = response ==="false" ? false : true;
        				console.log("yes");
        				if(flag){
        					console.log("submit");
        					document.forms[1].submit();			
        				}else{
        					console.log("Nosubmit");
        					$('#errorCheck').html("購物清單<br><Font color='green' size='-1'>購物車沒商品</Font>");
        			
        				}
        			}

        		}); 	
        	})
        })

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