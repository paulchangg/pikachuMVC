<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/common/member_edit.css" rel="stylesheet"type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
crossorigin="anonymous" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/wickedcss.min.css"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script> function updateMb(){
	if (confirm("確定更新會員資料 ? ") ) {
		document.forms[1].action="<c:url value='edit.do' />";
		document.forms[1].method="POST";
		document.forms[1].submit();
		return;
	} else {
		return;
	}
}</script>

<title>修改會員資料</title>
</head>
<body>
	<div class="flex-container">
		<!----------------------head區塊------------------------------>
		<div class="header">
		   <div class="row justify-content-end"> 
				<div class="col-4">    <!---------logo區塊----------->
				   <img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
			   </div>
			   <div class="col-4">     <!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
						 <div class="col-4">
							 <a href="member_login.jsp">
							  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-4"> 
							 <a href="#">
							  <i class="fa fa-question-circle" id="qanda">Q & A</i>
							</a>
					   </div>
					   <div class="col-3">
							<a href="#">
							  <i class="fa fa-shopping-cart" id="shoppingcart">shopping cart</i>
						   </a>
					   </div>
				   </div>
			   </div>
		   </div>
	   </div>
  
		<!-- 導覽列--------------------------->
	   <section class="top_navi">
		   <nav>
			   <a href="#" >關於我們</a>
			   <a href="">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">商城</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>

		<!-- 會員資料標題--------------------------->
	   <div class="memberedit">
		  <h3>修改會員資料</h3>
	   </div>

	   <!--顯示資料庫帳號-->
	   <div class="memberID">
		 <h4>
			會員帳號ID:<span id="membereedit_id">${LoginOK.m_id}</span>
		 </h4>
	  </div>

	 <!--動畫框限+會員資料+密碼修改-->
      <div class="col-5 aniarea">
		  <div class="photo" id="membereedit_img"><!--顯示會員圖像-->
			<c:choose>
				<c:when test="${empty LoginOK.m_img}">
					<img src="../images/common/membephoto_0.png" width="160" height="160">			
				</c:when>
				<c:otherwise>
					<img src='${pageContext.request.contextPath}/init/getMemberImage?id=${LoginOK.m_id}' width="160" height="160">	
				</c:otherwise>
			</c:choose>
			<div class="photo">
				<button type="button" id="membereedit_photoBtn" data-toggle="modal" data-target="#editimagemodal">選擇圖片</button>
			</div>
		  </div>

	     <div class="modal fade" id="editimagemodal">   <!--這區塊選擇會員圖像跳出視窗-->
		   <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2>選擇您喜愛的頭像</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
						<form action="editPhoto.do" method="POST">
							<div class="modal-body">
								<label class="radio-inline"><input type="radio"
									name="m_img" value="memberphoto_1"><img
									src="../images/common/memberphoto_1.jpg" width="100"
									height="100"></label> <label class="radio-inline"><input
									type="radio" name="m_img" value="memberphoto_2"><img
									src="../images/common/memberphoto_2.jpg" width="100"
									height="100"></label> <label class="radio-inline"><input
									type="radio" name="m_img" value="memberphoto_3"><img
									src="../images/common/memberphoto_3.jpg" width="100"
									height="100"></label> <label class="radio-inline"><input
									type="radio" name="m_img" value="memberphoto_4"><img
									src="../images/common/memberphoto_4.jpg" width="100"
									height="100"></label> <label class="radio-inline"><input
									type="radio" name="m_img" value="memberphoto_5"><img
									src="../images/common/memberphoto_5.jpg" width="100"
									height="100"></label> <label class="radio-inline"><input
									type="radio" name="m_img" value="memberphoto_6"><img
									src="../images/common/memberphoto_6.jpg" width="100"
									height="100"></label>
							</div>
							<div class="modal-footer">
								<input type="submit" value="確定" id="memberedit_modalBtn">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">關閉</button>
							</div>
						</form>
					</div>
		</div>
		  </div>
		  
		<div class="personaledit"> <!--更改基本資料表單-->
			<form >
				<label>暱稱: </label><input type="text" name="nickname" id="membereedit_textinput">
				<label>	<i class="far fa-money-bill-alt"></i>年收入:</label>
				        <select name="income">
						    <option value=""></option>
						    <option value="30under">36萬以下</option>
						    <option value="36-50">36萬-50萬</option>
						    <option value="30-50">51萬-70萬</option>
						    <option value="71-99">71萬-99萬</option>
						    <option value="71-99">100萬以上</option>
					    </select>
			    <label> <i class="fas fa-graduation-cap"></i>最高學歷: </label>
					   <select name="education">
						    <option value=""></option>
						    <option value="Elementary">國小</option>
						    <option value="Juniorhigh">國中</option>
						    <option value="Highschool">高中</option>
						    <option value="University">大學</option>
						    <option value="Graduate-Doctor">碩博</option>
					</select>
				<label><i class="far fa-building"></i>居住縣市:</label>
					  <select name="city">
						   <option value=""></option>
						   <option value="Keelung">基隆</option>
						   <option value="Taipei">台北</option>
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
			</form>
					<input type="submit" value="確定修改" onclick="updateMb()" id="updateMbBtn">
		</div>
	   
		 <div class="personalpassword"> <!--更改密碼-->
			<form method="post" action="changePassword.do">
				<label>輸入原密碼:</label> <input type="password" name=password required>
				      <p><font color="red" size="-1">${MsgMap.pwError}</font></p> 
				<label>輸入新密碼:</label> <input type="password" name=newpassword required>
				      <p><font color="red" size="-1">${MsgMap.newPwError}</font></p>
				<label>新密碼確認:</label><input type="password" name=newpassword2 required>
				      <span></span>
				<input type="submit" value="變更密碼" id="membereedit_changeBtn">
			</form>
		</div>
      </div>

	 	<!--返回區塊-->
		 <div class="footerbutton">
			<a href="member_center.jsp"><input type="button" value="返回" id="Button2"></a>
		</div>
	
	   <!--尾巴區塊-->
	   <div class="site_footer">
		  <div class="gotop">
		   <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
	   </div>
  </div>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
    
</body>
</html>