<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
     <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/wickedcss.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link href="css/shopping_produce.css" rel="stylesheet" type="text/css">
    <title>商品資訊</title>
</head>
 <body>
  <!-- 上方標題logo列----超連結待補----->
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
          <a href="<c:url value="/"/>">
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
             <c:choose>
				<c:when test="${empty LoginOK}">										
					<a class="nav-link" href="<c:url value="/member/member_login"/>" id="memberlogin" style="color: rgb(92, 41, 7);">會員登出</a>										
				</c:when>
				<c:otherwise>										
					<a class="nav-link" href="<c:url value="/member/member_logout"/>" id="memberlogout" style="color: rgb(92, 41, 7);">會員登出</a> 											
				</c:otherwise>
			 </c:choose>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href='<c:url value="/member/member_center"/>' id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
                <a class="nav-link"  style="color: rgb(92, 41, 7);" href="<c:url value="/shopping/listtrackproduct" />">追蹤商品</a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="<c:url value='/shopping/orderList' />"id="memberlogin" style="color: rgb(92, 41, 7);">查詢訂單</a>
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

    <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
    <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列  -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>
   
    <!-- 中間區塊 -->
    <div class="wrap">
      <!--輪播圖區塊包覆的開始-->
      <div class="center ">
		    <div id="advarea" class="carousel slide" data-ride="carousel">
		       <ol class="carousel-indicators"><!--導引連結區-->
			    <li data-target="#advarea" data-slide-to="0" class="active"></li> <!--廣告數量,位置由0開始計算-->
			    <li data-target="#advarea" data-slide-to="1"></li>
			   <li data-target="#advarea" data-slide-to="2"></li>
		       </ol>
		       <div class="carousel-inner" ><!--輪播圖片顯示區-->
              <div class="carousel-item active "><!--輪播圖片項目區-->
					        <span class="wordone">吃喝玩樂的購物商城</span>
                  <img src="../shopping/image/購物車.png" class="imagepickone">
			      	</div>
			      	<div class="carousel-item">
                  <span class="wordonetwo">這週末買餐劵去約會吧</span>
                  <img src="../shopping/image/壽司壽司好吃.gif" class="zoomer imagepicktwo">
                  <img src="../shopping/image/壽司壽司好吃翻轉.gif"class="zoomer imagepickthree">
			      	</div>
			         <div class="carousel-item">
                  <span class="wordonethee">假期來臨提早買票券計劃吧</span>
                  <img src="../shopping/image/滑雪比卡丘.png"class="wiggle imagepickfour">
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

     <!--商品標題-->
    <div class="hottitle"><h2>商品資訊</h2></div>


      <div class="row">
         <div class="col-2 sidderrone"><!--左邊選單-->
            <ul class="sidderul">
                <li><a href='<c:url value='/shopping/listProduct'/>'> 本月熱賣品</a></li>
                <li><a href="<c:url value='/shopping/吃貨歡樂劵'/>"> 吃貨歡樂劵</a></li>
                <li><a href="<c:url value='/shopping/放鬆娛樂劵'/>"> 放鬆娛樂劵</a></li>
                <li><a href="<c:url value='/shopping/外出旅遊劵'/>"> 外出旅遊券</a></li>
            </ul>
         </div>

         <div class="col-10 totalarea">
          <div class="row justify-content-center">
              <div class="col-5 produceimg"><!--商品圖片-->
                <img  src="<c:url value='/shopping/getPicture/${product_INFO.p_id}' />"   class="imagepone"  id="shoppingproduce_img">
             </div>
              <div class="col-4 produceitem"><!--中間商品--><!--這裡5個id是要連資料庫商品一切資料-->
                  <p style="text-align:left;">商品名稱:<span id="shoppingproduce_name">${product_INFO.p_name}</span></p>
                  <p style="text-align:left;">價格:<span id="shoppingproduce_price">${product_INFO.price}元</span></p>
                  <p style="text-align:left;">剩餘庫存:<span id="shoppingproduce_stock">${product_INFO.stock}</span></p>
                  <p style="text-align:left;">購買數量</p>
               <FORM  action="<c:url value='/shopping/buyProduct'/>" method="POST" style="text-align:left">
                   <label class="labelall"><input id="shoppinproduce_min" name="qty1" type="button" value="-" /></label><!--按鈕的方法是用id寫得所以如果有第二筆物件就必須把方法裡面的id更換掉-->
                   <label class="labelall"><input id="shoppinproduce_quantity" name="qty" type="text" value="1" /></label> 
                   <label class="labelall"><input id="shoppinproduce_add" name="qty1" type="button" value="+" /></label>

                   <label class="labelone"><Input type='button' id="addShop" data-toggle="modal" data-target="#shoopingmodal"  value='放入購物車'  productId='${product_INFO.p_id}' > </label>
                  <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
              </FORM>
              <FORM  action="<c:url value='/shopping/addtrackproduct' />" method="POST" style="text-align:left">    
                  <!-- <a href="shopping_cart.html"><button type="button" class="btn btn-warning" id="shoppingproduce_buy">立即購買</button></a> -->
                  <label class="labelway" ><Input type='button'  id="addTrack" data-toggle="modal" data-target="#shoopingmodal"  value='加入追蹤清單'  productId='${product_INFO.p_id}'> 
                  </label> 
                 <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
                  <!-- <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shoopinproduce_2" id="shoppingproduce_see">加入追蹤</button> -->
              </FORM>
             </div>
          </div>
          <div class="col-8 navtotal"> <!--優惠卷使用詳細說明-->
             <ul class="nav nav-tabs">                     
                <li class="nav-item"><a class="nav-link active" href="#shoppingproduce_about" data-toggle="tab">商品資訊</a></li>
                <li class="nav-item"><a class="nav-link" href="#shoppingproduce_rul" data-toggle="tab">使用須知</a></li>
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

    <div class="return"> <!--返回區塊-->
        <a href="<c:url value='/shopping/listProduct' />"><button type="button" class="returnBtn">返回商城</button></a>
    </div>

    <!-- 底部 ------>
    <div id="backtop" class="gotop">
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      <div class="footer">
        <ul> 
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-facebook"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-twitter"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-instagram"></span>
          </li>
          <li>
              <span></span>
              <span></span>
              <span class="fab fa-linkedin"></span>
          </li>
        </ul>  
      </div> 
      
      <br />
      <button type="button" id="back_bt" class="btn btn-secondary" >To the top</button>
    </div>
   
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


   <script src="js/jquery-3.4.1.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="../js/index.js"></script>
   <script src="js/shopping_produce.js"></script>
  </body>
</html>