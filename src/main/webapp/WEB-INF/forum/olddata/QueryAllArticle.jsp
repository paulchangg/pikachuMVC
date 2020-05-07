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
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
function update() {
	document.getElementById('res_content').disabled = false;
	$(document).ready(function() {
		$(':input').css('outline', 'auto');
	});
}
function postUpdate() {
	document.getElementById('mode').value = "MOD";
	//		var test= $('#mode').val();
	//		alert(test);
	document.forms[1].submit();
}
function remove() {
	document.getElementById('mode').value = "DEL";
	document.forms[1].submit();
}

		
</script>

<style>

input {
	background: window;
	outline: none;
	border: none;
	padding: 0px;
	margin: 0px;
	outline: none;
	padding: 0px;
}

textarea {
	width: 60%;
	height: 150px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	resize: none;
}

</style>


<body>
		
<c:forEach var="launchAll" items="${launchAll}">


<h1>文章編號${ launchAll.article_Id } 的資料</h1>
熱門看板:${ launchAll.foumBean.fname}
會員: ${ launchAll.article_m_id }<br><br>
		
活動標題: ${ launchAll.article_title }<br><br>
		
活動內容: ${ launchAll.article_content }<br><br>
		
活動圖片: ${ launchAll.articleimage }<br><br>



<img src="/forum/QueryLaunchALL?articleimage =${ launchAll.articleimage }" /><br>
		
活動主題: ${ launchAll.subject }<br><br>
		
活動地點: ${ launchAll.location }<br><br>
		
PO文時間: ${ launchAll.post_Time }<br><br>
		
活動開始時間: ${ launchAll.startTime }<br><br>
		
活動結束時間: ${ launchAll.endTime }<br><br>
		
<hr>	
	
<!-- ----------下面是提出回文開始------------------------------- -- -- -- -- -- -- -- -- -- -- -- --  -->
<form action="<c:url value='/forum/ResponserServlet' />"
		method="POST" enctype="multipart/form-data">
<!-- launchMembers.article_Id 藉由這裏帶 -->
<input type="hidden" id="article_IdStr" name="article_IdStr"value="${ launchAll.article_Id }">
	
<textarea cols="50" rows="5" placeholder="內容不能少於10個字"  name="res_contentStr" >${param.res_contentStr}</textarea><br>
<font color="red" size="-1">${MsgMap.res_contentError}</font> <br> 
<button name="insert" value="insert">提交回復</button><hr>
</form>
<!-- ----------下面是提出回文結束------------------------------- -- -- -- -- -- -- -- -- -- --  -->	
	
	
<!-- ----------下面是回文開始------------------------------- -- -- -- -- -- -- -- -- -- -- -- --  -->
<c:forEach var="responAll" items="${responAll}">
<c:if test="${launchAll.article_Id == responAll.launch_activityBean.article_Id }">
<form action="<c:url value='/forum/UpdateDelResponerServlet' />" method="POST" enctype="multipart/form-data">
文章編號:${responAll.launch_activityBean.article_Id }<br>
會員:${responAll.res_m_id }<br>
<div>
<label for="res_content">回覆內容:</label> <input type="text"
id="res_content" name="res_content" size="100" disabled value="${responAll.res_content }"><br>
</div>

回覆時間:${responAll.postTime }<br><br>
<!-- ----------所有修改開始----------------------------- -->
<!-- responAll.res_id 藉由這裏帶 -->
<input type="hidden" id="res_idStr" name="res_idStr" value="${ responAll.res_id }">
<!-- mod 的值由這裏帶-->
<input type="hidden" id="mode" name="mode" value="">
</form>
<c:if test="${loginmember == responAll.res_m_id }">

<button name="update" value="update" onclick="update()">修改</button>
<button name="delete" value="delete" onclick="remove()">刪除</button>
<button name="confirm" value="confirm" onclick="postUpdate()">確認</button>
</c:if>
<hr>
<!-- ----------所有修改結束----------------------------- -->
</c:if>

</c:forEach>


</c:forEach>
<!-- ----------所有文章結束----------------------------- -->
</body>
</html>