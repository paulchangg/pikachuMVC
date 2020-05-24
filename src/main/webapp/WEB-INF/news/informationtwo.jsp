<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${news.title}</title>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/wickedcss.min.css"/>
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/inquaryindex2.js"></script>
<link rel="stylesheet" type="text/css" href="css/examplestwo.css" media="screen"/>
</head>

<body>
 <!-- 上方標題logo列----超連結待補----->
  <div class="container-fluid" style="height: 160px;background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
    <div class="row">
      <div class="col-sm">
        <span style="font-size: xx-large;">哪家的信用卡功能最丘？</span><br>
        <span style="font-size: medium; padding-top: 10px;">
          快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
        </span>
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
            <a class="nav-link" href='<c:url value="/member/member_center" />' id="cardcompare" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
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
        <a class="et-hero-tab" href='<c:url value="/news/lastestNews"/>'>資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

	   <!-- 顯示文章區塊--------------------------->
	    <div class="col-7 textartccal"> 
			<h3><span id="title">${news.title}</span></h3>
			<p><span id="acttime">${news.actTime}</span></p>
			<div class="textartccalimg">
			   <img src="${pageContext.servletContext.contextPath}/news/RetrieveNewsImg?id=${news.newsId}" id="newsimg">
	    	</div>
			<p style="text-align:left"><span id="contextstr">
				${content}
			  </span>
			</p>
		</div>
		 <!-- 底部 ------>
     <div id="backtop" class="gotop" style="text-align: center !important; margin-top: 50px;">
      © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
    <div id="icons" >
      <ul>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-facebook"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-twitter"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-instagram"></span>
        </li>
        <li>
          <span></span>
          <span></span>
          <span></span>
          <span class="fab fa-linkedin"></span>
        </li>
      </ul>
    </div> 

    <br />
    <button type="button" id="back_bt" class="btn btn-secondary">
      To the top
    </button>
    </div>
   <script>
  var contextstr = document.getElementById("contextstr");
  var out = "";
  var srcb = contextstr.innerHTML;
  var src =srcb.replace(/&gt;&gt;/g, '\>\>');
  console.log(src);  
  for (let i = 0; i < src.length; i++) {
   if (src.charAt(i) == '☆' || src.charAt(i) == '◎' || src.charAt(i) == '●' 
     || src.charAt(i) == '▶' || src.charAt(i) == '\>' || src.charAt(i) == '【') { //遇到特殊符號要處理
    
//              if(i>0 && src.charAt(i) == '【' &&  src.charAt(i-1) =='▶️' ) {  用不到，前面太多空白
//            out += src.charAt(i);
//            continue;
//           }  
    if (i > 0 && src.charAt(i) != src.charAt(i - 1)) {  //如果此符號和前一個符號不相同 就換行
     out += "\n" + src.charAt(i);
    } else {                                           //如果相同就不換
     out += src.charAt(i);
    }

   } else {
    out += src.charAt(i);
   }
  }
  console.log(out);
  contextstr.innerText = out;
//   contextstr.innerhtml = out;
 </script>
</body>
</html>