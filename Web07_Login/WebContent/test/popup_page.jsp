<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/popup_page.jsp</title>
<style>
	body{
		background-color: yellow;
	}
</style>
</head>
<body>
<h3>팝업된 페이지 입니다.</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto impedit quae mollitia porro quis labore aspernatur autem voluptate! Odit non sint sit quisquam molestiae tempora maxime molestias qui laborum obcaecati.</p>
<a href="javascript: self.close();"></a> <%-- self.close()는 현재 창이 닫히게 되게 한다 --%>
</body>
</html>