<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>分類看板文章</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/article_board.css" />
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
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
    <!-- 上方標題logo列---超連結待補---->
    <div class="container-fluid" style="height: 160px; background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
      <div class="row">
        <div class="col-sm">
          <p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
          <p style="font-size: medium; padding-top: 10px;">
            快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。
          </p>
        </div>
        <div class="row justify-content-around">
          <div class="col-sm">
            <a href="<c:url value='/' />">
              <img src="images/logo2.png" alt="logo" style="height: 340px; width: 300px; padding:0 30px 140px 0;" />
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
            			<a class="nav-link" href='<c:url value="/member/member_center"/>' id="membercenter" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
          			</li>
				</ul>
		 </div>
      </div>
    </div>

    <!-- 導覽列上slider -->
    <div class="et-hero-tabs">
      <!-- 要改放圖片的話再修正 -->
          <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列  超連結待補 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href="#infoweb">資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

    <!-- 看板門面圖 -->
    <div class="card-group">
      <div class="card">
        <img
          src="images/board/article_board_1.jpg"
          class="card-img-top"
          style="height: 340px;"
        />
      </div>
      <div class="card">
        <img
        src="images/board/article_board_2.jpg"
        class="card-img-top"
          style="height: 340px;"
        />
      </div>
      <div class="card">
        <img
        src="images/board/article_board_3.jpg"
        class="card-img-top"
          style="height: 340px;"
        />
      </div>
    </div>

    <!-- 分隔列 -->
    <div class="container-fluid">
      <div class="row">
       <div class="col">
          <!-- 發文按鈕 -->
          <div
            class="d-flex flex-row bd-highlight"
            style="padding-top: 15px;
                   padding-bottom: 15px;"
          >
            <div
              class="btn-group btn-group-sm"
              role="group"
              aria-label="Basic example"
              style="font-size: 20px;"
            >
              <!-- Button trigger modal -->
              <button
                type="button"
                class="btn btn-primary"
                data-toggle="modal"
                data-target="#exampleModalLong"
              >
                發布新文章
                <br /><i class="far fa-edit"></i>
              </button>

            

              <!-- Modal 跳出頁面 -->
              <div
                class="modal fade"
                id="exampleModalLong"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLongTitle"
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
                <form id="msform" action="<c:url value="/articleForum/listforum" />" method="post" enctype="multipart/form-data">
                  <!-- 發文者頭像 -->
                  <div class="container">
                    <img
                      src="${pageContext.request.contextPath}/init/getMemberImage?id=${LoginOK.m_id}"
                      alt="profile-sample5"
                      id="memberid_img"
                    />
                    <span style="font-size: 0.6em; color: #3e8bbe;">發文者</span
                    ><span id="article_m_id" style="font-size: 0.8em;"
                      >:${LoginOK.m_id}</span
                    >
                  </div>
                  <hr />

                  <div class="bd-highlight" style="font-size: small;" id="postArticle_fourmError">
                    發文看板
                  </div>
                    <!-- 發文看板選擇 -->
                    <select name="select_fourm" id="postArticle_fourm">
  						<option value ="1">信用卡</option>
  						<option value ="2">美食</option>
  						<option value="3">感情</option>
                    	<option value ="4" SELECTED>請選擇</option>	
					</select>

                  <h1 class="fs-title" id="postArticle_titleError">文章標題</h1>
                  <input type="text" name="article_title" placeholder="標題"  id="postArticle_title"/>
                  <!-- 輸入內文 -->
                  <h1 class="fs-title" id="postArticle_contentError">文章內文</h1>
                  <p class="text">
                    <textarea
                      name="text"
                      class="validate[required,length[6,300]] feedback-input"
                      id="postArticle_content"
                      placeholder="內文"
                      style="height: 300px;"
                    ></textarea>
                  </p>

                  <!-- 上傳圖片的按鈕 -->
                  <h1 class="fs-title" id="inputImgError">文章照片</h1>
                  <div class="articleimage" style="padding-bottom: 5px;">
                    <input
                      id="inputImg"
                      name="imageFile"
                      type="file"
                      multiple="multiple"
                    />
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
              <!-- 底部按鈕 -->
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary btn-sm"
                  data-dismiss="modal"
                >
                  返回
                </button>
                <button type="button" class="btn btn-primary btn-sm" id="postArticleBtn">
                  送出
                </button>
              </div>
                </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
             <div style="height:20px;"></div>   
          <span class="badge badge-warning" style="font-size: 20px; padding-top:8px;">${fourmName}</span>
        </div>

       
      </div>
    </div>

    <!-- 左側按鈕列表 -->
    <div class="container-fluid">
      <div class="row" style="display: flex;">
        <!-- 左側button-->
        <div class="col-2">
          <div class="my-3">
            <a class="nav-link" href='<c:url value="/articleForum/listforum" />' style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">所有看板</button>
              </a>
                          <div style="padding: 10px 0 10px 0;"></div>
                <!-- 分類看板 -->
                <ul class="list-group list-group-flush" style="width: 250px;">
                  <li class="list-group-item">
                    <button
                      type="button"
                      class="btn btn-light"
                      id="creditcards"
                    >
                      <a
                        href="<c:url value='/articleForum/listforum/信用卡' />"
                        style="text-decoration: none; color: black;"
                        >信用卡</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="food">
                      <a
                        href="<c:url value='/articleForum/listforum/美食' />"
                        style="text-decoration: none; color: black;"
                        >美食</a
                      >
                    </button>
                  </li>
                  <li class="list-group-item">
                    <button type="button" class="btn btn-light" id="emotion">
                      <a
                        href="<c:url value='/articleForum/listforum/感情' />"
                        style="text-decoration: none; color: black;"
                        >感情</a
                      >
                    </button>
                  </li>
                </ul>
            </div>
            <div class="my-3">
            
          
                <a class="nav-link" href="<c:url value="/forum/ForumHompage?pageNo=1" />" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">交友活動 </button>
               </a>
            </div>
            <div class="my-3">
              <a class="nav-link" href="#" style="padding: 0px;">
              <button type="button" class="btn btn-outline-success">配對</button>
                </a>
          </div>
            <a href="<c:url value='/articleForum/listforum' />">
                <button type="button" class="btn btn-info btn-sm">
                  回論壇首頁
                  <br /><i class="fas fa-home"></i>
                </button>
               </a>
          <!-- 假廣告圖刪除 -->
          <%-- <img src="images/ad_photo/pazzo.jpg" style="height:420px; width:180px; padding-top: 40px;padding-right: 10px;"> --%>
        </div>
        <!-- 右側論壇 -->
			<div class="col-9" style="min-height:1100px;">
          <!-- 上方tab -->
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
              <a
                class="nav-link active"
                id="all-tab"
                data-toggle="tab"
                href="#all"
                role="tab"
                aria-controls="all"
                aria-selected="true"
                >全部</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                id="collection-tab"
                data-toggle="tab"
                href="#collection"
                role="tab"
                aria-controls="collection"
                aria-selected="false"
                >收藏</a
              >
            </li>
          </ul>

          <!-- tab內容 -->
          <div class="tab-content" id="myTabContent">
            <!-- 全部分頁 -->
            <div
              class="tab-pane fade show active"
              id="all"
              role="tabpanel"
              aria-labelledby="all-tab"
            >
              <!-- 下方論壇卡片 -->
              <div class="container">
			   <!-- 卡片一 -->
                <c:forEach varStatus="stVar"  var="entry"  items="${LaunchActivityBean_love}">
                 <div class="card my-2">
                  <div class="row">
                    <!-- 左側頭像 -->
                    <div
                      class="col-2"
                      style="display: flex; align-items: center;"
                    >
                      <img
                        class="memberid_img"
                        src="${pageContext.request.contextPath}/init/getMemberImage?id=${entry.member_id}"
                        alt=""
                        style="max-width: 100%; max-height: 200px;"
                      />
                    </div>
                    <!-- 中間論壇 -->
                    <div class="col-7 my-2">
                      <!-- 分四行 -->
                      <div class="my-3">
                        <div
                          class="row"
                          style="
                            background: #fcfcfc;
                            color: rgb(177, 172, 172);
                            display: flex;
                            align-items: center;
                          "
                        >
                          <div class="col-2 px-0">
                            <!--文章主題類別----->
                            <a >${entry.subject}</a>
                          </div>
                          <div class="col-2 px-1">
                            <!-- 發文者id ----->
                            <h6 class="article_m_id">
                              <!-- 要連結到哪需再想想 -->
                              <a href="#">
                        	 			${entry.member_id}
                              </a>
                            </h6>
                          </div>
                          <div class="col-3 px-0">
                            <!-- 發文日期------>
                            <span class="post_Time">${entry.post_time}</span>
                          </div>
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
                            <span>${entry.allWatch}</span>
                            <!-- 收藏 -->
                            <form style="margin:0px; display:inline" method="post"    action="<c:url value='/articleForum/track/${entry.article_Id}/${LoginOK.m_id}' />">
                            	<button
                             	 type="submit"
                             	 class="btn btn-link"
                              	style="color: rgb(177, 172, 172);"
                           		 >
                             	 <i class="fas fa-archive"></i>
                            	 </button>
                            </form>
                            <!-- 刪除 -->
                            <c:if test="${LoginOK.m_id == entry.member_id}">
                            <form style="margin:0px; display:inline" method="post"    action="<c:url value='/articleForum/track/${entry.article_Id}/${LoginOK.m_id}' />">
                            	<button
                              		type="button"
                              		class="btn btn-link deleteArticle"
                              		data-toggle="modal"
                              		data-target="#delete"
                              		style="color: rgb(177, 172, 172);"
                              		article_id='${entry.article_Id}'
                              		
                            	>
                              	<i class="far fa-trash-alt"></i>
                            	</button>
                            </form>
                            </c:if>
                          </div>
                        </div>
                      </div>
                      <!-- 連結到文章頁面  等首頁改好我再試試也改成互動式視窗-->
                      <div class="my-3">
                        <a href='<c:url value='/articleForum/reponseActivity/${entry.article_Id}' />' id="">${entry.article_title}</a>
                      </div>
                      <!-- 文章內容的前幾個字 -->
                      <div class="article_content my-3">
                        	<c:forEach varStatus="stVar2"  var="entry2"  items="${article_content_love}">
                        	 	<c:if test="${stVar2.count == stVar.count}">
                        	 		${entry2}
                        	 	</c:if>
                        	</c:forEach>
                      </div>
                      <!-- 總回文數 -->
                      <div
                        class="my-3"
                        style="
                          font-weight: initial;
                          font-size: 14px;
                          color: rgb(177, 172, 172);
                        "
                      >
                       		 回應
                        <span class="total_reply">
                        	 <c:forEach varStatus="stVar1"  var="entry1"  items="${responserCount_love}">
                        	 	<c:if test="${stVar1.count == stVar.count}">
                        	 		${entry1}
                        	 	</c:if>
                        	</c:forEach>  	
                        </span>
                      </div>
                    </div>
                    <!-- 右側圖片 -->
                    <div
                      class="col-3"
                      style="display: flex; align-items: center;"
                    >
                      <img
                        class="articleimage"
                        src='${pageContext.request.contextPath}/articleForum/getPicture/${entry.article_Id}'
                        style="max-width: 100%; max-height: 200px;"
                      />
                    </div>
                  </div>
                </div>
                </c:forEach>



               

              </div>
            </div>

            <!-- 收藏分頁 -->
            <div
              class="tab-pane fade"
              id="collection"
              role="tabpanel"
              aria-labelledby="collection-tab"
            >
              <!-- 下方論壇卡片 -->
              <div class="container">
					<c:forEach varStatus="stVar10"  var="entry10"  items="${trackBeans}">
                <!-- 卡片一 -->
                <div class="card my-2">
                  <div class="row">
                    <!-- 左側頭像 -->
                    <div
                      class="col-2"
                      style="display: flex; align-items: center;"
                    >
                      <img
                        class="memberid_img"
                        src="${pageContext.request.contextPath}/init/getMemberImage?id=${entry10.member_id}"
                        alt=""
                        style="max-width: 100%; max-height: 100%;"
                      />
                    </div>
                    <!-- 中間論壇 -->
                    <div class="col-7 my-2">
                      <!-- 分四行 -->
                      <div class="my-3">
                        <div
                          class="row"
                          style="
                            background: #fcfcfc;
                            color: rgb(177, 172, 172);
                            display: flex;
                            align-items: center;
                          "
                        >
                          <div class="col-2 px-0">
                            <!--文章主題類別----->
                            <a >${entry10.subject}</a>
                          </div>
                          <div class="col-2 px-1">
                            <!-- 發文者id ----->
                            <h6 class="article_m_id">
                              <!-- 要連結到哪需再想想 -->
                              <a href="#">${entry10.member_id}</a>
                            </h6>
                          </div>
                          <div class="col-3 px-0">
                            <!-- 發文日期------>
                            <span class="post_Time">${entry10.post_time}</span>
                          </div>
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
                            <span>${entry10.allWatch}</span>
                            <!-- 修改 -->
                            <c:if test="${LoginOK.m_id == entry10.member_id}">
                            	 <button
                              		type="button"
                              		class="btn btn-link"
                              		data-toggle="modal"
                              		data-target="#revise"
                              		style="color: rgb(177, 172, 172);"
                            		>
                              		<i class="fas fa-edit"></i>
                            	 </button>
                            </c:if>
                            <!-- 刪除 -->
                            <form style="margin:0px; display:inline" method="post"    action="<c:url value='/articleForum/deleteTrack/${entry10.article_Id}/${entry10.member_id}' />">
                            	<button
                              		type="submit"
                              		class="btn btn-link"
                              		style="color: rgb(177, 172, 172);"
                            	>
                              	<i class="far fa-trash-alt"></i>
                            	</button>
                            </form>
                          </div>
                        </div>
                      </div>
                      <!-- 連結到文章頁面 -->
                      <div class="my-3">
                        <a href="<c:url value='/articleForum/reponseActivity/${entry10.article_Id}' />" id="">${entry10.article_title}</a>
                      </div>
                      <!-- 文章內容的前幾個字 -->
                      <div class="article_content my-3">
                       		 <c:forEach varStatus="stVar12"  var="entry12"  items="${trackArticle_content}">
                        	 	<c:if test="${stVar12.count == stVar10.count}">
                        	 		${entry12}
                        	 	</c:if>
                        	</c:forEach>
                      </div>
                      <!-- 總回文數 -->
                      <div
                        class="my-3"
                        style="
                          font-weight: initial;
                          font-size: 14px;
                          color: rgb(177, 172, 172);
                        "
                      >
                        回應
                        <span class="total_reply">
                        	<c:forEach varStatus="stVar11"  var="entry11"  items="${article_content}">
                        	 	<c:if test="${stVar11.count == stVar10.count}">
                        	 		${entry11}
                        	 	</c:if>
                        	</c:forEach>
                        </span>
                      </div>
                    </div>
                    <!-- 右側圖片 -->
                    <div
                      class="col-3"
                      style="display: flex; align-items: center;"
                    >
                      <img
                        class="articleimage"
                        src="${pageContext.request.contextPath}/articleForum/getPicture/${entry10.article_Id}"
                        style="max-width: 100%; max-height: 100%;"
                      />
                    </div>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>

            <!-- 跳出收藏頁面  collect Modal  -->
            <div
              class="modal fade"
              id="collect"
              tabindex="-1"
              role="dialog"
              aria-labelledby="collectTitle"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5
                      class="modal-title"
                      id="collectTitle"
                      style="font-size: 18px; color: rgb(78, 73, 73);"
                    >
                      此文章已加入收藏
                    </h5>
                    <button
                      type="button"
                      class="close"
                      data-dismiss="modal"
                      aria-label="Close"
                    >
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-secondary btn-sm"
                      data-dismiss="modal"
                    >
                      關閉
                    </button>
                    <button type="button" class="btn btn-primary btn-sm">
                      取消收藏
                    </button>
                  </div>
                </div>
              </div>
            </div>



            <!-- 跳出刪除頁面 delete Modal -->
            <div
              class="modal fade"
              id="delete"
              tabindex="-1"
              role="dialog"
              aria-labelledby="deleteTitle"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5
                      class="modal-title"
                      id="deleteTitle"
                      style="font-size: 18px; color: rgb(78, 73, 73);"
                    >
                      確定要刪除此文章嗎？
                    </h5>
                    <button
                      type="button"
                      class="close"
                      data-dismiss="modal"
                      aria-label="Close"
                    >
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-secondary btn-sm"
                      data-dismiss="modal"
                    >
                      關閉
                    </button>
                    <button type="button" class="btn btn-primary btn-sm" id="deleteArticle1">
                      確定刪除
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 下方頁碼分頁 ----超連結待補------>
<nav aria-label="Page navigation example"
		style="padding-top: 20px; padding-bottom: 10px;">
		<ul class="pagination justify-content-center" id="buttonPage">
			<c:choose>
				<c:when test="${listDifPage == 1}">
						<li class="page-item"><a class="page-link"  id=""
						tabindex="-1" aria-disabled="true">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="<c:url value='/articleForum/listforum/${fourmName}?listDifFourmPage=1' />" id=""
						tabindex="-1" aria-disabled="true">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${listDifTotalPage}" varStatus="vs">
				<c:choose>
                    		<c:when test="${listDifPage == vs.index}">
                    			<li class="page-item">
                    				<a class="page-link"  id="shopping_pag1">${vs.count}</a>
                    			</li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item">
                    				<a class="page-link" href="<c:url value='/articleForum/listforum/${fourmName}?listDifFourmPage=${vs.index}' />" id="shopping_pag1">${vs.index}</a>
                    			</li>
                    		</c:otherwise>
                 </c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${listDifPage != listDifTotalPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/articleForum/listforum/${fourmName}?listDifFourmPage=${listDifTotalPage}' />" id=""
						tabindex="-1" aria-disabled="true">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"  id=""
						tabindex="-1" aria-disabled="true">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>

    <!-- 底部 ---------------------------->
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
      <br />
      <button type="button" id="back_bt" class="btn btn-secondary">
        To the top
      </button>
    </div> 
    <script type="text/javascript">
		var article_id;
	
	$('#collection-tab').click(function(){
		$('#buttonPage').attr('style','visibility:hidden');
	})
	$('#all-tab').click(function(){
		$('#buttonPage').attr('style','');
	})
	$('.deleteArticle').click(function(){
		article_id = $(this).attr('article_id');		
	})
	$('#deleteArticle1').click(function(){
		document.forms[2].action = '/pikachuMVC/articleForum/delete/' + article_id   ;
		document.forms[2].submit();
	})
    
    </script>
  </body>
</html>
