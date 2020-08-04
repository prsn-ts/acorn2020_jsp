<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/list.jsp</title>
</head>
<body>
<%-- 
	서블릿 페이지를 거쳐서 완성되는 이런 list.jsp 같은 페이지 같은 경우
	list.jsp 페이지를 직접 요청하게되면 아무런 내용도 없이 뜰 수 있는 오류의 개연성이 존재한다.
	그래서 주소창에 직접 입력해서 들어올 가능성을 아예 배제하기위해 직접적인 접근이 불가능한 경로에 넣어야하는데
	그것이 바로 WEB-INF 폴더 안에 넣는것이다.
	WEB_INF 폴더 안에 넣으면 주소창에 입력하여 직접적으로 접근하는 것을 원천적으로 막는다.
--%>
<h1>파일 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>파일 번호</th>
				<th>파일 올린 이</th>
				<th>파일 제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${requestScope.list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>${tmp.title }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>