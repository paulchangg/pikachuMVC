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
crossorigin="anonymous"
/>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/css/common/member_register.css" />'/>
<link rel="stylesheet" href='<c:url value="/css/common/wickedcss.min.css" />'/>

</head>
<body>
  <div class="flex-container">
	  <div class="header">
		  <div class="logoimg">
			  <img src="<c:url value="/images/common/logo.png" />" width="180px" height="100px">
		  </div>
		  <div class="toparea">
			  <span class="toptext">您現在的身分為訪客 已有會員帳號了嗎?快來 
				  <a href="member_login" style="color: #776C5B;">
				  <i class="fa fa-user-circle" id="memberlogin">登入</i>
			     </a>
			 </span>
		   </div>
	  </div>

	  <!---------------------表單區塊-------------------------------->
	      <div class="centerarea">
			 <div  class="col-7 formtablearea">
			    <h1 class="titleh1">成為會員</h1>
			       <form id="" name="frmlogin" method="post" action="register.do" onSubmit="return check()" >
					  <input type="hidden" name="csrf_test_name"><!-----???不知道是甚麼東西?後端測試用的嗎----->
					  
					  <!---------------------表格-------------------------------->
					  <table class="table01">
				         <tr>
						     <th><label >會員帳號</label><p>Your ID</p></th> <!-----帳號----->
						     <td>  
							     <input class="validate[required,custom[email]]"
							     type="text" name="account" id="signup_id" value="${param.account}"
							     placeholder="由英文與數字組成"  autocomplete="off">
							    <font color="red" size="-1">${MsgMap.errorIdEmpty}${MsgMap.errorIdDup}</font>
						     </td>
					      </tr>	  
					       <tr>
					          <th><label>密碼</label><p>Password</p></th><!-----密碼----->
					          <td> 
								  <input class="validate[required]"
								  type="password" name="password" id="register_password"
						          value="" placeholder="8碼以上的英文大小寫與數字特殊符號@#組成" 
								  autocomplete="off"> 
								  <input type="checkbox" onclick="myFunction()">顯示
								  <font color="red" size="-1">
						          ${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font>
					         </td>
						 </tr> 
<!-- 						 <tr> -->
<!-- 							<th><label>密碼確認</label><p>Comfirm Password</p></th>---密碼確認--- -->
<!-- 							<td>  -->
<!-- 								<input class="validate[required]" -->
<!-- 								type="password" name="password" id="register_passwordtwo" -->
<!-- 								value="" autocomplete="off" placeholder="請再次輸入您的密碼" > -->
<!-- 								<span id="register_passwordtext"></span> -->
<!-- 						   </td> -->
<!-- 					   </tr>  -->
					      <tr>
			                  <th><label class="required">姓名</label><p>Your name</p></th><!-----姓名----->
					          <td>
						        <input type="text" name="name" placeholder=" 請輸入中文姓名"  value="${param.name}"><br>
						        <font color="red" size="-1">${MsgMap.errorNameEmpty}</font>
						      </td>
					     </tr>
					      <tr>
					         <th><label class=" required">電子郵件</label><p>E-mail</p></th><!-----電子郵件----->
					         <td>
                                 <input
						          class=" validate[required,custom[email]]"
						          type="text" name="email" id="signup_mail" value="${param.email}"
							      placeholder="請輸入電子郵件"  autocomplete="off">
						          <font color="red" size="-1">${MsgMap.errorEmailEmpty}${MsgMap.emailError}${MsgMap.errorEmailDup}</font>
						     </td>
					     </tr> 
                          <tr>
						      <th><label class="required">性別</label><p>Gender</p></th> <!-----性別----->
					          <td>
							     <input type="radio" name="gender" value="male" >&nbsp;男
							     <input type="radio" name="gender" value="female" >&nbsp;女
							     <font color="red" size="-1">${MsgMap.errorGenderEmpty}</font>
						     </td>
					     </tr>	  
				         <tr>
							  <th><label class="required">手機</label><p>Phone</p></th><!-----手機----->
							  <td>
						         <input type="text" name="phone_num" placeholder=" 輸入10位數字"  value="${param.phone_num}"><br>
							     <font color="red" size="-1">${MsgMap.errorPhoneEmpty}${MsgMap.phoneError}</font>
							 </td>
						 </tr>
                         <tr>
							 <th><label class="required">生日</label><p>Birthday</p></th><!-----生日----->
					         <td>
						        <input type="date" name="birthday" value="${param.birthday}"><br>
						        <font color="red" size="-1">${MsgMap.errorBirthdayEmpty}</font>
						     </td>
						 </tr>
<!-- 						 <tr> -->
<!-- 							<td> -->
<!-- 						      	<div class="v_code"> -->
<!-- 								    <div class="code_show"> -->
<!-- 								    <span class="code" id="memberregister_img"></span> -->
<!-- 								    <a id="linkbt">看不清換一張</a> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<div class="input_code"> -->
<!-- 								    <label for="inputCode"></label> -->
<!-- 								    <input type="text" id="inputCode"/> -->
<!-- 								    <p><span id="text_show"></span></p> -->
<!-- 								</div> -->
<!-- 							</td> 	   -->
<!-- 						 </tr> -->
					  </table>   
					      <input type="submit" value="確認送出" id="Button1">
				  </form>
			 </div>
			 
			 <div class="col-4 centerimg">
				 <img src="<c:url value="/images/common/register_皮卡丘.png" />" width="500px" height="450px" class="pulse">
			 </div>
		 </div>
	           <img src="<c:url value="/images/common/regist註冊寫字.png" />" class="handimg">
	           
      <!-- 尾巴---------------------------------------->
	  <div class="site_footer">
          <div class="gotop">
             <!-- <i class="fa fa-arrow-alt-circle-up"></i> -->
             <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
		  </br>
          </div>
     </div>
</div>


<script
src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous">
</script>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"
></script>
<script src="<c:url value="/js/member_register.js" />">
</script>
</body>
</html>