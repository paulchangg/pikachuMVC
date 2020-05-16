<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
<link href="css/shopping.css" rel="stylesheet"type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="css/wickedcss.min.css"/>
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<title>購物商城首頁</title>
</head>
<body>
 <!-- 上方標題logo列----超連結待補----->
   <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <div class="row">
      <div class="col-sm">
        <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
        <p style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </p>
      </div>
      <div class="row justify-content-around">
        <div class="col-sm">
          <a href="index copy.html">
            <img src="../images/logo2.png" alt="logo" style="height: 140px;" />
          </a>
        </div>
      </div>
      <!-- 右上區塊 -->
      <div class="col-sm">
        <ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
          <li class="nav-item">
            <a class="nav-link" href="/member/member_login" id="memberlogin" style="color: rgb(92, 41, 7);">會員登出</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/member_center" id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="<c:url value='/shopping/listtrackproduct' />"id="memberlogin" style="color: rgb(92, 41, 7);">查詢訂單</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/shopping/listProduct" id="shoppingcart" style="color: rgb(92, 41, 7);">
               <i class="fas fa-shopping-cart"><span style="color:#FF5964">5</span> <!-- 加入購物車的商品數量 --></i>
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
        <a class="et-hero-tab" href="#">關於我們</a>
        <a class="et-hero-tab" href="/cards/cradeitCb?qt=main">信用卡比較</a>
        <a class="et-hero-tab" href="#friendshipforum">論壇交友</a>
        <a class="et-hero-tab" href="#mall">商城</a>
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

     <!--熱賣標題-->
      <c:choose>
        <c:when test="${category == null}">
          <div class="hottitle"><h2>本月熱賣品</h2></div>
        </c:when>
        <c:otherwise>
          <div class="hottitle"><h2>${category}</h2></div>
        </c:otherwise>
      </c:choose>
     
      
      <div class="row sider">
         <div class="col-2 sidderrone"><!--左邊選單-->
            <ul class="sidderul">
                <li><a href='<c:url value='/shopping/listProduct'/>'> 本月熱賣品</a></li>
                <li><a href="<c:url value='/shopping/吃貨歡樂劵'/>"> 吃貨歡樂劵</a></li>
                <li><a href="<c:url value='/shopping/放鬆娛樂劵'/>"> 放鬆娛樂劵</a></li>
                <li><a href="<c:url value='/shopping/外出旅遊劵'/>"> 外出旅遊券</a></li>
            </ul>
         </div>

        <div class="col-10 sidderr2 "><!--中間商品-->
          <div class="row sreach" id="shopping_totalsearch">
              <div class="col-5 dropdown" id="shopping_dropdown"><!--右邊下拉式選單-->
               <c:choose>
                 <c:when test="${modeState == 0}">
                  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="font-size: 16px;">上市日期(舊到新)</button>
                  <div class="dropdown-menu">
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2' />" id="shopping_pricelh">價格低到高</a>
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1' />" id="shopping_pricehl">價格高到低</a>
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0' />" id="shopping_pricehl">上市日期(舊到新)</a>
                </div>
               </c:when>
               <c:when test="${modeState == 1}">
                  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格高到低</button>
                 <div class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2' />" id="shopping_pricelh">價格低到高</a>
                    <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1' />" id="shopping_pricehl">價格高到低</a>
                    <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0' />" id="shopping_pricehl">上市日期(舊到新)</a>
                 </div>
               </c:when>
                <c:when test="${modeState == 2}">
                  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">價格低到高</button>
                   <div class="dropdown-menu">
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=2' />" id="shopping_pricelh">價格低到高</a>
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=1' />" id="shopping_pricehl">價格高到低</a>
                     <a class="dropdown-item" href="<c:url value='/shopping/listProduct?priceMode=0' />" id="shopping_pricehl">上市日期(舊到新)</a>
                 </div>
               </c:when>
               </c:choose>
            </div>
               <div class="col-3 input-group"><!--搜尋關鍵字id-->
                <input type="text" name="keywords" id="shopping_keywords" class="form-control col-8" placeholder="商品關鍵字" onkeyup="a()">
                  <div class="input-group-append">
                      <button class="btn btn-default" type="submit" style="background-color: #FF5964;">搜尋</button>
                 </div>
              </div>
              <div class="searchblock" id="searchblockone"><!--關鍵字顯示區塊.-->
                   <li><i class='bx bx-search'></i><span>飲料餐劵</span></li>
                   <li><i class='bx bx-search'></i><span>美食餐劵</span></li>
                   <li><i class='bx bx-search'></i><span>碰碰餐劵</span></li>
              </div>
          </div>

          <div class="row producearea"><!--商品圖呈現區塊-->
           <c:forEach varStatus="stVar"  var="entry"  items="${products_DPP}" >
              <div  class="col-3 card"> <!--商品1-->
               <div>            
                   <a href="<c:url value='/shopping/listProduct?mode=show&productId=${entry.value.p_id}' />" id="shopping_page">
                     <img class="card-img-top  imagesize" src="<c:url value='/shopping/getPicture/${entry.value.p_id}' />">
                  </a>
                  <div class="card-body">
                       <FORM  action="<c:url value='/shopping/buyProduct'/>" method="POST">
                         <h5 class="card-title"><span id="shopping_producename">${entry.value.p_name}</span></h5>
                         <p class="card-text" style="font-size: 17px;">售價<span id="shopping_price">${entry.value.price}</span></p>
                         <Input type='hidden' name='qty' value='1'>
                           <Input type='hidden' name='productId' value='${entry.value.p_id}'>
                         <Input type='hidden' name='pageNo' value='${pageNo}'>
                         <Input type='submit' class="btn btn-info test" data-toggle="modal" data-target="#shoopingmodal"  value='購買' id="buyBtn">
                      </FORM>
                   </div>
               </div>
             </div>  
           </c:forEach>    
        </div>
      </div> 
      </div>	  
 <!-- 	      <div class="return" > 底部分頁	 -->
<!-- 			<ul class="pagination pagination-sm"> -->
<%-- 				<c:choose> --%>
  <%-- 					<c:when test="${pageNo == 1}"> --%>
  <!-- 						  <li class="page-item">  -->
  <!-- 							  <a class="page-link"  aria-label="Previous"> -->
  <!-- 							   <span aria-hidden="true">&laquo;</span>  -->
  <!-- 						   </a> -->
  <!-- 						 </li> -->
  <%-- 					</c:when> --%>
  <%-- 					<c:otherwise> --%>
  <!-- 					   <li class="page-item">  -->
  <%-- 						   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=1' />" aria-label="Previous"> --%>
  <!-- 							   <span aria-hidden="true">&laquo;</span>  -->
  <!-- 						   </a> -->
  <!-- 					   </li> -->
  <%-- 					</c:otherwise> --%>
  <%-- 				</c:choose> --%>
  <%-- 			   <c:forEach begin="1" end="${totalPages}" varStatus="vs"> --%>
  <%-- 				   <c:choose> --%>
  <%-- 					   <c:when test="${pageNo == vs.index}"> --%>
  <!-- 						   <li class="page-item"> -->
  <%-- 							   <a class="page-link"  id="shopping_pag1">${vs.index}</a> --%>
  <!-- 						   </li> -->
  <%-- 					   </c:when> --%>
  <%-- 					   <c:otherwise> --%>
  <!-- 						   <li class="page-item"> -->
  <%-- 							   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a> --%>
  <!-- 						   </li> -->
  <%-- 					   </c:otherwise> --%>
  <%-- 				   </c:choose> --%>
  <%-- 			   </c:forEach> --%>
  <%-- 			   <c:choose> --%>
  <%-- 					<c:when test="${pageNo != totalPages}"> --%>
  <!-- 						  <li class="page-item">  -->
  <%-- 						   <a class="page-link" href="<c:url value='/listProduct/DisplayPageProducts?pageNo=${totalPages}' />" aria-label="Previous"> --%>
  <!-- 							   <span aria-hidden="true">&raquo;</span>  -->
  <!-- 						   </a> -->
  <!-- 					   </li> -->
  <%-- 					</c:when> --%>
  <%-- 					<c:otherwise> --%>
  <!-- 					   <li class="page-item">  -->
  <!-- 						   <a class="page-link" aria-label="Previous"> -->
  <!-- 							   <span aria-hidden="true">&raquo;</span>  -->
  <!-- 						   </a> -->
  <!-- 					   </li> -->
  <%-- 					</c:otherwise> --%>
  <%-- 				</c:choose> --%>
  <!-- 			</ul> -->
  <!-- 		</div> -->



    <!-- 底部 ------>
    <div id="backtop" class="gotop">
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
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
    <script type="text/javascript">
      function a() {
        // SELECT標籤
        var words = document.getElementById("shopping_keywords");
        var xhr = new XMLHttpRequest();
        xhr.open("Get", "queryProduct?q="+words.value, true);
        xhr.send();
        xhr.onreadystatechange = function() {
          // 向伺服器提出的請求已經收到回應
          if (xhr.readyState === 4) {
            // 伺服器回應成功
            if (xhr.status === 200) {
              var responseData = xhr.responseText;
              
              cosole.log(JSON.parse(responseData));
            }
          }
        }	
        
      }
      
      </script>
    <script>
      var inputBtn=document.getElementById("shopping_keywords");//取得輸入欄位
      var showbtn=document.getElementById("searchblockone");//取得隱藏區塊
          inputBtn.addEventListener("input",function(){

            if(inputBtn.value==null || inputBtn.value =="")//如果輸入欄位為空值或空字串則隱藏表單
            {
              showbtn.style.display="none";
            }
            else{
              showbtn.style.display="inline";
            };
            
           
      });
     
     
   </script>
   <script src="js/jquery-3.4.1.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/index.js"></script>
   <script src="js/shopping.js"></script>
  </body>
</html>