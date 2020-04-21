<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Order-item.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>訂單明細</title>
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
            
           <!--這裡為顯示訂單查詢區塊-->
           <div class="col-12 ordertitle">訂單詳細資料</div>
          
           <!--這裡為訂單詳細狀態區-->
           <div class="col-10 ordertable">
               <table border="1">
                <tr>
                 <td >訂單編號:${OrderBean.ordid}</td>
                 <td >訂購時間:<span id="orderitem_time">2020/03/2218:28:40</span></td>
                 <td ><a href="">詢問客服</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>商品名稱</td>
                    <td>單價</td>
                    <td>數量</td>
                    <td>紅利折扣</td>
                    <td>商品總額</td>
                    <td>使用狀態</td>
                    <td>電子票卷</td>
                </tr>
                <c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
                <tr>
                    <td><span id="orderitem_item">${stat.count}</span></td>
                    <td><a href="" id="orderitem_page"><span id="orderitem_name">${aBean.p_name}</span></a></td>
                    <td><span id="orderitem_money">${aBean.price}</span></td>
                    <td><span id="orderitem_qty">${aBean.qty}</span></td>
                    <td><span id="orderitem_bouns">0</span></td>
                    <td><span id="orderitem_totalmomey">${aBean.price*aBean.qty}</span></td>
                    <td><span id="orderitem_status">已使用</span></td>
                    <td><a href=""  id="orderitem_rqcode">點我查看</a></td>
                </tr>
                </c:forEach>
                <tr>
                <td>訂單總金額<span id="orderitem_total">${subtotal}元</TD></span></td>
                
                </tr>
             </table>
           </div>

           <div>
            備註/說明
             <ul>
               <li>「已出貨」之商品，訂單已不可異動。</li>
               <li> 若上方未顯示您欲修改的訂單，其商品可能已出貨，已無法異動。若為「轉廠商處理」的商品，則需煩請您撥冗致電或來函告知客服，由客服人員為您連絡廠商處理，謝謝您！</li>
               <li> 依據「電子發票實施作業要點」，自2014/1/1起，於博客來消費開立電子發票，可於商品出貨兩個工作天後，依據您選擇之載具(共通性載具/博客來會員載具)，至財政部電子發票平台/博客來會員專區查詢發票明細。</li>
             </ul>   
           </div>
        
             <!--這裡返回訂單查詢頁面按鈕區塊-->
             <div class="col-12 footerbutton">
                <a href="orderQuery.jsp"><input type="button" value="返回"></a>
            </div>
    
           <!--這裡為底部區塊-->
           <div class="col-12 footer">
               底部
           </div>
  

       </div>
     </div>      


</body>
</html>