<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>比卡丘-比比看誰的信用卡功能最丘</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="homepage/css/index.css" />
    
    <script type="text/javascript" src="homepage/js/index.js"></script>
  </head>

  <body>
     <div class="flex-container">
      <!-- 頁首---------超連結待補----------------------------------------------->
      <div class="header">
        <div class="row justify-content-end">
          <div class="col-4"> 
            <img class="index_logo" src="homepage/images/index_logo.jpg" alt="logo" />
          </div>
          <div class="col-4"> 
            <div class="row justify-content-end">
              <div class="col-4">
                <c:choose>
					<c:when test="${empty LoginOK}">								
						<a href="member/member_login"> 
							<i class="fa fa-user-circle" id="memberlogin">會員登入</i>
						</a>								
					</c:when>
					<c:otherwise>								
						<a href="member/member_logout"> 
							<i class="fa fa-user-circle" id="memberlogout">會員登出</i>
						</a>								
					</c:otherwise>
				</c:choose>
              </div>
              <div class="col-4"> 
                <a href="#">
                  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
                </a>
              </div>
              <div class="col-3">
                <a href="#">
                  <i class="fa fa-question-circle" id="qanda">Q & A</i>
                </a>
              </div>
            </div>
            <br>
            <div class="d-flex justify-content-end" >
              <a href="listProduct/DisplayPageProducts">
                <i class="fa fa-shopping-cart" id="shoppingcart">shopping cart</i>
              </a>
            </div>
        </div>
        </div>
      </div>


      <!-- <div style="display:inline"> 
        <i class="fa fa-credit-card"></i>
        信用卡種類太多不知如何選擇？</div> -->







      <!-- 導覽列------超連結待補--------------------------->
      <section class="top_navi">
        <nav>
          <a href="#" class="aboutus">關於我們</a>
          <a href="member/member_center" class="memberarea">會員中心</a>
          <a href="#" class="friendshipforum">論壇交友</a>
          <a href="#" class="mall">商城</a>
        </nav>
      </section>

      <!-- slider------------------------------------------->
      <div class="index_slider d-none d-sm-block">
        <div id="carousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="homepage/images/slider/index_slider_1.jpg" alt="First slide" width="250px" height="600px">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="homepage/images/slider/index_slider_2.jpg" alt="Second slide" width="250px" height="600px">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="homepage/images/slider/index_slider_3.jpg" alt="Third slide" width="250px" height="600px">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>


      <div class="container" >
        <div style="display:inline"> 
          <i class="fa fa-credit-card"></i>
          信用卡種類太多不知如何選擇？</div>
        <div style="display:inline"> 
        <i class="fa fa-users"></i> 
          想揪團卻找不到朋友？</div>
      </div>

      <span style="font-family: 'Fredoka One', cursive;">
      </span>

      <div class="content_pic">
        <img class="index_pic2" src="homepage/images/home_pic1.jpg" alt="picture2"/>
        <img class="index_pic3" src="homepage/images/home_pic2.jpg" alt="picture3"/>
      </div>

      <!-- 中央按鈕-----超連結待補----------------------------->
      <section class="content_nav">
        <nav>
          <a href="#" class="hottopics">熱門看板</a>
          <a href="#" class="recentactivity">近期活動</a>
          <a href="#" class="pairfun">配對樂</a>
          <a href="#" class="latestpromotion">優惠資訊</a>
        </nav>
      </section>

      <div class="bottom_content">
        讓比卡丘幫您找到與自己財力匹配的另一半</div>
      <div><img class="index_pic4" height="400px" width="550px" src="homepage/images/home_pic3.jpg" alt="picture4"/>     
      </div>
     </div>

      <!-- 回到置頂---------------------------------------->
        <div class="site_footer">
        <div class="gotop">
          <!-- <i class="fa fa-arrow-alt-circle-up"></i> -->
          <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
          <br>
          <br>
          <a href="#" class="fa fa-arrow-up gotop_bt-margin-right">
            To the top
          </a>
        </div>
        </div>
    </div>

<script
src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
crossorigin="anonymous"
></script>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"

></script>
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
crossorigin="anonymous"
></script>

  </body>
</html>
