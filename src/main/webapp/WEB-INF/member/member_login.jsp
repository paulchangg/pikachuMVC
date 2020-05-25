<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員登入</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"rel="stylesheet">
<link rel="stylesheet" href="../css/member_login.css" />
<link rel="stylesheet" href="../css/wickedcss.min.css" />
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
</head>
 <body>
  <!-- 上方標題logo列----超連結待補----->
  <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <!-- <div class="container-fluid" style="height: 160px;background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);"> -->
    <!-- <div class="container-fluid" style="height: 160px;background-image: linear-gradient(to top, #f0f18f 25%, #f7a773 75%);"> -->

    <div class="row">
      <div class="col-sm">
        <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
        <p style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </p>
      </div>
      <div class="row justify-content-around">
        <div class="col-sm">
          <a href='<c:url value="/" />'>
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="cardcompare" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/shopping/listProduct" />' id="shoppingcart" style="color: rgb(92, 41, 7);">
              <i class="fas fa-shopping-cart"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

    <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
    <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列  -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href='<c:url value="/news/lastestNews"/>'>資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>


    <img src="../images/忘記密碼.png" id="imagefive">
    <img src="../images/迷彩-1.png" class="rollerLeft imageone" id="imagethree">

  <div class="centercard" id="centercardarea">
  <div class="row">
    <!-- 登入區塊表單  -->
    <div class="col-7 centertwo" id="centertwo">
      <form id="" name="frmlogin" method="post" action="login.do"
        onSubmit="return check()">
        <input type="hidden" name="csrf_test_name">

        <!-- 使用表格-->
        <h1 style="font-size: 30px;">會員登入</h1>
        <table class="tableareatotal">
          <tr>
            <td>
              帳號:
              <!-- 輸入帳號  --> <input class="validate[required,custom[email]]"
              type="text" name="account" id="memberlogin_id"
              value="${requestScope.user}${param.account}"
              autocomplete="off">

              <p>
                <Font color='red' size="-3">${ErrorMsgKey.AccountEmptyError}</Font>
              </p>
            </td>
          </tr>
          <!-- 輸入密碼  -->
          <!-- 認證碼輸入-->
          <tr>
            <td>密碼
              <input class="validate[required]" type="password"
              name="password" id="memberilogin_password"
              value="${requestScope.password}${param.password}"
              autocomplete="off"></br> <span style="font-size: 16px;">記住帳密</span> <input
              type="checkbox" name="rememberMe"
              <c:if test='${requestScope.rememberMe==true}'>                  
               checked='checked'
               </c:if>
              value="true"> <!-- 輸入密碼錯誤顯示區塊  -->
              <p>
                <Font color='red' size="-3">${ErrorMsgKey.PasswordEmptyError}</Font>
              </p>
              <p>
                <Font color='red' size="-1">${msg}${ErrorMsgKey.LoginError}&nbsp;</Font>
              </p></td>
          </tr>
          <tr>
            <td>
              <button type="submit" class="btn normal2 send" id="Button1">LOGIN
                登入</button> <br> <%-- <Font color='red' size="-1">${msg}${ErrorMsgKey.LoginError}&nbsp;</Font> --%>
            </td>
          </tr>
        </table>
      </form>
      <button type="button" id="forgetbtn">
        忘記密碼<i class='bx bx-question-mark'></i>
      </button>
      <a href="member_register" class="floater btn pure">還不是會員??快去註冊<i class='bx bxs-pencil'></i></a>
    </div>
  </div>
</div>

	
    <!-- 底部 ------>
  	<div
      id="backtop"
      class="gotop"
      style="text-align: center !important; margin-top: 50px;"
    >
      © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      <div id="icons">
        <ul>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-facebook"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-twitter"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-instagram"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-linkedin"></span>
          </li>
        </ul>
      </div>

      <br />
      <button type="button" id="back_bt" class="btn btn-secondary">
        To the top
      </button>
    </div>
    <!-- 忘記密碼區塊 Modal -->
	<div class="modal fade" id="myModal" role="dialog"
  aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title">忘記密碼</h1>
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 多用一個 form 表單包裝起來，之後送到後端 server  -->
<!-- 					<form action="" method="POST" id="my-form"> -->
        <div id="my-form">
          <label>請輸入您註冊的email</label>
          <p>
            <!-- 新增 id forget_email -->
            <input type="text" id="forget_email" name="email" value=""
              placeholder="註冊的電子信箱" autocomplete="off">
          </p>
          <!-- 新增 id forget_email_error_msg -->
          <div id="forget_email_error_msg"></div>
           <!-- <Font color='red' size="-3" id="forget_email_error_msg">${ErrorMsg.EmailError}${ErrorMsg.EmptyError}</Font>  -->
<!-- 					</form> -->
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="Button2">送出</button>
        <p>
          <!-- <Font color='green' size="-3">${OkMsg.sendSuccessfully}</Font>  -->
        </p>
      </div>
    </div>
  </div>
</div>
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/member_login.js"></script>
 </body>
</html>