<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/Order-inquary.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>訂單查詢</title>
</head>
<body>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<c:if test="${empty LoginOK}">
	<c:redirect url="/_02_login/login.jsp" />
</c:if>
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
       <div class="col-12 ordertitle">訂單查詢</div>
      

        <!--這裡為輸入條件顯示有訂單的區塊-->
       <div class="col-8 orderone" id="Orderinquary_haveorder">
           <table>
               <tr>
                   <td>查詢條件:</td>
                   <td><input type="radio" name="orderitem" value="onemonth" id="Orderinquary_onemonth">一個月內訂單</td>
                   <td><input type="radio" name="orderitem" value="nouse" id="Orderinquary_nouse">未使用訂單</td>
                   <td><input type="radio" name="orderitem" value="use" id="Orderinquary_use">已使用訂單</td>
                   <td><input type="radio" name="orderitem" value="sixmonth" id="Orderinquary_sixmonth">六個月內訂單</td>
               </tr>
               <tr>
                   <td>訂單編號:</td>
                   <td><input type="text" name="orderitem" value="ordid"></td>
               </tr>
               目前僅提供六個月內的交易資料，若您欲查詢六個月前的資料，請您與<a href="">客服中心</a>聯繫
           </table>
           <input type="submit" value="查詢" id="Orderinquary_orderbutton">
       </div>

          <!--這裡為顯示搜尋結果為有訂單時的區塊-->
       <div class="col-10 ordertwo">
          <!-- <span id="Orderinquary_onemonth" style="margin: 0 auto;">一個月內訂單共7筆</span> -->
          <table border="1" style="margin: 20px auto;">
           <tr>
              
              <td>訂單編號</td>
              <td>訂購時間</td>  
              <td>購買數量</td>
              <td>訂單金額</td>
              <td>使用狀態</td>
              <td>訂單狀態</td>
          </tr>
          <c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
           <tr> 
            <!--此頁面可呈現8筆 用第1筆為主-->
            
            <td>
            	<span id="Orderinquary_ordid">${anOrderBean.ordid}</span></br>
             		<a  href='<c:url value='orderDetail.do?memberId=${LoginOK.m_id}&orderNo=${anOrderBean.ordid}' />'>
				    	看完整內容
			    	</a>
			</td>
            <td>
            	<span id="Orderinquary_time"> 
                ${anOrderBean.orderdate}</span>
            </td>
            
            <td><span id="Orderinquary_money"> ${anOrderBean.total}</span></td>
            <td><span id="Orderinquary_tick">已使用</span></td>
            <td><span id="Orderinquary_status">正常</span></td>
          </tr>
          </c:forEach>                                                                                                    
         </table>
           <div class="row return " style="margin-left: 450px; "> <!--底部分頁-->
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
                    			<a class="page-link" href="<c:url value='/orderProcess/orderList.do?pageNo=1' />" aria-label="Previous">
                        			<span aria-hidden="true">&laquo;</span> 
                        		</a>
                        	</li>
                 		</c:otherwise>
                 	</c:choose>
                    <c:forEach begin="1" end="${totalPages}" varStatus="vs">
                    	<c:choose>
                    		<c:when test="${pageNo == vs.index}">
                    			<li class="page-item">
                    				<a class="page-link"  id="shopping_pag1">${vs.count}</a>
                    			</li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item">
                    				<a class="page-link" href="<c:url value='/orderProcess/orderList.do?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                 		<c:when test="${pageNo != totalPages}">
                 			  <li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/orderProcess/orderList.do?pageNo=${totalPages}' />" aria-label="Previous">
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
   
      <!--這裡為顯示搜尋結果為沒有訂單時的區塊-->  
     <div class="col-8 nohave" id="Orderinquary_nohave">
        <table>
          <tr>
          <td></td>
          <td>訂單編號</td>
          <td>訂購時間</td>
          <td>訂單金額</td>
          <td>使用狀態</td>
          <td>訂單狀態</td>
         </tr>
         <tr>
           <td colspan="7">您沒有任何訂單資料</td>
        </tr>
       </table>
     </div>
         		            

    
         <!--這裡返回會員中心按鈕區塊-->
        

       <!--這裡為底部區塊-->
       <div class="col-12 footer">
           底部
       </div>
   </div>
 </div>      
</body> 
</html>    