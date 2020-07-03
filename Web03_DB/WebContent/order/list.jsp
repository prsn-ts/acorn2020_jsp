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
</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr>
					<td>주문 순서</td>
					<td>가격</td>
					<td>주문 메뉴</td>
					<td>주문받은 시간</td>
				</tr>
			</thead>
			<tbody>
			<%for(OrderDto tmp: list){ %>
				<!-- 실제 주문 받은 목록 보기 -->
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getPrice() %></td>
					<td><%=tmp.getMenu() %></td>
					<td><%=tmp.getTime() %></td>
				</tr>
			<%} %>	
			</tbody>
		</table>
	</div>
</body>
</html>