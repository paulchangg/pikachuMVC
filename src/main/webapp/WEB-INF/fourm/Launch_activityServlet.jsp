<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>文章頁面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/inner_page.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- <script src="js/inner_page.js"></script> -->
  </head>

  <body>
    <page size="A4">
      <div class="post_block">
        <!-- title 發文者頭像id區塊----發文日期---->
        <div class="inline_block">
          <!-- 會員頭像 -->
          <div class="comment-avatar">
            <img
              class="memberid_img"
              src="${pageContext.request.contextPath}/init/getMemberImage?id=${launchActivityBean.member_id}"
              alt=""
            />
          </div>
          <!-- 發文者id -->
          <a class="article_m_id" href="#" style="padding: 0 0 0 20px;"
            >${launchActivityBean.member_id}</a
          >
          <!-- 叉叉關閉視窗------->
          <div class="close_bt" style="padding: 0 0 0 73%;">
            <button type="button" class="close" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
      </div>

      <!-- 內文區塊----->
      <article class="content_block">
        <!-- 文章標題---->
        <p class="article_title" style="font-size: 20px;">${launchActivityBean.article_title}</p>

        <!-- 主題,發布時間----超連結待補---->
        <div class="content_block_a">
          <div class="subject" style="padding-right: 10px;">
            <a href="article_board_credit card.html" id="creditcards">信用卡</a>
          </div>
          <div class="post_Time">${launchActivityBean.post_time}</div>
        </div>

        <!-- 文章內文--->
        <div class="content_block_b">
          <div class="article_content_block">
            <span class="article_content">${launchActivityBean.article_content}</span>
            <!-- 照片區塊 -->
            <div class="photo_block">
              <!-- 照片 -->
              <img class="articleimage" src="${pageContext.request.contextPath}/fourm/getPicture/${launchActivityBean.article_Id}" />
            </div>
          </div>
          <!-- 中間主題分類標籤 -->
          <div class="label_box" style="padding-bottom: 16px;">
            <ul class="label_line">
              <li class="subject_block">
                <a href="article_board_credit card.html">
                  <!-- 主題分類   -->
                  <div class="subject">
                    <div>信用卡</div>
                  </div>
                </a>
              </li>
              <li class="subject_block">
                <a href="#">
                  <!-- 主題分類   -->
                  <div class="subject">
                    <div>讚</div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </article>

      <!-- 分隔----->
      <div></div>

      <!-- 回應總數, 人氣總數 ---->
      <div class="comment-box">
        <div class="comment-line">
          <span
            style="
              font-weight: initial;
              font-size: 14px;
              color: rgb(177, 172, 172);
            "
            >回應</span
          >
          <span
            class="total_reply"
            style="
              font-weight: initial;
              font-size: 14px;
              color: rgb(177, 172, 172);
            "
            >${responserCount1}</span
          >

           <!-- icon們 -->
           <div
           class="col-5 px-0"
           style="
             font-weight: initial;
             font-size: 14px;
             text-align: end;
           "
         >
           <!-- 觀看次數  -->
           <button
             type="button"
             class="btn btn-link"
             style="color: rgb(177, 172, 172);"
           >
             <i class="fas fa-eye"></i>
           </button>
           <span>${launchActivityBean.allWatch}</span>
           <!-- 收藏 -->
           <button
             type="button"
             class="btn btn-link"
             style="color: rgb(177, 172, 172);"
           >
             <i class="fas fa-archive"></i>
           </button>
           <!-- 修改 -->
           <button
             type="button"
             class="btn btn-link"
             style="color: rgb(177, 172, 172);"
           >
             <i class="fas fa-edit"></i>
           </button>
           <!-- 刪除 -->
           <button
             type="button"
             class="btn btn-link"
             style="color: rgb(177, 172, 172);"
           >
             <i class="far fa-trash-alt"></i>
           </button>
         </div>
        </div>
      </div>

      <!-- 假廣告圖-->
      <div class="advertising">
        <img
          src="./images/ad_photo/kebuke.jpg"
          style="height: 150px; width: 793px;"
        />
      </div>

      <!-- 回文區塊-------->
      <div class="reply_zone" style="margin-top: 0px; padding: 40px 0px 36px;">
        <section>
          <!-- 總共回覆貼文數---->
          <div class="total_reply_zone" style="padding: 0px 60px;">
            <div class="total_reply">共2則回覆</div>
          </div>
          <!-- 回文框框----->
          <div
            class="reply_content"
            style="padding: 0px 60px; background-color: white;"
          >
            <div style="padding-top: 0px;">
                  <!-- 第二個回文區塊 -->
                  <c:forEach varStatus="stVar"  var="entry"  items="${responserBeans}">
                  <div data-index="0">
                    <div data-post-engagement="true" class="reply_content_a">
                      <div class="reply_content_b">
                        <div
                          class="reply_content_c"
                          style="padding-right: 15px;"
                        >
                          <!-- 會員頭像 -->
                          <div
                            class="comment-avatar"
                            style="vertical-align: top;"
                          >
                            <img
                              class="memberid_img"
                              src="${pageContext.request.contextPath}/init/getMemberImage?id=${entry.m_id}"
                              alt=""
                            />
                          </div>
                        </div>
                        <div
                          class="reply_content_d"
                          style="flex: 110%; overflow: hidden;"
                        >
                          <!-- 回文者id------------------------>
                          <div class="res_m_id"><a href="#">${entry.m_id}</a></div>
                          <div class="reply_content_f">
                            B${stVar.count} |
                            <!-- 回文時間---------------------->
                            <div
                              class="post_Time"
                              style="
                                color: rgba(0, 0, 0, 0.35);
                                padding-left: 10px;
                              "
                            >
                              ${entry.res_post_time}
                            </div>
                          </div>
                        </div>
                        <!-- 愛心按鈕------------------------->
<!--                         <a class="button"><span class="heart"></span></a> -->
<!--                         按讚人數 -->
<!--                         <span class="popularity" style="padding-left: 10px;" -->
<!--                           >5</span -->
<!--                         > -->
                      </div>
                      <!-- 回覆的內文 -->
                      <div class="res_content_block" style="padding-top: 8px;">
                        <span
                          class="res_content"
                          style="white-space: pre-wrap;"
                        >
                        	 ${entry.res_content}
                        </span>
                      </div>
                    </div>
                  </div>
                  </c:forEach>
               
            </div>
          </div>
        </section>

        
        <!-- 立即回覆區---->
        <form  method="post" action="<c:url value="/fourm/reponseActivity" />"  enctype="multipart/form-data">
        <div class="input-group mb-3">
          <input
            type="text"
            name="content"
            class="form-control"
            placeholder="馬上回應"
            aria-label="Recipient's username"
            aria-describedby="button-addon2"
          />
          <input
          	type="hidden" name="article_Id" value="${launchActivityBean.article_Id}"
          />
          <input
          	type="hidden" name="m_id" value="${LoginOK.m_id}"
          />
          <div class="input-group-append">
            <button
              class="btn btn-outline-secondary"
              type="submit"
              id="button-addon2"
              style="background-color: rgb(245, 212, 163);"
            >
              	送出
            </button>
          </div>
        </div>
        </form>
      </div>
    </page>

  
  </body>
</html>