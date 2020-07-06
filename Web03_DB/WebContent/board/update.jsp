<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송받는 정보들을 utf-8 방식으로 요청한다.
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 수정할 글의 정보를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//BoardDto 객체에 수정할 글의 정보를 담는다.
	BoardDto dto = new BoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	//BoardDao 객체를 이용하여 DB에 수정된 정보를 저장한다.
	boolean isSuccess = BoardDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num%> 번 글을 수정했습니다.");
			location.href="detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<script>
			alert("글 수정 실패..");
			location.href="updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>