<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myName="김구라";
	//page scope 에 "myName" 이라는 키값으로 myName 담기
	//page scope 에 담은 값은 해당 페이지(jsp) 내에서만 사용할 수 있다.
	pageContext.setAttribute("myName", myName);
	
	String yourName="해골";
	/*
		request scope 에 "yourName" 이라는 키값으로 yourName 담기
		request scope 에 담은 값은 응답하기 전까지 사용할 수 있다.
		(다른 페이지로 forward 이동해도 사용할 수 있다.)
		(다른 페이지로 redirect 이동하면 사용할 수 없다.) -> redirect 자체가 응답이기 때문에 응답하기전까지만 사용가능한 request scope에 담은 값은 사용불가.
	*/
	request.setAttribute("yourName", yourName);
		
	String ourName = "원숭이";
	/*
		session scope 에 "ourName" 이라는 키값으로 ourName 담기
		session scope 에 담은 값은 세션이 유지 되는 동안 사용할 수 있다.
		(다른 페이지로 forward, redirect 이동 해도 사용할 수 있다)
		(웹브라우저를 닫거나 세션을 초기화 하기 전까지 사용할 수 있다.)
	*/
	session.setAttribute("ourName", ourName);
	
	String companyName="에이콘";
	/*
		application scope 에 "companyName" 이라는 키값으로 companyName 담기
		application scope 에 담은 내용은 서버를 끄기 전까지 사용할 수 있다.
		(웹브라우저를 닫아도 지워지지 않는다)
	*/
	application.setAttribute("companyName", companyName);
	
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setTitle("원숭이");
	dto.setContent("나와라~");
	/*
		request 영역에 "dto" 라는 키값으로 CafeDto dto인 dto 담기
	*/
	request.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/el_test2.jsp</title>
</head>
<body>
	<h1>EL 로 page scope 에 저장된 값 추출</h1>
	<%-- 자바 코드로 표현 --%>
	<p>내 이름은 <strong><%=myName %></strong></p> <%-- 자바 코드로 출력하기 --%>
	
	<%-- el(expression language 로 표현 --%>
	<p>내 이름은 <strong>${pageScope.myName }</strong></p>
	<p>내 이름은 <strong>${myName }</strong></p> <%-- "pageScope" 생략가능 --%>
	
	<h1>EL 로 request scope 에 저장된 값 추출</h1>
	<p>내 이름은 <strong>${requestScope.yourName }</strong></p>
	<p>내 이름은 <strong>${yourName }</strong></p> <%-- "requestScope" 생략가능 --%>
	
	<h1>EL 로 session scope 에 저장된 값 추출</h1>
	<p>우리 이름은 <strong>${sessionScope.ourName }</strong></p>
	<p>우리 이름은 <strong>${ourName }</strong></p> <%-- "sessionScope" 생략가능 --%>
	
	<h1>EL 로 application scope 에 저장된 값 추출</h1>
	<p>학원 이름은 <strong>${applicationScope.companyName }</strong></p>
	<p>학원 이름은 <strong>${companyName }</strong></p>
	
	<%-- 
		영역을 적지않고 키값만 입력할 시 아래의 순서대로 찾음
		1. pageScope
		2. requestScope
		3. sessionScope
		4. applicationScope
		
		위에 순서대로 찾는데 없으면 null값도 아닌 완전히 비어있는 상태를 출력한다.
	--%>
	
	<%-- el(expression language) 로 값 추출해 사용하기
	
		- dto 작성 규약에 맞게 쓰여진 dto에 경우에만 el로 추출가능.
		개발자가 dto 작성 규약에 맞지않게 오타가 났다던가 내용을
		임의로 바꿨다면 추출 불가능.
		
		- 또한, dto의 private 필드값을 직접 참조하는 듯한 el문법의 경우(${dto.num })
		el문법 내부에서는 이러한 처리를 필드값을 직접 참조하는 것이 아닌 getter,setter 메소드를 호출해서 추출하는 방식으로 하게된다.
	--%>
	<h1>EL request scope 에 담긴 dto 의 값 추출</h1>
	<p>번호 : ${requestScope.dto.getNum() }</p>
	<p>번호 : ${dto.getNum() }</p>
	<p>번호 : ${dto.num }</p>
	
	<p>제목 : ${requestScope.dto.getTitle() }</p>
	<p>제목 : ${dto.getTitle() }</p>
	<p>제목 : ${dto.title }</p>
	
	<p>내용 : ${requestScope.dto.getContent() }</p>
	<p>내용 : ${dto.getContent() }</p>
	<p>내용 : ${dto.content }</p>
	
	<%-- 만일 EL 을 사용하지 않는다면 아래와 같은 작업이 필요하다 -- --%>
	<%CafeDto dto2 = (CafeDto)request.getAttribute("dto"); %>
	<p> 내용 : <%=dto2.getContent() %></p>
	
	<a href="el_test3.jsp?num=1&name=원효대사">다음 예제</a>
</body>
</html>