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
		  if ($(this).scrollTop() > 300) {
			$("#backtop").fadeIn(222);
		  } else {
			$("#backtop").stop().fadeOut(222);
		  }
		})
		.scroll();
	});
  
	let aboutBtn = document.getElementById("aboutBtn");
	aboutBtn.addEventListener("click", () => {
	  window.location.href = "/pikachuMVC/about_us";
	});
  }
  



// 發布新活動的上傳圖片
$(document).ready(function() {
    $("#inputImg").fileinput({
		showClose:false,
		showCaption:false,
		showRemove: false,
		showCancel:false,
        showUpload: false,
        dropZoneEnabled: false,
        maxFileCount: 10,
        mainClass: "input-group-lg"
    });
    $('#postArticleBtn').click(function(){
    	var img = $('#inputImg');
    	var item = img[0].files;
    	var size;
    	
    	try {
    			size = item[0].size;
    		}
    		catch (e) {
    		    size = 0;
    		}
    	
    	$.ajax({
			url: '/pikachuMVC/articleForum/checkData',
			type: 'post',
			data: { postArticle_fourm: $('#postArticle_fourm').val(),
					postArticle_title: $('#postArticle_title').val(),
					postArticle_content: $('#postArticle_content').val(),
					imgSize: size
					
			},
			dataType:"json",
			success:function(response){
				var flag = response.check ==="false" ? false : true;
				
				if(flag){
					document.forms[0].submit();			
				}else{
					$('#postArticle_fourmError').html("發文看板&nbsp;&nbsp;&nbsp;&nbsp;<Font color='green' size='-3'>"+response.postArticle_fourm+"</Font>");
					$('#postArticle_titleError').html("文章標題&nbsp;&nbsp;&nbsp;&nbsp;<Font color='green' size='-3'>"+response.postArticle_title+"</Font>")
					$('#postArticle_contentError').html("文章內文&nbsp;&nbsp;&nbsp;&nbsp;<Font color='green' size='-3'>"+response.postArticle_content+"</Font>");
					$('#inputImgError').html("文章照片&nbsp;&nbsp;&nbsp;&nbsp;<Font color='green' size='-3'>"+response.imgSize+"</Font>");
				}
			}

		}); 	
    })
});

// 修改頁面的上傳圖片
$(document).ready(function() {
    $("#input-b7").fileinput({
		showClose:false,
		showCaption:false,
		showRemove: false,
		showCancel:false,
        showUpload: false,
        dropZoneEnabled: false,
        maxFileCount: 10,
        mainClass: "input-group-lg"
    });
});