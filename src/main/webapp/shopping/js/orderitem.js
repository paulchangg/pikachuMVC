

var seeBtn=document.getElementById('orderitem_rqcode');//span區塊
var printBtn=document.getElementById('print');

/*互動視窗跳出*/
seeBtn.addEventListener("click",function(){
    $('#orderitem_myModal').modal('show');
    mathway();
},false);

/*列印事件*/
printBtn.addEventListener("click",function(){
    window.print();
},false);


/*插入qrcode套件*/
jQuery('#qrcodeCanvas').qrcode({
    text: "http://jetienne.com"
});	