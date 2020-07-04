<%@page import="test.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="test.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에 있는 정보를 읽어와서 화면에 보여주기 위해 DB접근 객체 생성.
	OrderDao dao = OrderDao.getInstance();
	//OrderDao의 객체를 사용하여 OrderDto에 있는 정보 리스트 가져오기.
	List<OrderDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="../index.jsp">Acorn</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link" href="../todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link active" href="list.jsp">Order</a></li>
			</ul>
		</div>
		<h1>주문 내역 보기</h1>
		<form action="insert.jsp" method="post">
			<label for="price">가격</label>
			<input type="text" id="price" name="price" />
			<label for="menu">주문할 메뉴</label>
			<input type="text" id="menu" name="menu" />
			<button>추가</button>
		</form>
			<table class="table table-bordered mt-3">
				<thead>
					<tr class="table-info">
						<th scope="col">주문 순서</th>
						<th scope="col">가격</th>
						<th scope="col">주문 메뉴</th>
						<th scope="col">주문받은 시간</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
				<%for(OrderDto tmp: list){ %>
					<!-- 실제 주문 받은 목록 보기 -->
					<tr>
						<td scope="col"><%=tmp.getNum() %></td>
						<td scope="col"><%=tmp.getPrice() %></td>
						<td scope="col"><%=tmp.getMenu() %></td>
						<td scope="col"><%=tmp.getTime() %></td>
						<td scope="col"><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
					</tr>
				<%} %>	
				</tbody>
			</table>
	</div>
</body>
</html>