<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div style="text-align: left:;">
		<h1>熱門看板</h1>
									
		<form action="<c:url value='/ForumHompage'/>"
		
			method="POST" enctype="multipart/form-data">

			<c:forEach var="sessionfname" items="${sessionfname}"  class="btn-all-board">
				<h1>
					<a href="forum/ConnectionForum_launch?${sessionfname}">${sessionfname}</a>
				</h1>
				<br>
			</c:forEach>
		</form>
	</div>
</body>
</html>