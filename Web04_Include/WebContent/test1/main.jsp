<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 디렉티브를 이용해서 jsp 페이지를 include 하면
	해당 페이지에 include 된 jsp 페이지와 합쳐지며 하나의 jsp 페이지가 만들어진다.
	결국 실행시점에 사용되는 jsp 페이지는 1개만 사용된다.(즉, 서블릿도 하나만 만들어진다. include 용도로 만든 header.jsp, footer.jsp의 서블릿은 만들어지지 않는다.)
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/main.jsp</title>
</head>
<body>

	<%@include file="header.jsp" %>
	
	<h1>main.jsp 페이지 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum rem fugit reprehenderit fugiat reiciendis incidunt ex perspiciatis voluptates ab architecto a impedit voluptatem quas et doloremque sed rerum culpa dolorum.</p>
	<a href="other.jsp">다른 페이지 가기</a>
	
	<%@include file="footer.jsp" %>
</body>
</html>