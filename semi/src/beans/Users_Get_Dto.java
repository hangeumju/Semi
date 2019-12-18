package beans;

public class Users_Get_Dto {
	private int user_no, user_point;
	private String user_id, user_pw, user_name, user_phone, user_email_id,
	user_email_domain, user_interest, user_birth, user_join_date, user_last_login;
	
	@Override
	public String toString() {
		return "Users_Get_Dto [user_no=" + user_no + ", user_point=" + user_point + ", user_id=" + user_id
				+ ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone=" + user_phone
				+ ", user_email_id=" + user_email_id + ", user_email_domain=" + user_email_domain + ", user_interest="
				+ user_interest + ", user_birth=" + user_birth + ", user_join_date=" + user_join_date
				+ ", user_last_login=" + user_last_login + "]";
	}
	public Users_Get_Dto() {
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
	
//	표시용 메소드 : user_last_login이 null일 경우는 빈 문자열을 반환하도록 처리
	public String getUser_last_loginStr() {
		if(user_last_login == null)
			return "";
		else
			return user_last_login;
	}
	
	public void setUser_last_login(String user_last_login) {
		this.user_last_login = user_last_login;
	}
}
