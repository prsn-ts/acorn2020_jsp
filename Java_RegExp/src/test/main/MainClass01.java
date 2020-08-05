package test.main;

public class MainClass01 {
	public static void main(String[] args) {
		
		/* 자바코드에서 사용되는 정규표현식 관련 match 함수 사용법. */
		
		//검증할 문자열
		String str = "abcd1234";
		//검증할 정규표현식 정보를 가지고 있는 문자열
		String reg = "abcd";
		//정규 표현식에 매칭되는지 여부 "^abcd$" 와 같이 완벽히 일치해야 true 가 나온다.
		boolean isMatch = str.matches(reg); //자바스크립트와는 다르게 자바에서는 시작(^)과 끝($)의 개념을 기본적으로 갖고있어 완벽히 일치해야 true 아니면 false가 나온다.(기준이 엄격함)
		System.out.println(isMatch);
	}
}
