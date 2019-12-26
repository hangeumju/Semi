package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Users_Regist_Dto {
	private int user_no, user_point;
	private String user_id, user_pw, user_name, user_phone, user_email_id,
	user_email_domain, user_interest, user_birth, user_join_date, user_last_login;
	
	@Override
	public String toString() {
		return "Users_Regist_Dto [user_no=" + user_no + ", user_point=" + user_point + ", user_id=" + user_id
				+ ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone=" + user_phone
				+ ", user_email_id=" + user_email_id + ", user_email_domain=" + user_email_domain + ", user_interest="
				+ user_interest + ", user_birth=" + user_birth + ", user_join_date=" + user_join_date
				+ ", user_last_login=" + user_last_login + "]";
	}
	
	
	//시간 변환을 수행하여 출력하는 메소드
public String getJoindateWithFormat() throws ParseException {
	if(user_join_date==null) {
		return"";
	}
	else {
		
	// [1]내가 가진 가입일을 날짜 형식(java.util.Date)으로 변환 - .Parse()
	// [2] 1번 결과를 다시 원하는 형식의 문자열로 변환 	- .format()
	SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	Date date = read.parse(user_join_date);   
	SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
	String time = write.format(date);
	
	return time;
}
}

public String getLast_loginWithFormat() throws ParseException {
	if(user_last_login == null) {
		return"";
	}
	else {
		
	
	//[1]내가 가진 가입일을 날짜형식 (java.util.Date로 변환 -parse 
	SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	Date date =  read.parse(user_last_login);
	//[2] 1번결과를 다시 원하는 형식의 문자열로 반환 - .format()
	SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 E요일 H시 m분");
	String time = write.format(date);
	return time;
	
			
	}
			
}
	public Users_Regist_Dto() {
		super();
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email_id() {
		return user_email_id;
	}
	public void setUser_email_id(String user_email_id) {
		this.user_email_id = user_email_id;
	}
	public String getUser_email_domain() {
		return user_email_domain;
	}
	public void setUser_email_domain(String user_email_domain) {
		this.user_email_domain = user_email_domain;
	}
	public String getUser_interest() {
		return user_interest;
	}
	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_join_date() {
		return user_join_date;
	}
	public void setUser_join_date(String user_join_date) {
		this.user_join_date = user_join_date;
	}
	public String getUser_last_login() {
		return user_last_login;
	}
	public void setUser_last_login(String user_last_login) {
		this.user_last_login = user_last_login;
	}
	
	

}
