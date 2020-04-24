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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>商品頁面</title>
</head>
<body>
<div class="flex-container">
    <!----------------------head區塊------------------------------>
		<div class="header">
			${LoginOK.m_id}皮卡丘商標位置<!--這裡開始為上方,呈現商標log位置-->
		   <div class="row justify-content-end"> 
				<div class="col-4">    <!---------logo區塊----------->
				   <img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
			   </div>
			   <div class="col-4">     <!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
						<div class="col-3">
							<a href="../member/member_login.jsp">
							  <i class="fa fa-user-circle" id="memberlogin">會員登入</i>
							</a>
					   </div>
						 <div class="col-3">
							 <a href="http://127.0.0.1:5500/web/login.html">
							  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-3"> 
							 <a href="#">
							  <i class="fa fa-question-circle" id="qanda">Q & A</i>
							</a>
					   </div>
					   <div class="col-3">
							<a href="#">
							  <i class="fa fa-shopping-cart" id="shoppingcart">shopping cart</i>
						   </a>
					   </div>
				   </div>
			   </div>
		   </div>
	   </div>
		<!-- 導覽列--------------------------->
	   <section class="top_navi">
		   <nav>
			    <a href="<c:url value="/shopping/orderList" />" >查詢訂單</a>
		       <a href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="<c:url value="/shopping/listProduct" />">購物商城</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>

       <!-- 商品頁面標題--------------------------->
	   <div class="shopping">
		     <h2>商品頁面</h3>
       </div>
       
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
  
        <div class="row sider">
            <div class="col-2 sidderrone"><!--左邊選單-->
                        <p><a href=""> <button type="button" class="sidderBtn">本月熱賣品</button></a></p>
                        <p><a href=""> <button type="button" class="sidderBtn">吃貨歡樂劵</button></a></p>
                        <p><a href=""> <button type="button" class="sidderBtn">放鬆娛樂劵</button></a></p>
                       <p><a href=""> <button type="button" class="sidderBtn">外出旅遊券</button></a></p>
            </div>
            <div class="col-10 totalarea">
              <div class="row justify-content-center">
                  <div class="col-6 produceimg"><!--商品圖片-->
                   <img  src="<c:url value='/shopping/getPicture/${product_INFO.p_id}' />"   class="img-fluid"  id="shoppingproduce_img" width="600px" height="400px">
                 </div>
                  <div class="col-4 produceitem"><!--中間商品--><!--這裡5個id是要連資料庫商品一切資料-->
                      <p>商品名稱:<span id="shoppingproduce_name">${product_INFO.p_name}</span></p>
                      <p>價格:<span id="shoppingproduce_price">${product_INFO.price}元</span></p>
                      <p>點數:<span id="shoppingproduce_bouns">${product_INFO.p_bns}點</span></p>
                      <p>剩餘庫存:<span id="shoppingproduce_stock">${product_INFO.stock}</span></p>
                      <p>購買數量</p>
                    <FORM  action="<c:url value='/shopping/buyProduct'/>" method="POST">
                       <label><input id="shoppinproduce_min" name="qty1" type="button" value="-" /></label><!--按鈕的方法是用id寫得所以如果有第二筆物件就必須把方法裡面的id更換掉-->
                       <label><input id="shoppinproduce_quantity" name="qty" type="text" value="1" /></label> 
                       <label><input id="shoppinproduce_add" name="qty1" type="button" value="+" /></label><br>

                      <!--<a href="shopping_cart.html"><button type="button" class="btn btn-warning" id="shoppingproduce_buy">立即購買</button></a> -->
                      <label class="labelway"><Input type='submit' class="btn btn-warning test" data-toggle="modal" data-target="#shoopingmodal"  value='放入購物車'>
                      </label> 
                      <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
                       <!--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shoopinproduce_2" id="shoppingproduce_see">加入追蹤</button> -->
                  </FORM>
                  <FORM  action="<c:url value='/shopping/addtrackproduct' />" method="POST">    
                      <!-- <a href="shopping_cart.html"><button type="button" class="btn btn-warning" id="shoppingproduce_buy">立即購買</button></a> -->
                      <label class="labelway" ><Input type='submit' class="btn btn-warning test" data-toggle="modal" data-target="#shoopingmodal"  value='加入追蹤'>
                      </label> 
                     <Input type='hidden' name='productId' value='${product_INFO.p_id}'>
                      <!-- <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shoopinproduce_2" id="shoppingproduce_see">加入追蹤</button> -->
                  </FORM>
                 </div>
              </div>
              <div class="col-8 navtotal"> <!--優惠卷使用詳細說明-->
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

        <div class="return"> <!--返回區塊-->
            <a href="<c:url value='/listProduct/DisplayPageProducts' />"><button type="button" class="returnBtn">返回商城</button></a>
        </div>
	 
	   <div class="site_footer"> <!--尾巴區塊-->
        <div class="gotop">
           <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
      </div>
  
  </div>


<!--   <!--這區塊是跳出視窗加入購物車視窗-->
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
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
          integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
          crossorigin="anonymous"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
          integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
          crossorigin="anonymous"></script>     
         <script src="js/shopping_produce.js"></script>
</html>
</body>