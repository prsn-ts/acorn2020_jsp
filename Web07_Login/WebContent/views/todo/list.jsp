<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/todo/list.jsp</title>
</head>
<body>
<h1>할일 목록 입니다.</h1>
<ul>
	<%-- 
		el문법을 사용해서 request 영역에 담은 키값을 사용해
		키에 해당하는 값(value, 여기선 todoList라는 가변 배열)를 가져온 후
		todoList 배열에 있는 제너릭인 String 타입의 문자열 객체의 참조값을
		tmp 변수에 반복문 돌 때마다 차례대로 저장하고 el문법으로 출력까지 한다.
	--%>
	<c:forEach var="tmp" items="${requestScope.todoList }">
		<li>${tmp }</li>
	</c:forEach>
</ul>
</body>
</html>