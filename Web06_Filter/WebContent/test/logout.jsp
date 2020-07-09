<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 처리하기
	session.invalidate(); //전체 세션 초기화
	//context Path
	String cPath = request.getContextPath();
	//리다일렉트 응답
	response.sendRedirect(cPath+"/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>