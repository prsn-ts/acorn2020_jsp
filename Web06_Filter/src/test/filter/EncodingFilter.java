package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/*
 *  [요청을 가로채서 중간에 원하는 작업을 할 수 있는 필터 만들기]
 *  
 *  1. javax.servlet.Filter 인터페이스를 구현한다.
 *  2. web.xml 문서에 필터를 정의하고 맵핑한다.
 *  3. doFilter() 메소드 안에서 원하는 작업을 한다.
 */

public class EncodingFilter implements Filter {
	//인코딩 정보를 저장할 필드 선언
	private String encoding; //web.xml에 정보를 읽어와서 유동적으로 값을 설정할 변수 선언.

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	//필터가 동작해야할 때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 요청 인코딩이 설정되지 않았다면(효율적인 구문 처리를 위한 방안)
		if(request.getCharacterEncoding()==null) {
			//인코딩 설정하기
			request.setCharacterEncoding("utf-8");
		}
		//요청의 흐름 계속 이어가기(filter class가 클라이언트의 요청의 흐름을 가로채가서 처리를 하기 때문에 작업이 끝나면 그 다음 실행할 곳(서버 측)으로 흐름을 이어가야한다 그래서 아래와 같은 코드를 작성한다.)
		chain.doFilter(request, response);
	}
	//필터가 최초 사용될 때 1번 호출되는 메소드
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//web.xml 문서에 있는 내용을 읽어서 필드에 저장한다.
		encoding = filterConfig.getInitParameter("encoding");
	}

}
