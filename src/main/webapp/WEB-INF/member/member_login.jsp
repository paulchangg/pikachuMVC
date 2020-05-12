<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員登入</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/member_login.css" />
<link rel="stylesheet" href="../css/wickedcss.min.css" />
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
</head>

<body>

<div class="container-fluid" style="height: 190px;">
       <div class="row">
          <div class="col-sm"> <!-- 左上角logo -->
             <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
             <p style="font-size: small;">
               快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
             </p>
         </div>
         <div class="row justify-content-around"> <!-- logo -->
           <div class="col-sm">
             <a href="index copy.html">
                <img src="../images/logo2.png" alt="logo" style="height: 230px;" />
             </a>
          </div>
        </div>
        <!-- 右上區塊 -->
        <div class="col-sm">
			<ul class="nav justify-content-end" style="font-size: 17px;">
			   <li class="nav-item">
				                 <a class="nav-link" href='<c:url value="/member/member_center" />' id="cardcompare"><i class='bx bx-user-circle' ></i>會員中心</a>
			  </li>  
			   <li class="nav-item">
			       <a class="nav-link" href='<c:url value="/shopping/listProduct" />' id="shoppingcart">
				    <i class="fas fa-shopping-cart"></i>
			   </a>
			 </li>
		   </ul>
		</div>
	   </div>
		  
           <!-- 導覽列 -->
      <div class="et-hero-tabs">
      <!-- 要改放圖片的話再修正 -->
      <!-- 導覽列  超連結待補 -->
         <div class="et-hero-tabs-container">
           <a class="et-hero-tab" href="#aboutus">關於我們</a>
           <a class="et-hero-tab" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡比較</a>
           <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
           <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
           <a class="et-hero-tab" href="#infoweb">資訊網</a>
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
      <!-- 回到置頂------>
       <div id="backtop" class="gotop">
         <h5>
            © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
         </h5>
         <br />
          <button type="button" class="btn btn-secondary">To the top</button>
      </div>
 
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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"></script>
<script src="../js/member_login.js"></script>
 </body>
</html>