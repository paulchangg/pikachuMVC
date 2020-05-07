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
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
</head>

<script type="text/javascript">
	function update() {
	
		document.getElementById('article_title').disabled = false;
		document.getElementById('article_content').disabled = false;
		document.getElementById('articleimage').disabled = false;
		document.getElementById('subject').disabled = false;
		document.getElementById('location').disabled = false;
		document.getElementById('starteTime').disabled = false;
		document.getElementById('endTime').disabled = false;
		$(document).ready(function() {
			$(':input').css('outline', 'auto');
			$('textarea').css('outline', 'auto');
		});
	}

	function postUpdate() {
		document.getElementById('mode').value ="MOD" ;
// 		var test= $('#mode').val();
// 		alert(test);
		document.forms[0].submit();
	}

	function remove() {
		alert(123)
		document.getElementById('mode').value ="DEL" ;
		document.forms[0].submit();
	}
</script>
<style>
input, select, textarea {
	background: window;
	outline: none;
	border: none;
	padding: 0px;
	margin: 0px;
	outline: none;
	padding: 0px;
}

textarea {
	background: window;
	height: 250px;
	weight: 200px;
	resize: none;
}
</style>

<body>

	<h1>查詢結果</h1>

	<c:forEach var="launchMembers" items="${launchMembers}">

		<h1 id="article_Id">文章編號${ launchMembers.article_Id }的資料</h1>
		<h2 id="article_m_id">會員: ${ launchMembers.article_m_id }</h2>
		<br>
		
		
		
		<form action="<c:url value='/forum/UpdateItem.do' />"
		method="POST" enctype="multipart/form-data">

			<div>
				<label for="article_title">活動標題:</label> <input type="text"
					id="article_title" name="article_title" size="100" disabled
					placeholder="標題不能少於10個字" value="${launchMembers.article_title }" />
					<font color="red" size="-1">${MsgMap.TitleError}</font> <br>
			</div>
			<div>
				<label for="article_content">活動內容:</label> <br>
				<textarea cols="112" rows="5" placeholder="內容不能少於100個字" disabled
					name="article_content" id="article_content">${launchMembers.article_content }</textarea>
					<font color="red" size="-1">${MsgMap.ContentError}</font> <br>
			</div>
			<br>
			<div>
				<label class="fontSize">活動圖片:</label>&nbsp;
				${launchMembers.articleimage }<br> 
				<input name="articleimage" type="File" disabled value="${launchMembers.articleimage }.name"
					id="articleimage" /><br />&nbsp;
			</div>
			<div>
				<label for="subject">活動主題:</label> <input type="text" id="subject"
					name="subject" disabled size="100" value="${launchMembers.subject}" />
					<font color="red" size="-1">${MsgMap.subjectError}</font> <br>
			</div>
			<br>

			<div>
				<label for="location">活動地點::</label> <select name="location"
					id="location" disabled>
					<option value="${ launchMembers.location }">${ launchMembers.location }</option>
					<option value="Taipei">台北</option>
					<option value="Keelung">基隆</option>
					<option value="NewTaipei">新北</option>
					<option value="Taoyuan">桃園</option>
					<option value="Hsinchu">新竹</option>
					<option value="Miaoli">苗栗</option>
					<option value="Taichung">台中</option>
					<option value="Changhua">彰化</option>
					<option value="Nantou">南投</option>
					<option value="Yunlin">雲林</option>
					<option value="Chiayi">嘉義</option>
					<option value="Tainan">台南</option>
					<option value="Kaohsiung">高雄</option>
					<option value="Pingtung">屏東</option>
					<option value="Taitung">台東</option>
					<option value="Hualien">花蓮</option>
					<option value="Yilan">宜蘭</option>
					<option value="insland">外島</option>
				</select>
				<font color="red" size="-1">${MsgMap.locationError}</font> <br>
			</div>
			<br> PO文時間: ${ launchMembers.post_Time }<br> <br>
			<div>
				<label for="starteTime">活動開始時間:</label> <input type="date"
					name="starteTime" tabindex="7" disabled
					value="${launchMembers.startTime}" id="starteTime" /><br>
				原始活動開始時間${launchMembers.startTime}<br>
				<font color="red" size="-1">${MsgMap.starte_TimeError}</font> <br>
			</div>
			<br>
			<div>
				<label for="endTime">活動結束時間:</label> <input type="date"
					name="endTime" tabindex="7" disabled id="endTime"
					value="${ launchMembers.endTime }" /><br> 原始活動結束${ launchMembers.endTime }<br>
					<font color="red" size="-1">${MsgMap.endTimeError}</font> <br>
			</div>
			<div>
				<label for="subject">人氣:</label> <input type="text" id="subject"
					name="subject" disabled size="100"
					value="${launchMembers.popularity}" />
			</div>
			<br>


			<!-- launchMembers.article_Id 藉由這裏帶 -->
			<input type="hidden" id="articleIdStr" name="articleIdStr" value="${ launchMembers.article_Id }">
			<!-- mod 的值由這裏帶-->
			<input type="hidden" id="mode" name="mode" value="">
		</form>
		<button name="update" value="update" onclick="update()">修改</button>
		<button name="delete" value="delete" onclick="remove()">刪除</button>
		<button name="confirm" value="confirm" onclick="postUpdate()">確認</button>
		<hr>
		
<c:forEach var="responAll" items="${responAll}">

<c:if test="${launchMembers.article_Id == responAll.launch_activityBean.article_Id }">


文章編號:${responAll.launch_activityBean.article_Id }<br><br><br>
會員:${responAll.res_m_id }<br><br><br>
回覆內容:${responAll.res_content }<br><br><br>
回覆時間:${responAll.postTime }<br><br><br>

<hr>
</c:if>	
</c:forEach>
	</c:forEach>

</body>

</html>