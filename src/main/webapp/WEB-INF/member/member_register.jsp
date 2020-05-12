<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>成為比卡丘會員</title>
<link
rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="../css/member_register.css" />'/>
<link rel="stylesheet" href='<c:url value="../css/wickedcss.min.css" />'/>
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
				
			   </li>   
			  <li class="nav-item">

			  </li>
			</ul>
		   </div>
		</div>
		 <div class="et-hero-tabs">
	   <!-- 導覽列  超連結待補 -->
		  <div class="et-hero-tabs-container">
			<a class="et-hero-tab" href="#aboutus">關於我們</a>
			<a class="et-hero-tab" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡比較</a>
			<a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
			<a class="et-hero-tab" href="#mall">商城</a>
			<a class="et-hero-tab" href="#infoweb">資訊網</a>
			<span class="et-hero-tab-slider"></span>
		 </div>
		 </div>

	   <div class="floater toparea">
			您現在的身分為訪客,已有會員帳號了嗎? <a href="member_login" style="color: #FF5964; font-size: 25px;">快來登入<i class='bx bx-happy-alt'></i> </a>
	 </div> 
	  <!---------------------表單區塊-------------------------------->
	      <div class="col-4 centerarea">
			 <div  class="formtablearea" id="formtableareafrom">
			    <h2 class="titlemember" style="margin-bottom: 3%;">成為會員</h2>
			       <form id="" name="frmlogin" method="post" action="register.do" onSubmit="return check()" >
					  <input type="hidden" name="csrf_test_name"><!-----???不知道是甚麼東西?後端測試用的嗎----->
					  
					  <!---------------------表格-------------------------------->
					  <table class="table01">
				         <tr>
						     <th><label >會員帳號</label></th> <!-----帳號----->
						     <td>  
							     <input class="validate[required,custom[email]]"
							     type="text" name="account" id="signup_id" value="${param.account}"
							     placeholder="由英文與數字組成"  autocomplete="off"><br>
							    <font color="red" size="-1">${MsgMap.errorIdEmpty}${MsgMap.errorIdDup}</font>
						     </td>
					      </tr>	  
					       <tr>
					          <th><label>密碼</label></th><!-----密碼----->
					          <td> 
								  <input class="validate[required]"
								  type="password" name="password" id="register_password"
						          value="" placeholder="密碼長度需8位數字以上" 
								  autocomplete="off">
								  <input type="checkbox" onclick="myFunction()">顯示<br>
								  <span style="font-size: 15px; color: red;">8碼以上的英文大小寫+數字特殊符號@#組成</span><br>
								  <font color="red" size="-1">
						          ${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font>
					         </td>
						 </tr> 
					      <tr>
			                  <th><label class="required">姓名</label></th><!-----姓名----->
					          <td>
						        <input type="text" name="name" placeholder=" 請輸入中文姓名"  value="${param.name}" style="width: 15rem;"><br>
						        <font color="red" size="-1">${MsgMap.errorNameEmpty}</font>
						      </td>
					     </tr>
					      <tr>
					         <th><label class=" required">電子郵件</label></th><!-----電子郵件----->
					         <td>
                                 <input
						          class=" validate[required,custom[email]]"
						          type="text" name="email" id="signup_mail" value="${param.email}"
							      placeholder="請輸入電子郵件"  autocomplete="off"><br>
						          <font color="red" size="-1">${MsgMap.errorEmailEmpty}${MsgMap.emailError}${MsgMap.errorEmailDup}</font>
						     </td>
					     </tr> 
                          <tr>
						      <th><label class="required">性別</label></th> <!-----性別----->
					          <td>
							     <input type="radio" name="gender" value="male" >&nbsp;男
							     <input type="radio" name="gender" value="female" >&nbsp;女<br>
							     <font color="red" size="-1">${MsgMap.errorGenderEmpty}</font>
						     </td>
					     </tr>	  
				         <tr>
							  <th><label class="required">手機</label></th><!-----手機----->
							  <td>
						         <input type="text" name="phone_num" placeholder=" 輸入10位數字"  value="${param.phone_num}" style="width: 15rem;"><br>
							     <font color="red" size="-1">${MsgMap.errorPhoneEmpty}${MsgMap.phoneError}</font>
							 </td>
						 </tr>
                         <tr>
							 <th><label class="required">生日</label></th><!-----生日----->
					         <td>
						        <input type="date" name="birthday" value="${param.birthday}"><br>
						        <font color="red" size="-1">${MsgMap.errorBirthdayEmpty}</font>
						     </td>
						 </tr>
					  </table>   
					      <input type="submit" value="確認送出" id="Button1">
				  </form>
			 </div>
		 </div>
	
			<img src="../images/會員對話01.png" class="imageconvone">
			<img src="../images/比卡丘黃色沒電波.png" class="hahapickhubig">
		    <img src="../images/加入會員1.png" class="imageconvtwo">
			<img src="../images/比卡丘黃色沒電波翻轉.png" class="hahapickhu">
	           
      <!-- 尾巴---------------------------------------->
	  <div id="backtop" class="gotop">
		<h5>
		   © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
		</h5>
		<br />
		 <button type="button" class="btn btn-secondary">To the top</button>
	 </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"></script>
<script src="../js/meber_register2.js"></script>
<script src="../js/member_register.js"></script>
</body>
</html>