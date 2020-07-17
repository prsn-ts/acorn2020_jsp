<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/test.jsp</title>
</head>
<body>
<h1>이미지 파일 업로드 테스트</h1>
<form id="myForm" action="test_upload2.jsp" method="post" enctype="multipart/form-data">
	<input type="text" name="title" placeholder="설명 입력..." /><br />
	<%-- accept 속성의 값을 확장자로 지정해 명시된 확장자에 해당하는 파일만 파일시스템에서 볼 수 있고 선택할 수 있다 --%>
	<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" /><br />
	<button type="submit">업로드</button>
</form>
<div class="wrapper">

</div>
<!-- jquery 로딩 -->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<!-- jquery 플러그인 로딩(이 플러그인이 있어야 폼을 페이지 이동없이 ajax로 이미지를 띄울 수 있다. -->
<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<!-- custom javascript 코딩 -->
<script>
	// id 가 myForm 인 form 에 submit 이벤트가 일어나면 페이지 전환 없이 제출하기(ajax)
	$("#myForm").ajaxForm(function(data){
		//data 매개변수의 인자값으로는 {imageSrc:"xxx.jsp"} 형식의 object가 넘어온다.
		console.log(data);
		<%-- 
			jquery를 이용해 동적으로 img 태그를 만든다
			세부사항 설명 :
			attr()는 속성을 만드는 함수.
			appendTo() 특정공간에 추가하는 함수.
		 --%>
		$("<img/>").attr("src","${pageContext.request.contextPath}"+data.imageSrc)
		.appendTo("#wrapper")
	});
</script>
</body>
</html>