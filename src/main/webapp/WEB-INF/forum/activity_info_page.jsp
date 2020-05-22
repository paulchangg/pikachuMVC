<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>活動詳細內容頁</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="./css/activity_info_page.css" />
<link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
<script src="<c:url value="/articleForum/js/jquery-3.4.1.js"/>"></script>
<script src=" <c:url value="/articleForum/js/popper.min.js"/>"></script>
<script src="<c:url value="/articleForum/js/bootstrap.min.js"/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
<script src="<c:url value="/articleForum/js/forum.js"/>"></script>

<!-- <META HTTP-EQUIV="pragma" CONTENT="no-cache">  -->
<!-- <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">  -->
<!-- <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> -->
</head>

<body>
	<!-- logo及上方標題列--超連結待補 -->
	<div class="container-fluid" style="height: 160px; background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
		<div class="row">
			<div class="col-sm">
				<p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
				<p style="font-size: medium; padding-top: 10px;">快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。</p>
			</div>
			<div class="row justify-content-around">
				<div class="col-sm">
					<a href="<c:url value="/"/>"> <img
						src="<c:url value="/articleForum/images/logo2.png"/>" alt="logo"
						style="height: 340px; width: 300px;padding:0 30px 140px 0;" />
					</a>
				</div>
			</div>
			<!-- 右上區塊 -->
			<div class="col-sm">
				<ul class="nav justify-content-end" style="font-size: 18px; font-weight: bold;">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/member_logout" />' id="memberlogin" style="color: rgb(92, 41, 7);">會員登出</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/cards/cradeitCb?qt=main" />' id="cardcompare" style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle' ></i>會員中心</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/shopping/listProduct" />' id="shoppingcart" style="color: rgb(92, 41, 7);">
							<i class="fas fa-shopping-cart"></i>
					</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 導覽列上slider -->
    <div class="et-hero-tabs">
      <!-- 要改放圖片的話再修正 -->
      <div class="aa" style="height: 100px;"></div>

      <!-- 導覽列 -->
      <div class="et-hero-tabs-container">
        <a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a>
        <a class="et-hero-tab" href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a>
        <a class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
        <a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
        <a class="et-hero-tab" href='<c:url value="/news/lastestNews" />'>資訊網</a>
        <span class="et-hero-tab-slider"></span>
      </div>
    </div>

	<!-- 圖片 -->
	<div class="container_area" style="padding: 10px 0 15px 0;">
		<span class="container">
			<div class="column-left">
				<img class="articleimage"
					src='${pageContext.servletContext.contextPath}/forum/RetrieveLaunchImageServlet?article_IdStr=${ activity_info_page.article_Id }'
					height="100%" width="100%" />
			</div> <!-- 右側資訊列 -->
			<div class="column-right" style="padding-left: 40px;">

				<div class="flex-item">
					<span id="article_title" style="font-size: 30px;">活動標題:</span> ${ activity_info_page.article_title}
				</div>
				<div class="flex-item">
					<i class="far fa-sticky-note"></i> <span id="subject">活動主題:</span>
					${ activity_info_page.subject}
				</div>
				<div class="flex-item">
					<i class="fas fa-map-marker-alt"></i> <span id="Location">活動地點:</span>
					${ activity_info_page.location}
				</div>
				<div class="flex-item">
					<i class="far fa-clock"></i> <span id="startTime">活動開始時間:</span> ${ activity_info_page.startTime}
				</div>
				<div class="flex-item">
					<i class="far fa-clock"></i> <span id="endTime">活動結束時間</span> ${ activity_info_page.endTime}
				</div>
				<div class="flex-item">
					<i class="fas fa-users"></i> <span id="popularity">參加人數:</span> ${ activity_info_page.popularity}位

				</div>
				<div class="flex-item">
					<i class="fas fa-user"></i> <span class="article_m_id">主揪人:</span>
					${ activity_info_page.article_m_id}
				</div>
				<!-- 加入活動按鈕 -->
				<div class="row">
					<div class="message_button"
						style="padding-top: 100px; padding-left: 20px;">
						<c:if test="${joinmember  ==false}">
							<a
								href="<c:url value='/forum/activity_info_page?article_IdStr=${ activity_info_page.article_Id}&mode=add_activity'/>"
								id="">
								<button type="button" class="btn btn-outline-success"
									data-toggle="modal" data-target="#exampleModalCenter">加入此活動</button>
							</a>
						</c:if>
						<c:if test="${joinmember  ==true}">
							<a
								href="<c:url value='/forum/activity_info_page?article_IdStr=${ activity_info_page.article_Id}&mode=leave_activity'/>"
								id="">
								<button type="button" class="btn btn-outline-success"
									data-toggle="modal" data-target="#exampleModalCenter">取消參加此活動</button>
							</a>
						</c:if>
					</div>
					<!-- 跳出加入成功視窗 -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="joinactivity" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<c:if test="${joinmember  ==false}">
									<div class="modal-header">
										<h5 class="modal-title" id="joinactivity">已成功加入活動</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:if>
								<c:if test="${joinmember  ==true}">
									<div class="modal-header">
										<h5 class="modal-title" id="joinactivity">已取消參加此活動</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:if>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary btn-sm">
										確認</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 留言按鈕 -->
					<div class="message_button"
						style="padding-top: 100px; padding-left: 15px;">
						<button type="button" class="btn btn-outline-success"
							data-toggle="modal" data-target="#exampleModalCenter1">
							我要留言</button>
					</div>
					<!-- 留言跳出視窗 -->
					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
						role="dialog" aria-labelledby="leavemessage" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="leavemessage">我要留言</h5>
									<!--                     右上角的叉叉開始 -->
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<!--                     右上角的叉叉結束 -->
								</div>

								<form action="<c:url value='/forum/ResponserServlet' />"
									method="POST" enctype="multipart/form-data">
									<!-- activity_info_page.article_Id 藉由這裏帶 -->
									<input type="hidden" id="article_IdStr" name="article_IdStr"
										value="${ activity_info_page.article_Id }">

									<!--                   中間內容開始 -->
									<div class="modal-body">
										<div class="form-group">
											<textarea class="form-control" id="exampleTextarea" rows="3"
												spellcheck="false" placeholder="內容不能少於10個字"
												name="res_contentStr">${param.res_contentStr}</textarea>
											<font color="red" size="-1">${MsgMap.res_contentError}</font>
											<br> <Input type='hidden' name='pageNo'
												value='${param.pageNo}'>
										</div>
									</div>
									<!--                   中間內容結束 -->
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary btn-sm"
											data-dismiss="modal">返回</button>
										<button class="btn btn-primary btn-sm">送出</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<!-- 修改按鈕 -->
					<div class="message_button" style="padding-top: 100px; padding-left: 15px;">
					<button type="button" class="btn btn-outline-success" >修改活動</button>
					</div>

					<!-- 刪除按鈕 -->
					<div class="message_button" style="padding-top: 100px; padding-left: 15px;">
					<button type="button" class="btn btn-outline-success" >刪除此活動</button>
					</div>
					
				</div>
			</div>
		</span>
	</div>

	<div class="second_line"></div>

	<!-- 中央文章大區塊範圍----->
	<div class="col-12" style="margin-top: 20px; margin-bottom: -2px;">
		<!-- 左側看板列表-->
		<div class="container-fluid">
			<div class="row" style="display: flex;">
			<!-- 左側button-->
			<div class="col-2">
				<div class="my-3">
					<a class="nav-link" style="padding: 0px;">
						<button type="button" class="btn btn-outline-success "">所有看板</button>
					</a>
					<div style="padding: 10px 0 10px 0;"></div>
					<!-- 分類看板 -->
					<ul class="list-group list-group-flush" style="width: 250px;">
						<li class="list-group-item">
							<button type="button" class="btn btn-light" id="creditcards">
								<a href="<c:url value='/articleForum/listforum/信用卡' />"
									style="text-decoration: none; color: black;">信用卡</a>
							</button>
						</li>
						<li class="list-group-item">
							<button type="button" class="btn btn-light" id="food">
								<a href="<c:url value='/articleForum/listforum/美食' />"
									style="text-decoration: none; color: black;">美食</a>
							</button>
						</li>
						<li class="list-group-item">
							<button type="button" class="btn btn-light" id="emotion">
								<a href="<c:url value='/articleForum/listforum/感情' />"
									style="text-decoration: none; color: black;">感情</a>
							</button>
						</li>
					</ul>
				</div>
				<div class="my-3">
					<a class="nav-link" href="<c:url value="/forum/ForumHompage?pageNo=1" />"
						style="padding: 0px;">
						<button type="button" class="btn btn-outline-success">交友活動
						</button>
					</a>
				</div>
				<div class="my-3">
					<a class="nav-link" href='<c:url value="/friends/pair" />'
						style="padding: 0px;">
						<button type="button" class="btn btn-outline-success">配對</button>
					</a>
				</div>
				<br>
				<br>
				<div class="my-3">
					<a href="<c:url value='/forum/QueryLaunchALL?pageNo=1' />" style="padding: 0px;">
						<button type="button" class="btn btn-outline-info">所有活動</button>
					</a>
				</div>	
				<c:forEach var="listFame_listFid" items="${listFame_listFid}">
				<ul class="list-group list-group-flush" style="width: 250px;">
					<li class="list-group-item">
						<button type="button" class="btn btn-light">${listFame_listFid.key}</button>
							<a href="<c:url value='/forum/ConnectionForum_launch?fname=${listFame_listFid.key}&fid=${listFame_listFid.value}'/>"
							    	style="text-decoration: none; color: black;"></a>								
						</button>
					</li>
				</ul>
			</c:forEach>
				<br>
			</div>
		<!-- 下方區塊 -->
	<div class="col-10">	
		<div class="container_area" style="padding: 10px 0 15px 0;">
			<span class="container_bt_area" style="display: flex;"> <!-- 左半部 -->
				<div class="column-bt-left"
					style="height:400px; margin-left: 30px;">
					<p style="font-size: 22px;">活動內容介紹</p>
					<!-- 活動內容 -->
					<div>
						<p id="article_content">${ activity_info_page.article_content }
						</p>
					</div>
					<!-- 回覆區塊 -->
					<p style="font-size: 22px; padding-top: 70px;">討論區</p>
					<c:forEach var="responAll" items="${responAll}">
						<!-- 回覆者1開始 -->
						<div class="card my-2">
							<div class="row">
								<!-- 頭像 -->
								<div class="col-3"
									style="display: flex; align-items: center; padding-right: 10px;">
									<img class="memberid_img"
										src='${pageContext.servletContext.contextPath}/init/getMemberImage?id=${responAll.res_m_id }'
										alt=""
										style="max-width: 100%; max-height: 100%; margin-left: 2px; margin-top: 2px;" />
								</div>
								<div class="col-9 my-1">
									<div class="my-3">
										<div class="row"
											style="color: rgb(177, 172, 172); display: flex; align-items: center;">
											<div class="col-3 px-1">
												<!-- 回文者id ----->
												<h6 class="res_m_id" style="font-size: 14px;">
													${responAll.res_m_id}</h6>
											</div>
											<!-- 回覆日期------>
											<div class="col-6">
											<span class="postTime" style="font-size: 12px;">${responAll.postTime }</span>
										  </div>
										  <!-- icon們 -->
										  <div style="font-weight: initial; font-size: 14px; text-align: end;">
														<!-- 修改 -->
														<button type="button" class="btn btn-link" 
														data-toggle="modal" 
														data-target="#revise" 
														style="color: rgb(177, 172, 172);">
														<i class="fas fa-edit"></i>
														</button>
														<!-- 刪除 -->
															<form style="margin: 0px; display: inline">
																<button type="button" class="btn btn-link"
																	data-toggle="modal" data-target="#delete"
																	style="color: rgb(177, 172, 172);">
																	<i class="far fa-trash-alt"></i>
																</button>
															</form>
													</div>
										</div>
													
										<p class="res_content my-1" style="font-size: 14px;">
											${responAll.res_content }</p>
									</div>
								</div>
							</div>
						</div>

						<!-- 回覆者1結束 -->

					</c:forEach>

				</div> 
				<!-- 右側資訊列 -->
				<div class="column-bt-right" style="padding-left: 50px;">
					<p style="font-size: 22px;">主揪人</p>
					<div class="row">
						<!-- 頭像 -->
						<div class="col-3"
							style="display: flex; align-items: center; padding-right: 10px; padding-top: 10px;">
							<img class="memberid_img"
								src='${pageContext.servletContext.contextPath}/init/getMemberImage?id=${activity_info_page.article_m_id }'
								alt=""
								style="max-width: 100%; max-height: 100%; padding-top: 15px;" />
						</div>
						<div class="col-6 my-1">
							<div class="my-3">
								<div class="row"
									style="color: rgb(177, 172, 172); display: flex; align-items: center;">
									<!-- 發文者id ----->
									<h6 class="article_m_id"
										style="font-size: 16px; padding-top: 10px; ">${ activity_info_page.article_m_id}</h6>
								</div>
							</div>
						</div>
					</div>

					<!-- 參與成員頭像區塊 -->

					<p style="font-size: 22px; padding-top: 70px;">參加活動成員</p>

					<!-- ------------   活動人元			 -->
					<div class="row">
							<c:forEach var="JoinPersonName" items="${JoinPersonName}"> 
						<div class="col-2">
							<br>
            	
<%--             	${JoinPersonName.name} --%>
                <img class="memberid_img"
									src='${pageContext.servletContext.contextPath}/init/getMemberImage?id=${JoinPersonName.m_id }'
									alt=""
									style="max-width: 100%; max-height: 100%; padding-top: 15px;" />

						</div>
							</c:forEach>
						</div>
					</div>
					<!-- ------------   活動人元			 -->
				</div>

					<!-- 頁碼分頁 ----開始------>

					<c:if test="${responAll != null}">
						<nav aria-label="Page navigation example"
							style="padding-top: 10px;">
							<ul class="pagination" style="justify-content:center; margin-right:150px;">

								<c:if test="${pageNo > 1}">

									<li class="page-item"><a class="page-link"
										href="<c:url value='/forum/activity_info_page?pageNo=${pageNo-1}&article_IdStr=${ activity_info_page.article_Id }' />"
										id="">Previous</a></li>
								</c:if>
								<c:if test="${  pageNo !=0  }">

									<li class="page-item"><a class="page-link"
										href="<c:url value='/forum/activity_info_page?pageNo=${pageNo}&article_IdStr=${ activity_info_page.article_Id }' />"
										id="">${pageNo}</a></li>
								</c:if>
								<c:if test="${  pageNo !=totalPage  }">
										href="<c:url value='/forum/activity_info_page?pageNo=${pageNo+1}&article_IdStr=${ activity_info_page.article_Id }' />"
										id="">${pageNo+1}</a></li>


								</c:if>
								<c:if test="${pageNo != totalPage}">

									<li class="page-item"><a class="page-link"
										href="<c:url value='/forum/activity_info_page?pageNo=${totalPage}&article_IdStr=${ activity_info_page.article_Id }' />"
										id="">End</a></li>
								</c:if>

								<c:if test="${pageNo != totalPage}">

									<li class="page-item"><a class="page-link"
										href="<c:url value='/forum/activity_info_page?pageNo=${pageNo+1}&article_IdStr=${ activity_info_page.article_Id }' />"
										id="">Next</a></li>
								</c:if>
							</ul>
						</nav>

					</c:if>

					<!-- 頁碼分頁 ----結束------>
		</div>
	</div>


	<!-- 底部 ------>
	 <div id="backtop" class="gotop" >
      <h4>
        © Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved
      </h4>
      <div class="footer">
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

</body>
</html>