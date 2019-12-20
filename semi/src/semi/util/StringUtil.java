package semi.util;

import java.util.Random;

public class StringUtil {

//	public static String generateRandomString(int size) {
//		String base = 
//				"0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!@#$";
//		Random r = new Random();
//		String result="";
//		for(int i=0; i<size; i++) {
//			int index = r.nextInt(base.length());
//			char c = base.charAt(index);
//			result += c;
//		}
//	return result;
//	}
	
	public static String generateRandomString(int size) throws Exception{
		StringBuffer key = new StringBuffer();
		
		Random r = new Random();
		for(int i=0; i<size; i++) {
			int index = r.nextInt(3);
			
		switch(index){
			case 0:
				key.append((char)((int)r.nextInt(26)+97));
				break;
			case 1:
				key.append((char)((int)r.nextInt(26)+65));
				
			case 2:
				key.append((r.nextInt(10)));
				break;
		}
		}
		return key.toString();
		
	}
	
}
