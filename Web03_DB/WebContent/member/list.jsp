<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();
	//회원 목록 얻어오기
	List<MemberDto> list = dao.getList();
%>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.jsp">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="../todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="../order/list.jsp">Order</a></li>
		</ul>
</div>
<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item active"><a href="list.jsp"></a>회원목록</li>
	</ol>
	<h1>회원 목록입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp: list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a></td>
			</tr>	
		<%} %>
		</tbody>
	</table>
	<a href="insertform.jsp">회원 추가 하러가기</a>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>