/*密碼顯示 */
function myFunction() {
  var x = document.getElementById("register_password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

/*建立密碼相符的方法*/

function passwordway(){
   var passwordone=document.getElementById('register_password').value;  //密碼值
   var passwordtwo=document.getElementById('register_passwordtwo').value; //再次確認密碼值
   var passwordtext=document.getElementById('register_passwordtext'); //顯示錯誤訊息

  
   if ( passwordtwo.length<=0) {
    passwordtext.innerHTML = "不可為空";
    passwordtext.style.color = "red";
  
  } 
  else if(passwordone !== passwordtwo){
    passwordtext.innerHTML = "密碼不相符";
    passwordtext.style.color = "red";

  }
  else {
    passwordtext.innerHTML = "密碼相符";
    passwordtext.style.color = "green";
  }

}

/*密碼表單更改狀態時*/
function changepassword(){
  var el=document.getElementById('register_passwordtwo');   
   el.onchange=function(){
    passwordway();
   }
  }
  


/*建立驗證碼的方法*/ 
var code; //宣告一個變數用來儲存驗證碼
function createCode() { 
  code = "";
  var codeLength = 6; //驗證碼的長度
  var checkCode = document.getElementById("memberregister_img");
  var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
       'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
  for (var index = 0; index < codeLength; index++) {    //通過for迴圈犯事建立一個長度為6的驗證碼字串。
    var charNum = Math.floor(Math.random() * 52);
    code += codeChars[charNum];
  }
  if (checkCode) {
    checkCode.className = "code";
    checkCode.innerHTML = code;
  }
}


/*驗證功能*/



function validateCode() { 
  var inputCode = document.getElementById("inputCode").value; //獲取輸入驗證碼的值。
  var textShow = document.getElementById("text_show") //獲取要顯示警告與的元素物件。
  
  textShow.style.fontSize="18px";

  if (inputCode.length <= 0) {
    textShow.innerHTML = "請輸入驗證碼,無大小寫";
    textShow.style.color = "red";


  } else if (inputCode.toUpperCase() != code.toUpperCase()) {
    textShow.innerHTML = "手殘嗎?輸入的驗證碼有誤";
    textShow.style.color = "red";
    createCode();

  
  } else {
    textShow.innerHTML = "驗證碼正確";
    textShow.style.color = "green";
  }
}



/* 網頁載入時產生*/
window.onload = function () {
  passwordway()//檢查密碼驗證功能
  changepassword()//密碼確認更改狀態時
  createCode();    //建立驗證碼表單
  validateCode();  //檢查驗證碼功能
  changebtn()//驗證碼輸入內容改變時
  document.getElementById("memberregister_img").onclick = function () { createCode() } //驗證碼圖片
  linkbt.onclick = function () { createCode() }  //重新產生文字
}


/*此方法為當輸入狀態改變時*/
function changebtn(){
var el=document.getElementById('inputCode');   
 el.onchange=function(){
  validateCode();
 }
}



/*這個方法放在form裡面的onSubmit裡 預設是true所以怎麼都可以送出 要是要停止送出要由這裡更改*/
function check(){

  var inputCode = document.getElementById("inputCode").value; //獲取輸入驗證碼的值。
  var passwordone=document.getElementById('register_password').value;  //密碼值
  var passwordtwo=document.getElementById('register_passwordtwo').value; //再次確認密碼值
  
  if(inputCode == null || inputCode == "")
	  {
	     return false;
	  }
  else if(inputCode.toUpperCase() != code.toUpperCase())
	  {
	     return false;
	  }
  else if(passwordone !== passwordtwo)
	  {
	      return false;
	  }
    return true;
}