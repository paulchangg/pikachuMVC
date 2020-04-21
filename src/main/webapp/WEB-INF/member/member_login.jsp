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
<link rel="stylesheet" href="../css/common/member_login.css" />
<link rel="stylesheet" href="../css/common/wickedcss.min.css" />
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
</head>

<body>


	<div class="flex-container">
		<div class="header">
			<div class="logoimg">
				<img src="../images/common/logo.png" width="180px" height="100px">
			</div>
			<div class="toparea">
				<c:if test="${ ! empty sessionScope.timeOut }">
					<!-- 表示使用逾時，重新登入 -->
					<c:set var="msg"
						value="<font color='red'>${sessionScope.timeOut}</font>" />
				</c:if>
			</div>
		</div>

		<section class="top_navi">
			<nav>
				<a href="#">關於我們</a> <a href="member_center">會員中心</a> <a
					href="#">論壇交友</a> <a href="#">商城</a> <a href="#">資訊網</a>
			</nav>
		</section>


		<!-- 中間區塊  -->
		<div class="centercard">
			<div class="logintitle">
				<div class="logintitletext">尊爵貴賓卡</div>
			</div>
			<div class="row">
				<div class="col-2  hahaha">
					<img src="../images/common/login_晶片圖.png" class="loginimgone">
				</div>
				<!-- 登入區塊表單  -->
				<div class="col-7">
					<form id="" name="frmlogin" method="post" action="login.do"
						onSubmit="return check()">
						<input type="hidden" name="csrf_test_name">

						<!-- 使用表格-->
						<h1 style="font-size: 30px;">會員登入</h1>
						<table class="tableareatotal">
							<tr>
								<td>
									<!-- 輸入帳號  --> <input class="validate[required,custom[email]]"
									type="text" name="account" id="memberlogin_id"
									value="${requestScope.user}${param.account}"
									placeholder="請輸入帳號" autocomplete="off">

									<p>
										<Font color='red' size="-3">${ErrorMsgKey.AccountEmptyError}</Font>
									</p>
								</td>
							</tr>
							<!-- 輸入密碼  -->
							<!-- 認證碼輸入-->
							<tr>
								<td><input class="validate[required]" type="password"
									name="password" id="memberilogin_password"
									value="${requestScope.password}${param.password}"
									placeholder="請輸入密碼" autocomplete="off"></br> 記住帳密 <input
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
<!-- 							<tr> -->
<!-- 								<td> -->
<!-- 									<div class="input_code"> -->
<!-- 										<input type="text" id="inputCode" placeholder="驗證碼無大小寫" /> -->
<!-- 										<p> -->
<!-- 											<span id="text_show"></span> -->
<!-- 										</p> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							認證碼圖形 -->
<!-- 							<tr> -->
<!-- 								<td> -->
<!-- 									<div class="v_code"> -->
<!-- 										<div class="code_show"> -->
<!-- 											<span class="code" id="memberregister_img"></span> -->
<!-- 											<p> -->
<!-- 												<a id="linkbt">看不清換一張</a> -->
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<!-- 登入按鈕-->
							<tr>
								<td>
									<button type="submit" class="btn normal2 send" id="Button1">LOGIN
										登入</button> <br> <%-- <Font color='red' size="-1">${msg}${ErrorMsgKey.LoginError}&nbsp;</Font> --%>
								</td>
							</tr>
						</table>
					</form>
					<button type="button" class="btn btn-outline-danger" id="forgetbtn">
						忘記密碼<i class='bx bx-question-mark'></i>
					</button>
					<a href="member_register" class="btn pure">還不是會員??快去註冊>></a>
				</div>
				<div class="col-1 ">
					<img src="../images/common/login_歡迎回來.png" class="loginthtree">
				</div>
				<img src="../images/common/login_交友脫單.png" class="loginfour">

				<div class="col-1 testimg">
					<img src="../images/common/login_皮卡丘出來.png" class="loginimgtwo">
				</div>
			</div>
		</div>

		<!-- 尾巴區塊  -->
		<div class="site_footer">
			<div class="gotop">
				<h4>© Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
				</br>
			</div>
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




	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
		
	</script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous">
		
	</script>
	<script src="../js/member_login.js"></script>
</body>
</html>