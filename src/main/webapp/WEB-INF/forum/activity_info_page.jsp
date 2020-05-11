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
<link rel="stylesheet" href="./css/activity_info_page.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="/js/post_article.js"></script> -->


<!--     <META HTTP-EQUIV="pragma" CONTENT="no-cache">  -->
<!-- <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">  -->
<!-- <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> -->
</head>

<body>
	<!-- logo及上方標題列---超連結待補---->
	<div class="top-navigation">
		<a href="#/" class="navigation__logo"> <img
			src="./images/index_logo.jpg" alt="logo" class="navigation__logo" />
		</a>
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link active memberlogin"
				href="#" id="">會員登入</a></li>
			<li class="nav-item"><a class="nav-link cardcompare" href="#"
				id="">信用卡比較</a></li>
			<li class="nav-item"><a class="nav-link qanda" href="#" id="">Q
					& A</a></li>
			<li class="nav-item"><a class="nav-link shoppingcart" href="#"
				id=""> <i class="fas fa-shopping-cart"></i>
			</a></li>
		</ul>
	</div>

	<!-- 導覽列------超連結待補------>
	<div class="header">
		<div class="nav-bar">
			<a href="#" class="aboutus" id="">關於我們</a> <a href="#"
				class="memberarea" id="">會員中心</a> <a href="#" class="mall" id="">商城</a>
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
<%-- 						<c:forEach var="JoinPersonName" items="${JoinPersonName}"> --%>
<%-- 			<c:choose> --%>
<%-- 			<c:when test="${loginmember != JoinPersonName.m_id}"> --%>
								<a
									href="<c:url value='/forum/activity_info_page?article_IdStr=${ activity_info_page.article_Id}&mode=add_activity'/>"
									id="">
									<button type="button" class="btn btn-outline-success"
										data-toggle="modal" data-target="#exampleModalCenter">加入此活動</button>
								</a>
								
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
								<a
									href="<c:url value='/forum/activity_info_page?article_IdStr=${ activity_info_page.article_Id}&mode=leave_activity'/>"
									id="">
									<button type="button" class="btn btn-outline-success"
										data-toggle="modal" data-target="#exampleModalCenter">取消參加此活動</button>
								</a>
<%-- 			</c:otherwise> --%>
<%-- 			</c:choose> --%>
<%-- 						</c:forEach> --%>
					</div>
					
					<!-- 跳出加入成功視窗 -->
				
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="joinactivity" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="joinactivity">已成功加入活動</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-footer">
<!-- 									<button type="button" class="btn btn-secondary btn-sm" -->
<!-- 										data-dismiss="modal">取消加入</button> -->
									<button type="button" class="btn btn-primary btn-sm">
										確認</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 留言按鈕 -->
					<div class="message_button"
						style="padding-top: 100px; padding-left: 20px;">
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
											<br>
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
				</div>
			</div>
		</span>
	</div>

	<div class="second_line"></div>

	<!-- 中央文章大區塊範圍----->
	<div class="col-12" style="margin-top: 20px; margin-bottom: -2px;">
		<!-- 左側看板列表---超連結待補-->
		<div class="container-fluid">
			<div class="leftNav" style="width: 80px;">
				<div class="btn-group-vertical" id="forum_btn">
					<button type="button" class="btn-all-board">
						<a class="nav-link" href="allboards.html">所有看板</a>
					</button>
					<br />
					<button type="button" class="btn-all-board">
						<a class="nav-link" href="activity_page.html">交友活動</a>
					</button>
					<br />
					<button type="button" class="btn-all-board">
						<a class="nav-link" href="#">配對</a>
					</button>
					<br /> <span style="margin-top: 30px;">熱門活動</span> <br> <a
						href="<c:url value='/forum/QueryLaunchALL' />">

						<button type="button" class="btn-all-board">所有活動頁面</button>
					</a><br>
					<c:forEach var="sessionfname" items="${sessionfname}">
						<a
						href="<c:url value='/forum/ConnectionForum_launch?fname=${sessionfname}'/>"
						id="">
							<button type="button" class="btn-all-board">${sessionfname}</button>
						</a>
						<br />
					</c:forEach>

				</div>
			</div>
		</div>
		<!-- 下方區塊 -->
		<div class="container_area" style="padding: 10px 0 15px 0;">
			<span class="container_bt_area" style="display: flex;"> <!-- 左半部 -->
				<div class="column-bt-left"
					style="padding-left: 40px; margin-right: 80px;">
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
								<div class="col-2"
									style="display: flex; align-items: center; padding-right: 10px;">
									<img class="memberid_img"
									  src='${pageContext.servletContext.contextPath}/init/getMemberImage?id=${responAll.res_m_id }'
										alt=""
										style="max-width: 100%; max-height: 100%; padding-top: 15px;" />
								</div>
								<div class="col-6 my-1">
									<div class="my-3">
										<div class="row"
											style="background: #fcfcfc; color: rgb(177, 172, 172); display: flex; align-items: center;">
											<div class="col-3 px-1">
												<!-- 回文者id ----->
												<h6 class="res_m_id" style="font-size: 14px;">
													${responAll.res_m_id}</h6>
											</div>
											<!-- 回覆日期------>
											<span class="postTime" style="font-size: 12px;">${responAll.postTime }</span>
										</div>
										<p class="res_content my-1" style="font-size: 14px;">
											${responAll.res_content }</p>
									</div>
								</div>
							</div>
						</div>

						<!-- 回覆者1結束 -->

					</c:forEach>


				</div> <!-- 右側資訊列 -->
				<div class="column-bt-right" style="padding-left: 50px;">
					<p style="font-size: 22px;">主揪人</p>
					<div class="row">
						<!-- 頭像 -->
						<div class="col-2"
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
										style="font-size: 14px; padding-top: 10px;">
										${ activity_info_page.article_m_id}</h6>
								</div>
							</div>
						</div>
					</div>

					<!-- 參與成員頭像區塊 -->

					<p style="font-size: 22px; padding-top: 70px;">成員</p>
					<div class="row">
						<div class="col-2">
							參加活動人:<br>
							<c:forEach var="JoinPersonName" items="${JoinPersonName}"> 
            	
            	${JoinPersonName.name}
                <img class="memberid_img"
                src='${pageContext.servletContext.contextPath}/init/getMemberImage?id=${JoinPersonName.m_id }'
									alt=""
									style="max-width: 100%; max-height: 100%; padding-top: 15px;" />
							</c:forEach>
						</div>

					</div>

				</div>
			</span>
		</div>
	</div>


	<!-- 底部 ---------------------------->
	<div class="footer">
		<div class="gotop">
			<h4>© Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
			<br /> <br /> <a href="#" class="w3-botton w3-black w3-margin">
				<i class="fa fa-arrow-up w3-margin-right"></i> To the top
			</a>
		</div>
		<br />
	</div>
</body>
</html>