<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.spacer{
		height: 500px;
		background-color:#999;
		border: 1px solid green;
	}
	.container{
		width:768px;
		margin:0 auto;
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데 정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
	}
</style>
</head>
<body>
<div class="container">
	<h1>스크롤 테스트</h1>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<div class="spacer"></div>
</div>
<div class="loader">
	<img src="${pageContext.request.contextPath}/images/ajax-loader.gif" alt="" />
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	//웹브라우저에 scroll 이벤트가 일어 났을 때 실행할 함수 등록
	$(window).on("scroll", function(){
		console.log("scroll!");
		//위쪽으로 스크롤된 길이 구하기
		var scrollTop = $(window).scrollTop();
		//window 의 높이
		var windowHeight = $(window).height();
		//document(문서)의 높이
		var documentHeight = $(document).height();
		//바닥까지 스크롤 되었는지 여부
		 //바닥으로 스크롤을 다 내렸는지 인식을 못하는 경우가 있어서 +10의 여유를 줘서 documentHeight보다 값이 크게해 인식되도록 처리.
		var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		if(isBottom){//만일 바닥까지 스크롤 했다면...
			//로딩중 이미지를 띄워서 서버에서 데이터를 가져오는 중이라고 보여주고
			$(".loader").show();
			setTimeout(function(){ //3초 후에 함수안에 내용을 실행하게함(ajax 요청 후 서버에서 응답오는 시간이 걸리는 경우를 생각하면서 가상으로 적용한 함수(일단 가상으로 3초로 설정))
				//원하는 작업을 한다.(3초 후(서버가 응답하는 데 걸리는 시간을 가상으로 설정)에 "<div class="spacer"></div>" 이 구문을 생성)
				$("<div/>")
				.addClass("spacer")
				.appendTo(".container")
				.hide() //안보였다가
				.fadeIn(); //서서히 나타나도록 하는 효과.
				//로딩된 이미지가 나오면 로딩 이미지는 안보이게 처리.
				$(".loader").hide();
			}, 3000);
		}
	});
</script>
</body>
</html>