package semi.util;

import java.util.Random;

public class StringUtil {

//	비밀번호 랜덤생성 구문
//	user & host 비밀번호 생성시 동시 사용!
	public static String generateRandomString(int size) {
		String base = 
				"0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!@#$";
		Random r = new Random();
		String result="";
		for(int i=0; i<size; i++) {
			int index = r.nextInt(base.length());
			char c = base.charAt(index);
			result += c;
		}
	return result;
	}
	
}
