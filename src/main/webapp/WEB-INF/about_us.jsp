<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>關於我們</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/about_us.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css"
      rel="stylesheet"
    />
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
  </head>

  <body>
    <!-- 上方標題logo列----超連結待補----->
    <div
      class="container-fluid"
      style="
        height: 160px;
        background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);
      "
    >
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
            <a href='<c:url value="/" />'>
              <img src="images/logo2.png" alt="logo" style="height: 140px;" />
            </a>
          </div>
        </div>
        <!-- 右上區塊 -->
        <div class="col-sm">
          <ul
            class="nav justify-content-end"
            style="font-size: 18px; font-weight: bold;"
          >
            <li class="nav-item">
              <c:choose>
                <c:when test="${empty LoginOK}">
                  <a
                    class="nav-link"
                    href='<c:url value="/member/member_login" />'
                    id="memberlogin"
                    style="color: rgb(92, 41, 7);"
                    >會員登入</a
                  >
                </c:when>
                <c:otherwise>
                  <a
                    class="nav-link"
                    href='<c:url value="/member/member_logout" />'
                    id="memberlogout"
                    style="color: rgb(92, 41, 7);"
                    >會員登出</a
                  >
                </c:otherwise>
              </c:choose>
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href='<c:url value="/member/member_center" />'
                id="membercenter"
                style="color: rgb(92, 41, 7);"
                ><i class="bx bx-user-circle"></i>會員中心</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href='<c:url value="/shopping/listProduct" />'
                id="shoppingcart"
                style="color: rgb(92, 41, 7);"
              >
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
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'
          >信用卡比較</a
        >
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'
          >論壇交友</a
        >
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'
          >商城</a
        >
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

    <!-- 組員介紹 -->
    <div class="wrap">
      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/ching.gif" />
          <span>青岑</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>前端UI設計與切版</li>
            <li>前端架構規劃與整合</li>
            <li>撰寫前端程式頁面:</li>
            <li>首頁、論壇、活動</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/ruei.gif" />
          <span>騏瑞</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>UML設計</li>
            <li>資料庫設計規劃</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/HC.gif" />
          <span>鴻圻</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>撰寫前端程式頁面:</li>
            <li>部分會員、關於我們</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/tsai.gif" />
          <span>采培</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>前端UI設計、切版</li>
            <li>撰寫前端程式頁面:</li>
            <li>部分會員、商城、信用卡搜尋、資訊網</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/cheng.gif" />
          <span>承志</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>數據收集、爬蟲</li>
            <li>資料庫設計規劃</li>
            <li>撰寫後端商城、論壇並與前端整合</li>
            <li>技術指導</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/hau.gif" />
          <span>皓博</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>數據收集、爬蟲</li>
            <li>資料庫設計規劃</li>
            <li>撰寫後端會員、交友並與前端整合</li>
            <li>Android APP 開發</li>
            <li>技術指導</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/bo.gif" />
          <span>柏賢</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>資料庫設計規劃</li>
            <li>撰寫後端信用卡比較、優惠資訊並與前端整合</li>
          </ul>
        </div>
      </div>

      <div class="row team-member">
        <div class="col-4 photo">
          <img src="images/about/SH.gif" />
          <span>順鴻</span>
        </div>
        <div class="col-8">
          <ul class="work">
            <li>資料庫設計規劃</li>
            <li>撰寫後端活動系統、並與前端整合</li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 回到置頂------>
    <div id="backtop" class="gotop">
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
      <div class="footer">
        <ul>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-facebook"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-twitter"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-instagram"></span>
          </li>
          <li>
            <span></span>
            <span></span>
            <span></span>
            <span class="fab fa-linkedin"></span>
          </li>
        </ul>
      </div>

      <br />
      <button type="button" id="back_bt" class="btn btn-secondary">
        To the top
      </button>
    </div>
  </body>
</html>
