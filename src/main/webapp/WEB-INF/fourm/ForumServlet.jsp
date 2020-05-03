<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>論壇forum</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/forum.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- <script src="js/index.js"></script> -->
  </head>

  <body>
    <!-- logo及右上方標題列-----超連結待補------>
    <div class="top-navigation">
      <a href="#" class="navigation__logo">
        <img
          src="images/index_logo.jpg"
          alt="logo"
          class="navigation__logo"
        />
      </a>
      <ul class="nav justify-content-end">
        <li class="nav-item">
          <a class="nav-link" href="#" id="memberlogin">會員登入</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="cardcompare">信用卡比較</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="qanda">Q & A</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="shoppingcart">
            <i class="fas fa-shopping-cart"></i>
          </a>
        </li>
      </ul>
    </div>

    <!-- 導覽列------超連結待補----->
    <div class="header">
      <div class="nav-bar">
        <a href="#" id="aboutus">關於我們</a>
        <a href="#" id="memberarea">會員中心</a>
        <a href="#" id="mall">商城</a>
      </div>
    </div>

    <!-- 上方文章卡片 x3 ----超連結待補------>
    <div class="card-group">
      <div class="card">
        <img
          src="images/slider/slide_pic1.jpg"
          class="card-img-top"
          alt="..."
          height="340px"
        />
        <div class="card-body">
          <h5>
            <a href="#" class="article_title">
              <!-- 文章標題 -->
              最新熱門景點
            </a>
          </h5>
          <span class="article_content">文章內文</span>
          <p>
            <small class="post_Time" style="font-size: small;"
              >3月20日發布</small
            >
          </p>
        </div>
      </div>
      <div class="card">
        <img
          src="images/slider/slide_pic2.jpg"
          class="card-img-top"
          alt="..."
        />
        <div class="card-body">
          <h5>
            <a href="#" class="article_title">
              <!-- 文章標題 -->
              台新卡友來來來
            </a>
          </h5>
          <span class="article_content">文章內文</span>
          <p>
            <small class="post_Time" style="font-size: small;"
              >3月25日發布</small
            >
          </p>
        </div>
      </div>
      <div class="card">
        <img
          src="images/slider/slide_pic4.jpg"
          class="card-img-top"
          alt="..."
        />
        <div class="card-body">
          <h5>
            <a href="#" class="article_title">
              <!-- 文章標題 -->
              神卡分享
            </a>
          </h5>
          <span class="article_content">文章內文</span>
          <p>
            <small class="post_Time" style="font-size: small;"
              >2月28日發布</small
            >
          </p>
        </div>
      </div>
    </div>

    <!-- 分隔列---->
    <div class="second_line">
      <span class="friendshipforum"></span>
    </div>

    <!-- 發文按鈕 -->
    <div
      class="d-flex flex-row-reverse bd-highlight"
      style="padding-top: 7px; padding-right: 10px;"
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
                <form id="msform" action="<c:url value="/fourm/listforum" />" method="post" enctype="multipart/form-data">
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

                  <div class="bd-highlight" style="font-size: small;">
                    	發文看板
                    <!-- 發文看板選擇 -->
                    <select name="select_fourm">
  						<option value ="1">信用卡</option>
  						<option value ="2">美食</option>
  						<option value="3">感情</option>
                    	<option value ="4" SELECTED>請選擇</option>	
					</select>
<!--                     <div class="dropdown"> 不適合DropDown-->  
<!--                       <button -->
<!--                         class="btn btn-secondary btn-sm dropdown-toggle" -->
<!--                         type="button" -->
<!--                         data-toggle="dropdown" -->
<!--                         aria-haspopup="true" -->
<!--                         aria-expanded="false" -->
<!--                         style="font-size: small;" -->
<!--                       > -->
<!--                         請選擇 -->
<!--                       </button> -->
<!--                       <div class="dropdown-menu" aria-labelledby="subject"> -->
<!--                         <button class="subject" type="button">信用卡</button> -->
<!--                         <button class="subject" type="button">美食</button> -->
<!--                         <button class="subject" type="button">感情</button> -->
<!--                       </div> -->
<!--                     </div> -->
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
                  <input type="file" name="imageFile"/>
<!--                   <div class="input-group mb-3" style="font-size: 13px;"> -->
<!--                     <div class="input-group-prepend"> -->
<!--                       <span -->
<!--                         class="input-group-text" -->
<!--                         id="articleimage" -->
<!--                         style="font-size: 13px;" -->
<!--                         >Upload</span -->
<!--                       > -->
<!--                     </div> -->
<!--                     <div class="custom-file"> -->
<!--                       <input -->
<!--                         type="file" -->
<!--                         class="custom-file-input" -->
<!--                         id="articleimage" -->
<!--                         aria-describedby="articleimage" -->
<!--                       /> -->
<!--                       <label class="custom-file-label" for="articleimage">請選擇照片</label> -->
                     
<!--                     </div> -->
<!--                   </div> -->
                  <!-- 文章標籤選擇 標籤意思跟主題一樣-->
                  <legend style="font-size: 13px; padding-bottom: 7px;">
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
                   <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary btn-sm"
                  data-dismiss="modal"
                >
                  	返回
                </button>
                <button type="submit" class="btn btn-primary btn-sm">
                  		送出
                </button>
              </div>
               
                </form>
              </div>

              <!-- 底部按鈕 -->
<!--               <div class="modal-footer"> -->
<!--                 <button -->
<!--                   type="button" -->
<!--                   class="btn btn-secondary btn-sm" -->
<!--                   data-dismiss="modal" -->
<!--                 > -->
<!--                   	返回 -->
<!--                 </button> -->
<!--                 <button type="submit" class="btn btn-primary btn-sm"> -->
<!--                   		送出 -->
<!--                 </button> -->
<!--               </div> -->
            </div>
          </div>
        </div>

        <!-- <button type="button" class="btn btn-secondary">活動管理
    </button> -->
      </div>
    </div>

    <!-- 左側按鈕列表 -->
    <div class="container-fluid">
      <div class="row" style="display: flex; align-items: center;">
        <!-- 左側button-->
        <div class="col-2" style="text-align: center;">
          <div class="my-2">
            <button type="button" class="btn-all-board" id="allboards">
              <a class="nav-link" href="allboards.html">所有看板</a>
            </button>
          </div>
          <div class="my-2">
            <button type="button" class="btn-all-board" id="friend_activity">
              <a class="nav-link" href="activity_page.html">交友活動</a>
            </button>
          </div>
          <div class="my-2">
            <button type="button" class="btn-all-board" id="pair">
              配對
            </button>
          </div>
        </div>
        <!-- 右側論壇 -->
        <div class="col-10">
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
            <!-- 全部 -->
            <div
              class="tab-pane fade show active"
              id="all"
              role="tabpanel"
              aria-labelledby="all-tab"
            >
              <!-- 下方論壇卡片 -->
              <div class="container">
                <!-- 卡片一 -->
                <c:forEach varStatus="stVar"  var="entry"  items="${LaunchActivityBean}">
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
                            <a href="article_board_credit card.html">信用卡</a>
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
                            <form style="margin:0px; display:inline" method="post"    action="<c:url value='/fourm/track/${entry.article_Id}/${LoginOK.m_id}' />">
                            	<button
                             	 type="submit"
                             	 class="btn btn-link"
                              	style="color: rgb(177, 172, 172);"
                           		 >
                             	 <i class="fas fa-archive"></i>
                            	 </button>
                            </form>
                            <!-- 修改 -->
                            <c:if test="${LoginOK.m_id == entry.member_id}">
                            	<form style="margin:0px; display:inline" method="post"    action="">
                            		<button
                             		 type="button"
                              		class="btn btn-link"
                              		style="color: rgb(177, 172, 172);"
                            		>
                              		<i class="fas fa-edit"></i>
                            		</button>
                            	</form>
                            </c:if>
                            <!-- 刪除 -->
                            <c:if test="${LoginOK.m_id == entry.member_id}">
                            	<form style="margin:0px; display:inline" method="post"    action="<c:url value='/fourm/delete/${entry.article_Id}' />">
                            		<button
                              			type="submit"
                              			class="btn btn-link"
                              			style="color: rgb(177, 172, 172);"
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
                        <a href='<c:url value='/fourm/reponseActivity/${entry.article_Id}' />' id="">${entry.article_title}</a>
                      </div>
                      <!-- 文章內容的前幾個字 -->
                      <div class="article_content my-3">
                        	<c:forEach varStatus="stVar2"  var="entry2"  items="${article_content}">
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
                        	 <c:forEach varStatus="stVar1"  var="entry1"  items="${responserCount}">
                        	 	<c:if test="${stVar1.count == stVar.count}">
                        	 		${entry1.value}
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
                        src='${pageContext.request.contextPath}/fourm/getPicture/${entry.article_Id}'
                        style="max-width: 100%; max-height: 100%;"
                      />
                    </div>
                  </div>
                </div>
                </c:forEach>



              </div>
            </div>

            <!-- 收藏 -->
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
                            <a href="article_board_credit card.html">信用卡</a>
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
                            <button
                              type="button"
                              class="btn btn-link"
                              style="color: rgb(177, 172, 172);"
                            >
                              <i class="fas fa-edit"></i>
                            </button>
                            <!-- 刪除 -->
                            <form style="margin:0px; display:inline" method="post"    action="<c:url value='/fourm/deleteTrack/${entry10.article_Id}/${entry10.member_id}' />">
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
                        <a href="<c:url value='/fourm/reponseActivity/${entry10.article_Id}' />" id="">${entry10.article_title}</a>
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
                        src="${pageContext.request.contextPath}/fourm/getPicture/${entry10.article_Id}"
                        style="max-width: 100%; max-height: 100%;"
                      />
                    </div>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 下方頁碼分頁 ----超連結待補------>
    <nav aria-label="Page navigation example" style="padding-top: 10px;">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" id="" tabindex="-1" aria-disabled="true"
            >Previous</a
          >
        </li>
        <li class="page-item">
          <a class="page-link" href="#" id="forum_page1">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" id="forum_page2">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" id="">Next</a>
        </li>
      </ul>
    </nav>


    <!-- 底部 ------>
    <div class="footer">
      <div class="gotop">
        <h4>
          © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
        </h4>
        <br />
        <br />
        <a href="#" class="w3-botton w3-black w3-margin">
          <i class="fa fa-arrow-up w3-margin-right"></i>
          To the top
        </a>
      </div>
      <br />
    </div>


 
  </body>
</html>