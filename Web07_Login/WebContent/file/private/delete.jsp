<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 삭제할 파일의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당파일의 정보를 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);
	//로그인된 아이디와 글 작성자가 같을 때만 삭제 되도록 한다.
	String id = (String)session.getAttribute("id");
	
	//만일 글 작성자가 로그인된 아이디와 같지 않으면
	if(!dto.getWriter().equals(id)){
		//.sendError(에러코드, 에러메세지);
		response.sendError(HttpServletResponse.SC_FORBIDDEN,
				"남의 파일 지우지 말그라~");
		return; //메소드 끝내기
	}
	//3. 파일 시스템에서 해당 파일을 삭제한다.
	//삭제할 파일의 원본 파일명과 DB에 저장된 파일명을 변수에 저장한다.
	String orgFileName=dto.getOrgFileName(); //원본 파일명
	String saveFileName=dto.getSaveFileName(); //저장된 파일명
	
	//삭제할 파일의 실제 경로 알아내기
	String path=application.getRealPath("/upload")
			+File.separator+saveFileName;
	//파일 객체 생성 후 파일 삭제
	File file = new File(path);
	if(file.exists()){
		if(file.delete()){
			System.out.println("삭제 성공!");
		}else{
			System.out.println("삭제 실패..");
		}
	}else{ 
		System.out.println("파일이 존재하지 않습니다.");
	}
	//4. DB 에서 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//5. 응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>

</body>
</html>