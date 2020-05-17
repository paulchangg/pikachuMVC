<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>修改個人資料</title>
     <link rel="stylesheet" href="../css/bootstrap.min.css">
	 <link href="../css/member_edit.css" rel="stylesheet" type="text/css">
	 <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
     <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
     <link rel="stylesheet" href="../css/wickedcss.min.css">
     <script src="../js/index.js"></script><!-- 捲動時固定瀏覽器在上方的js-->
  <script> function updateMb(){
if (confirm("確定更新會員資料 ? ") ) {
  document.forms[1].action="<c:url value='edit.do' />";
  document.forms[1].method="POST";
  document.forms[1].submit();
  return;
} else {
  return;
}
  }
  </script>
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
          <a href="index copy.html">
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_logout" />' id="member_logout" style="color: rgb(92, 41, 7);">會員登出</a>
          </li>
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
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>


    <!-- 會員修改框圖片 -->
	  <div><img src="../images/個人資料.png" class="imageone"></div>

	     <!--顯示資料庫帳號-->
		 <div class="memberID">
			<p>
			   會員帳號ID:<span id="membereedit_id">${LoginOK.m_id}</span>
			</p>
		 </div>

	 <!--動畫框限+會員資料+密碼修改-->
   <div class="col-5 aniarea">
		<div class="photo" id="membereedit_img"><!--顯示會員圖像-->
		  <c:choose>
			  <c:when test="${empty LoginOK.m_img}">
				  <img src="../images/membephoto_0.png" width="160" height="160">			
			  </c:when>
			  <c:otherwise>
				  <img src='<c:url value="/init/getMemberImage?id=${LoginOK.m_id}" />' width="160" height="160">	
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
								  src="../images/memberphoto_1.jpg" width="100"
								  height="100"></label> <label class="radio-inline"><input
								  type="radio" name="m_img" value="memberphoto_2"><img
								  src="../images/memberphoto_2.jpg" width="100"
								  height="100"></label> <label class="radio-inline"><input
								  type="radio" name="m_img" value="memberphoto_3"><img
								  src="../images/memberphoto_3.jpg" width="100"
								  height="100"></label> <label class="radio-inline"><input
								  type="radio" name="m_img" value="memberphoto_4"><img
								  src="../images/memberphoto_4.jpg" width="100"
								  height="100"></label> <label class="radio-inline"><input
								  type="radio" name="m_img" value="memberphoto_5"><img
								  src="../images/memberphoto_5.jpg" width="100"
								  height="100"></label> <label class="radio-inline"><input
								  type="radio" name="m_img" value="memberphoto_6"><img
								  src="../images/memberphoto_6.jpg" width="100"
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
			  <label>新密碼確認:</label> <input type="password" name=newpassword2 required>		
			  <p> <input type="submit" value="變更密碼" id="membereedit_changeBtn">
		  </form>
	  </div>
   </div>
   
     <!--返回區塊-->
	   <div class="footerbutton">
		  <a href="member_center"><input type="button" value="返回" id="Button2"></a>
	  </div>
	  
	  
	 
    <!-- 底部 ------>
    <div id="backtop" class="gotop">
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
      <div class="footer">
        <ul> 
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-facebook"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-twitter"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-instagram"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-linkedin"></span>
          </li>
        </ul>  
      </div> 
      
      <br />
      <button type="button" id="back_bt" class="btn btn-secondary" >To the top</button>
    </div>
    <script src="../js/jquery-3.4.1.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
