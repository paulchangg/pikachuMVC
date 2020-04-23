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
    <link href="css/cradeitsearch_page.css" rel="stylesheet" type="text/css">
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
          <div class="collapse navbar-collapse " id="cradeitsearchpage_navContent">
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
                <span id="cradeitsearchpage_number">${cardCounts}項搜尋結果</span>
               
                   <div class="col-10 dropdown" id="cradeitsearchpage_btnone">
                      <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                         <span id="">精選推薦<span>
                      </button>
                        <div class="dropdown-menu" id="cradeitsearchpage_btninn">
                        
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
            <a href="<c:url value="cradeitsearch_minecredit.jsp"/>">
              <%-- <a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_minecredit.jsp"> --%> <input type="button" value="最適合我的信用卡"> </a>           
            </div>
          <div class="col-3 creditsider"> <!--為側邊選單共34間銀行機構-->                
            按需要機構/銀行篩選
             <div>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="花旗銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">花旗銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="匯豐銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">匯豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="渣打銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">渣打銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="星展銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">星展銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="王道銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">王道銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="新光銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">新光銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="中國信託">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">中國信託</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="國泰世華">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">國泰世華</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="玉山銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">玉山銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="台新銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台新銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="聯邦銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">聯邦銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="美國運通">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">美國運通</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="遠東商銀">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">遠東商銀</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="臺灣企銀">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">臺灣企銀</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="彰化銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">彰化銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="永豐銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">永豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="華泰銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">華泰銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="華南銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">華南銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="台北富邦">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台北富邦</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="第一銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">第一銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="高雄銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">高雄銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="安泰銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">安泰銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="合作金庫">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">合作金庫</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="兆豐銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">兆豐銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="凱基銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">凱基銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="台灣樂天">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台灣樂天</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="臺灣銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">臺灣銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="台中商銀">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">台中商銀</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="日盛銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">日盛銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="元大銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">元大銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="土地銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">土地銀行</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="三信銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">三信銀行</span>
            </label></br>
            <label>
              <input type="checkbox" name="bank" class="checkbox" value="上海商銀">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">上海商銀</span>
            </label></br>
            <label >
              <input type="checkbox" name="bank" class="checkbox" value="陽信銀行">
              <span class="btn-box">
                <span class="btn"></span>      
              </span>
              <span class="text">陽信銀行</span>
            </label></br>
             </div>
          </div>
          
          <div class="col-8 contentcenter"><!--為中間顯示區塊-->    
          
          
          
          <c:choose> 
          <c:when test="${qt == 'cb'|| qt == 'main' }">  <!--第1種：現金回饋-->
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
                       <div class="col-2 creditbtn">
                       
                       <a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>
                       	詳細資訊</a>
                       	</div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>
                
                
                <c:when test="${qt == 'ml'}"> <!--第2種：哩程回饋-->
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
                                <div><span >${entry.value.fma}</span></div>
                                <div>國外消費累積哩程</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.dma}</span></div>
                               <div>國內消費累積哩程</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>
                
          <c:when test="${qt == 'oil'}">  <!--第3種：加油回饋-->
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
                                <div><span >${entry.value.refuel_cb}</span></div>
                                <div>加油現金回饋</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.refuel_dis}</span></div>
                               <div>加油優惠</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>
                
          <c:when test="${qt == 'mv'}">  <!--第4種：電影優惠-->
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
                                <div><span >${entry.value.wkdmoviedis}</span></div>
                                <div>週未電影折扣</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.moviedis}</span></div>
                               <div>平日電影折扣</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>                                

          <c:when test="${qt == 'os'}">  <!--第5種：網購回饋-->
          <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
                <div class="onecard"  name="${entry.value.bank}">
                   <span id="">${entry.value.c_name}</span> <!--卡名-->
                    <div class="row">
                       <div class="col-2 creditimg"><!--信用卡商品圖-->    
                          <img src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${entry.value.c_id}"  width="110px" height="90px">
                      </div>
                       <div class="col credittext">
                            <div class="col-4 creditinner"><!--年費-->   
                               <div><span >${entry.value.ditigalfb}</span></div>
                               <div>數位通路回饋上限</div>
                           </div>
                            <div class="col-4 creditinner"><!--國外消費-->   
                                <div><span >${entry.value.fcb}</span></div>
                                <div>國外消費現金回饋</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.onlinefb}</span></div>
                               <div>網購回饋</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>                

          <c:when test="${qt == 'zi'}">  <!--第6種：分期零利率-->
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
                                <div><span >${entry.value.zeroins}</span></div>
                                <div>最高分期數</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.minins}</span></div>
                               <div>最底可分期金額</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>                

          <c:when test="${qt == 'fg'}">  <!--第7種：首刷-->
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
                                <div><span >${entry.value.mileagefb}</span></div>
                                <div>首刷哩程回饋</div>
                                <div></div>
                           </div> 
                            <div class="col-4 creditinner"><!--國內消費--> 
                               <div><span >${entry.value.cashfb}</span></div>
                               <div>首刷(類)現金回饋</div>
                               <div></div>
                           </div>
                       </div>   
                       <div class="col-2 creditbtn"><a href="${pageContext.servletContext.contextPath}/cards/cradeitsearch_produce?id=${entry.value.c_id}" class="btn btn-primary" id=>詳細資訊</a></div><!--商品連結頁面--> 
                  </div>
                </div>
                </c:forEach> 
                </c:when>                

          <c:when test="${qt == 'all'}">  <!--第8種：全部-->
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
                </c:when>                
                
                
                </c:choose>
                
        </div>
        
     </div>

           <!--這裡為尾巴--> 
        <div class="col-12 footer">底部位置</div>
    </div>
 </div>
 <script src="js/jquery-3.4.1.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 
 <script>

var checkValue = document.getElementsByName("bank");//上網查使用checkbox用這個方式取得

for(var i=0;i<checkValue.length;i++){
  checkValue[i].addEventListener("click",show,false);  
};

function show(){
  
 let checkarray=[]; 
  
  for(let i=0;i<checkValue.length;i++){
     if(checkValue[i].checked)  
      {
        checkarray.push(checkValue[i].value);  
      }
        
  } 
   
  let cdiv = document.getElementsByClassName("onecard");
  let cnt = 0;      
  if (checkarray.length == 0) {  //如果全部都沒勾選，就全顯示
    for (let x = 0; x < cdiv.length; x++) {
      cdiv[x].style.display = 'block';
      cnt++;
    }
  } else {                       //不是全部沒勾(即有任一勾選)
    for (let x = 0; x < cdiv.length; x++) {

      if (checkarray.indexOf(cdiv[x].getAttribute('name')) != -1) {   //!= -1 代表有在陣列裡
        cdiv[x].style.display = 'block';
        cnt++;
      } else {
        cdiv[x].style.display = 'none'; 
      }  
    }
  }
  console.log(cnt);
  let cntcard = document.getElementById('cradeitsearchpage_number');
  cntcard.innerText =cnt + "項搜尋結果";
  }


</script>
 
 
 
</body> 
</html>    
