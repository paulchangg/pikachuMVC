<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>所有看板</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/allboards.css" />
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js"
      type="text/javascript"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
    <script src="js/allboards.js"></script>
  </head>

  <body>
    <!-- 上方標題logo列----超連結待補----->
    <div class="container-fluid" style="height: 190px;">
      <div class="row">
        <div class="col-sm">
          <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
          <p style="font-size: small;">
            快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
          </p>
        </div>
        <div class="row justify-content-center">
          <div class="col-sm">
            <a href="index copy.html">
              <img src="images/logo2.png" alt="logo" style="height: 230px;" />
            </a>
          </div>
        </div>
        <!-- 右上區塊 -->
        <div class="col-sm">
          <ul class="nav justify-content-end" style="font-size: 17px;">
            <li class="nav-item">
              <a class="nav-link" href="#" id="memberlogin">會員登入</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="cardcompare">信用卡比較</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="qanda">Q & A</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="shoppingcart">
                <i class="fas fa-shopping-cart"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
      <div
        id="carouselExampleSlidesOnly"
        class="carousel slide"
        data-ride="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="images/slider/slide_pic5.jpg"
              style="height: 380px; width: 1367px;"
            />
          </div>
          <div class="carousel-item">
            <img
              src="images/slider/slide_pic6.jpg"
              style="height: 380px; width: 1367px;"
            />
          </div>
          <div class="carousel-item">
            <img
              src="images/slider/slide_pic7.jpg"
              style="height: 380px; width: 1367px;"
            />
          </div>
        </div>
      </div>

      <!-- 導覽列  超連結待補 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href="#aboutus">關於我們</a>
        <a class="et-hero-tab" href="#memberarea">會員中心</a>
        <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
        <a class="et-hero-tab" href="#mall">商城</a>
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

    <a href="forum.html">
      <button type="button" class="btn btn-info btn-sm" style="margin: 10px 0 10px 1250px;">
        回論壇首頁
        <br /><i class="fas fa-home"></i>
      </button>
     </a>
    <!-- 左側按鈕列表 -->
    <div class="container-fluid">
      <div class="row" style="display: flex;">
        <!-- 左側button-->
        <div class="col-2" style="padding-top: 10px;">
          <div class="my-2">
            <a class="nav-link" href="allboards.html" style="padding-top: 1px;">
              <button type="button" class="btn btn-outline-success">
                所有看板
              </button>
            </a>
          </div>
          <div class="my-2">
            <a class="nav-link" href="activity_page.html" style="padding-top: 1px;">
              <button type="button" class="btn btn-outline-success">
                交友活動
              </button>
            </a>
            
          </div>
          <div class="my-2">
            <a class="nav-link" href="#" style="padding-top: 1px;">
              <button type="button" class="btn btn-outline-success">
                配對
              </button>
            </a>
          </div>
        </div>
        
        <!-- 中央區塊 -->
        <div class="content" style="height: 550px;">
          <div class="row">
            <div class="col">
              <div style="margin: 10px 0 0 140px;">
                <span class="badge badge-warning" style="font-size: 20px;"
                  >所有看板</span
                >
                <div style="padding: 10px 0 10px 0;"></div>
                <!-- 分類看板 -->
                <ul class="list-group list-group-flush" style="width: 350px;">
                  <li class="list-group-item">
                    <button
                      type="button"
                      class="btn btn-light"
                      id="creditcards"
                    >
                      <a
                        href="<c:url value='/fourm/listforum/信用卡' />"
                        style="text-decoration: none; color: black;"
                        >信用卡</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="food">
                      <a
                        href="<c:url value='/fourm/listforum/美食' />"
                        style="text-decoration: none; color: black;"
                        >美食</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="emotion">
                      <a
                        href="<c:url value='/fourm/listforum/感情' />"
                        style="text-decoration: none; color: black;"
                        >感情</a
                      >
                    </button>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col" style="padding-left: 330px;">
              <div>
                <img
                  src="images/ad_photo/hamburger.jpg"
                  style="width: 300px; height: 550px;"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 回到置頂-- 按鈕有bug，請不要按-->
    <div id="backtop" class="gotop">
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
      <br />
      <button type="button" class="btn btn-secondary">To the top</button>
    </div>
  </body>
</html>
