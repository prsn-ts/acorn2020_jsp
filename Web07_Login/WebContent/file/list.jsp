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
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=FileDao.getInstance().getCount();
	//하단에 표시할 전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}
	//startRowNum 과 endRowNumdmf FileDto 객체에 담고
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다.
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
%>
<div class="container">
	<h1>파일 목록입니다.</h1>
	<table>
		<thead>
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
	<a href="private/upload_form.jsp">파일 업로드</a>
</div>
</body>
</html>