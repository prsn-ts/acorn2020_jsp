package test.main;

public class MainClass02 {
	public static void main(String[] args) {
		String str = "i_am_gura";
		// .split(분리 시킬 정규 표현식 pattern);
		String[] result = str.split("_"); //하나의 문자열을 _(언더바)로 구분해서 분리한 것을 String 배열에 순서대로 저장.
		for(String tmp:result) {
			System.out.println(tmp);
		}
	}
}
