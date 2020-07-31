<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/regular_ex.jsp</title>
</head>
<body>
<h1>Regular Expression 테스트</h1>
<input type="text" id="id" placeholder="아이디 입력..." />
<button id="checkBtn">가입</button>
<p>영문자 소문자로 시작하고 5~10글자 이내, 특수문자를 하나이상 입력 하세요</p>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>

	//영문자 소문자로 시작하는지 여부를 알아 낼 수 있는 정규 표현식 객체
	var reg1 = /^[a-z]/;
	//최소 5글자 최대 10글자 인지 여부를 검증할 수 있는 정규 표현식 객체
	// /.{5,10}/ 이렇게만 쓰면 최대 10글자가 넘어가도 시작(^)과 끝($)을 명시하지 않았기 때문에 result2의 값이 true로 반환이되는 오류 발생함.)
	// 그래서 /^.{5,10}$/ 이렇게 시작(^)과 끝($)을 명시해야한다.(매칭되는게 존재할 뿐만 아니라 그것외에 불필요한 문자가 들어갈 수 있기 때문에 시작과 끝을 명시해서 검사해야할 문자만 검사해 true, false를 반환해서 판단한다.)
	var reg2=/^.{5,10}$/;
	////특수문자가 포함되어 있는지 여부를 검증할 수 있는 정규 표현식 객체
	var reg3=/[a-zA-Z0-9]/;
	//영문자 소문자 시작 + 최소 5글자 최대 10글자 인지 여부를 검증할 수 있는 정규 표현식 객체
	var reg4 = /^[a-z].{4,9}$/; //[a-z]에서 한글자가 포함되기 때문에 최소 4글자에서 최대 9글자까지만 들어가도록 .{4,9} 이렇게 처리.

	//버튼을 클릭했을 때 실행할 함수 등록
	$("#checkBtn").on("click", function(){
		//1. 입력한 문자열을 읽어와서
		var str = $("#id").val();
		//2. 검증한다.
		var result1 = reg1.test(str);
		if(result1){
			alert("영문자 소문자로 시작 했군요!");
		}
		
		var result2 = reg2.test(str);
		if(result2){
			alert("최소 5글자~최대10글자 이군요!");
		}
	});
</script>
</body>
</html>