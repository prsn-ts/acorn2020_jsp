<%@page import="test.member.dto.MemoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에 접근할 수 있는 MemoDao 객체 불러오기(getInstance 메소드 이용)
	MemoDao dao = MemoDao.getInstance();
	//getList 메소드를 이용해서 DB의 내용을 저장한 MemoDto의 정보들을 list 변수에 담기.
	List<MemoDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="../index.jsp">Acorn</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link active" href="list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="../order/list.jsp">Order</a></li>
			</ul>
		</div>
		<h1>할일 목록 보기</h1>
		<form action="insert.jsp" method="post">
			<input type="text" name="content"/>
			<button type="submit">추가</button>
		</form>
		<div class="d-flex table-dark">
			<div class="col-2">순서</div>
			<div class="col-5">할일</div>
			<div class="col-3">날짜</div>
			<div class="col-2">삭제</div>
		</div>
	<%for(MemoDto tmp:list){ %>
		<div class="d-flex">
			<div class="col-2"><%=tmp.getNum() %></div>
			<div class="col-5"><%=tmp.getContent() %></div>
			<div class="col-3"><%=tmp.getRegdate() %></div>
			<div class="col-2"><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></div>
		</div>
	<%} %>
	</div>
</body>
</html>