package test.main;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainClass04 {
	public static void main(String[] args) {
		String str = "abcd    1234    abcd    5678   abcd";
		//String reg = "abc";
		//String reg = "[0-9]+";
		//String reg = "[\\d]+";
		String reg="[^ ]+";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(str);
		//결과값을 담을 가변 배열
		List<String> list = new ArrayList<>();
		//Matcher 객체의 find() 메소드를 호출하면서 반복문을 수행해서 
		while(m.find()) {
			//찾았으면 찾은 문자열을 출력한다.
			System.out.println(m.group());
			//결과값 누적 시키기
			list.add(m.group());
		}
	}
}
