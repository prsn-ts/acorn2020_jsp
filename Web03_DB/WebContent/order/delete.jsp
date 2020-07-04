<%@page import="test.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//DB 삭제하는 비지니스 로직 짜기
	//1. 특정 행을 삭제할 수 있는 정보를 가져오기.
	int num = Integer.parseInt(request.getParameter("num"));
	
	//2. OrderDao 객체를 생성해서 DB에 가져온 정보를 넣기
	boolean isSuccess = OrderDao.getInstance().delete(num);
%>
	<% if(isSuccess == true){%>
		<script>
			alert("주문을 삭제했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{%>
		<script>
			alert("주문 삭제가 실패했습니다!");
			location.href="list.jsp";
		</script>	
	<%}%>
</body>
</html>