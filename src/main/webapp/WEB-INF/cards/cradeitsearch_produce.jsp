<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>詳細資訊</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cradeitsearch_page.css" />
    <link rel="stylesheet" href="css/wickedcss.min.css">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
  </head>
   <body>
    <div class="container-fluid" style="height: 190px;">
      <div class="row">
         <div class="col-sm"> <!-- 左上角logo -->
            <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
            <p style="font-size: small;">
              快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
            </p>
        </div>
        <div class="row justify-content-around"> <!-- logo -->
          <div class="col-sm">
            <a href="index copy.html">
               <img src="../cards/image/重新縮圖.png" alt="logo" style="height: 230px;" />
            </a>
         </div>
       </div>
       <!-- 右上區塊 -->
       <div class="col-sm">
          <ul class="nav justify-content-end" style="font-size: 17px;">
             <li class="nav-item">
               <a class="nav-link" href="#" id="memberlogin">會員登出</a>
            </li>
            
           <li class="nav-item">
             <a class="nav-link" href="#" id="cardcompare"><i class="fa fa-user-circle" id="memberlogin"></i>會員中心</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="#" id="qanda"> <i class="fa fa-question-circle" id="qanda"></i>Q & A</a>
           </li>
           
           <li class="nav-item">
             <a class="nav-link" href="#" id="shoppingcart">
               <i class="fas fa-shopping-cart"></i>
             </a>
           </li>
         </ul>
        </div>
        </div>
          <!-- 導覽列 -->
       <div class="et-hero-tabs">
     <!-- 要改放圖片的話再修正 -->
       <img src="" style="height: 70px; width: 1367px;" />

     <!-- 導覽列  超連結待補 -->
        <div class="et-hero-tabs-container">
          <a class="et-hero-tab" href="#aboutus">關於我們</a>
          <a class="et-hero-tab" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡比較</a>
          <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
          <a class="et-hero-tab" href="#mall">商城</a>
          <a class="et-hero-tab" href="#infoweb">資訊網</a>
          <span class="et-hero-tab-slider"></span>
       </div>
       </div>

       <div class="credittitle">詳細資訊</div>
      
       <div class="row imgareatext"><!-- 信用卡上半部 -->
           <div class="col-8 imagecared"><!-- 信用卡圖片 -->                        
             <img src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${bean.c_id}" id="cradeitsearchproduce_img"  width="300px" height="180px"> <!--這id連資料庫-->
           </div>
           <div class="col-12 creditname">
              <span id="cradeitsearchproduce_title">${bean.c_name}</span> <!--信用卡名稱-->
          </div>
          <div class="row textarea">
             <div class="col-4">
                <span id="cradeitsearchproduce_req">${bean.annual_income}</span></br><span style="color: #38618C; font-size: 16px;">最低年薪要求</span>
            </div>
            <div class="col-4">
                 <span id="cradeitsearchproduce_dcbn">${bean.dcb}</span></br><span style="color: #38618C;font-size: 16px;">國內消費現金回饋</span>
            </div>
            <div class="col-4">
              <span id="cradeitsearchproduce_fcbn">${bean.fcb}</span></br><span style="color: #38618C;font-size: 16px;">國外消費現金回饋</span>
            </div>
            <div class="col-8" style="margin-top: 2%;">
             <a href="" id="cradeitsearchproduce_bank"><input type="button" value="立即申請" class="voiceBtn"></a>
           </div>
        </div> 
       </div>
       
       <!--這裡為信用卡介紹的下半部-->
       <div class="col-8 creditareatext">
         <div>
             <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#cradeitsearchproduce_gift" data-toggle="tab">首刷禮</a></li>
                <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_dis" data-toggle="tab">優惠</a></li>
                <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_app" data-toggle="tab">申請資格</a></li>
                <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_mon" data-toggle="tab">財務費用</a></li>
           </ul>
            <div class="tab-content my-2 mx-2">
                 <div class="tab-pane fade show active" id="cradeitsearchproduce_gift">
                    <div class="gifttext">    <!--首刷禮-->
                     <img src="../cards/image/首刷禮.jpg">
                    </div>
                 </div>
                 <div class="tab-pane fade" id="cradeitsearchproduce_dis"> <!--優惠介紹-->
                </div>
                 <div class="tab-pane fade" id="cradeitsearchproduce_app"> <!--申請資格-->
                </div>
                <div class="tab-pane fade" id="cradeitsearchproduce_mon"> <!--財務費用-->
               </div>
           </div> 
       </div>
     </div>

        <!--這裡為謹慎理財區塊-->
        <div class="col-8 managermoney">
         <h2>謹慎理財 信用至上</h2>
         產品特色
         <p>
         <span id="cradeitsearchproduce_desc">一般消費（含悠遊自動加值）回饋0.5%；三大通路（國內加油、生鮮量販超市、餐廳）之前2萬元刷卡消費享額外1.5%現金回饋，當期帳單最高回饋NT$300元。活動期間：即日起~2020/06/30。
         現金紅利持卡期間有效！除了折抵帳單金額、紅利商品輕鬆換，還可兌換航空公司哩程。</span>
        </p>
         注意事項</br>
         <span id="cradeitsearchproduce_atten">詳細活動內容條件請詳花旗官網。</span>
       </div>
      
       
       <!--這裡再次提示使用比較的按鈕區塊-->
       <div class="col-8 butagain ">
          未找到你適合的信用卡?
          沒關係~有比卡丘會協助你找出最丘的信用卡</br>
          <a href="cradeitsearch_minecredit.html">
             <button id="cradeitsearchmine_btn" class="floater searchbtn"><i class='bx bx-search-alt'></i>
             </button>
           </a>
       </div>
          
           
               

     <!-- 回到置頂------>
      <div id="backtop" class="gotop">
     <h5>
       © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
     </h5>
     <br />
     <button type="button" class="btn btn-secondary">To the top</button>
     </div>

   </div>    
   <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/cradeitsearch_page.js"></script>
 </body>
</html>
