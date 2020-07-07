<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/main.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<%
		//jsp include는 include 디렉티브처럼 코드가 합쳐지는 것이 아닌 독립적인 서블릿 페이지가 만들어지기 때문에 같은 이름의 name 변수를 써도 오류가 발생하지 않는다.
		//header.jsp 페이지와 별개의 main.jsp 페이지이기 때문에
		//서로 coding 내용에 영향을 받지 않는다.
		String name="해골";
	%>
	
	<h1>main.jsp 페이지 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum rem fugit reprehenderit fugiat reiciendis incidunt ex perspiciatis voluptates ab architecto a impedit voluptatem quas et doloremque sed rerum culpa dolorum.</p>
	<a href="other.jsp">다른 페이지 가기</a>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>