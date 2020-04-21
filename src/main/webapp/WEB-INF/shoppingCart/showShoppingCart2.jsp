<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/shopping_cart3.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>完成訂購</title>
</head>
<body>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<div class="container">
    <div class="row ">
        <div class="col-12 p-5  logarea"><!--這裡開始為上方,呈現商標log位置-->
            皮卡丘商標位置
               <div class="col-5 offset-8 wrap"><!--這裡為右上角,呈現快速連結的位置-->
                   <ul>
                       <li class=""><a class="nav-link" href="#">會員登入</a></li>
                       <li class=""><a class="nav-link" href="#">Q&A</a></li>
                       <li class=""><a class="nav-link" href="shopping_cart.html">Shopping CART</a></li>
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
        
       <!--這裡為步驟購物圖檔-->
       <div class="col-12 stepimg"><img src="image/參考圖.png" height="200px"></div>

        <!--這裡為產生訂單編號區塊-->
       <div class="col-12 ordercneter">
           <div class="col-12 ordernumberarea" >
             <p>${LoginOK.m_id}的訂單已成功送出</p>
     
             <p>您的訂單編號為:<span id="shoppingcart3_ordernumber">${Orders.ordid}<span></p>
             歡迎至訂單頁面查看,謝謝
            </div>
             <div class="col-12 return"> <!--返回區塊-->
             <a href="<c:url value='../index.jsp' />"><button type="button" class="btn btn-warning">回首頁</button></a>
             <a href="<c:url value='../listProduct/DisplayPageProducts' />"><button type="button" class="btn btn-warning">繼續購物</button></a>
             <a href="<c:url value='../orderProcess/orderList.do' />"><button type="button" class="btn btn-warning">訂單查詢</button></a>
         </div>
       </div>
      
        <div class="col-12 footer" >尾巴</div><!--這區塊首頁出來套版-->
    </div>
</div>
</body> 
</html>    