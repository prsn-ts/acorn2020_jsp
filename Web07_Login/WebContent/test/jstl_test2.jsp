<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	//테스트를 위해 smaple 데이터를 request 영역에 담아 놓는다.
	List<String> names = new ArrayList<String>();
	names.add("호랑이");
	names.add("눈표범");
	names.add("금빛원숭이");
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//reqeust 영역에 "list" 라는 키값으로 이 페이지에서 생성했지만 담겨있다고 가정하고 담긴 값 얻어오기
	List<String> list = (List<String>)request.getAttribute("list");
%>
<h1>친구 목록 입니다.</h1>
<ul>
	<%for(String tmp:list){ %>
		<li><%=tmp %></li>
	<%} %>
</ul>

<h1>친구 목록 입니다. (EL+JSTL 활용)</h1>
<ul>
	<c:forEach var="tmp" items="${requestScope.list }">
		<li>${tmp }</li>
	</c:forEach>
</ul>
</body>
</html>