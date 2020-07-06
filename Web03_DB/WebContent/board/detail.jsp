<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 자세히 보여줄 글의 번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	//BoardDao 객체를 이용해서 해당글의 정보를 얻어온다.
	BoardDto dto = BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
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
	</ol>
	<h1>글 자세히 보기 페이지 입니다.</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<textarea cols="20" rows="5"><%=dto.getTitle() %></textarea>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
			</td>
		</tr>
	</table>
</div>
</body>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
</html>