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


// 導覽列功能設定
class StickyNavigation {
	constructor() {
	  this.currentId = null;
	  this.currentTab = null;
	  this.tabContainerHeight = 70;
	  let self = this;
	  $(".et-hero-tab").click(function () {
		self.onTabClick(event, $(this));
	  });
	  $(window).scroll(() => {
		this.onScroll();
	  });
	  // $(window).resize(() => {
	  //   this.onResize();
	  // });
	}
  
	onScroll() {
	  this.checkTabContainerPosition();
	}
  
	// 固定延展功能
	checkTabContainerPosition() {
	  let offset =
		$(".et-hero-tabs").offset().top +
		$(".et-hero-tabs").height() -
		this.tabContainerHeight;
	  if ($(window).scrollTop() > offset) {
		$(".et-hero-tabs-container").addClass("et-hero-tabs-container--top");
	  } else {
		$(".et-hero-tabs-container").removeClass("et-hero-tabs-container--top");
	  }
	}
  }
  
  window.addEventListener("load", doFirst);
  
  function doFirst() {
	new StickyNavigation();
  
	// 置頂鈕移動時間設定
	$(function () {
	  // 當點擊這個按鈕，自動捲動到網頁最上方，0.333秒完成捲動的動作
	  $("#backtop").click(function () {
		$("html,body").animate({ scrollTop: 0 }, 333);
	  });
  
	  $(window)
		.scroll(function () {
		  if ($(this).scrollTop() > 10) {
			$("#backtop").fadeIn(222);
		  } else {
			$("#backtop").stop().fadeOut(222);
		  }
		})
		.scroll();
	});
}
