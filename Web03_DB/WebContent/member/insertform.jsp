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
<div class="container">
	<h1>회원 정보 추가 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
	<div class="row">
		<div class="form-group col">
			<label for="name">이름</label>
			<input type="text" class="form-control" name="name" id="name" /><br/>
		</div>
		<div class="form-group col">
			<label for="addr">주소</label>
			<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
		        <option selected>지역 선택</option>
		        <option value="1">경기도</option>
		        <option value="2">강원도</option>
		        <option value="3">충청북도</option>
		        <option value="4">충청남도</option>
		        <option value="5">경상북도</option>
		        <option value="6">경상남도</option>
      		</select>
			<input type="text" class="form-control" name="addr" id="addr" /><br />
		</div>
	</div>
		<button type="submit">추가</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>