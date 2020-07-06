<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
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
		<li class="breadcrumb-item active"><a href="insertform.jsp"></a>새 글쓰기</li>
	</ol>
	<h1>새글 작성 폼입니다.</h1>
	<form action="insert.jsp" method="post">
		<div class="form-row">
			<div class="col">
				<label for="writer">작성자</label>
				<input type="text" name="writer" id="writer" /><br />
			</div>
			<div class="col">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" /><br />
			</div>
		</div>
		<label for="content">내용</label><br />
		<textarea name="content" id="content" cols="20" rows="5"></textarea><br />
		<input type="submit" value="등록" />
		<input type="reset" value="취소" />
	</form>
</div>
</body>
</html>