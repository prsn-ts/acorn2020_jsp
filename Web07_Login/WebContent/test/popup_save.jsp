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
	//"no" 혹은 null 이다
	String canPopup = request.getParameter("canPopup");
	//만일 팝업을 띄우지 않겠다고 체크박스를 체크했다면(canPopup의 파라미터의 값이 "no"일 경우)
	if(canPopup != null){
		//canPopup 이라는 키값으로 no 라는 문자열을 담고 (no라는 문자열을 사용하지는 않는다.)
		Cookie cook = new Cookie("canPopup", canPopup);
		//쿠키 유지 시간을 초단위로 삼고
		cook.setMaxAge(60);
		//쿠키가 응답될 수 있도록 HttpServletResponse 객체에 담는다.
		response.addCookie(cook);
	}
%>
<script>
	//창이 닫아지도록 자바스크립트로 처리한다.
	self.close();
</script>
</body>
</html>