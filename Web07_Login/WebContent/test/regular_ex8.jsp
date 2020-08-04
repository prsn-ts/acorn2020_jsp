<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/regular_ex8.jsp</title>
</head>
<body>
<script>
	//자바스크립트에서 쓰이는 정규표현식

	//아래의 두 정규 표현식은 같다
	var reg1 = /[0-9]/;
	var reg12 = /[\d]/; //숫자를 의미하는 "\d" 표현 d는 decimal의 약자
	
	//아래의 두 정규 표현식은 같다
	var reg2 = /[^0-9]/;
	var reg22 = /[\D]/; // \d 와 \D는 반대 개념, "\D"는 숫자가 아님을 의미.
	
	//아래의 두 정규 표현식은 같다
	var reg3 = /[a-zA-Z0-9]/; //특수문자가 아닌 한 글자를 의미
	var reg32 = /[\w]/; //특수문자가 아닌 한 글자를 의미
	
	//아래의 두 정규 표현식은 같다
	var reg4 = /^a-zA-Z0-9/; //특수문자인 한 글자를 의미
	var reg42 = /[\W]/; //특수문자인 한 글자를 의미
	
	//공백(띄어쓰기, tab, 개행기호)를 찾는 정규 표현식
	var reg5 = /[\s]/;
	//공백(띄어쓰기, tab, 개행기호)이 아닌 문자를 찾는 정규 표현식
	var reg6 = /[\S]/;
	
	// 자바스크립트에서 쓰이는 정규표현식
	var reg7 = /^[a-z].{4,9}$/;
	//new 를 이용한 정규 표현식 객체 생성
	var reg72 = new RegExp("^[a-z].{4,9}$"); //생성자 함수 혹은 RegExp 클래스의 객체를 생성하여 정규표현식 사용.
	
	// abc 문자를 global 로 찾는 정규 표현식 객체
	var reg8 = /abc/g;
	var reg82 = new RegExp("abc", "g"); //서버사이드 측면에서 정규표현식을 사용하기위해 자바 코드에서 사용하는 방법도 알면 좋다.
	
	var reg9 = /^[\w]+$/; //특수문자가 아닌 하나 이상의 글자를 찾는 정규표현식
	//위와 다른 점은 문자열 안("")에 쓰기 때문에 자바스크립트 형식처럼 결과가 나오게하려면(문자열안에서 표시하기만을 위한 "\"가 특별한 의미를 가지지 말아달라는 뜻으로) 역슬래시가 두번(\\) 들어가야한다.
	var reg92 = new RegExp("^[\\w]+$"); //특수문자가 아닌 하나 이상의 글자를 찾는 정규표현식
</script>
</body>
</html>