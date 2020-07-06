<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
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
		<li class="breadcrumb-item active"><a href="insertform.jsp"></a>추가양식</li>
	</ol>
	<h1>회원 정보 추가 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
	<div class="row">
		<div class="form-group col">
			<label for="name">이름</label>
			<input type="text" class="form-control" name="name" id="name" /><br/>
		</div>
		<div class="form-group col">
			<label for="addr">지역선택</label>
			<select class="custom-select mr-sm-2" id="addr">
		        <option selected>지역 선택</option>
		        <option value="1">경기도</option>
		        <option value="2">강원도</option>
		        <option value="3">충청북도</option>
		        <option value="4">충청남도</option>
		        <option value="5">경상북도</option>
		        <option value="6">경상남도</option>
		        <option value="7">전라북도</option>
		        <option value="8">전라남도</option>
		        <option value="9">제주도</option>
      		</select>
      		<label for="detail_addr">상세주소</label>
			<input type="text" class="form-control" name="addr" id="detail_addr" /><br />
		</div>
	</div>
		<button class="btn btn-outline-primary btn-sm" type="submit">추가</button>
		<button class="btn btn-outline-warning btn-sm" type="reset">취소</button>
	</form>
</div>
</body>
</html>