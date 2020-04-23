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
    <link href="css/cradeitsearch.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>信用卡比較</title>
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
          <div class="collapse navbar-collapse " id="cradeitsearch_navContent">
             <ul class="navbar-nav ">
                 <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">購物商城</a></li>
                <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/cards/cradeitCb">信用卡比較</a></li>
            </ul>
         </div>
       </nav>

       <div class="col-12 center "><!--輪播圖區塊包覆的開始-->
         <div id="advarea" class="carousel slide" data-ride="carousel">
             <ol class="carousel-indicators"><!--導引連結區-->
                <li data-target="#advarea" data-slide-to="0" class="active"></li> <!--廣告數量,位置由0開始計算-->
                <li data-target="#advarea" data-slide-to="1"></li>
                <li data-target="#advarea" data-slide-to="2"></li>
             </ol>
             <div class="carousel-inner" ><!--輪播圖片顯示區-->
                 <div class="carousel-item active"><!--輪播圖片項目區-->
                    <img class="d-block w-100" src="image/信用卡優惠廣告01.jpg" height="300px" alt="Photo1">
                 </div>
                 <div class="carousel-item">
                   <img class="d-block w-100" src="image/信用卡優惠廣告02.png" height="300px" alt="Photo2">
                 </div>
                 <div class="carousel-item">
                   <img class="d-block w-100 " src="image/信用卡優惠廣告03.jpg" height="300px" alt="Photo3">
                  </div>
             </div>
               <a class="carousel-control-prev" href="#advarea" role="button" data-slide="prev"><!--向前切換-->
                <span class="carousel-control-prev-icon"></span>
              </a>
               <a class="carousel-control-next" href="#advarea" role="button" data-slide="next"><!--向後切換-->
                <span class="carousel-control-next-icon"></span>
              </a>
         </div>
       </div>

       <!--這裡為顯信用卡介紹的小區塊-->
       <div class="col-12 credittitle">精選推薦</div>

        <!--這裡為信用卡選單區塊-->
       <div class="col-12 creditbtnarea"> 
               <div class="col-2 titelresult"><span id="cradeitsearch_number">298</span>項搜尋結果-</div>
                <div class="col-7 dropdown" id="cradeitsearch_btnone">
                   <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                    精選推薦
                   </button>
                   <!--這裡為下拉式選單區塊-->
                    <div class="dropdown-menu"  id="cradeitsearch_siderinn">
               
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=all">全部</a>
                      
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=cb">現金回饋</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=ml">哩程回饋</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=oil">加油卡優惠</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=mv">電影優惠</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=zi">分期零利率優惠</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=os">網路購物</a>
                        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=fg">信用卡首刷禮</a>
                        
                     </div>
               </div>
          </div>
      
       <!--這裡為中間區塊-->
      <div class="col-12 creditcenter">
          <div class="searchbtn">找出最丘的信用卡gogogo-->
             <a href="cradeitsearch_minecredit.html"> <input type="button" value="最適合我的信用卡"> </a>           
          </div>
          <div class="col-3 creditsider"> <!--為側邊選單共34間銀行機構-->                
            按需要機構/銀行篩選
             <div>
            <label><!--銀行回傳的value值為銀行代碼-->   
              <input type="checkbox" name="bank" class="checkbox" value="021">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">花旗銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="052">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">匯豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="021">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">渣打銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="810">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">星展銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="048">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">王道銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="103">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">新光銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="822">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">中國銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="013">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">國泰銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="808">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">玉山銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="812">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台新銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="803">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">聯邦銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="024">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">美國運通</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="805">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">遠東商銀</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="050">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台灣企銀</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="009">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">彰化銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="807">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">永豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="102">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">華泰銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="008">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">華南銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="012">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台北富邦</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="007">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">第一銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="016">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">高雄銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="816">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">安泰銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="006">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">合作銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="017">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">兆豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="809">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">凱基銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="960">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台灣樂天</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="004">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台灣銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="053">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台中銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="815">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">日盛銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="806">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">元大銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="005">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">土地銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="147">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">三信銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="011">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">上海商銀</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="108">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">陽信銀行</span>
            </label></br>
             </div>
          </div>
          <div class="col-8 contentcenter"><!--為中間顯示區塊-->    
              <div class="onecard">
                  <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第1張為範例資料須從資料庫撈-->
                    <div class="row">
                         <div class="col-2 creditimg"><!--信用卡商品圖-->    
                            <img src="image/花旗銀行現金回饋卡.png" id="credittitle_image" width="110px" height="90px">
                        </div>
                         <div class="col credittext">
                              <div class="col-4 creditinner"><!--年費-->   
                                 <div><span id="credittitle_one">首年免年費</span></div>
                                 <div><span id="credittitle_two">年費</span></div>
                             </div>
                              <div class="col-4 creditinner"><!--國外消費-->   
                                  <div><span id="credittitle_ three">不適用</span></div>
                                  <div><span id="credittitle_ four">國外消費現金回饋</span></div>
                                  <div><span id="credittitle_five"></span></div>
                             </div> 
                              <div class="col-4 creditinner"><!--國內消費--> 
                                 <div><span id="credittitle_six">2%</span></div>
                                 <div><span id="credittitle_seven">國內消費現金回饋</span></div>
                                 <div><span id="credittitle_eight">2%</span></div>
                             </div>
                         </div>   
                         <div class="col-2 creditbtn"><a href="cradeitsearch_produce.html" class="btn btn-primary" id=credittitle_url>詳細資訊</a></div><!--商品連結頁面--> 
                    </div>
                </div>

                <div class="onecard">
                   <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第2張沒有提供id 請以第1張為主-->
                   <div class="row">
                       <div class="col-2 creditimg"><!--信用卡商品圖-->    
                          <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
                      </div>
                       <div class="col credittext">
                            <div class="col-4 creditinner"><!--年費-->   
                               <div><span id="">首年免年費</span></div>
                               <div>年費</div>
                           </div>
                            <div class="col-4 creditinner"><!--國外消費-->   
                                <div><span id="">不適用</span></div>
                                <div>國外消費現金回饋</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span id="">2%</span></div>
                               <div>國內消費現金回饋</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                   </div>
               </div>

                 <div class="onecard">
                      <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第3張沒有提供id 請已以1張為主-->
                     <div class="row">
                         <div class="col-2 creditimg"><!--信用卡商品圖-->    
                           <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
                         </div>
                              <div class="col credittext">
                                  <div class="col-4 creditinner"><!--年費-->   
                                  <div><span id="">首年免年費</span></div>
                                  <div>年費</div>
                               </div>
                               <div class="col-4 creditinner"><!--國外消費-->   
                                  <div>不適用</div>
                                  <div>國外消費現金回饋</div>
                                  <div></div>
                               </div> 
                               <div class="col-4 creditinner"><!--國內消費--> 
                                  <div><span id="">2%</span></div>
                                  <div>國內消費現金回饋</div>
                                  <div></div>
                               </div>
                            </div>   
                       <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                   </div>
                 </div>

              <div class="onecard">
                 <span id="credittitle_title">花旗銀行現金回饋卡</span><!--這裡為信用卡第4張沒有提供id 請以第1張為主-->
                  <div class="row">
                   <div class="col-2 creditimg"><!--信用卡商品圖-->    
                      <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
                  </div>
                   <div class="col credittext">
                        <div class="col-4 creditinner"><!--年費-->   
                           <div>首年免年費</div>
                           <div>年費</div>
                       </div>
                        <div class="col-4 creditinner"><!--國外消費-->   
                            <div>不適用</div>
                            <div>國外消費現金回饋</div>
                            <div></div>
                       </div> 
                        <div class="col-4 creditinner"><!--國內消費--> 
                           <div><span>2%</span></div>
                           <div>國內消費現金回饋</div>
                           <div></div>
                       </div>
                   </div>   
                   <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
              </div>

              <div class="onecard">
                 <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第5張沒有提供id 請以第1張為主-->
            <div class="row">
                 <div class="col-2 creditimg"><!--信用卡商品圖-->    
                    <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
                </div>
                 <div class="col credittext">
                      <div class="col-4 creditinner"><!--年費-->   
                         <div><span id="">首年免年費</span></div>
                         <div>年費</div>
                     </div>
                      <div class="col-4 creditinner"><!--國外消費-->   
                          <div><span id="">不適用</span></div>
                          <div>國外消費現金回饋</div>
                          <div></div>
                     </div> 
                      <div class="col-4 creditinner"><!--國內消費--> 
                         <div><span id="">2%</span></div>
                         <div>國內消費現金回饋</div>
                         <div></div>
                     </div>
                 </div>   
                 <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                </div>
            </div>

            <div class="onecard">
               <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第6張沒有提供id 請以第1張為主-->
               <div class="row">
               <div class="col-2 creditimg"><!--信用卡商品圖-->    
                  <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
              </div>
               <div class="col credittext">
                    <div class="col-4 creditinner"><!--年費-->   
                       <div>首年免年</div>
                       <div>年費</div>
                   </div>
                    <div class="col-4 creditinner"><!--國外消費-->   
                        <div><span >不適用</span></div>
                        <div>國外消費現金回饋</div>
                        <div></div>
                   </div> 
                    <div class="col-4 creditinner"><!--國內消費--> 
                       <div><span id="">2%</span></div>
                       <div>國內消費現金回饋</div>
                       <div></div>
                   </div>
               </div>   
               <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
              </div>
           </div>

           <div class="onecard">
           <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第7張為範例資料須從資料庫撈-->
           <div class="row">
             <div class="col-2 creditimg"><!--信用卡商品圖-->    
                <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
            </div>
             <div class="col credittext">
                  <div class="col-4 creditinner"><!--年費-->   
                     <div><span id="">首年免年費</span></div>
                     <div>年費</div>
                 </div>
                  <div class="col-4 creditinner"><!--國外消費-->   
                      <div><span id="">不適用</span></div>
                      <div>國外消費現金回饋</div>
                      <div></div>
                 </div> 
                  <div class="col-4 creditinner"><!--國內消費--> 
                     <div><span id="">2%</span></div>
                     <div>國內消費現金回饋</div>
                     <div></div>
                 </div>
             </div>   
             <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
           </div>
          </div>

            <div class="onecard">
           <span id="credittitle_title">花旗銀行現金回饋卡</span> <!--這裡為信用卡第8張為範例資料須從資料庫撈-->
            <div class="row">
           <div class="col-2 creditimg"><!--信用卡商品圖-->    
              <img src="image/花旗銀行現金回饋卡.png" id="" width="110px" height="90px">
          </div>
           <div class="col credittext">
                <div class="col-4 creditinner"><!--年費-->   
                   <div><span id="">首年免年費</span></div>
                   <div>年費</div>
               </div>
                <div class="col-4 creditinner"><!--國外消費-->   
                    <div><span id="">不適用</span></div>
                    <div>國外消費現金回饋</div>
                    <div></div>
               </div> 
                <div class="col-4 creditinner"><!--國內消費--> 
                   <div><span id="n">2%</span></div>
                   <div>國內消費現金回饋</div>
                   <div></div>
               </div>
           </div>   
           <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
           </div>
          </div>
        </div>
       </div>  

      
           <!--這裡為尾巴--> 
        <div class="col-12 footer">底部位置</div>
    </div>
 </div>
 <script>


 </script>
 <script src="js/jquery-3.4.1.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</body> 
</html>    