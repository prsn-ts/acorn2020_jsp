<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/game.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="game" name="thisPage"/>
	</jsp:include>
	<h1>game.jsp 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis mollitia excepturi eaque nemo facere voluptate officiis enim exercitationem. Suscipit hic corrupti iure molestiae aperiam doloribus tenetur quae fugit rerum porro.</p>
</body>
</html>