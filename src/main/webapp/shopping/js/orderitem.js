

var seeBtn=document.getElementsByClassName('orderitem_rqcode');//span區塊
var printBtn=document.getElementById('print');

/*互動視窗跳出*/


/*列印事件*/
printBtn.addEventListener("click",function(){
    window.print();
},false);



$(document).ready(function() {
	$('.orderitem_rqcode').click(function(){
		let url = '/pikachuMVC/shopping/getQRcode/'+$(this).attr('ordid')+'/'+$(this).attr('produtId')
		$('#orderitem_myModal').modal('show');
		$('#qrCodeImg').attr('src',url);
		
	})
})