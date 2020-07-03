<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. form 전송되는 수정할 회원의 정보를 읽어온다
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//2. DB에 수정 반영한다.
	MemberDto dto = new MemberDto(num, name, addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
	//3. 수정 요청에 응답한다.(2가지가 있음.)
	//isSuccess 변수 활용 or redirect 메소드를 이용하는방법.
	//여기서는 후자를 선택했다.
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	<%if(isSuccess){ %>
		<script>
			alert("<%=dto.getNum() %> 번 회원의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="updateform.jsp?num=<%=dto.getNum() %>";
		</script>
	<%} %>
	--%>
</body>
</html>