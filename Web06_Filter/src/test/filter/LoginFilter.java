package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//web.xml 에 필터 정의와 필터 맵핑을 어노테이션을 이용해서 할 수 있다.(초간단!)
@WebFilter("/member/*")
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//클라이언트가 로그인 했는지 여부를 확인한다.
		//session(로그인 했는지 여부를 알 수 있는 객체) 정보를 조회하기 위해서 session 정보를 얻을 수 있는 메소드를 가진 자식타입의 HttpServletRequest로 캐스팅한다.
		HttpServletRequest req = (HttpServletRequest)request;
		//HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		//로그인된 아이디가 있는지 얻어와본다.
		String id = (String)session.getAttribute("id");
		if(id != null) {//로그인된 상태
			//요청의 흐름 계속 진행 시키기
			chain.doFilter(request, response);
		}else {//로그인이 안된 상태
			//로그인 폼으로 강제 리다일렉트 응답을 준다.
			//ServletResponse 타입을 응답할 수 있는 객체인 자식타입의 HttpServletResponse로 캐스팅을 한다.
			HttpServletResponse res = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			res.sendRedirect(cPath+"/test/loginform.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
