<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<h1>친구 목록 입니다. (EL+JSTL 활용), 인덱스 표시(varStatus 속성 이용)</h1>
<ul>
	<%-- 
		el문법을 이용해서 값을 추출해 보여주기 위해서는
		아래의 4개의 영역에 담겨있어야 가능하다.(그냥 일반변수에 담겨있는 값은 el문법으로 추출 불가능)
		1. pageScope
		2. requestScope
		3. sessionScope
		4. applicationScope
	--%>
	<%-- 웹브라우저에 인덱스 값을 이용해서 처리하고 싶을 때 사용하면 좋다.(웹브라우저를 키면 동작 확인가능) --%>
	<c:forEach var="tmp" items="${requestScope.list}" varStatus="status">
		<li data-index="${status.index }">${tmp } <strong>${status.index }</strong></li>
	</c:forEach>
</ul>
<h1>순서에 맞는 값 출력 관련 기능(count)</h1>
<ul>
	<%-- 1부터 카운트를 세는 el문법을 활용(웹브라우저에 페이지 소스보기를 열면 동작 확인 가능) --%>
	<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
		<li data-index="${status.count }">${tmp } <strong>${status.count }</strong></li>
	</c:forEach>
</ul>
<h1>친구 목록 입니다. 첫번째 인지 여부(첫번째 결과만 true, 반복문의 첫번째인지 알 수 있음)</h1>
<ul>
	<%-- 첫번째 인지 여부 확인하는 el문법을 활용 --%>
	<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
		<li data-index="${status.first }">${tmp } <strong>${status.first }</strong></li>
	</c:forEach>
</ul>
<h1>친구 목록 입니다. 마지막 인지 여부(마지막 결과만 true, 반복문의 마지막인지 알 수 있음)</h1>
<ul>
	<%-- 첫번째 인지 여부 확인하는 el문법을 활용 --%>
	<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
		<li data-index="${status.last }">${tmp } <strong>${status.last }</strong></li>
	</c:forEach>
</ul>
</body>
</html>