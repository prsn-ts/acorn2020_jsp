<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//request 영역에 "dto" 라는 키값으로 담긴 MemberDto 객체의 참조값 얻어내기
	MemberDto dto = (MemberDto)request.getAttribute("dto");
%>
<p><%=dto.getName() %> 회원이 입장했습니다.</p>
<p> 번호 : <strong><%=dto.getNum() %></strong></p>
<p> 주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>