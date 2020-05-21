<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>配對好友列表</title>
    <link rel="stylesheet" href="../articleForum/css/bootstrap.min.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="../articleForum/css/forum_pair.css" />
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
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
    <script src="../js/friendList.js"></script>
  </head>

  <body>
    <!-- 上方標題logo列--->
    <div class="container-fluid" style="height: 160px; background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
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
              <img
                src="../articleForum/images/logo2.png"
                alt="logo"
                style="height: 340px; width: 300px; padding:0 30px 140px 0;"
              />
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
      <!-- 要改放圖片的話再修正 -->
      <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
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

    <div class="container-fluid">
       <div
            class="d-flex flex-row bd-highlight"
            style="padding-top: 15px;
                   padding-bottom: 15px;"
          >
        <%-- <a href='<c:url value="/friends/friendList" />'>
          <button type="button" class="btn btn-primary btn-sm">
            好友列表
            <br /><i class="fas fa-users"></i>
          </button>
        </a> --%>

        <div class="col" >
          <div style="height:20px; text-align: center;">
          <span class="badge badge-warning" style="font-size: 20px; padding-top:8px; ">好友列表</span>
        </div>
        </div>
      </div>
    </div>

    <!-- 左側按鈕列表 -->
    <div class="container-fluid" style="  align-content: center;">
      <div class="row" style="display: flex; padding-top: 20px; align-content: center;">
        <!-- 左側button-->
        <div class="col-2" style="height:600px; margin-top:10px;">
          <div class="my-3">
            <a class="nav-link" href='<c:url value="/articleForum/listforum" />' style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">所有看板</button>
            </a>
          </div>
         <div style="padding: 10px 0 10px 0;"></div>
          <!-- 分類看板 -->
             <ul class="list-group list-group-flush" style="width: 250px;">
                  <li class="list-group-item">
                    <button
                      type="button"
                      class="btn btn-light"
                      id="creditcards"
                    >
                      <a
                        href="<c:url value='/articleForum/listforum/信用卡' />"
                        style="text-decoration: none; color: black;"
                        >信用卡</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="food">
                      <a
                        href="<c:url value='/articleForum/listforum/美食' />"
                        style="text-decoration: none; color: black;"
                        >美食</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="emotion">
                      <a
                        href="<c:url value='/articleForum/listforum/感情' />"
                        style="text-decoration: none; color: black;"
                        >感情</a
                      >
                    </button>
                  </li>
                </ul>
          <div class="my-3">
           <a class="nav-link" href="<c:url value="/forum/ForumHompage?pageNo=1" />" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">
                交友活動
              </button>
            </a>
          </div>
          <div class="my-3">
            <a class="nav-link" href='<c:url value="/friends/pair" />' style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">
                配對
              </button>
            </a>
          </div>
             <a href="<c:url value='/articleForum/listforum' />">
                <button type="button" class="btn btn-info btn-sm">
                  回論壇首頁
                  <br /><i class="fas fa-home"></i>
                </button>
               </a>
          <!-- 左側假廣告圖已刪 -->
        </div>

        <div style="width:110px; height:300px;"></div>
        <!-- 中央好友列表 -->
      <div class="listefriend d-none d-lg-block col-lg-9">  
      <div class="row chatroom">
       </div>
        <div class="col-8">
          <div class="listheader"></div> 
          <div
            id="friendList"
            style="
              height: 500px;
              overflow: auto;
            "
          ></div>

          <div class="listheader" style="padding-top:20px; padding-left:10px;">
          </div> 

        </div>
      <div container>
         <div class="col-2">
            <div class="row">
          <div class="pkmn pkmn__pikachu" style="padding-left:700px;"></div>
         </div>
        </div>       
      </div>
    </div>

        <div style="width: 90px;"></div>

        <!-- 右側廣告已刪 -->
      </div>
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
