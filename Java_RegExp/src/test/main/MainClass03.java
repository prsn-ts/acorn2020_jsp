package test.main;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainClass03 {
	public static void main(String[] args) {
		/*반복문을 돌면서 반복되는 문자열을 다 찾아야할 때 Pattern 객체와 Matcher 객체를 이용.*/
		
		Scanner scan = new Scanner(System.in);
		System.out.println("특수 문자를 제외한 5~10글자를 입력하세요:");
		String str = scan.nextLine();
		String reg = "^[a-zA-Z0-9]{5,10}$"; //특수문자가 아닌 최소 5글자~최대10글자까지 검증
		String reg2 = "[\\w]{5,10}$"; //특수문자가 아닌 최소 5글자~최대10글자까지 검증
		
		boolean result = str.matches(reg);
		boolean result2 = str.matches(reg2);
		
		//정규 표현식을 compile 한 Pattern 객체 얻어내기
		Pattern p = Pattern.compile(reg); //Pattern 클래스의 static 메소드인 compile를 호출.
		//Pattern 객체에 검증할 문자열을 전달해서 Matchar 객체 얻어내기
		Matcher m = p.matcher(str);
		//찾아지는 문자열이 있는지 boolean type 으로 얻어내기
		boolean result3 = m.find();
		System.out.println(result+"|"+result2+"|"+result3);
		
	}
}
