<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 수정할 글의 번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	//BoardDao 객체를 이용해서 해당글의 정보를 얻어온다.
	BoardDto dto = BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.jsp">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="../todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="../order/list.jsp">Order</a></li>
		</ul>
</div>
<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item active"><a href="list.jsp"></a>글 목록</li>
		<li class="breadcrumb-item active"><a href="detail.jsp"></a>자세히보기</li>
		<li class="breadcrumb-item active"><a href="updateform.jsp"></a>수정 및 삭제하기</li>
	</ol>
	<h1>글 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<label for="num">번호</label>
		<input type="text" id="num" value="<%=dto.getNum() %>" disabled />
		<br />
		<label for="writer">작성자</label>
		<input type="text" id="writer" name="writer" value="<%=dto.getWriter() %>" />
		<br />
		<label for="title">제목</label>
		<input type="text" id="title" name="title" value="<%=dto.getTitle()%>"/>
		<br />
		<label for="content">내용</label>
		<textarea name="content" id="content" cols="20" rows="5"><%=dto.getContent() %></textarea>
		<br />
		<button class="btn btn-primary btn-sm" type="submit">수정확인</button>
		<button class="btn btn-danger btn-sm" type="reset">취소</button>
	</form>
</div>
</body>
</html>