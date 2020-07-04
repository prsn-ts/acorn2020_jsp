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
	//비지니스 로직 처리하기
	//1. form에서 전송한 정보들을 담아오기.
	request.setCharacterEncoding("utf-8");
	int price = Integer.parseInt(request.getParameter("price"));
	String menu = request.getParameter("menu");
	//2. OrderDao 객체를 생성해서 DB에 가져온 정보를 넣기
	boolean isSuccess = OrderDao.getInstance().insert(price, menu);
%>
	<% if(isSuccess == true){%>
		<script>
			alert("주문을 추가했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{%>
		<script>
			alert("주문이 실패했습니다!");
			location.href="list.jsp";
		</script>	
	<%}%>
</body>
</html>