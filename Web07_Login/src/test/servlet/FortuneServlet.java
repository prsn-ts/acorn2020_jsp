package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//1. 오늘의 운세를 얻어오는 비즈니스 로직 수행(DB 에서 얻어왔다고 가정하자)
		String fortuneToday = "동쪽으로 가면 귀인을 만나요";
		//2. 비즈니스 로직의 수행 결과를 request 영역에 담기
		req.setAttribute("fortuneToday", fortuneToday); //request 영역에 담은 것은 forward 이동을 해도 사라지지않는다.(응답한 것이 아니기 때문임, 응답하는 것은 fortune.jsp로 위임한다)
		//3. view 페이지(jsp 페이지) 로 forward(응답을 위임하는 것을 말함) 이동해서 응답하기
		RequestDispatcher rd =
				req.getRequestDispatcher("/WEB-INF/views/fortune.jsp");
		rd.forward(req, resp);
	}
}
