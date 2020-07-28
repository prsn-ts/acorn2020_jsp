<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL (Jsp Standard Tag Library)</h1>
<%-- jstl을 이용해서 <p>안녕 (i 변수값) </p> 부분을 화면에 5번 출력. --%>
<c:forEach var="i" begin="1" end="5">
	<p>안녕 ${i }</p>
</c:forEach>

<%-- 자바코드와 tag의 결합 --%>
<%for(int i=1; i<=5; i++){ %>
	<p>안녕 <%=i %></p>
<%} %>

<a href="jstl_test2.jsp">다음 예제</a>
</body>
</html>