<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Launch_activityBean</title>
</head>
<body>
<h1>

所屬的熱門看板:${Newsessionfname}<br><br>
文章編號${ Launch_activityBean.article_Id } 的資料新增成功</h1><br><br>
會員: ${ Launch_activityBean.article_m_id }<br><br>
活動標題: ${ Launch_activityBean.article_title }<br><br>
活動內容: ${ Launch_activityBean.article_content }<br><br>
活動圖片: ${ Launch_activityBean.articleimage }<br><br>
活動主題: ${ Launch_activityBean.subject }<br><br>
活動地點: ${ Launch_activityBean.location }<br><br>
PO文時間: ${ Launch_activityBean.post_Time }<br><br>
活動開始時間: ${ Launch_activityBean.startTime }<br><br>
活動結束時間: ${ Launch_activityBean.endTime }<br><br>
</body>
</html>