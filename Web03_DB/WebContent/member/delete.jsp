<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 요청에 의한 정보를 받을 수 있게 한다.(삭제할 번호를 읽어온다)
	int num = Integer.parseInt(request.getParameter("num"));

	//2. 요청의 의한 정보를 MemberDao 객체를 이용해서 db에 접근해 삭제 동작을 한다.
	MemberDao dao = MemberDao.getInstance();
	dao.delete(num);
	
	//3. 응답하기
	//리다일렉트 이동시키기 위해 context path 를 먼저 읽어온다.
	String cPath = request.getContextPath();
	//회원 목록보기 요청을 하도록 강요한다. (리다일렉트 이동시키기)
	response.sendRedirect(cPath+"/member/list.jsp");
	
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