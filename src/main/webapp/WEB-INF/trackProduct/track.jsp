<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Order-love.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>追蹤清單</title>
</head>
<body>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <div class="container">
        <div class="row ">
            <div class="col-12 p-3 logarea"><!--這裡開始為上方,呈現商標log位置-->
                皮卡丘商標位置
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
            
           <!--這裡為顯示追蹤清單區塊-->
           <div class="col-12 ordertitle">追蹤清單</div>
  
          <!--這裡為追蹤清單內容-->
         <div class="col-8 Ordercontent"> 
            <table >
               <tr>
                 <td>商品明細</td>
                 <td>優惠價</td>
                 <td>庫存</td>
                 <td>變更內容</td>
               </tr> 
               
               	  <c:forEach varStatus="stVar"  var="entry"  items="${trackProduct}" >
               	 <tr>
                 <td>  <!--這裡顯示兩筆 第一筆為主-->
                  
                     <img src="${pageContext.servletContext.contextPath}/init/getBookImage?id=${entry.p_id}" width="80" height="80" class="img-fluid"  id="shoppingproduce_img">
                  <a href="" id="orderlove_ul"><span id="orderlove_name">${entry.p_name}<span></a></span>
                 </td>
                 <td><span id="orderlove_price">${entry.price}</span></td>
                 <td><span id="orderlove_stock">100</span></td>
                 <td>
                  	<input type="button" value="放入購物車" id="orderlove_buy">
                  	<input type="button" value="刪除商品" id="orderlove_delete">
                  </td>
                  </tr>
                  </c:forEach>
           </table>
         </div>
           

          <!--這裡為說明區-->
       <div class="col-8 Orderunder">
         <ul>   
           <li>下次再買清單中的商品優惠價金額與供貨狀況是最更新的訊息。</li>
           <li>商品售價以訂單成立時之即時價格為準。</li>
           <li>下次再買清單不保留商品之優惠價及優先購買權。</li>
           <li>可保存的商品品項至多為500項。</li>
           <li>部份商品若因缺貨或絕版而無法再提供購買，將由系統自動刪除，不另外通知。</li>
       </ul>
      </div>


       <!--這裡為返回按鈕區塊-->
      <div class="footerbutton">
        <a href=""><input type="button" value="返回"></a> <!--這裡為返回會員中心畫面-->
        <a href=""><input type="button" value="購物商城"></a><!--這裡為返回購物中心畫面-->
      </div>


      <!--這裡為尾部區塊-->
    <div class="footer">尾巴</div>
  </div>
</div>

</body>
</html>