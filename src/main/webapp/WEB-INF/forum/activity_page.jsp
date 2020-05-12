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
<title>活動頁面</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/activity_page.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/d3js/5.15.0/d3.min.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="/js/post_article.js"></script> -->
</head>

<body>
	<!-- logo及上方標題列---超連結待補---->
	<div class="top-navigation">
		<a href="#/" class="navigation__logo"> <img
			src="./images/index_logo.jpg" alt="logo" class="navigation__logo" />
		</a>
		<ul class="nav justify-content-end">
			<li class="nav-item">
			
			

				
				

				
				<c:choose>
					<c:when test="${empty LoginOK}">								
						<a href="<c:url value='/member/member_login'/>"  class="nav-link active memberlogin"> 
							<i class="fa fa-user-circle" id="memberlogin">會員登入</i>
						</a>								
					</c:when>
					<c:otherwise>								
						<a href="<c:url value='/member/member_logout'/>"  class="nav-link active memberlogin"> 
							<i class="fa fa-user-circle" id="memberlogout">會員登出</i>
						</a>								
					</c:otherwise>
				</c:choose>
				
				
				
				
				
				
				
				
				</li>
				
			<li class="nav-item">
			
			
			
			
			

			
			<a class="nav-link cardcompare" href="<c:url value='/cards/cradeitCb?qt=main'/>"
				id="">信用卡比較</a>
				
				
				
				
				
				</li>
			<li class="nav-item"><a class="nav-link qanda" href="#" id="">Q&A</a></li>
			<li class="nav-item">
			
			
			

			
			<a class="nav-link shoppingcart" 
			
			href="<c:url value='/shopping/listProduct'/>"
				id=""> <i class="fas fa-shopping-cart"></i>
			</a></li>
		</ul>
	</div>

	<!-- 導覽列------超連結待補------>
	<div class="header">
		<div class="nav-bar">
			<a href="#" class="aboutus" id="">關於我們</a> 
			
			
			
			
			
			
			<a href="<c:url value='/member/member_center'/>"
				class="memberarea" id="">會員中心</a> 
				
				
				
				
				<a href="#" class="mall" id="">商城</a>
		</div>
	</div>

	<!-- 看板門面圖 -->
	<div class="card-group">
		<div class="card">
			<img src="./images/activity/pic1.jpg" class="card-img-top" alt="..." />
		</div>
		<div class="card">
			<img src="./images/activity/pic2.jpg" class="card-img-top" alt="..." />
		</div>
		<div class="card">
			<img src="./images/activity/pic3.jpg" class="card-img-top" alt="..."
				style="height: 302.95px;" />
		</div>
	</div>

	<div class="second_line"></div>

	<!-- 發布活動按鈕 -->
	<div class="d-flex flex-row-reverse bd-highlight"
		style="padding-top: 7px; padding-right: 10px;">
		<div class="btn-group btn-group-sm" role="group"
			aria-label="Basic example" style="font-size: 20px;">

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModalLong">
				發布新活動 <br /> <i class="far fa-edit"></i>
			</button>

			<!-- Modal 跳出頁面 -->
			<div class="modal fade" id="exampleModalLong" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 叉叉按鈕 -->
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<!-- 內容 -->
							<form action="<c:url value='/forum/Launch_activityServlet'/>"
								method="POST" enctype="multipart/form-data" id="msform">
								<!-- 主辦人頭像 -->
								<div class="container">
							
									<img 	src='${pageContext.request.contextPath}/init/getMemberImage?id=${loginmember}'
										alt="profile-sample5" id="memberid_img" /><br>
									<c:choose>
										<c:when test="${Newsessionfname != null}">
											<span style="font-size: 0.6em; color: #3e8bbe;">主揪人</span>
											<span id="article_m_id" style="font-size: 0.8em;">${loginmember}</span>
											<!-- 發文著的名子 -->
											<h1>發文看板:${Newsessionfname}</h1>
											<hr />

											<h1 class="fs-title">活動標題</h1>
											<!-- <input type="text" name="article_title" placeholder="標題" /> -->

											<input type="text" id="article_title" name="article_title"
												placeholder="標題不能少於5個字" value="${param.article_title}" />
											<font color="red" size="-1">${MsgMap.TitleError}</font>
											<br>

											<h1 class="fs-title">活動地點</h1>
											<input type="text" name="Location" placeholder="地點"
												value="${param.Location}" />
											<font color="red" size="-1">${MsgMap.locationError}</font>
											<br>
											<h1 class="fs-title">活動開始時間</h1>
											<input type="datetime-local" name="starteTimeStr" placeholder="開始日期與時間"
												value="${param.starteTimeStr}" />
											<font color="red" size="-1">${MsgMap.starte_TimeError}</font>
											<br>

											<h1 class="fs-title">活動結束時間</h1>
											<input type="datetime-local" name="endTimeStr" placeholder="結束日期與時間"
												value="${param.endTimeStr}" />
											<font color="red" size="-1">${MsgMap.endTimeError}</font>
											<br>

											<h1 class="fs-title">活動主題</h1>
											<!-- 主題選單 -->
											<div class="btn-group">

											<input type="text" id="subject" name="subject" size="100"
											value="${param.subject}" /><br>
											</div>
											<font color="red"size="-1">${MsgMap.subjectError}</font><br>

											<h1 class="fs-title">活動內容</h1>

											<textarea cols="50" rows="5" placeholder="內容不能少於50個字"
												name="article_content">${param.article_content}</textarea>
											<br>
											<font color="red" size="-1">${MsgMap.ContentError}</font>
											<br>

											<!-- 上傳圖片的按鈕 -->
											<h1 class="fs-title">活動照片</h1>
											<div class="input-group mb-3" style="font-size: 13px;">
												<div class="input-group-prepend">
													<span class="input-group-text" style="font-size: 13px;">Upload</span>
												</div>
												<div class="custom-file">

													<input type="file" class="custom-file-input"
														id="articleimage" name="articleimageStr"
														aria-describedby="articleimage"> <label
														class="custom-file-label" for="articleimage">請選擇照片</label>

												</div>
											</div>

											<!-- 底部按鈕 -->
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary btn-sm"
													data-dismiss="modal">返回</button>
												<button type="submit" class="btn btn-primary btn-sm">送出</button>
											</div>
										</c:when>
										<c:otherwise>
											<h1>發文看板:你還沒選擇看板喔(在左邊)</h1>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- <button type="button" class="btn btn-secondary">活動管理
        </button> -->
		</div>
	</div>


	<!-- 中央文章大區塊範圍----->
	<div class="col-12" style="margin-top: 20px; margin-bottom: -2px;">
		<!-- 左側看板列表---超連結待補-->
		<div class="container-fluid">
			<div class="leftNav" style="width: 100px;">
				<div class="btn-group-vertical" id="forum_btn">
					<a href="#" id="">
						<button type="button" class="btn-all-board">所有看板</button>
					</a> <br /> 
					
					
					
					<a href="<c:url value="/forum/ForumHompage" />" id="">
						<button type="button" class="btn-all-board">交友活動</button>
					</a> <br /> 
					
					
					
					<a href="#" id="">
						<button type="button" class="btn-all-board">配對</button>
					</a> <br /> <span style="margin-top: 30px;">熱門活動</span> <br /> 
					<a
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
	</div>

	<!-- 活動欄位 -->
	<!-- 這裡面要放全部的活動結束(不分標籤) -->
	<c:choose>
		<c:when test="${Newsessionfname == null}">
			<c:forEach var="launchAll" items="${launchAll}">
<%-- 			會員: ${ launchAll.article_m_id }<br><br> --%>
				<div class="container">
<%-- 				<h1>文章編號${ launchAll.article_Id } 的資料</h1> --%>
					<div class="card-deck">
						<!-- 活動1-1 -->
						<div class="card">
							<!-- 活動圖片 -->
							<img height="80%" width="80px"
							src='${pageContext.servletContext.contextPath}/forum/RetrieveLaunchImageServlet?article_IdStr=${ launchAll.article_Id }' class="articleimage"
									alt="..." />
							<div class="card-body">
								<div class="card__share">
									<div class="card__social">
										<a class="share-icon googleplus" href="#"><span
											class="fa fa-google-plus"></span></a>

										<!-- 點擊進入詳細活動頁面  -->
										

										<a id="share" class="share-toggle share-icon"
										href="<c:url value='/forum/activity_info_page?article_IdStr=${ launchAll.article_Id }&mode=enterpage'/>"> 
<%-- 									href="activity_info_page.jsp?article_Id=${ launchAll.article_Id }">  --%>
											
											
											
											<i class="fas fa-plus"></i>
										</a>
									</div>
								</div>
								<div class="card__meta" style="padding-top: 10px;">
									<!-- 所屬的看板 -->

									<a href="#" class="subject">${launchAll.foumBean.fname}</a><br>

									<!-- 活動時間 -->
									<time class="post_Time" style="font-size: medium;"> ${ launchAll.startTime }</time>
								</div>

								<p class="article_content">以下活動內文 ~ ~</p>
							</div>
							<div class="card__action"></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="launchAll" items="${launchAll}">
				<c:if test="${Newsessionfname == launchAll.foumBean.fname }">
					<div class="container">
<%-- 					<h1>文章編號${ launchAll.article_Id } 的資料</h1> --%>
						<div class="card-deck">
							<!-- 活動1-1 -->
							<div class="card">
								<!-- 活動圖片 -->
								
								<img height="80%" width="80px"
								src='${pageContext.servletContext.contextPath}/forum/RetrieveLaunchImageServlet?article_IdStr=${ launchAll.article_Id }' class="articleimage"
									alt="..." />
								<div class="card-body">
									<div class="card__share">
										<div class="card__social">
											<a class="share-icon googleplus" href="#"><span
												class="fa fa-google-plus"></span></a>

											<!-- 點擊進入詳細活動頁面  -->
											<a id="share" class="share-toggle share-icon"
												
												href="<c:url value='/forum/activity_info_page?article_IdStr=${ launchAll.article_Id }&mode=enterpage'/>"> 
												
												
												<i class="fas fa-plus"></i>
											</a>
										</div>
									</div>
									<div class="card__meta" style="padding-top: 10px;">
										<!-- 活動主題 -->
										<a href="#" class="subject">${ launchAll.foumBean.fname}</a><br>
										<!-- 活動時間 -->
										<time class="post_Time" style="font-size: medium;">${ launchAll.startTime }</time>
									</div>
									<!-- 活動內文 -->
									<p class="article_content">以下活動內文 ~ ~</p>
								</div>
								<div class="card__action"></div>
							</div>
						</div>
					</div>
				</c:if>

			</c:forEach>
<!-- 			<font  size="5">此板目前沒有活動喔，新增文章可以坐沙發喔</font> -->

		</c:otherwise>
	</c:choose>
	      <br />
	      <br />



	<!-- 下方頁碼分頁 ----超連結待補------>
	<nav aria-label="Page navigation example" style="padding-top: 10px;">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#"
				id="" tabindex="-1" aria-disabled="true">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#" id="">1</a></li>
			<li class="page-item"><a class="page-link" href="#" id="">2</a></li>
			<li class="page-item"><a class="page-link" href="#" id="">Next</a>
			</li>
		</ul>
	</nav>

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
