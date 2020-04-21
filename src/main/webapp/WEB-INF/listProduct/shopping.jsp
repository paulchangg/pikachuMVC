<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/shopping.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>購物商城</title>
</head>
<body>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>



<!--整個版面區塊由這個包起來-->

<div class="container">
  <div class="row ">
         <div class="col-12 p-5  logarea"><!--這裡開始為上方,呈現商標log位置-->
             ${LoginOK.m_id}皮卡丘商標位置
                <div class="col-5 offset-8 wrap"><!--這裡為右上角,呈現快速連結的位置-->
                    <ul>
                        <li class=""><a class="nav-link" href="#">會員登入</a></li>
                        <li class=""><a class="nav-link" href="#">Q&A</a></li>
                        <li class=""><a class="nav-link" href="../shoppingCart/showShoppingCart.jsp">Shopping CART</a></li>
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
                <div class="carousel-inner" ><!--輪播圖片顯示區-->
                     <div class="carousel-item active"><!--輪播圖片項目區-->
                         <img class="d-block w-100" src="image/400寬-1.jpg" alt="Photo1">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" src="image/400寬-2.jpg" alt="Photo2">
                     </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 " src="image/400寬-3.jpg"  alt="Photo3">
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

         <div class="col-12 hot">本月熱賣品</div>

         <div class="col-12 sider">
                <div class="col-2 sidderr"><!--左邊選單-->
                   <a href=""> <button type="button" class="btn btn-outline-danger ">本月熱賣品</button></a>
                   <a href=""> <button type="button" class="btn btn-outline-danger ">吃貨歡樂劵</button></a>
                   <a href=""> <button type="button" class="btn btn-outline-danger ">放鬆娛樂劵</button></a>
                   <a href=""> <button type="button" class="btn btn-outline-danger ">外出旅遊券</button></a>
                </div>
              <div class="col-10 sidderr2 "><!--中間商品-->
                 <div class="col-12 sreach" id="shopping_totalsearch">
                    <div class="col-4 dropdown" id="shopping_dropdown"><!--右邊下拉式選單-->
                    	<c:choose>
                    		<c:when test="${modeState == 0}">
                        		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">上市日期(舊到新)</button>
                          		<div class="dropdown-menu">
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
                          		</div>
                    		</c:when>
                    		<c:when test="${modeState == 1}">
                        		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格高到低</button>
                          		<div class="dropdown-menu">
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
                          		</div>
                    		</c:when>
                    		<c:when test="${modeState == 2}">
                        		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格低到高</button>
                          		<div class="dropdown-menu">
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=2&pageNo=${pageNo}' />" id="shopping_pricelh">價格低到高</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=1&pageNo=${pageNo}' />" id="shopping_pricehl">價格高到低</a>
                            		<a class="dropdown-item" href="<c:url value='/listProduct/DisplayPageProducts?priceMode=0&pageNo=${pageNo}' />" id="shopping_pricehl">上市日期(舊到新)</a>
                          		</div>
                    		</c:when>
                    	</c:choose>
                     </div>
                    <div class="col-3 input-group"><!--搜尋關鍵字id-->
                        <input type="text" name="keywords" id="shopping_keywords" class="form-control col-8" placeholder="商品關鍵字">
                           <div class="input-group-append">
                              <button class="btn btn-default" type="submit">搜尋</button>
                          </div>
                     </div>
                 </div>
                   <div class="producepoho mt-2"><!--商品圖呈現區塊-->
                      <div class="row">
                      <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
                         <div class="col-md-6 col-lg-3 mb-2"> <!--商品1-->
                              <div class="card">               <!--這個id是要連結到這個商品的頁面-->
                                  <a href="<c:url value='/listProduct/DisplayPageProducts?mode=show&productId=${entry.value.p_id}' />" id="shopping_page"><img class="card-img-top" src="${pageContext.servletContext.contextPath}/init/getBookImage?id=${entry.value.p_id}" alt="歡樂旅遊劵不要對我尖叫"></a>
                                  <div class="card-body">
                       			  	<FORM  action="<c:url value='/listProduct/BuyProduct.do' />" method="POST">
                                      <h5 class="card-title"><span id="shopping_producename">${entry.value.p_name}</span></h5>
                                      <p class="card-text">售價<span id="shopping_price">${entry.value.price}</span></p>
                                       <Input type='hidden' name='qty' value='1'>
                                     
                                       <Input type='hidden' name='productId' value='${entry.value.p_id}'>
              						   <Input type='hidden' name='pageNo' value='${pageNo}'>
               						   <Input type='submit' class="btn btn-info test" data-toggle="modal" data-target="#shoopingmodal"  value='購買'>
                        			</FORM>
                                 </div>
                             </div>
                          </div>  <!---以下商品只是呈現這頁最多只能放8個商品 所以都不放id以第一個商品為主-->
                      </c:forEach>    
                     </div>
                 </div> 
                </div>
              <div class="row return" > <!--底部分頁-->
              	 <br>	
              	 <br>
              	 <br>
              	 <br>	
                 <ul class="pagination pagination-sm">
                 	<c:choose>
                 		<c:when test="${pageNo == 1}">
                 			  <li class="page-item"> 
                 			  	<a class="page-link"  aria-label="Previous">
                        			<span aria-hidden="true">&laquo;</span> 
                        		</a>
                        	  </li>
                 		</c:when>
                 		<c:otherwise>
                    		<li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=1' />" aria-label="Previous">
                        			<span aria-hidden="true">&laquo;</span> 
                        		</a>
                        	</li>
                 		</c:otherwise>
                 	</c:choose>
                    <c:forEach begin="1" end="${totalPages}" varStatus="vs">
                    	<c:choose>
                    		<c:when test="${pageNo == vs.index}">
                    			<li class="page-item">
                    				<a class="page-link"  id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item">
                    				<a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                 		<c:when test="${pageNo != totalPages}">
                 			  <li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${totalPages}' />" aria-label="Previous">
                        			<span aria-hidden="true">&raquo;</span> 
                        		</a>
                        	</li>
                 		</c:when>
                 		<c:otherwise>
                    		<li class="page-item"> 
                    			<a class="page-link" aria-label="Previous">
                        			<span aria-hidden="true">&raquo;</span> 
                        		</a>
                        	</li>
                 		</c:otherwise>
                 	</c:choose>
                 </ul>
             </div>
         </div>
         <div class="col-12 footer" >尾巴</div><!--這區塊首頁出來套版-->

		<script type="text/javascript">
			$(document).ready(function(){
				$(".test").click(function(){
					alert("已加入購物車");
				})
			}
		)

		</script>

        <!--這區塊是跳出視窗加入購物車視窗-->    
<!--             <div class="modal fade" id="shoopingmodal"> -->
<!--                 <div class="modal-dialog"> -->
<!--                   <div class="modal-content"> -->
<!--                     <div class="modal-body"> -->
<!--                       <p>商品已加入購物車</p> -->
<!--                        <button type="button" class="btn btn-default" data-dismiss="modal">確認</button> -->
<!--                    	</div> -->
<!--                   </div> -->
<!--              	</div> -->
<!--          	</div> -->
</div>
</body>
</html>