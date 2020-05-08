<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
    <link href="css/Order-inquary.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/wickedcss.min.css"/>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <title>訂單查詢</title>
</head>
<body>

    <div class="flex-container">
        <!----------------------head區塊------------------------------>
        <div class="header">
			<!--這裡開始為上方,呈現商標log位置-->
		   <div class="row justify-content-end"> 
				<div class="col-4">    <!---------logo區塊----------->
				   <a href='<c:url value='/' />'>
				   		<img class="index_logo" src="../homepage/images/index_logo.jpg" alt="logo" />
					</a>
			   </div>
			   <div class="col-4">     <!---------左上角超連結區塊----------->
					<div class="row justify-content-end">
						<div class="col-3">
							<c:choose>
								<c:when test="${empty LoginOK}">								
									<a href="<c:url value="/member/member_login"/>"> 
										<i class="fa fa-user-circle" id="memberlogin">會員登入</i>
									</a>								
								</c:when>
								<c:otherwise>								
									<a href="<c:url value="/member/member_logout"/>"> 
									<i class="fa fa-user-circle" id="memberlogout">會員登出</i>
									</a>								
								</c:otherwise>
							</c:choose>
					   </div>
						 <div class="col-3">
							 <a href="">
							  <i class="fa fa-credit-card" id="cardcompare">信用卡比較</i>
							</a>
						</div>
						<div class="col-3"> 
							 <a href="#">
							  <i class="fa fa-question-circle" id="qanda">Q & A</i>
							</a>
					   </div>
				   </div>
			   </div>
		   </div>
	   </div>
		<!-- 導覽列--------------------------->
	   <section class="top_navi">
		   <nav>
		       <a href="<c:url value="/shopping/listtrackproduct" />" >追蹤商品</a>
			   <a href="#" >關於我們</a>
			   <a href="<c:url value="/member/member_center" />">會員中心</a>
			   <a href="#">論壇交友</a>
			   <a href="#">信用卡搜尋</a>
			   <a href="<c:url value="/shopping/listProduct" />">購物商城</a>
			   <a href="#">資訊網</a>
			</nav>
		</section>
        
       <!--這裡為顯示訂單查詢區塊-->
       <div class="ordertitle">
           <h2>訂單查詢頁面</h2>
       </div>
      

        <!--這裡為輸入條件區塊-->
       <div class="col-6 orderone" id="Orderinquary_haveorder">
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
                   <td colspan="4"><input type="text" name="orderitem" value="ordid" class="orderinput"></td>
               </tr>
               <p>目前僅提供六個月內的交易資料，若您欲查詢六個月前的資料，請您與<a href=""><i class='bx bx-help-circle' ></i>客服中心</a>聯繫</p>
           </table>
           <input type="submit" value="查詢" id="Orderinquary_orderbutton">
       </div>

          <!--這裡為顯示搜尋結果為有訂單時的區塊-->
       <div class="ordertwo">
          <!-- <span id="Orderinquary_onemonth" style="margin: 0 auto;">一個月內訂單共7筆</span> -->
          <table class="twotable">
             <tr>
                <td>訂單編號</td>
                <td>訂購時間</td>  
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

          <div class="return"> <!--底部分頁-->
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
                    			<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=1' />" aria-label="Previous">
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
                    				<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                 		<c:when test="${pageNo != totalPages}">
                 			  <li class="page-item"> 
                    			<a class="page-link" href="<c:url value='/shopping/orderList?pageNo=${totalPages}' />" aria-label="Previous">
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
	            
             <!--這裡返回訂單查詢頁面按鈕區塊-->
            
    
           <!--這裡為底部區塊-->
           <div class="site_footer"> <!--尾巴區塊-->
              <div class="gotop">
                 <h4> © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
             </div>
          </div>
   </div>   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
     integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
     crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-barcode.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>    
</body> 
</html> 