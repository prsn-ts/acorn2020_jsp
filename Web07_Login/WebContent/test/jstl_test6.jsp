<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//textarea 에 입력한 정보를 읽어온다. 개행기호(\n) 포함되어 있을 수 있다.
	String content = request.getParameter("content");
	//sample data(DB 에서 불러온 데이터라고 가정) 를 request 영역에 담아준다.
	request.setAttribute("content", content);
	//페이지 영역에 newLine 이라는 키값으로 개행기호 담기
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/jstl_test6.jsp</title>
</head>
<body>
<h1>jstl 함수 사용해 보기</h1>
<%-- textarea에서 넘어오는 개행기호를 p 요소안에 <br/>로 변경해서 여러줄로 표시될 수 있게 처리 --%>
<p>${fn:replace(content, newLine, '<br/>') }</p>
</body>
</html>