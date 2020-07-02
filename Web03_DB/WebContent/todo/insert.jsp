<%@page import="test.member.dao.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 할일을 읽어온다.
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	// 2. DB 에 저장한다.
	MemoDao dao = MemoDao.getInstance();
	dao.insert(content);
	// 3. 클라이언트 웹브라우저에 응답한다. 응답내용은 ↓↓
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<p>할일을 추가했어요 <a href="list.jsp">확인해볼텨?</a></p>
</body>
</html>