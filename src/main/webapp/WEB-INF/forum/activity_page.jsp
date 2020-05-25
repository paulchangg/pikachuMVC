
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<c:url value="/articleForum/css/activity_page.css"/>" />
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
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


<script type="text/javascript">
	window.addEventListener('load', doFirst);

	function doFirst() {

		var article_content = document
				.getElementsByClassName("article_content");

		for (let i = 0; i < article_content.length; i++) {

			let longarticle_content = article_content[i].innerHTML;


			let shortarticle_content = longarticle_content.substring(0, 30)
					+ "<br><br><.....點進來看詳情.........>";


			article_content[i].innerHTML = shortarticle_content;
		}

		
		
		
		
		
		
		var post_Time = document.getElementsByClassName("post_Time");
		
		for(let i = 0;i<post_Time.length; i++){
			
			
			let qqq = post_Time[i].innerHTML;
			
			let ddd =  qqq .substring(0, 17);
			
			
			
			console.log("ddd"+ddd)
			
			
			post_Time[i].innerHTML = ddd;
			
		}
		
		
		
		
		
		
		
		
		
		
		

	}
</script>



</head>


<body>
	<!-- logo及上方標題列-->
	<div class="container-fluid"
		style="height: 160px; background-image: linear-gradient(-225deg, #b3db94 50%, #ffe066 50%);">
		<div class="row">
			<div class="col-sm">
				<p style="font-size: xx-large;">哪家的信用卡功能最丘？</p>
				<p style="font-size: medium; padding-top: 10px;">快速了解最適合自己的信用卡，同時找到與自己財力匹配的對象。</p>
			</div>
			<div class="row justify-content-around">
				<div class="col-sm">
					<a href="<c:url value="/"/>"> <img
						src="<c:url value="/articleForum/images/logo2.png"/>" alt="logo"
						style="height: 340px; width: 300px; padding: 0 30px 140px 0;" />
					</a>
				</div>
			</div>
			<!-- 右上區塊 -->
			<div class="col-sm">
				<ul class="nav justify-content-end"
					style="font-size: 18px; font-weight: bold;">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/member_logout" />' id="memberlogin"
						style="color: rgb(92, 41, 7);">會員登出</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/member_center" />' id="cardcompare"
						style="color: rgb(92, 41, 7);"><i class='bx bx-user-circle'></i>會員中心</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/shopping/listProduct" />' id="shoppingcart"
						style="color: rgb(92, 41, 7);"> <i
							class="fas fa-shopping-cart"></i>
					</a></li>
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
			<a class="et-hero-tab" href='<c:url value="/about_us" />'>關於我們</a> <a
				class="et-hero-tab"
				href='<c:url value="/cards/cradeitCb?qt=main" />'>信用卡比較</a> <a
				class="et-hero-tab" href='<c:url value="/articleForum/listforum"/>'>論壇交友</a>
			<a class="et-hero-tab" href='<c:url value="/shopping/listProduct" />'>商城</a>
			<a class="et-hero-tab" href='<c:url value="/news/lastestNews" />'>資訊網</a>
			<span class="et-hero-tab-slider"></span>
		</div>
	</div>

	<!-- 看板門面圖 -->
	<div class="card-group">
		<div class="card">
			<img src="./images/activity/pic1.jpg" class="card-img-top" alt="..."
				style="height: 378px;" />
		</div>
		<div class="card">
			<img src="./images/activity/pic2.jpg" class="card-img-top" alt="..."
				style="height: 378px;" />
		</div>
		<div class="card">
			<img src="./images/activity/pic3.jpg" class="card-img-top" alt="..."
				style="height: 378px;" />
		</div>
	</div>

	<!-- 分隔列---->
	<div class="second_line"></div>

	<!-- 發布活動按鈕 -->
	<div class="d-flex flex-row bd-highlight"
		style="padding-top: 20px; margin-left: 15px;">
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
									<img
										src='${pageContext.request.contextPath}/init/getMemberImage?id=${loginmember}'
										alt="profile-sample5" id="memberid_img" /><br>
									<c:choose>
										<c:when test="${Newsessionfname != null}">
											<span style="font-size: 0.6em; color: #3e8bbe;">主揪人</span>
											<span id="article_m_id" style="font-size: 0.8em;">${loginmember}</span>
											<!-- 發文者的名字 -->
											<h1>發文看板:${Newsessionfname}</h1>
											<hr />

											<h1 class="fs-title">活動標題</h1>

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
											<input type="datetime-local" name="starteTimeStr"
												placeholder="開始日期與時間" value="${param.starteTimeStr}" />
											<font color="red" size="-1">${MsgMap.starte_TimeError}</font>
											<br>

											<h1 class="fs-title">活動結束時間</h1>
											<input type="datetime-local" name="endTimeStr"
												placeholder="結束日期與時間" value="${param.endTimeStr}" />
											<font color="red" size="-1">${MsgMap.endTimeError}</font>
											<br>

											<h1 class="fs-title">活動主題</h1>
											<!-- 主題選單 -->
											<div class="btn-group">

												<input type="text" id="subject" name="subject" size="100"
													value="${param.subject}" /><br>
											</div>
											<font color="red" size="-1">${MsgMap.subjectError}</font>
											<br>

											<h1 class="fs-title">活動內容</h1>

											<textarea cols="50" rows="5" placeholder="內容不能少於50個字"
												name="article_content">${param.article_content}</textarea>
											<br>
											<font color="red" size="-1">${MsgMap.ContentError}</font>
											<br>

											<!-- 上傳圖片的按鈕 -->
											<h1 class="fs-title">活動照片</h1>
											<div class="articleimage" style="padding-bottom: 5px;">
												<input id="inputImg" name="imageFile" type="file"
													multiple="multiple" />
											</div>

											<!-- 底部按鈕 -->
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary btn-sm"
													data-dismiss="modal">返回</button>
												<button type="submit" class="btn btn-primary btn-sm">送出</button>
											</div>
										</c:when>
										<c:otherwise>
											<h1>發文看板:你還沒選擇看板喔(在下方喔)</h1>
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
	<!-- 左側看板列表-->
	<div class="container-fluid">
		<div class="row" style="display: flex;">
			<!-- 左側button-->
			<div class="col-2">
				<div class="my-3">
					<a class="nav-link"  href='<c:url value="/articleForum/listforum" />'style="padding: 0px;">
					
					  
					  
						<button type="button" class="btn btn-outline-success "">所有看板</button>
					</a>
					<div style="padding: 10px 0 10px 0;"></div>
					<!-- 分類看板 -->
					<ul class="list-group list-group-flush" style="width: 250px;">
						<li class="list-group-item">
							<button type="button" class="btn btn-light" id="creditcards">
								<a href="<c:url value='/articleForum/listforum/信用卡' />"
									style="text-decoration: none; color: black;">信用卡
									</a>
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
					<a class="nav-link"
						href="<c:url value="/forum/ForumHompage?pageNo=1" />"
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
				<br> <br>
				<div class="my-3">
					<a href="<c:url value='/forum/QueryLaunchALL?pageNo=1' />"
						style="padding: 0px;">
						<button type="button" class="btn btn-outline-info">所有活動</button>
					</a>
				</div>
				<c:forEach var="listFame_listFid" items="${listFame_listFid}">
					<ul class="list-group list-group-flush" style="width: 250px;">
						<li class="list-group-item"><a
							href="<c:url value='/forum/ConnectionForum_launch?fname=${listFame_listFid.key}&fid=${listFame_listFid.value}'/>"
							style="text-decoration: none; color: black;">
								<button type="button" class="btn btn-light">${listFame_listFid.key}</button>
						</a>
						
						
						</li>
					</ul>
				</c:forEach>
				<br>
			</div>
			<!-- 中間大區塊貼文開始 -->
			<!-- 活動欄位 -->
		
			
			
			<div class="col-9">
			
				<!-- 		分標籤的部分 -->
				<div class="container">
					<div class="card-deck">
						<!-- 活動1-1 -->
						<c:forEach var="subList1" items="${subList1}">
								<div class="card">
									<!-- 活動圖片 -->
									<a
										href="<c:url value='/forum/activity_info_page?article_IdStr=${ subList1.article_Id }&mode=enterpage'/>">
										<img
										src='${pageContext.servletContext.contextPath}/forum/RetrieveLaunchImageServlet?article_IdStr=${ subList1.article_Id }'
										class="articleimage" alt="..." />
									</a>

									<div class="card-body">
										<div class="card__share">
											<div class="card__social">

												<!-- 點擊進入詳細活動頁面  -->
												<a id="share" class="share-toggle share-icon"
													href="<c:url value='/forum/activity_info_page?article_IdStr=${ subList1.article_Id }&mode=enterpage'/>">
													<i class="fas fa-plus"></i>
												</a>
											</div>
										</div>
										<div class="card__meta" style="padding-top: 10px;">
											<!-- 所屬的看板 -->
											<a href="#" class="subject">${subList1.foumBean.fname}</a><br>
											<!-- 活動時間 -->
											<time class="post_Time" style="font-size: medium;"> ${ subList1.post_Time }</time>
										</div>
										<p class="article_content" id="Substring_article_content">${ subList1.article_content }</p>
									</div>
								</div>
							</c:forEach>
					</div>
				</div>
<!-- 				-------------------------------------------------- -->

				<div class="container">
					<div class="card-deck">
						<!-- 活動1-2 -->
						<c:forEach var="subList2" items="${subList2}">
								<div class="card">
									<!-- 活動圖片 -->
									<a
										href="<c:url value='/forum/activity_info_page?article_IdStr=${ subList2.article_Id }&mode=enterpage'/>">
										<img
										src='${pageContext.servletContext.contextPath}/forum/RetrieveLaunchImageServlet?article_IdStr=${ subList2.article_Id }'
										class="articleimage" alt="..." />
									</a>

									<div class="card-body">
										<div class="card__share">
											<div class="card__social">

												<!-- 點擊進入詳細活動頁面  -->
												<a id="share" class="share-toggle share-icon"
													href="<c:url value='/forum/activity_info_page?article_IdStr=${ subList2.article_Id }&mode=enterpage'/>">
													<i class="fas fa-plus"></i>
												</a>
											</div>
										</div>
										<div class="card__meta" style="padding-top: 10px;">
											<!-- 所屬的看板 -->
											<a href="#" class="subject">${subList2.foumBean.fname}</a><br>
											<!-- 活動時間 -->
											<time class="post_Time" style="font-size: medium;"> ${ subList2.post_Time }</time>
										</div>
										<p class="article_content" id="Substring_article_content">${ subList2.article_content }</p>
									</div>
								</div>
							</c:forEach>
					</div>
				</div>
<!-- 				-------------------------------------------------- -->






			</div>
		</div>

		<br /> <br />
		<!-- 中間大區塊貼文結束 -------->


	</div>

	<!-- 下方頁碼分頁 ----超連結待補------>

		<nav aria-label="Page navigation example" style="padding-top: 10px;">
		<ul class="pagination justify-content-center">



	<c:if test="${pageNo >1}">
			<c:forEach var="listFame_listFid" items="${listFame_listFid}">
			<c:if test="${Newsessionfname ==listFame_listFid.key }">


					<li class="page-item"><a class="page-link"
						href="<c:url value='/forum/ConnectionForum_launch?pageNo=1&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
						id="">First</a></li>
				</c:if>
</c:forEach>


<c:if test="${Newsessionfname ==null }">

				<li class="page-item"><a class="page-link"
					href="<c:url value='/forum/QueryLaunchALL?pageNo=1' />"
					id="">First</a></li>
			</c:if>
</c:if>






			<c:if test="${pageNo > 1}">

				<c:forEach var="listFame_listFid" items="${listFame_listFid}">
					<c:if test="${Newsessionfname ==listFame_listFid.key }">

						<li class="page-item"><a class="page-link"
							href="<c:url value='/forum/ConnectionForum_launch?pageNo=${pageNo-1}&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
							id="">Previous</a></li>

				</c:if>
				</c:forEach>
				
				
				
				

<c:if test="${Newsessionfname ==null }">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/forum/QueryLaunchALL?pageNo=${pageNo-1}' />"
					id="">Previous</a></li>
</c:if>
			</c:if>



			<c:if test="${  pageNo !=0  }">
			
			
			
				<c:forEach var="listFame_listFid" items="${listFame_listFid}">
					<c:if test="${Newsessionfname ==listFame_listFid.key }">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/forum/ConnectionForum_launch?pageNo=${pageNo}&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
							id="">${pageNo}</a></li>
					</c:if>
				</c:forEach>
				
				
				
				

<c:if test="${Newsessionfname ==null }">

				<li class="page-item"><a class="page-link"
					href="<c:url value='/forum/QueryLaunchALL?pageNo=${pageNo}' />"
					id="">${pageNo}</a></li>
				</c:if>	
					
					
</c:if>




				<c:if test="${  pageNo !=totalPage  }">

					<c:forEach var="listFame_listFid" items="${listFame_listFid}">
						<c:if test="${Newsessionfname ==listFame_listFid.key }">
							<li class="page-item"><a class="page-link"
								href="<c:url value='/forum/ConnectionForum_launch?pageNo=${pageNo+1}&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
								id="">${pageNo+1}</a></li>
						</c:if>
					</c:forEach>




			<c:if test="${Newsessionfname ==null }">
					<li class="page-item"><a class="page-link"
						href="<c:url value='/forum/QueryLaunchALL?pageNo=${pageNo+1}' />"
						id="">${pageNo+1}</a></li>
				</c:if>


			</c:if>


			

		


			<c:if test="${pageNo != totalPage}">
<c:forEach var="listFame_listFid" items="${listFame_listFid}">
				<c:if test="${Newsessionfname ==listFame_listFid.key }">
					<li class="page-item"><a class="page-link"
						href="<c:url value='/forum/ConnectionForum_launch?pageNo=${pageNo+1}&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
						id="">Next</a></li>
				</c:if>
</c:forEach>


<c:if test="${Newsessionfname ==null }">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/forum/QueryLaunchALL?pageNo=${pageNo+1}' />"
					id="">Next</a></li>
			</c:if>
</c:if>



	<c:if test="${pageNo != totalPage}">
			<c:forEach var="listFame_listFid" items="${listFame_listFid}">
			<c:if test="${Newsessionfname ==listFame_listFid.key }">


					<li class="page-item"><a class="page-link"
						href="<c:url value='/forum/ConnectionForum_launch?pageNo=${totalPage}&fname=${listFame_listFid.key}&fid=${listFame_listFid.value}' />"
						id="">End</a></li>
				</c:if>
</c:forEach>


<c:if test="${Newsessionfname ==null }">

				<li class="page-item"><a class="page-link"
					href="<c:url value='/forum/QueryLaunchALL?pageNo=${totalPage}' />"
					id="">End</a></li>
			</c:if>
</c:if>






		</ul>
	</nav>

	<!-- 底部 ------>
	<div id="backtop" class="gotop">
		<h4>© Java & Android 程式設計人才養成班 第13期第2組. All Rights Reserved</h4>
		<div class="footer">
			<ul>
				<li><span></span> <span></span> <span></span> <span
					class="fab fa-facebook"></span></li>
				<li><span></span> <span></span> <span></span> <span
					class="fab fa-twitter"></span></li>
				<li><span></span> <span></span> <span></span> <span
					class="fab fa-instagram"></span></li>
				<li><span></span> <span></span> <span></span> <span
					class="fab fa-linkedin"></span></li>
			</ul>
		</div>

		<br />
		<button type="button" id="back_bt" class="btn btn-secondary">
			To the top</button>
	</div>

</body>
</html>
