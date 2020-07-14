<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>
<button id="getBtn">요청하기</button>
<button id="getBtn2">요청하기2</button>
<button id="getBtn3">요청하기3</button>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	// id 가 getBtn 인 곳에 "click" 이벤트가 일어났을 때 호출되는 함수 등록
	$("#getBtn").on("click", function(){
		//jquery 의 기능을 이용해서 페이지 이동이 없는 ajax 요청하기
		$.ajax({
			method:"GET", //요청방식
			url:"${pageContext.request.contextPath}/ajax/getmsg.jsp", //요청경로
			data:"num=1&name=kimgura", //요청 파라미터
			success:function(responseData){ //getmsg.jsp 페이지에서 응답했을 때 그 결과를 다양한 문자열 형식(plain text, html, json, xml 등이 있음)중에 한 타입을 인자값으로 받아둔다.
				console.log(responseData);
			}
		});
	});
	
	$("#getBtn2").on("click", function(){
		$.ajax({
			method:"get", //소문자로 작성해도 된다.
			url:"getmsg.jsp", //상대 경로도 가능하다
			data:{num:2, name:"해골"}, //요청 파라미터를 object 로 전달해도 된다.
			success:function(data){ //함수에 전달 받는 변수명은 마음대로 작성 가능하.
				//data 는 json 형식을 가지고 있는 html style의 string type 이다.
				console.log(data);
				//javascript 에서 사용하려면 object 로 바꿔서 사용해야한다.
				var obj = JSON.parse(data); //문자열을 객체로 바꿔야할 때 사용한다.
				console.log(obj);
				//object 로 바꿨기 때문에 쉽게 사용(접근)할 수 있다.
				alert(obj.msg)
			}
		});
	});
	
	$("#getBtn3").on("click", function(){
		$.ajax({
			method:"get",
			url:"getgreet.jsp", //요청 파라미터가 없으면 전달 안해도 된다.
			success:function(data){
				/*
					getgreet.jsp 페이지에서 contentType 을 application/json
					이라고 정확히 명시 했기 때문에 jquery 가 응답된 문자열을
					object 로 바꿔서 전달을 해준다.
				*/
				console.log(data); //json으로 응답할 것이라 응답페이지에 명시 되있기 때문에 전달 받은 data 인자값은 object 타입이다.
				alert(data.greet)
			}
		});
	});
</script>
</body>
</html>