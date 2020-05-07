<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>配對頁面</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="../articleForum/css/forum_pair.css" />
    <script src="../js/jquery-3.4.1.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js"
      type="text/javascript"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
    <script src="../articleForum/js/forum.js"></script>
    <script src="../js/pair.js"></script>
  </head>
  <body>
    <!-- 上方標題logo列---超連結待補---->
    <div class="container-fluid" style="height: 190px;">
      <div class="row">
        <div class="col-sm">
          <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
          <p style="font-size: small;">
            快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
          </p>
        </div>
        <div class="row justify-content-around">
          <div class="col-sm">
            <a href="index copy.html">
              <img src="../articleForum/images/logo2.png" alt="logo" style="height: 230px;" />
            </a>
          </div>
        </div>
        <!-- 右上區塊 -->
        <div class="col-sm">
          <ul class="nav justify-content-end" style="font-size: 17px;">
            <li class="nav-item">
              <a class="nav-link" href='<c:url value="/member/member_logout" />' id="member_logout">會員登出</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href='<c:url value="/member/member_center" />' id="member_center">會員中心</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="qanda">Q & A</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href='<c:url value="/shopping/listProduct" />' id="shoppingcart">
                <i class="fas fa-shopping-cart"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
      <!-- 要改放圖片的話再修正 -->
      <!-- <img src="" style="height: 70px; width: 1367px;" /> -->

      <!-- 導覽列  超連結待補 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href="#aboutus">關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

    <!-- 上方文章卡片 x3 ----超連結待補------>
    <div class="card-group">
      <div class="card">
        <img
          src="../articleForum/images/board/couples.jpg"
          class="card-img-top"
          height="340px"
        />
      </div>
      <div class="card">
        <img
          src="../articleForum/images/board/couples2.jpg"
          class="card-img-top"
          height="340px"
        />
      </div>
      <div class="card">
        <img
          src="../articleForum/images/board/couples3.jpg"
          class="card-img-top"
          height="340px"
        />
      </div>
    </div>
    <!-- 分隔列---->
    <div class="second_line"></div>

    <div class="container" style="padding-bottom: 25px; margin-left: 150px;">
      <div class="row">
        <div class="col">
          <img src="../articleForum/images/cellphone.jpg" style="width: 80px; height: 60px;" />
          <span class="badge badge-warning" style="font-size: 20px;">配對</span>
        </div>
        <a href="forum_friendlist.html">
          <button type="button" class="btn btn-primary btn-sm">
            好友列表
            <br /><i class="fas fa-users"></i>
          </button>
        </a>

        <a href="forum.html">
          <button type="button" class="btn btn-info btn-sm">
            回論壇首頁
            <br /><i class="fas fa-home"></i>
          </button>
        </a>
      </div>
    </div>

    <!-- 左側按鈕列表 -->
    <div class="container-fluid">
      <div class="row" style="display: flex; padding-top: 20px;">
        <!-- 左側button-->
        <div class="col-2">
          <div class="my-3">
            <a class="nav-link" href="allboards.html" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">
                所有看板
              </button>
            </a>
          </div>
          <div class="my-3">
            <a class="nav-link" href="activity_page.html" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">
                交友活動
              </button>
            </a>
          </div>
          <div class="my-3">
            <a class="nav-link" href="forum_pair.html" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">
                配對
              </button>
            </a>
          </div>

          <!-- 左側假廣告圖 -->
          <img
            src="../articleForum/images/ad_photo/burgerking.jpg"
            style="width: 200px; padding-top: 50px; padding-right: 10px;"
          />
          <img
            src="../articleForum/images/ad_photo/uniqlo.jpg"
            style="width: 200px; padding-top: 25px; padding-right: 10px;"
          />
        </div>

        <div style="width: 50px;"></div>
        <!-- 中央配對區 -->
        <div class="col-7">
        <div id="preFriends"></div>
        </div>
        <div style="width: 90px;">

        <!-- 右側廣告 -->
        <div class="col-1" style="float: right;">
          <img
            src="../articleForum/images/ad_photo/rice.jpg"
            style="width: 180px; height: 600px;"
          />
        </div>
      </div>
    </div>

    <!-- 底部 ------>
    <div id="backtop" class="gotop">
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
      <br />
      <button type="button" class="btn btn-secondary">To the top</button>
    </div>
  </body>
</html>
