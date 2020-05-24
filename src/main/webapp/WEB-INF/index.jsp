<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>比卡丘-比比看誰的信用卡功能最丘new</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/wickedcss.min.css">
    <link rel="stylesheet" href="./css/index.css" />
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="./js/jquery-3.4.1.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/index.js"></script>
  </head>
  <body class="indexBody">
     <!--loading畫面----->
     <div class="hahahahaha">
        <div ><img src="./images/logo2.gif" class="zoomer onrpickure" style="padding-right: 60px;"></div>
        <div><span id="percentCount" class="percent-count" style="padding-left: 5px;"></span></div>
           </div>
    </div>
    
    <!-- 上方標題logo列 -->
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
            <a href='<c:url value="/" />'>
              <img src="./images/logo2.png" alt="logo" style="height: 140px; width: 215px;" />
            </a>
          </div>
        </div>
        <!-- 右上區塊 -->
        <div class="col-sm">
          <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
            <li class="nav-item">
              <c:choose>
          <c:when test="${empty LoginOK}">      
              <a class="nav-link" href='<c:url value="/member/member_login" />' id="memberlogin" style="color: rgb(92, 41, 7);">會員登入</a>
              </c:when>
              <c:otherwise>               
            <a class="nav-link" href='<c:url value="/member/member_logout" />' id="memberlogout" style="color: rgb(92, 41, 7);">會員登出</a>                
          </c:otherwise>
        </c:choose>
            </li>
            <li class="nav-item">
              <a class="nav-link" href='<c:url value="/member/member_center" />' id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<c:url value='/shopping/ShoppingCart' />" id="shoppingcart" style="color: rgb(92, 41, 7);">
              <i class="fas fa-shopping-cart"><span style="color:#FF5964" id="shoppingCartItem">${shoppingCart}</span> <!-- 加入購物車的商品數量 --></i>
             </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 上面圖片區塊 -->
      <main>
        <section class="slides"> 
          <section class="slide is-active">
            <div class="slide__content">
              <figure class="slide__figure"><div class="slide__img" style="background-image: url(./images/home_pic1.jpg);"></div></figure>
              <header class="slide__header">
                <h2 class="slide__title">
                  <span class="title-line"><span>邊緣人</span></span>
                  <span class="title-line"><span>也找得到咖</span></span>
                </h2>
              </header>
            </div>
          </section>
        </section>
        </main>


    <div class="et-hero-tabs">
      <!-- 導覽列 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href="<c:url value="/news/lastestNews"/>">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

    <!-- Main -->
    <main class="et-main">
      <!-- 關於我們區塊 -->
      <div class="et-slide" id="aboutus" style="background-image: linear-gradient(to top, #dfe9f3 50%, white 100%);">
    <div class="container">
      <div class="col-3">
    <div class="wrapper">
      <div class="image one">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/ching.gif">
          <span class="text"><br>青岑 &#128516<span />
        </div>
      </div>
    </div>
  </div>

  <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/HC.gif" >
          <span class="text"><br>鴻圻😒<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/tsai.gif" >
          <span class="text"><br>采培💓<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/ruei.gif" >
          <span class="text"><br>騏瑞😈<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/cheng.gif">
          <span class="text"><br>承志🤞<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/hau.gif" >
          <span class="text"><br>皓博😸<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/SH.gif" >
          <span class="text"><br>順鴻🔥<span />
        </div>
      </div>
    </div>
  </div>

    <div class="col-3">
    <div class="wrapper">
      <div class="image">
        <div class="image__side image__side--front">
          <img src="./images/123.jpg" >
        </div>
        <div class="image__side image__side--back">
          <img src="./images/about/bo.gif" >
          <span class="text"><br>柏賢🦠<span />
        </div>
      </div>
    </div>
  </div>
  <button class="bt" id="aboutBtn" style="position: absolute; top:320px; left: 30px;width: 200px;height: 70px; font-weight: bold;font-size: 24px;" >前往關於我們
  </button>
</div>
</div>
      
      <!-- 信用卡比較 -->
      <div class="et-slide" id="cardcompare" style="background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);padding-top: 40px;">
        <div class="min-h-screen w-full ">
          <div class="container-fluid2" style="opacity:0.8; ">
            <h1 class="subtitle_card" style="float: right; padding-top: 50px;font-size: 60px; padding-bottom: 20px; ">
              <a style="text-decoration:none; color: rgb(36, 16, 36); " href='<c:url value="/cards/cradeitCb?qt=main" />'>60秒內<br>找到您的命定信用卡!
            <br>
            <br>
            </h1>
              </a>
              </div>
          </div>
      </div>
      
      <!-- 論壇交友 -->
      <div class="et-slide" id="friendshipforum" style="background-image: linear-gradient(-20deg, #e9defa 0%, #fbfcdb 100%);	">
        <main class="grid" style="width: 1100px;">
          <p class="subtitle"><a style="text-decoration:none; color: rgb(36, 18, 36);left: 30px;" href='<c:url value="/articleForum/listforum"/>'>來論壇發文揪團囉</a></p>
          <div class="panels">
          </div>
        </main>
      </div>

      <!-- 商城 -->
      <div class="et-slide" id="mall" style="background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);">
        <ul class="card-list">
          <li class="card">
            <a class="card-image" href="shopping/本月熱賣品" style="background-image: url(./images/mall-selling.jpg);">
            </a>
              <h2>本月熱賣品</h2>
            </a>
          </li>
          <li class="card">
            <a class="card-image" href="shopping/吃貨歡樂劵" style="background-image: url(./images/mall-eating.jpg);">
            </a>
              <h2>吃貨歡樂券</h2>
            </a>
          </li>
          <li class="card">
            <a class="card-image" href="shopping/放鬆娛樂券" style="background-image: url(./images/mall-relax.jpg);">
            </a>
              <h2>放鬆娛樂券</h2>
            </a>
          </li>
          
          <li class="card">
            <a class="card-image" href="shopping/外出旅遊券" style="background-image: url(./images/mall-travel.jpg);">
            </a>
              <h2>外出旅遊券</h2>
            </a>
          </li>
        </ul>
      </div>

    <!-- 資訊網---->
      <div class="et-slide" id="infoweb" style="background-image: linear-gradient(to top, #b7e6bb 50%, #eff5ef 80%);">
        <div class="aaa">
          <aside><img class="info_pic" src="./images/info.jpg" style="width: 750px;height: 700px;"/>
          </aside>
          <main style="padding-right: 10px;">
            <h1 style="padding-bottom: 40px;">各種優惠看這裡 </h1>
            <button class="bt" style="padding: 1rem 2.5rem; font-weight: bold;font-size: 24px;"><a style="text-decoration:none; color: rgb(73, 5, 73);" href='<c:url value="/news/lastestNews"/>'>前往資訊網</button></a>
          </main>
        </div>
      </div>
    </main>

    <!-- 回到置頂------>
    <div id="backtop" class="gotop" style="text-align: center !important; margin-top: 50px;">
      © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
    <div id="icons" >
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
     <div class="hahahahaha">
        <div style="text-align:center;"><img src="/images/logo2.gif" class="zoomer onrpickure"></div>
        <div style="text-align:center;"><span id="percentCount" class="percent-count"></span></div>
                 <div class="progress" id="progress"></div>
         </div>
    </div>
    <script>
    /*loading方法*/
    function progress(){
        var loadarea=document.querySelector('.hahahahaha');
        var percent=document.getElementById('percentCount');
        var counter=5;5;
        var id=setInterval(frame,20);//動畫時間
        var bodyarea=document.querySelector('.indexBody');
        

        function frame(){

            if(counter == 100)
            {
                clearInterval(id);
                bodyarea.style.background="#FFE066";
                loadarea.style.background="#FFE066";
                setTimeout(function(){
                bodyarea.style.background="#FFF";
                loadarea.style.display="none";},500)
            }
            else{
                  counter  += 1;
                  percent.innerHTML = counter+'%';
            }
        };
    };
    progress();
    </script>
  </body>
</html>
