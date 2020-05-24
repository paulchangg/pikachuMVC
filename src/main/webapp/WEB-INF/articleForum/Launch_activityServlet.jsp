<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>文章頁面</title>
    <link rel="stylesheet" href="<c:url value="/articleForum/css/bootstrap.min.css"/>" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/inner_page.css" />
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js"
      type="text/javascript"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
    <script src="js/forum.js"></script>
  </head>

  <body>
    <page size="A4">
      <div class="post_block">
        <!-- title 發文者頭像id區塊---發文日期--->
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
          <p class="article_m_id" style="padding: 0 0 0 17px;">${launchActivityBean.member_id}</p>
          <div style="padding-left: 360px;"></div>
          <a href='<c:url value='/articleForum/listforum'  />'>
            <button type="button" class="btn btn-info btn-sm">
              回論壇首頁
              <br /><i class="fas fa-home"></i>
            </button>
           </a>
        </div>
      </div>

      <!-- 內文區塊---->
      <article class="content_block">
        <!-- 文章標題---->
        <p class="article_title" style="font-size: 20px; padding-bottom: 10px;">
          ${launchActivityBean.article_title}
        </p>

        <!-- 主題,發布時間----超連結待補---->
        <div class="content_block_a">
          <div class="subject" style="padding: 0 10px; height: 25px;">
            <a href="article_board_credit card.html" id="creditcards">${launchActivityBean.subject}</a>
          </div>
          <div class="post_Time" style="padding-left: 10px;">${launchActivityBean.post_time}</div>
        </div>

        <!-- 文章內文--->
        <div class="content_block_b">
          <div class="article_content_block" >
            <span class="article_content">${launchActivityBean.article_content}</span>
            <!-- 照片區塊 -->
            <div class="photo_block">
              <!-- 照片 -->
              <img
                class="articleimage"
                src="${pageContext.request.contextPath}/articleForum/getPicture/${launchActivityBean.article_Id}"
                style="max-height: 270px;"
              />
            </div>
          </div>
          <!-- 中間主題分類標籤 -->
          <div class="label_box" style="padding-bottom: 16px;">
            <ul class="label_line">
              <li class="subject_block">
                <a href="article_board_credit card.html">
                  <!-- 主題分類  -->
                  <div class="subject" style="height: 25px;">
                    <div>信用卡</div>
                  </div>
                </a>
              </li>
              <li class="subject_block">
                <a href="#">
                  <!-- 主題分類   -->
                  <div class="subject" style="height: 25px;">
                    <div>讚</div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </article>

      <!-- 分隔--->
      <div></div>

      <!-- 回應總數, 人氣總數 --->
      <div class="comment-box">
        <div class="comment-line">
          <!-- icon們 -->
          <div
            class="col-6 px-0"
            style="
              padding-left: -1;
              font-weight: initial;
              font-size: 14px;
              text-align: end;
            "
          >
            <span
              style="
                font-weight: initial;
                font-size: 14px;
                color: rgb(177, 172, 172);
                float: left;
                padding-top: 2px;
              "
              >回應</span
            >
            <span
              class="total_reply"
              style="
                font-weight: initial;
                font-size: 14px;
                color: rgb(177, 172, 172);
                float: left;
                padding-top: 2px;
              "
              >${responserCount1}</span
            >
            <!-- 觀看次數  -->
            <button
              type="button"
              class="btn btn-link"
              style="color: rgb(177, 172, 172);float: left;
                padding-top: 2px;"
            >
              <i class="fas fa-eye"></i>
            </button>
            <span style="float: left;
                padding-top: 2px;">${launchActivityBean.allWatch}</span>
          </div>
        </div>
      </div>
      <!-- 假廣告圖-->
      <div class="advertising">
        <img
          src="images/ad_photo/kebuke.jpg"
          style="width: 100%; height: 150px;"
        />
      </div>
      <!-- 回文區塊-------->
      <div class="reply_zone" style="margin-top: 0px; padding: 5px 0px 36px;">
        <section>
          <!-- 總共回覆貼文數---->
          <div class="total_reply_zone" style="padding: 10px 60px;">
            <div class="total_reply">共${responserCount1}則回覆</div>
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
        <form  method="post" action="<c:url value="/articleForum/reponseActivity" />"  enctype="multipart/form-data">
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
      <!-- 修改 Modal 跳出頁面 -->
      <div
        class="modal fade"
        id="revise"
        tabindex="-1"
        role="dialog"
        aria-labelledby="reviseTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <!-- 叉叉按鈕 -->
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <div class="modal-body">
              <!-- 內容 -->
              <form id="msform">
                <!-- 發文者頭像 -->
                <div class="container">
                  <img
                    src="./images/id_photo/memberphoto_6.png"
                    alt="profile-sample5"
                    id="memberid_img"
                  />
                  <span style="font-size: 0.6em; color: #3e8bbe;">發文者</span
                  ><span id="article_m_id" style="font-size: 0.8em;"
                    >豬血糕不要香菜</span
                  >
                </div>
                <hr />
                <div class="bd-highlight" style="font-size: small;">
                  發文看板
                  <!-- 發文看板選擇 -->
                  <select id="select_area">
                    <option value="請選擇">請選擇</option>
                    <option value="creditcards">信用卡</option>
                    <option value="food">美食</option>
                    <option value="emotion">感情</option>
                  </select>
                </div>

                <h1 class="fs-title">文章標題</h1>
                <input type="text" name="article_title" placeholder="標題" />
                <!-- 輸入內文 -->
                <h1 class="fs-title">文章內文</h1>
                <p class="text">
                  <textarea
                    name="text"
                    class="validate[required,length[6,300]] feedback-input"
                    id="article_content"
                    placeholder="內文"
                    style="height: 300px;"
                  ></textarea>
                </p>

                <!-- 上傳圖片的按鈕 -->
                <h1 class="fs-title">文章照片</h1>
                <div class="articleimage" style="padding-bottom: 5px;">
                  <input id="input-b6" name="input-b6[]" type="file" multiple />
                </div>
                <!-- 文章標籤選擇 標籤意思跟主題一樣-->
                <legend
                  style="
                    font-size: 13px;
                    padding-bottom: 7px;
                    padding-top: 15px;
                  "
                >
                  標籤選擇
                </legend>
                <div id="checkline">
                  <ul id="labels" class="center">
                    <li><input class="subject" type="checkbox" />信用卡</li>
                    <li><input class="subject" type="checkbox" />美食</li>
                    <li><input class="subject" type="checkbox" />感情</li>
                    <li><input class="subject" type="checkbox" />讚</li>
                    <li><input class="subject" type="checkbox" />我就爛</li>
                    <li><input class="subject" type="checkbox" />口袋空空</li>
                  </ul>
                </div>
              </form>
            </div>
            <!-- 底部按鈕 -->
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary btn-sm"
                data-dismiss="modal"
              >
                返回
              </button>
              <button type="button" class="btn btn-primary btn-sm">
                送出
              </button>
            </div>
          </div>
        </div>
      </div>
    </page>
  </body>
</html>
