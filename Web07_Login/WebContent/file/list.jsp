<%@page import="java.net.URLEncoder"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<%
	//로그인 된 아이디 읽어오기(로그인을 하지 않으면 null 이다)
	String id=(String)session.getAttribute("id"); //변수 id는 로그인한 아이디 이름 or null 이다.
	
	/* 페이징 처리에 관련된 구문 */
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5; //프로젝트 상황에 맞게끔 변경가능
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5; //프로젝트 상황에 맞게끔 변경가능
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	/*
		검색 키워드에 관련된 처리
	*/
	String keyword = request.getParameter("keyword");
	String condition = request.getParameter("condition");
	if(keyword == null){//전달된 키워드가 없다면
		//condition, keyword의 파라미터값이 null이 찍히지 않도록 하기 위함.(파라미터로 넘어오는 값이 null로 찍힐 경우 문제가 생길 수도 있다고 함.)
		keyword = ""; //빈 문자열을 넣어준다.
		condition = ""; //빈 문자열을 넣어준다.
	}
	
	//keyword 변수의 내용을 파라미터로 전송할 때 인코딩된 키워드로 보내기 위함.
	//인코딩안된 내용을 파라미터로 보내면 문제가 발생할 수도 있다.
	//인코딩된 키워드를 미리 만들어 둔다.
	String encodedK = URLEncoder.encode(keyword);
	
	//keyword와 condition 변수에 null값이 들어오는지 확인용.
	//request.getParameter("keyword"), request.getParameter("keyword")의 값이 없는 경우 null값이 들어간다.
	System.out.println(keyword);
	System.out.println(condition);
	
	//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//select 된 결과를 담을 List
	List<FileDto> list = null; //어차피 FileDao  안에서 선언이되서 리턴되기 때문에 처음엔 null값을 넣는다.
	//전체 row 의 개수를 담을 변수
	int totalRow = 0;
	if(!keyword.equals("")){ //만일 키워드가 넘어온다면
		if(condition.equals("title_filename")){
			//검색 키워드를 FileDto 객체의 필드에 담는다.
			dto.setTitle(keyword);
			dto.setOrgFileName(keyword);
			//검색 키워드에 맞는 파일 목록중에서 pageNum(보여줄 페이지)에 해당하는 목록 얻어온다.
			list=FileDao.getInstance().getListTF(dto);
			//검색 키워드에 맞는 전체 글의 개수를 얻어온다.
			totalRow=FileDao.getInstance().getCountTF(dto);
		}else if(condition.equals("title")){
			dto.setTitle(keyword);
			list=FileDao.getInstance().getListT(dto);
			totalRow=FileDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){
			dto.setWriter(keyword);
			list=FileDao.getInstance().getListW(dto);
			totalRow=FileDao.getInstance().getCountW(dto);
		}
	}else{ //검색 키워드로 list.jsp를 들어온 것이 아닌 다른 링크로 들어왔을 때 전체 목록을 얻어오기.
		list=FileDao.getInstance().getList(dto);
		totalRow=FileDao.getInstance().getCount();
	}
	
	//하단에 표시할 전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT); //double 연산으로 소수점이 나오는데 이것을 올림 연산(Math.ceil)을 해서 전체 행의 개수에 맞는 하단에 표시할 전체 페이지의 개수를 구하기 위함.
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면(실제 하단 페이지 개수(totalPageCount)보다 끝 페이지 번호 계산된 값(endPageNum)이 많다면)
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다.(실제 하단 페이지 개수로 화면에 출력될 수 있도록 endPageNum의 값을 totalPageCount로 넣어준다.)
	}
%>
<div class="container">
	<a href="private/upload_form.jsp">파일 업로드</a>
	<h1>파일 목록입니다.</h1>
	<table class="table table-striped table-sm">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(FileDto tmp: list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<%-- 
					download.jsp에서 클라이언트가 다운로드를 할 수 있는 기능을 처리한다
					download.jsp로 연결되는 링크를 선택했을 때 선택한 특정 게시물를 다운로드하기위해
					?num=<%=tmp.getNum() %> 이 부분을 넣어줘야한다.
				--%>
				<td><a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a></td>
				<td><%=tmp.getSaveFileName() %></td>
				<td><%=tmp.getFileSize() %></td>
				<td><%=tmp.getRegdate() %></td>
				<%-- 파일을 삭제하기 위한 삭제 링크 설정
					1.delete.jsp에서 클라이언트가 삭제를 할 수 있는 기능을 처리한다
					delete.jsp로 연결되는 링크를 선택했을 때 선택한 특정 게시물를 삭제하기위해
					?num=<%=tmp.getNum() %> 이 부분을 넣어줘야한다.
					2.또한 본인이 올린 게시물만 삭제할 수 있도록 삭제 링크를 본인의 게시물에서만 표시하기위해서
					조건부 처리(if문)를 한다.
				 --%>
				<td>
					<%if(tmp.getWriter().equals(id)){ //글 작성자와 세션(로그인된 id)가 같을 때만 삭제 링크 출력%>
						<a href="private/delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
					<%} %>
				</td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<%if(startPageNum != 1){ //시작 페이지 숫자가 1이 아닐경우(시작 페이지 숫자가 1일 때는 이전 페이지로 이동할 필요가 없다)%>
			<%-- 
				&condition=<%=condition%>&keyword=<%=encodedK%> 부분이 들어가는 이유는
				검색 키워드로 검색된 list.jsp 페이지에서 다음 컨텐츠를 보기위해 넘길 시에 검색한 내용과 관련있는
				내용이 계속 나와야하는데 그럴러면 condition과 keyword의 내용을 pageNum에 해당하는 페이지에 넘겨야한다.
			--%>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition%>&keyword=<%=encodedK%>">Prev</a></li>
		<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i==pageNum){ //현재 페이지랑 페이지 넘버랑 같을 때 li요소 active 효과 추가하기%>
					<li class="page-item active"><a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a></li>
				<%}else{ %>
					<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a></li>
				<%} %>
			<%} %>
		<%if(endPageNum < totalPageCount){ //전체 페이지 숫자 보다 끝 페이지 숫자가 작은 경우(다음으로 넘어갈 페이지가 존재한다는 의미)%>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>&condition=<%=condition%>&keyword=<%=encodedK%>">Next</a></li>
		<%} %>
		</ul>
	</div>
	<hr style="clear:left;"/>
	<form action="list.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_filename" <%if(condition.equals("title_filename")){ %>selected<%} %>>제목+파일명</option>
			<option value="title" <%if(condition.equals("title")){ %>selected<%} %>>제목</option>
			<option value="writer" <%if(condition.equals("writer")){ %>selected<%} %>>작성자</option>
		</select>
		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어..." />
		<button type="submit">검색</button>
	</form>
</div>
</body>
</html>