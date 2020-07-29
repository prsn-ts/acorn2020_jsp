<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//test 를 위해 sample data 를 request 영역에 담기
	request.setAttribute("jumsu", 85);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 단일 if문을 쓸 수 있다(if-else 문은 없지만 대체할 수 있는 것은 있다) --%>
	<c:if test="${10%2 eq 0 }"> <%-- test 속성안에 값이 if문의 조건 검사식이 들어가는 부분이다. --%>
		<p>10은 짝수 입니다.</p>
	</c:if>
	<c:if test="${11%2 eq 0 }">
		<p>11은 짝수 입니다.</p>
	</c:if>
	<%-- session 영역에 id 라는 키값으로 저장된 값이 비어있지 않다면
		(저장된 값이 있다면) (로그인된 상태라면) --%>
	<c:if test="${not empty sessionScope.id }">
		<p><strong>${id }</strong>님 로그인중...</p>
	</c:if>
	
	<p> 획득한 점수는 <strong>${jumsu }</strong> 입니다.</p>
	<p> 
		학점은
		<%-- 다중 if문 사용을 위해 <c:choose> 태그 사용 --%>
		<c:choose>
			<%-- switch, if문 개념과 비슷하다 --%>
			<c:when test="${jumsu ge 90 }">A</c:when> <%-- if문 --%>
			<c:when test="${jumsu ge 80 }">B</c:when> <%-- else if문 --%>
			<c:when test="${jumsu ge 70 }">C</c:when> <%-- else if문 --%>
			<c:when test="${jumsu ge 60 }">D</c:when> <%-- else if문 --%>
			<c:otherwise>F</c:otherwise> <%-- else문 --%>
		</c:choose>
		입니다.
	</p>
</body>
</html>