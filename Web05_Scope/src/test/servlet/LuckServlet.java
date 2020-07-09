package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class LuckServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행한다.
		String fortuneToday = "동쪽으로 가면 귀인을 만나요";
		
		//비즈니스 로직의 수행결과 data 를 HttpServletRequest 객체에 담는다.
		//"request 영역(scope)에 담는다" 라고도 한다.
		
		// "fortuneToday" 라는 키값으로 String type 의 참조값 담기
		req.setAttribute("fortuneToday", fortuneToday);
		
		//jsp 페이지로 응답을 위임한다. (forward 이동) -> jsp 페이지로 응답을 위임하는 이유는 서블릿 클래스는 html 문서 처리하기가 까다롭기 때문에(삽질..) html 처리 전문가인 jsp 페이지로 응답 처리를 위임.
		//클라이언트의 최초 요청을 서블릿이 받아서 비지니스 로직 처리를 한 후 그 결과값을 jsp 페이지로 모두 넘기면서 응답은 html 출력 전문가인 jsp가 하도록 응답을 위임.(서블릿(로직처리), jsp(출력) - 분업화)
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp); //fortune.jsp 페이지로 응답할 수 있는 도구(req 객체, resp 객체)를 전달.
	}
}
