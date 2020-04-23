<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/cradeitsearch_mine.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>我的信用卡</title>
</head>
<body>
  <div class="container">
     <div class="row ">
          <div class="col-12 p-3 logarea"><!--這裡開始為上方,呈現商標log位置-->
            皮卡丘商標位置
          </div>
       
          <nav class="col-12 navbar sticky-top navbar-expand-lg "><!--這裡開始為導覽頁-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navConetnt">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="cradeitsearchmine_navContent">
               <ul class="navbar-nav ">
                  <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">購物商城</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡</a></li>
               </ul>
             </div>
          </nav>

           <!--這裡為信用卡介紹的小區塊-->
          <div class="col-12 credittitle">我的信用卡</div>

          
           <!--歡迎使用按鈕點及找出信用卡-->
          <div class="col-8 searchbtnareatotal "> 
               <div class="col-8 searchbtnarea">
                  想知道最邱的信用卡是哪一張嗎?
                  快來測驗看看吧
                  最多只要回答五題
                 <input type="button" value="點擊我測驗" id="cradeitsearchmine_btn">
               </div>
               <div class="col-2 searchbtnareatwo">
               
             </div>
         </div>
          
           <!--為中間為結果區塊-->    
          <div class="col-12 creditcenter">
         <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
                <div class="onecard"  name="${entry.value.bank}">
                   <span id="">${entry.value.c_name}</span> <!--卡名-->
                    <div class="row">
                       <div class="col-2 creditimg"><!--信用卡商品圖-->    
                          <img src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"  width="110px" height="90px">
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

          <!--   <div class="col-12 creditcenter">
               <div class="onecard">
                   <span id="">花旗銀行現金回饋卡</span> 這裡為信用卡第2張為範例資料須從資料庫撈
                     <div class="row">
                          <div class="col-2 creditimg">信用卡商品圖    
                             <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
                         </div>
                          <div class="col credittext">
                               <div class="col-4 creditinner">年費   
                                  <div><span id="">首年免年費</span></div>
                                  <div><span id="">年費</span></div>
                              </div>
                               <div class="col-4 creditinner">國外消費   
                                   <div><span id="">不適用</span></div>
                                   <div><span id="">國外消費現金回饋</span></div>
                                   <div><span id=""></span></div>
                              </div> 
                               <div class="col-4 creditinner">國內消費 
                                  <div><span id="">2%</span></div>
                                  <div><span id="">國內消費現金回饋</span></div>
                                  <div><span id="">2%</span></div>
                              </div>
                          </div>   
                          <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div>商品連結頁面 
                     </div>
                 </div>
           </div>   -->


       <!--點擊按鈕產生問卷的區塊-->
       <!-- Modal -->
       <div class="modal fade" id="cradeitsearchmine_myModal" tabindex="-1" role="dialog" aria-labelledby="cradeitsearchmine_myModalLabel">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="cradeitsearchmine_myModalLabel">問卷測驗</h4>
               </div>
               <div class="modal-body">
                <!-- 多用一個 form 表單包裝起來，之後送到後端 server  -->
              <form id="my-form" action="${pageContext.servletContext.contextPath}/cards/ModalSearch.do" method="post">
                  <div class="step step1 active">
                  <!--開始-->
                   <p>請回答以下問題協助我們找出最適合您的信用卡</p>
                 </div>
                 <div class="step step2">
                   <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                   <p>Q1請問您的生日</p>
                   <input type="date" name="bday" id='bday'>
               
                </div>
                 <div class="step step3">
                   <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                   <p>Q2請問您的年收入</p>
                   <input type="radio" value="c.annual_income &lt;= 400000 AND c.annual_income &gt; 0" name="sal">20-40萬
                   <input type="radio" value="c.annual_income &lt;= 600000 AND c.annual_income &gt; 0" name="sal" checked="true">40-60萬
                   <input type="radio" value="c.annual_income BETWEEN 600000 AND 2000000 OR c.annual_income = 0" name="sal">60-200萬
                   <input type="radio" value="c.annual_income &gt;= 2000000 OR c.annual_income = 0" name="sal">200萬以上</br>
               </div>
                 <div class="step step4">
                 <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                 <p>Q3請問您是否有辦過信用卡</p>
                 <input type="radio" value="" name="" checked="true">是
                 <input type="radio" value="" name="">否</br>
             </div>
             <div class="step step5">
                <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                <p>Q4請依序選擇您平常最常做的消費,至多可以選擇3項</p>   
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

              </div>
              <div class="step step6">
             <p>Q5請問您的性別</p>
                   <input type="radio" value="male" name="gender" checked="true">男
                   <input type="radio" id="test" value="female" name="gender">女</br>
              
            <!--      <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                 <p>請問再您已持有的信用卡中,哪些類別優惠是您相當滿意的?(可複選)</p>
                 <input type="checkbox" name="" value="">國內購物
                 <input type="checkbox" name="" value="">大眾運輸
                 <input type="checkbox" name="" value="">海外旅遊購物
                 <input type="checkbox" name="" value="">娛樂電影
                 <input type="checkbox" name="" value="">交通工具加油 -->
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

      
          <!--這裡為尾巴--> 
          <div class="col-12 footer">底部位置</div>
    </div>
 </div>
 <script src="js/jquery-3.4.1.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/crseitsearch_min.js"></script>
</body> 
</html>    