<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/cradeitsearch_produce.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>信用卡詳細資訊</title>
</head>
<body>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/popper.min.js"></script>
  <div class="container">
     <div class="row ">
          <div class="col-12 p-3 logarea"><!--這裡開始為上方,呈現商標log位置-->
            皮卡丘商標位置
          </div>
       
          <nav class="col-12 navbar sticky-top navbar-expand-lg "><!--這裡開始為導覽頁-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navConetnt">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="cradeitsearchproduce_navContent">
               <ul class="navbar-nav ">
                  <li class="nav-item active"><a class="nav-link" href="#">關於我們</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">會員專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">論壇交友</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">購物商城</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">資訊網</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath}/cards/cradeitCb?qt=main">信用卡</a></li>
               </ul>
             </div>
          </nav>

           <!--這裡為信用卡介紹的小區塊-->
          <div class="col-12 credittitle">信用卡詳細資訊</div>
          
          <!--這裡為信用卡介紹上半部-->
          <div class="col-8 creaditarea">
              <div>                             
                <img src="${pageContext.servletContext.contextPath}/cards/RetrieveCardImg?id=${bean.c_id}" id="cradeitsearchproduce_img"  width="200px" height="140px"> <!--這id連資料庫-->
             </div>
              <span id="cradeitsearchproduce_title">${bean.c_name}</span> <!--這id連資料庫-->
             <div class="row textarea">
                <div class="col-3">
                   <span id="cradeitsearchproduce_req">${bean.annual_income}</span></br>最低年薪要求<!--這Nt25000要從資料庫撈,但最低年薪已寫死在靜態網頁--->
                </div>
                 <div class="col-3"><span id="cradeitsearchproduce_dcbn">${bean.dcb}</span></br>國內消費現金回饋<!--這2%要從資料庫撈,但國內消費現金回饋已寫死在靜態網頁--->
                </div>
                 <div class="col-3">
                   <span id="cradeitsearchproduce_fcbn">${bean.fcb}</span></br>國外消費現金回饋<!--這不適用要從資料庫撈,但國外消費現金回饋已寫死在靜態網頁-->
               </div>
             </div> 
             <a href="" id="cradeitsearchproduce_bank"><input type="button" value="立即申請"></a><!--這個按鈕是要連結該銀行的網址,不用理會當未來展望吧-->
          </div>

          <!--這裡為信用卡介紹的下半部-->
          <div class="col-8 creditareatext">
              <div>
                  <ul class="nav nav-tabs">
                     <li class="nav-item"><a class="nav-link active" href="#cradeitsearchproduce_gift" data-toggle="tab">首刷禮</a></li>
                     <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_dis" data-toggle="tab">優惠</a></li>
                     <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_app" data-toggle="tab">申請資格</a></li>
                     <li class="nav-item"><a class="nav-link" href="#cradeitsearchproduce_mon" data-toggle="tab">財務費用</a></li>
                </ul>
                 <div class="tab-content my-2 mx-2">
                      <div class="tab-pane fade show active" id="cradeitsearchproduce_gift">
                         <div class="gifttext">    <!--首刷禮介紹這部分寫死沒有id-->
                            比卡丘提供指定首刷禮
                             <table class="tablestyle">
                                <tr>
                                 <td rowspan="5">新戶透過比卡丘指定申辦連結,新申辦核卡後30日內刷滿4000元,享有1500元禮券5選1</td>
                                </tr>
                                <tr>
                                   <td>遠東sogo百貨禮卷1500元</td>
                                </tr>
                                <tr>
                                    <td>家樂福禮卷1500元</td>
                               </tr>  
                                <tr>
                                   <td>大潤發禮卷1500元</td>
                               </tr>
                                <tr><td>7-11禮卷1500元</td>
                               </tr>
                            </table>
                         </div>
                      </div>
                      <div class="tab-pane fade" id="cradeitsearchproduce_dis"> <!--優惠介紹-->
                        <table >
                             <tr>
                                <td>消費享回饋</td>
                                <td>現金回饋</td>
                                <td>哩程回饋</td>
                             </tr>
                             <tr><!--最多提供3個特色的回饋整理 已這筆有給id範例 -->
                                <td><span id="cradeitsearchproduce_one">國內消費</span></td>
                                <td><span id="cradeitsearchproduce_onecash"></span>2%</td>
                                <td><span id="cradeitsearchproduce_onetr">不適用</span></td>
                             </tr>
                             <tr><!--最多提供3個特色的回饋整理 這是第2筆 -->
                                <td><span id="cradeitsearchproduce_two">加油消費</span></td>
                                <td><span id="cradeitsearchproduce_twocash">2%</span></td>
                                <td><span id="cradeitsearchproduce_twotr"></span></td>
                             </tr>
                             <tr><!--最多提供3個特色的回饋整理 這是第3筆 -->
                                <td><span id="cradeitsearchproduce_three">繳保費</span></td>
                                <td><span id="cradeitsearchproduce_threecash">1.5%</span></td>
                                <td><span id="cradeitsearchproduce_threetr"></span></td>
                             </tr>
                          </table>
                     </div>
                      <div class="tab-pane fade" id="cradeitsearchproduce_app"> <!--申請資格-->
                         <table>
                            <tr>
                               <td>最低年齡要求</td><!--資料庫好像沒有這個資料?看要不要改其他的?-->
                               <td><span id="cradeitsearchproduce_age">20歲</span></td>
                            </tr>
                             <tr>
                                <td>最低年薪要求</td><!--資料庫好像沒有這個資料?看要不要改其他的?-->
                                <td>NT<sapn id="cradeitsearchproduce_salary">250,000</sapn></td>
                             </tr>
                         </table>
                     </div>
                     <div class="tab-pane fade" id="cradeitsearchproduce_mon"> <!--財務費用-->
                        <table>
                          <tr>
                              <td>國外刷卡手續費</td>
                              <td><span id="cradeitsearchproduce_outcash">1.5%</span></td>
                          </tr>
                          <tr>
                              <td>年費</td>
                              <td><span id="cradeitsearchproduce_annl">正卡年費：御璽卡NT$2400。免年費條件：首年免年費，第二年起年度累積消費達NT$6萬 或 不限金額12次。</span></td>
                          </tr>
                          <tr>
                             <td>其他資訊</td>
                             <td><span id="cradeitsearchproduce_other"></span></td>
                          </tr>
                          <tr>
                             <td>信用卡發卡機構</td>
                             <td><span id="cradeitsearchproduce_type">VISA</span></td>
                          </tr>
                        </table>
                        <table >
                          <tr>
                             <td>還款</td>
                             <td><span id="cradeitsearchproduce_retu"></span></td>
                          </tr> 
                          <tr>
                             <td>循環信用利率</td>
                             <td><span id="cradeitsearchproduce_bon">花旗信用卡循環利率6.88%~15% 循環利率基準日為104年9月1日。預借現金手續費：預借現金金額乘以3.5%加上新臺幣100元。其它費用請上花旗網站www.citibank.com.tw查詢。</span></td>
                          </tr>
                        </table>
                    </div>
                </div> 
            </div>
          </div>

          <!--這裡為謹慎理財區塊-->
          <div class="col-8 managermoney">
            <h2>謹慎理財 信用至上</h2>
            產品特色
            <p>
            <span id="cradeitsearchproduce_desc">一般消費（含悠遊自動加值）回饋0.5%；三大通路（國內加油、生鮮量販超市、餐廳）之前2萬元刷卡消費享額外1.5%現金回饋，當期帳單最高回饋NT$300元。活動期間：即日起~2020/06/30。
            現金紅利持卡期間有效！除了折抵帳單金額、紅利商品輕鬆換，還可兌換航空公司哩程。</span>
           </p>
            注意事項</br>
            <span id="cradeitsearchproduce_atten">詳細活動內容條件請詳花旗官網。</span>
          </div>
         
          
          <!--這裡再次提示使用比較的按鈕區塊-->
          <div class="col-8 butagain ">
             未找到適合您的信用卡?
             快來搜尋比較吧</br>
             <a href="cradeitsearch_minecredit.html"><input type="button" value="我的信用卡"></a>
          </div>

          
          <!--這裡為尾巴--> 
          <div class="col-12 footer">底部位置</div>
    </div>
 </div>
</body> 
</html>    
