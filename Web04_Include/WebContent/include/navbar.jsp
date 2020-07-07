<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp --%>
<%
	//요청 파라미터 읽어내기
	String thisPage = request.getParameter("thisPage");
	String save_par = thisPage;
%>
<%if(save_par.equals("game")){%>
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.jsp">index page</a>
		<ul class="navbar-nav">
			<li id="game" class="nav-item active"><a class="nav-link" href="../test5/game.jsp">game</a></li>
			<li id="home" class="nav-item"><a class="nav-link" href="../test5/home.jsp">home</a></li>
		</ul>
	</div>
<%}else if(save_par.equals("home")){ %>
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.jsp">index page</a>
		<ul class="navbar-nav">
			<li id="game" class="nav-item"><a class="nav-link" href="../test5/game.jsp">game</a></li>
			<li id="home" class="nav-item active"><a class="nav-link" href="../test5/home.jsp">home</a></li>
		</ul>
	</div>
<%} %>
<div>
	navbar 입니다. <strong><%=thisPage %></strong>에 포함되었음.
</div>
