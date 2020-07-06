<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//
	List<BoardDto> list = BoardDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.jsp">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="../todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="../order/list.jsp">Order</a></li>
			<li class="nav-item"><a class="nav-link active" href="list.jsp">Board</a></li>
		</ul>
</div>
<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item active"><a href="list.jsp"></a>글 목록</li>
	</ol>
	<h1>글 목록 입니다.</h1>
	<table class="table">
		<thead>
			<tr class="bg-success">
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<%for(BoardDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %><a href="detail.jsp?num=<%=tmp.getNum()%>">자세히보기</a></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<a href="insertform.jsp">글 추가하기</a>
</div>
</body>
</html>