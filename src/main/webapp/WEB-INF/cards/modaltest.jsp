<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORTEST</title>
</head>
<body>
<h1>這是傳入的option數： ${mdtest}</h1>
<h3>opt1: ${opt1}</h3>
<h3>opt2: ${opt2}</h3>
<h3>opt3: ${opt3}</h3>
<h3>sal: ${sal}</h3>
<h3>ql: ${ql}</h3>
<hr>

<h4>${header.accept}</h4>
<h4>${pageContext.request.requestURI}</h4>
<h4>${pageContext.request.contextPath}</h4>
<h4>${pageContext.servletContext.contextPath}</h4>
<h1>這是傳入的超連結mimi： ${mimi}</h1>
<hr>
 <form id="my-form" action="${pageContext.servletContext.contextPath}/ModalSearchs" method="post">
   <div class="step step3">
                   <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                   <p>Q2請問您的年收入</p>
                   <input type="radio" value="c.annual_income &lt;= 400000 AND c.annual_income &gt; 0" name="sal">20-40萬
                   <input type="radio" value="c.annual_income &lt;= 600000 AND c.annual_income &gt; 0" name="sal">40-60萬
                   <input type="radio" value="c.annual_income BETWEEN 600000 AND 2000000 OR c.annual_income = 0" name="sal">60-200萬
                   <input type="radio" value="c.annual_income &gt;= 2000000 OR c.annual_income = 0" name="sal">200萬以上</br>
               </div>
                 <div class="step step4">
                 <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                 <p>Q3請問您是否有辦過信用卡</p>
                 <input type="radio" value="" name="">是
                 <input type="radio" value="" name="">否</br>
             </div>
             <div class="step step5">
                <p>請回答以下問題協助我們找出最適合您的信用卡(最多需要五題)</p>
                <p>Q4請依序選擇您平常最常做的消費,至多可以選擇3項</p>
                 1.<select class='se' name="opt1">
                   <option name="">請選擇</option>
                   <option name="option" value='c.fcb > 0'>百貨購物</option>
                   <option name="option" value='c.onlinefb > 0'>網路購物</option>
                   <option name="option" value='c.refuel_cb > 0'>加油</option>
                   <option name="option" value="c.fma LIKE 'NT%'">海外旅遊</option>
                   <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
                   </select>
                   2.<select class='se' name="opt2">
                   <option name="">請選擇</option>
                   <option name="option" value='c.fcb > 0'>百貨購物</option>
                   <option name="option" value='c.onlinefb > 0'>網路購物</option>
                   <option name="option" value='c.refuel_cb > 0'>加油</option>
                   <option name="option" value="c.fma LIKE 'NT%'">海外旅遊</option>
                   <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
                    </select>
                    3.<select class='se' name="opt3">
                   <option name="">請選擇</option>
                   <option name="option" value='c.fcb > 0'>百貨購物</option>
                   <option name="option" value='c.onlinefb > 0'>網路購物</option>
                   <option name="option" value='c.refuel_cb > 0'>加油</option>
                   <option name="option" value="c.fma LIKE 'NT%'">海外旅遊</option>
                   <option name="option" value="c.moviedis LIKE '%折'">電影娛樂</option>
                      </select>

             </div>

<input type="submit" value="傳送資料">
</form>

<div><a href="${pageContext.servletContext.contextPath}/ModalSearchs?mimi=all">連到servlet</a></div>


</body>
</html>