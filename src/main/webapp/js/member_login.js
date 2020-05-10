
/*建立驗證碼的方法*/ 
//var code; //宣告一個變數用來儲存驗證碼
//function createCode() { 
//  code = "";
//  var codeLength = 6; //驗證碼的長度
//  var checkCode = document.getElementById("memberregister_img");
//  var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
//       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
//       'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
//  for (var index = 0; index < codeLength; index++) {    //通過for迴圈犯事建立一個長度為6的驗證碼字串。
//    var charNum = Math.floor(Math.random() * 52);
//    code += codeChars[charNum];
//  }
//  if (checkCode) {
//    checkCode.className = "code";
//    checkCode.innerHTML = code;
//  }
//}


/*驗證功能*/



//function validateCode() { 
//  var inputCode = document.getElementById("inputCode").value; //獲取輸入驗證碼的值。
//  var textShow = document.getElementById("text_show") //獲取要顯示警告與的元素物件。
//  
//  textShow.style.fontSize="15px";
//
//  if (inputCode.length <= 0) {
//    textShow.innerHTML = "請輸入驗證碼";
//    textShow.style.color = "red";
//
//
//  } else if (inputCode.toUpperCase() != code.toUpperCase()) {
//    textShow.innerHTML = "手殘嗎?輸入的驗證碼有誤";
//    textShow.style.color = "red";
//    createCode();
//
//  
//  } else {
//    textShow.innerHTML = "驗證碼正確";
//    textShow.style.color = "green";
//  }
//}



///* 網頁載入時產生*/
//window.onload = function () {
//  createCode();    //建立驗證碼表單
////  validateCode();  //檢查驗證碼功能
//  changebtn()//驗證碼輸入內容改變時
//  document.getElementById("memberregister_img").onclick = function () { createCode() } //驗證碼圖片
//  linkbt.onclick = function () { createCode() }  //重新產生文字
//}

//
///*此方法為當輸入狀態改變時*/
//function changebtn(){
//var el=document.getElementById('inputCode');   
// el.onchange=function(){
//  validateCode();
// }
//}
//
//
//
///*這個方法放在form裡面的onSubmit裡 預設是true所以怎麼都可以送出 要是要停止送出要由這裡更改*/
//function check(){
//
//	  var inputCode = document.getElementById("inputCode").value; //獲取輸入驗證碼的值。
//	  
//	  if(inputCode == null || inputCode == "")
//		  {
//		     return false;
//		  }
//	  else if(inputCode.toUpperCase() != code.toUpperCase())
//		  {
//		     return false;
//		  }
//	    return true;
//}


/*忘記密碼的按鈕啟動視窗*/
var startbtn=document.getElementById('forgetbtn');

startbtn.addEventListener("click",function(){
//  $('#myModal').modal('show');},false)
	$('#myModal').modal({backdrop:'static', keyboard: false})},false)
  


//  以下有調整
// var isAllowToSubmit = false;
// var submitbtn = document.getElementById("Button2");
// submitbtn.addEventListener(
//   "click",
//   function () {
//     if(isAllowToSubmit){
//       $("#my-form").submit();
//     }
//   },
//   false
// );

// // check email existing
// $("#forget_email").on("change", function () {
//   var url = "/pikachu/member/forgetPW.do";
//   var data = {
//     email: $("#forget_email").val(),
//   };

//   $.post(
//     url,
//     data,
//     function (data, textStatus, jqXHR) {
//       if (data) {
//         isAllowToSubmit = true;
//         $('#forget_email_error_msg').html("<Font color='green' size='-3'>驗證信已寄送成功</Font>");
        
//         window.location.replace("/pikachu/member/member_login.jsp");
//       } else {
//         isAllowToSubmit = false; 
//         $('#forget_email_error_msg').html("<Font color='red' size='-3'>這個使用者好像不存在喔！</Font>");
//       }
//     },
//     "json"
//   );
// });


let bt = document.getElementById('Button2');
bt.addEventListener('click', () => {
    var url = "forgetPW.do";
    var data = {
      email: $("#forget_email").val(),
    };

    $.post(
      url,
      data,
      function (data, textStatus, jqXHR) {
        if (data) {
          // isAllowToSubmit = true;
          $('#forget_email_error_msg').html("<Font color='green' size='-3'>驗證信已寄送成功</Font>");
          
          window.location.replace("/pikachuMVC/member/member_login");
        } else {
          // isAllowToSubmit = false; 
          $('#forget_email_error_msg').html("<Font color='red' size='-3'>這個使用者好像不存在喔！</Font>");
        }
      },
      "json"
    );


})


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
    // this.findCurrentTabSelector();
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
        if ($(this).scrollTop() > 50) {
          $("#backtop").fadeIn(100);
        } else {
          $("#backtop").stop().fadeOut(222);
        }
      })
      .scroll();
  });
}

