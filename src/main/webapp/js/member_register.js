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

function passwordway() {
  var passwordone = document.getElementById("register_password").value; //密碼值
  var passwordtwo = document.getElementById("register_passwordtwo").value; //再次確認密碼值
  var passwordtext = document.getElementById("register_passwordtext"); //顯示錯誤訊息

  if (passwordtwo.length <= 0) {
    passwordtext.innerHTML = "不可為空";
    passwordtext.style.color = "red";
  } else if (passwordone !== passwordtwo) {
    passwordtext.innerHTML = "密碼不相符";
    passwordtext.style.color = "red";
  } else {
    passwordtext.innerHTML = "密碼相符";
    passwordtext.style.color = "green";
  }
}

/*密碼表單更改狀態時*/
function changepassword() {
  var el = document.getElementById("register_passwordtwo");
  el.onchange = function () {
    passwordway();
  };
}

/*建立驗證碼的方法*/

var code; //宣告一個變數用來儲存驗證碼
function createCode() {
  code = "";
  var codeLength = 6; //驗證碼的長度
  var checkCode = document.getElementById("memberregister_img");
  var codeChars = new Array(
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  );
  for (var index = 0; index < codeLength; index++) {
    //通過for迴圈犯事建立一個長度為6的驗證碼字串。
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
  var textShow = document.getElementById("text_show"); //獲取要顯示警告與的元素物件。

  textShow.style.fontSize = "18px";

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
// window.onload = function () {
//   passwordway()//檢查密碼驗證功能
//   changepassword()//密碼確認更改狀態時
//   createCode();    //建立驗證碼表單
//   validateCode();  //檢查驗證碼功能
//   changebtn()//驗證碼輸入內容改變時
//   document.getElementById("memberregister_img").onclick = function () { createCode() } //驗證碼圖片
//   linkbt.onclick = function () { createCode() }  //重新產生文字
// }

/*此方法為當輸入狀態改變時*/
function changebtn() {
  var el = document.getElementById("inputCode");
  el.onchange = function () {
    validateCode();
  };
}

/*這個方法放在form裡面的onSubmit裡 預設是true所以怎麼都可以送出 要是要停止送出要由這裡更改*/
function check() {
  var inputCode = document.getElementById("inputCode").value; //獲取輸入驗證碼的值。
  var passwordone = document.getElementById("register_password").value; //密碼值
  var passwordtwo = document.getElementById("register_passwordtwo").value; //再次確認密碼值

  if (inputCode == null || inputCode == "") {
    return false;
  } else if (inputCode.toUpperCase() != code.toUpperCase()) {
    return false;
  } else if (passwordone !== passwordtwo) {
    return false;
  }
  return true;
}

window.addEventListener("load", doFirst);
function doFirst() {
  let registerForm = document.getElementById("registerForm");
  let Button1 = document.getElementById("Button1");
  Button1.addEventListener("click", valid);

  let account = document.getElementsByName("account");
  let password = document.getElementsByName("password");
  let name = document.getElementsByName("name");
  let email = document.getElementsByName("email");
  let gender = document.getElementsByName("gender");
  let phone_num = document.getElementsByName("phone_num");
  let birthday = document.getElementsByName("birthday");

  let accountError = document.getElementById("accountError");
  let passwordError = document.getElementById("passwordError");
  let nameError = document.getElementById("nameError");
  let emailError = document.getElementById("emailError");
  let genderError = document.getElementById("genderError");
  let phone_numError = document.getElementById("phone_numError");
  let birthdayError = document.getElementById("birthdayError");

  function valid() {
    console.log('!!!!!!!!!!!!!!!!!!!');
    accountError.innerText = "";
    passwordError.innerText = "";
    nameError.innerText = "";
    emailError.innerText = "";
    genderError.innerText = "";
    phone_numError.innerText = "";
    birthdayError.innerText = "";

    var url = "validRegister";
    var data = {
      account: account[0].value,
      password: password[0].value,
      name:name[0].value,
      email: email[0].value,
      gender: gender[0].value,
      phone_num: phone_num[0].value,
      birthday: birthday[0].value,
    };

    $.post(
      url,
      data,
      function (data, textStatus, jqXHR) {
        for (let key in data) {
          if (data.hasOwnProperty(key)) {
            switch (key) {
              case "errorIdEmpty":
                accountError.innerText = data[key];
                break;
              case "errorIdDup":
                accountError.innerText = data[key];
                break;
              case "errorPasswordEmpty":
                passwordError.innerText = data[key];
                break;
              case "errorNameEmpty":
                nameError.innerText = data[key];
                break;
              case "passwordError":
                passwordError.innerText = data[key];
                break;
              case "errorEmailEmpty":
                emailError.innerText = data[key];
                break;  
              case "emailError":
                emailError.innerText = data[key];
                break;
              case "errorEmailDup":
                emailError.innerText = data[key];
                break;  
              case "errorGenderEmpty":
                genderError.innerText = data[key];
                break;
              case "errorPhoneEmpty":
                phone_numError.innerText = data[key];
                break;
              case "phoneError":
                phone_numError.innerText = data[key];
                break;
              case "errorBirthdayEmpty":
                birthdayError.innerText = data[key];
                break;
              case "ok":
                alert("驗證信已寄出，請至註冊信箱啟用帳號");
                registerForm.submit();
                break;
              default:
                console.log("註冊檢核error");
                  
            }
          }
        }
        return;
      },
      "json"
    );
  }
}
