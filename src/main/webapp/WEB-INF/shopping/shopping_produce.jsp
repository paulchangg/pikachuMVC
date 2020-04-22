<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/shopping_produce.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>商品頁面</title>
</head>
<body>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/shoppingproduce.js"></script>
</body>
<div class="container">
    <div class="row ">
        <div class="col-12 p-5 logarea"><!--這裡開始為上方,呈現商標log位置-->
            ${LoginOK.m_id}皮卡丘商標位置
               <div class="col-5 offset-8 wrap"><!--這裡為右上角,呈現快速連結的位置-->
                   <ul>
                       <li class=""><a class="nav-link" href="#">會員登入</a></li>
                       <li class=""><a class="nav-link" href="#">Q&A</a></li>
                       <li class=""><a class="nav-link" href="../shoppingCart/showShoppingCart.jsp">購物車</a></li>
                       
                   </ul>
              </div>
       </div>

       <nav class="col-12 navbar sticky-top navbar-expand-lg "><!--這裡開始為導覽頁-->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navConetnt">
           <span class="navbar-toggler-icon"></span>
          </button>
         <div class="collapse navbar-collapse " id="shopping_navContent">
            <ul class="navbar-nav ">
                 <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                 <li class="nav-item"><a class="nav-link" href="../trackproduct/listTrack">追蹤商品</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                 <li class="nav-item"><a class="nav-link" href="../listProduct/DisplayPageProducts">購物商城</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                 <li class="nav-item"><a class="nav-link" href="<c:url value='../orderProcess/orderList.do' />">我的訂單</a></li>
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
                  <div class="carousel-inner" ><!--圖片顯示區-->
                       <div class="carousel-item active"><!--圖片項目區-->
                           <img class="d-block w-100" src="image/400寬-1.jpg" alt="Photo1">
                       </div>
                       <div class="carousel-item">
                          <img class="d-block w-100" src="image/400寬-2.jpg" alt="Photo2">
                       </div>
                      <div class="carousel-item">
                          <img class="d-block w-100 " src="image/400寬-3.jpg" alt="Photo3">
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
  
           <div class="col-12 sider">
                    <div class="btn-group-vertical"  id="shoppingproduce_btn">
                     <a href="shopping.html"> <button type="button" class="btn btn-outline-danger ">本月熱賣品</button></a>
                     <a href=""> <button type="button" class="btn btn-outline-danger ">吃貨歡樂劵</button></a>
                     <a href=""> <button type="button" class="btn btn-outline-danger ">放鬆娛樂劵</button></a>
                     <a href=""> <button type="button" class="btn btn-outline-danger ">外出旅遊券</button></a>
                  </div>
                  <div class="col-10 sidderr2 "><!--中間商品-->
                      <div class="col-12 producebox">
                          <div class="col-8 produceimg"><!--這裡1個id是要連資料庫商品的圖片-->
                             <img src="<c:url value='/shopping/getPicture/${product_INFO.p_id}' />"  class="img-fluid"  id="shoppingproduce_img">
                          </div>
                           <div class="col-4 produceitem"><!--中間商品--><!--這裡5個id是要連資料庫商品一切資料-->
                              <p>商品名稱:<span id="shoppingproduce_name">${product_INFO.p_name}</span></p>
                              <p>價格:<span id="shoppingproduce_price">${product_INFO.price}元</span></p>
                              <p>點數:<span id="shoppingproduce_bouns">${product_INFO.p_bns}點</span></p>
                              <p>剩餘庫存:<span id="shoppingproduce_stock">${product_INFO.stock}</span></p>
                             	    購買數量<p>
                          <FORM  action="<c:url value='/shopping/buyProduct'/>" method="POST">
                                <input id="shoppinproduce_min" name="qty1" type="button" value="-" />  <!--按鈕的方法是用id寫得所以如果有第二筆物件就必須把方法裡面的id更換掉-->
                                <input id="shoppinproduce_quantity" name="qty" type="text" value="1" />
                                <input id="shoppinproduce_add" name="qty1" type="button" value="+" />
                          </div>
                           <div class="col-3 threebutton">            
<!--                                <a href="shopping_cart.html"><button type="button" class="btn btn-warning" id="shoppingproduce_buy">立即購買</button></a> -->
                                <Input type='submit' class="btn btn-warning test" data-toggle="modal" data-target="#shoopingmodal"  value='放入購物車' style="margin-top: 20px">
                                <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
<!--                                 <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shoopinproduce_2" id="shoppingproduce_see">加入追蹤</button> -->
                                                                                                                                <!--加入追蹤清單如果沒有登入會員會跳出請先登入會員的視窗-->
                                                                                                                                <!--如果有登入會員會跳出已加入追蹤的視窗-->
                          </div>
                          </FORM>
                          <FORM  action="<c:url value='/trackproduct/DisplayPageProduct' />" method="POST">
                          <div class="col-3 threebutton">            
<!--                                <a href="shopping_cart.html"><button type="button" class="btn btn-warning" id="shoppingproduce_buy">立即購買</button></a> -->
                                <Input type='submit' class="btn btn-warning test" data-toggle="modal" data-target="#shoopingmodal"  value='加入追蹤' style="margin-top: 20px">
                                <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
<!--                                 <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shoopinproduce_2" id="shoppingproduce_see">加入追蹤</button> -->
                                                                                                                                <!--加入追蹤清單如果沒有登入會員會跳出請先登入會員的視窗-->
                                                                                                                                <!--如果有登入會員會跳出已加入追蹤的視窗-->
                          </div>
                          </FORM>
                           <div class="col-12 navtotal">
                                <ul class="nav nav-tabs">                     
                                    <li class="nav-item"><a class="nav-link active" href="#shoppingproduce_about" data-toggle="tab">商品描述</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#shoppingproduce_rul" data-toggle="tab">使用規則</a></li>
                                </ul>
                                <div class="tab-content my-2 mx-2">  <!--這裡2個id是要連資料庫商品資料-->
                                <div class="tab-pane fade show active" id="shoppingproduce_about">
                                    <p>${product_INFO.p_desc}</p>
                                </div>
                                 <div class="tab-pane fade" id="shoppingproduce_rul">
                                     <p>由台北捷運中山站的巷弄進化...
                                            依然用日常垂手可得的物件做為媒介，記錄、傳達與延續社會中美好正向的信念，集結生活美好當下的片刻成為階段性完整且美好的一段記憶。不同於2016，我們將更深入日常、更貼近大家的生活。
                                     </p>
                                 </div>
                                </div>
                            </div>    
                      </div>
                 </div>
                <div class="col-12 return"> <!--返回區塊-->
                    <a href="<c:url value='/listProduct/DisplayPageProducts' />"><button type="button" class="btn btn-warning">返回商城</button></a>
               </div>
           </div>
  
        <div class="col-12 footer" >尾巴</div><!--這區塊首頁出來套版-->
      </div>
  </div>


<!--   <!--這區塊是跳出視窗加入購物車視窗-->     -->
<!--   <div class="modal fade" id="shoopinproduce"> -->
<!--     <div class="modal-dialog"> -->
<!--         <div class="modal-content"> -->
<!--             <div class="modal-body"> -->
<!--                 <p>商品已加入購物車</p> -->
<!--                 <button type="button" class="btn btn-default" data-dismiss="modal">確認</button> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--   </div> -->

    <!--這區塊是跳出視窗加入追蹤視窗-->    
    <div class="modal fade" id="shoopinproduce_2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <p>商品已加入追蹤清單</p>
                    <button type="button" class="btn btn-default" data-dismiss="modal">確認</button>
                </div>
            </div>
        </div>
      </div>

    <!--這區塊是跳出需先登入會員才能追蹤清單-->    
        <div class="modal fade" id="shoopinproduce_3">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <p>請先登入會員才能將此商品加入清單</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">確認</button>
                    </div>
                </div>
            </div>
          </div>  
	<script type="text/javascript">
			$(document).ready(function(){
				$(".test").click(function(){
					alert("已加入購物車");
				})
			}
		)
	</script>
</html>