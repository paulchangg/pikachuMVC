<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<c:url value='/listProduct/DisplayPageProducts' />"> 購物 </a><br>

<form action="forgetPW.do" method="post">
	<input type="text" name="email" 
		value="" placeholder="請輸入註冊信箱"
		tabindex="1" autocomplete="off">
	<Font color='red' size="-3">${ErrorMsg.EmailError}${ErrorMsg.EmptyError}</Font>
	<br>
	<button type="submit" >送出</button><br>
	<Font color='green' size="-3">${OkMsg.sendSuccessfully}</Font>
	<a href="member/member_login.jsp">會員登入</a>
	
</form>
<br>
<br>
<br>
<a href="<c:url value='/member/member_edit.jsp' />"> 更新 </a><br>
</body>
</html>