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
    <link href="cards/css/cradeitsearch_page.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="cards/css/bootstrap.min.css">
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
          <div class="collapse navbar-collapse " id="cradeitsearchpage_navContent">
             <ul class="navbar-nav ">
                 <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">購物商城</a></li>
                <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                <li class="nav-item"><a class="nav-link" href="#">信用卡</a></li>
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
       <div class="col-12 credittitle"><span id="cradeitsearchpage_title">全部信用卡<span></div>

        <!--這裡為信用卡選單區塊-->
       <div class="col-12 creditbtnarea"> 
            <div class="col-8 btnareaone"> <!--信用卡分類連結共14個-->
                <span id="cradeitsearchpage_number">298</span>項搜尋結果
                   <div class="col-10 dropdown" id="cradeitsearchpage_btnone">
                      <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                         <span id="">精選推薦<span>
                      </button>
                        <div class="dropdown-menu" id="cradeitsearchpage_btninn">
                          <a class="dropdown-item" href="#" id="">全部</a>
                          <a class="dropdown-item" href="cradeitsearch.html">精選推薦</a>
                          <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/cards/cradeitCb" id="">現金回饋</a>
                          <a class="dropdown-item" href="#" id="">限時優惠</a>
                          <a class="dropdown-item" href="#" id="">加油卡優惠</a>
                          <a class="dropdown-item" href="#" id="">哩程回饋</a>
                          <a class="dropdown-item" href="#" id="">分期零利率優惠</a>
                          <a class="dropdown-item" href="#" id="">電影優惠</a>
                          <a class="dropdown-item" href="#" id="">信用卡首刷禮</a>
                          <a class="dropdown-item" href="#" id="">網路購物</a>
                          <a class="dropdown-item" href="#" id="">亞洲萬里通</a>
                          <a class="dropdown-item" href="#" id="">繳保費優惠</a>
                          <a class="dropdown-item" href="#" id="">紅利點數</a>
                          <a class="dropdown-item" href="#" id="">繳稅優惠</a>
                       </div>
                    </div>
               </div>
           <div class="col-4 btnareatwo" ><!--信用卡排序方式-->
                 <div class="col-9 btnareatext">排序方式</div>
                 <div class="dropdown">
                     <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                       年費
                     </button>
                    <div class="dropdown-menu">
                       <a class="dropdown-item" href="#" id="">年費</a>
                       <a class="dropdown-item" href="#" id="">國內消費現金回饋</a>
                       <a class="dropdown-item" href="#" id="">國外消費現金回饋</a>
                    </div>
                 </div>  
           </div>
      </div>
      
       <!--這裡為中間區塊-->
      <div class="col-12 creditcenter">
           <div class="searchbtn">找出最丘的信用卡gogogo-->
              <a href=""> <input type="button" value="最適合我的信用卡"> </a>           
            </div>
          <div class="col-3 creditsider"> <!--為側邊選單共34間銀行機構-->                
            按需要機構/銀行篩選
             <div>
            <label>
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
          
          <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
                <div class="onecard">
                   <span id="">${entry.value.c_name}</span> <!--這裡為信用卡第2張請以第1張為主-->
                    <div class="row">
                       <div class="col-2 creditimg"><!--信用卡商品圖-->    
                          <img src="${pageContext.servletContext.contextPath}/RetrieveCardImg?id=${entry.value.c_id}"  width="110px" height="90px">
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
                       <div class="col-2 creditbtn"><a href="" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
        </div>
        
     </div>
 
    
     <!--底部分頁 一頁最多呈現8筆如果超過8筆以下為分頁連結-->
     <div class="col-12 return">
      <ul class="pagination pagination-sm">
          <li class="page-item"> <a class="page-link" href="#" aria-label="Previous">
             <span aria-hidden="true">&laquo;</span> </a></li>
          <li class="page-item"><a class="page-link" href="#" id="cradeitsearchpage_pag1">1</a></li>
          <li class="page-item"><a class="page-link" href="#" id="cradeitsearchpage_pag2">2</a></li>
          <li class="page-item"><a class="page-link" href="#" id="cradeitsearchpage_pag3">3</a></li>
          <li class="page-item"><a class="page-link" href="#" aria-label="Next">
             <span aria-hidden="true">&raquo;</span></a>
      </ul>
    </div>

      
           <!--這裡為尾巴--> 
        <div class="col-12 footer">底部位置</div>
    </div>
 </div>
 <script src="cards/js/jquery-3.4.1.js"></script>
 <script src="cards/js/popper.min.js"></script>
 <script src="cards/js/bootstrap.min.js"></script>
</body> 
</html>    
