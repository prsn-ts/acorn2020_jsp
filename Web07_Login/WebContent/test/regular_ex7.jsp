<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/regular_ex7.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	.error-feedback{
		color:red;
		font-size: 10px;
		display: none;
	}
</style>
</head>
<body>
<%-- 
	아이디, 휴대폰 번호의 유효성 검증도 필요하지만 form 전체의 유효성 검증을 하고 그 결과를 도출해내는 과정도 필요하다.
	부트스트랩을 이용해서 유효성 검사 후 ui 처리
 --%>
<div class="container">
 	<h1>가입 폼 입니다.</h1>
 	<form action="insert.jsp" method="post" id="myForm">
 		<div class="form-group">
 			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id" placeholder="아이디 입력..."/>
			<div class="valid-feedback">id good!</div>
			<div class="invalid-feedback">영문자 소문자로 시작을 하고 최소 5글자에서 최대 10글자 이내로 작성하세요</div>
 		</div>
		<div class="form-group">
			<label for="phone">휴대폰 번호</label>
			<input class="form-control" type="text" id="phone" name="phone" placeholder="010-1111-2222" />
			<div class="valid-feedback">password good!</div>
			<div class="invalid-feedback">휴대폰 번호 형식에 맞게 입력 하세요.</div>
		</div>
		<button class="btn btn-primary" type="submit">가입</button>
	</form>
	<a href="regular_ex8.jsp">다음예제</a>
</div>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//아이디를 검증할수 있는 정규 표현식
	var reg_id=/^[a-z].{4,9}$/;
	//휴대폰 번호를 검증할 수 있는 정규 표현식
	var reg_phone=/^010-[0-9]{4}-[0-9]{4}$/;
	//id 유효성
	var isIdValid = false;
	//phone 유효성
	var isPhoneValid = false;
	//form 유효성
	var isFormValid = false;
	
	$("#id").on("input", function(){
		//입력한 아이디를 읽어와서 검증한다.
		inputId=$("#id").val();
		isIdValid=reg_id.test(inputId);
		
		//is-valid, is-invalid 클래스를 일단 제거 후
		$(this).removeClass("is-valid is-invalid");
		
		//아이디가 유효하면 에러 메세지를 숨긴다.
		if(isIdValid){//아이디가 유효하다면
			//is-valid 클래스를 추가한다.
			$(this).addClass("is-valid");
		}
		//아이디가 유효하지 않으면 에러 메세지를 보여준다.
		else{
			//is-invalid 클래스를 추가한다.
			$(this).addClass("is-invalid");
		}
	});
	
	$("#phone").on("input", function(){
		//입력한 전화 번호를 읽어와서 검증한다.
		inputPhone=$("#phone").val();
		isPhoneValid = reg_phone.test(inputPhone);
		
		//is-valid, is-invalid 클래스를 일단 제거 후
		$(this).removeClass("is-valid is-invalid");
		
		//휴대폰 번호가 유효하면 에러 메세지를 숨긴다.
		if(isPhoneValid){
			//is-valid 클래스를 추가한다.
			$(this).addClass("is-valid");
		}
		//휴대폰 번호가 유효하지 않으면 에러 메세지를 보여준다.
		else{
			//is-invalid 클래스를 추가한다.
			$(this).addClass("is-invalid");
		}
	});
	/*
	//jquery를 이용한 폼 제출 막기
	$("#myForm").on("submit", function(){
		//폼 전체의 유효성 여부
		isFormValid = isIdValid && isPhoneValid;
		if(!isFormValid){//폼이 유효하지 않으면
			return false;//폼 제출을 막아준다.
		};
	});
	*/
	//순수 javascript를 이용한 폼 제출 막기
	//jquery 를 사용하지 않는다면 아래 코드와 같다
	document.querySelector("#myForm")
	.addEventListener("submit", function(event){
		//폼 전체의 유효성 여부
		isFormValid = isIdValid && isPhoneValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//함수에 전달된 이벤트 객체의 preventDefault() 함수를 호출하면
			//폼 제출이 막아진다(기본 동작 막기)
			event.preventDefault();
		};
	})
</script>
</body>
</html>