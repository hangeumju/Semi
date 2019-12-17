package beans;

public class Users_Login_Dto {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_email;
	private String user_email_domain;
	private int user_point;
	private String user_interest;
	private String user_birth;
	private String user_join_date;
	private String user_last_login;
	
	@Override
	public String toString() {
		return "Users_Login_Dto [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_email=" + user_email + ",  user_email_domain=" + user_email_domain + ", user_point=" + user_point
				+ ", user_interest=" + user_interest + ", user_birth=" + user_birth + ", user_join_date="
				+ user_join_date + ", user_last_login=" + user_last_login + "]";
	}
	

	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
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


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public String getUser_email_domain() {
		return user_email;
	}


	public void setUser_email_domain(String user_email_domain) {
		this.user_email_domain = user_email_domain;
	}


	public int getUser_point() {
		return user_point;
	}


	public void setUser_point(int user_point) {
		this.user_point = user_point;
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


	public Users_Login_Dto() {
		super();
	}


	public Users_Login_Dto(int user_no, String user_id, String user_pw, String user_name, String user_phone,
			String user_email, String user_email_domain, int user_point, String user_interest, String user_birth, String user_join_date,
			String user_last_login) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_email_domain = user_email_domain;
		this.user_point = user_point;
		this.user_interest = user_interest;
		this.user_birth = user_birth;
		this.user_join_date = user_join_date;
		this.user_last_login = user_last_login;
	}
	
	
	
	

}
