<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>我的信用卡</title>
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/cradeitsearch_mine2.css" />
     <link rel="stylesheet" href="css/wickedcss.min.css">
     <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
  </head>

  <body>
    <div class="container-fluid" style="height: 190px;">

       <div class="row logoarea">  <!-- logo區塊 -->   
          <div class="col-sm">
             <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
             <p style="font-size: small;">
               快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
             </p>
         </div>
         <div class="row justify-content-around">
           <div class="col-sm">
             <a href="index copy.html">
                <img src="/image/重新縮圖.png" alt="logo" style="height: 230px;" />
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
  
      
      <!-- 導覽列  超連結待補 -->
      <div class="et-hero-tabs">
         <div class="et-hero-tabs-container">
           <a class="et-hero-tab" href="#aboutus">關於我們</a>
           <a class="et-hero-tab" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡比較</a>
           <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
           <a class="et-hero-tab" href="#mall">商城</a>
           <a class="et-hero-tab" href="#infoweb">資訊網</a>
           <span class="et-hero-tab-slider"></span>
        </div>
      </div>
      
         
      <!--我的信用卡區塊-->
      <div class="col-8 searchbtnareatotal">
         <img src="/image/比卡丘黃色沒電波.png" class="fadeIn yellowimg">
          <img src="/image/電波.png" class="yellowimgee">
           <div class="searchtext">
              <p>想知道最適合自己的信用卡是哪張嗎?<br>
               讓比卡丘協助幫你找出最適合的<br>信用卡<i class='bx bx-credit-card-front bx-tada' ></i></p>
              <button id="cradeitsearchmine_btn" class="floater searchbtn"><i class='bx bx-search-alt'></i></button>
            </div>
      </div>


       <main class="col-8 main"><!--結果呈現區塊-->
               <div class="box"> <!--特效區塊需要當外層-->
                  <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
                      <line class="top" x1="0" y1="0" x2="1300" y2="0"/>
                      <line class="left" x1="0" y1="400" x2="0" y2="-1300"/>
                      <line class="bottom" x1="0" y1="160" x2="1300" y2="160"/>
                      <line class="right" x1="1090" y1="0" x2="1090" y2="160"/>
                  </svg>
                  <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
                    <div class="onecard"  name="${entry.value.bank}">
                       <span id="">${entry.value.c_name}</span> <!--卡名-->
                        <div class="row">
                           <div class="col-2 creditimg"><!--信用卡商品圖-->    
                              <img src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"  width="160px" height="110px">
                        
                          </div>
                           <div class="col credittext">
                                <div class="col-4 creditinner"><!--年費-->   
                                   <div><span >${entry.value.annlfee}</span></div>
                                   <div>年費</div>
                               </div>
                                <div class="col-4 creditinner"><!--國外消費-->   
                                    <div><span >${entry.value.fcb}</span></div>
                                    <div>國外消費現金回饋</div>
                                    <div></div>
                               </div> 
                                <div class="col-4 creditinner"><!--國內消費--> 
                                   <div><span >${entry.value.dcb}</span></div>
                                   <div>國內消費現金回饋</div>
                                   <div></div>
                               </div>
                           </div>   
                           <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                      </div>
                    </div>
                    </c:forEach> 
                 </div>
       </main>



       <!--點擊按鈕產生問卷的區塊-->
       <!-- Modal -->
       <div class="modal fade" id="cradeitsearchmine_myModal" tabindex="-1" role="dialog" aria-labelledby="cradeitsearchmine_myModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content" style="width: 35rem;">
             <div class="modal-header">
              <h4 class="modal-title" id="cradeitsearchmine_myModalLabel">問卷測驗</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
              <!-- 多用一個 form 表單包裝起來，之後送到後端 server  -->
            <form id="my-form" action="${pageContext.servletContext.contextPath}/cards/ModalSearch.do" method="post">
                <div class="step step1 active">
                  <!--開始-->
                  <p>請回答以下問題讓比卡丘快速找出最適合您的信用卡</p>
                  <img src="/image/對話框1.png" class="modalimgone">
                  <img src="/image/會動的比卡丘2.gif" class="modalimgtwo">
               </div>

               <div class="step step2">
                 <p>Q1:比卡丘想知道您的生日<i class='bx bx-calendar' >?</i></p>
                 <input type="date" name="bday" id='bday'>
                  <img src="/image/未滿20對話框.png" class="modalimgthree">
                  <img src="/image/會動的比卡丘2.gif" class="modalimgfour">
              </div>

               <div class="step step3" style="font-size: 25px;">
                 <p style="font-size: 20px;">Q2:比卡丘想知道您的性別?</p>
                 <input type="radio" value="male" name="gender" checked="true">
                 <i class='bx bx-male' ></i>男
                 <input type="radio" id="test" value="female" name="gender">
                 <i class='bx bx-female' ></i>女</br>
                 <img src="/image/猜猜看對話框.png" class="modalimgone">
                 <img src="/image/會動的比卡丘2.gif" class="modalimgtwo">
               </div>

               <div class="step step4">
               <p>Q3:比卡丘想知道您之前是否有辦過信用卡<i class='bx bxs-credit-card-front'></i>?</p>
               <input type="radio" value="" name="" checked="true">是
               <input type="radio" value="" name="">否</br>
               <img src="/image/小白對話框.png" class="modalimgone">
              <img src="/image/會動的比卡丘2.gif" class="modalimgtwo">
              </div>


           <div class="step step5">
            <p>Q4:比卡丘想知道您的年收入<i class='bx bx-money' ></i>?</p>
            <input type="radio" value="c.annual_income &lt;= 400000 AND c.annual_income &gt; 0" name="sal">20-40萬
            <input type="radio" value="c.annual_income &lt;= 600000 AND c.annual_income &gt; 0" name="sal" checked="true">40-60萬
            <input type="radio" value="c.annual_income BETWEEN 600000 AND 2000000 OR c.annual_income = 0" name="sal">60-200萬
            <input type="radio" value="c.annual_income &gt;= 2000000 OR c.annual_income = 0" name="sal">200萬以上</br>
            <img src="/image/年收入對話框.png" class="modalimgone">
            <img src="/image/會動的比卡丘2.gif" class="modalimgtwo">
            </div>

            <div class="step step6">
               <p>Q5:比卡丘想知道您平常消費習慣有哪些類別,最多選擇3項</p>   
               1.<select class='se' name="opt1">
               <option name="">請選擇</option>
               <option name="option" value='c.dcb > 0'>百貨購物</option>
               <option name="option" value='c.onlinefb > 0'>網路購物</option>
               <option name="option" value='c.refuel_cb > 0'>加油</option>
               <option name="option" value="c.fcb > 0">海外旅遊</option>
               <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
               </select>
               2.<select class='se' name="opt2">
               <option name="">請選擇</option>
               <option name="option" value='c.dcb > 0'>百貨購物</option>
               <option name="option" value='c.onlinefb > 0'>網路購物</option>
               <option name="option" value='c.refuel_cb > 0'>加油</option>
               <option name="option" value="c.fcb > 0">海外旅遊</option>
               <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
                </select>
                3.<select class='se' name="opt3">
               <option name="">請選擇</option>
               <option name="option" value='c.dcb > 0'>百貨購物</option>
               <option name="option" value='c.onlinefb > 0'>網路購物</option>
               <option name="option" value='c.refuel_cb > 0'>加油</option>
               <option name="option" value="c.fcb > 0">海外旅遊</option>
               <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
                  </select>

                  <img src="/image/最後一題2.png" class="modalimgfinal">
                  <img src="/image/會動的比卡丘2.gif" class="modalimgfinal">
           </div>
          </form>
        </div>
      <!-- 按鈕統一放在下面這個區塊，並且用 Js 控制他們的隱藏 -->
        <div class="modal-footer">
          <button type="button" id="prevBtn" class="btn btn-default">
            上一題
         </button>
         <button type="button" id="nextBtn" class="btn btn-primary">
          開始
         </button>
       </div>
     </div>
   </div>
  </div>
       
  
    <!-- 回到置頂------>
       <div id="backtop" class="gotop">
          <h5>
             © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
         </h5> <br/>
          <button type="button" class="btn btn-secondary">To the top</button>
      </div>

    </div>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index_modal.js"></script>
    <script src="js/crseitsearch_min.js"></script>
 </body>
</html>


