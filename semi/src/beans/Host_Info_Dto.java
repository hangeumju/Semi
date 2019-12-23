package beans;

//host(판매자) 가입 및 로그인 관련  변수가 있는 dto 입니다
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Host_Info_Dto {
	private int host_no;
	private String host_id;
	private String host_pw;
	private String host_name;
	private String host_phone;
	private String host_email_id;
	private String host_email_domain;
	private String host_interest;
	private String host_post;
	private String host_basic_addr;
	private String host_extra_addr;
	private String host_bank_name;
	private String host_bank_account;
	private String host_joindate;
	private String host_lastlogin;
	private String host_totalmail;
	private String host_address;
	private String host_bankaccount;
	
	public Host_Info_Dto() {
		super();
	}
	
	public int getHost_no() {
		return host_no;
	}

	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getHost_pw() {
		return host_pw;
	}

	public void setHost_pw(String host_pw) {
		this.host_pw = host_pw;
	}

	public String getHost_name() {
		return host_name;
	}

	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}

	public String getHost_phone() {
		return host_phone;
	}

	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}

	public String getHost_email_id() {
		return host_email_id;
	}

	public void setHost_email_id(String host_email_id) {
		this.host_email_id = host_email_id;
	}

	public String getHost_email_domain() {
		return host_email_domain;
	}

	public void setHost_email_domain(String host_email_domain) {
		this.host_email_domain = host_email_domain;
	}

	public String getHost_post() {
		return host_post;
	}

	public void setHost_post(String host_post) {
		this.host_post = host_post;
	}

	public String getHost_basic_addr() {
		return host_basic_addr;
	}

	public void setHost_basic_addr(String host_basic_addr) {
		this.host_basic_addr = host_basic_addr;
	}

	public String getHost_extra_addr() {
		return host_extra_addr;
	}

	public void setHost_extra_addr(String host_extra_addr) {
		this.host_extra_addr = host_extra_addr;
	}

	public String getHost_bank_name() {
		return host_bank_name;
	}

	public void setHost_bank_name(String host_bank_name) {
		this.host_bank_name = host_bank_name;
	}

	public String getHost_bank_account() {
		return host_bank_account;
	}

	public void setHost_bank_account(String host_bank_account) {
		this.host_bank_account = host_bank_account;
	}

	public String getHost_joindate() {
		return host_joindate;
	}

	public void setHost_joindate(String host_joindate) {
		this.host_joindate = host_joindate;
	}

	public String getHost_lastlogin() {
		return host_lastlogin;
	}

	public void setHost_lastlogin(String host_lastlogin) {
		this.host_lastlogin = host_lastlogin;
	}

	public void setHost_totalmail(String host_totalmail) {
		this.host_totalmail = host_totalmail;
	}

	public void setHost_address(String host_address) {
		this.host_address = host_address;
	}

	public void setHost_bankaccount(String host_bankaccount) {
		this.host_bankaccount = host_bankaccount;
	}

		//호스트 메일 병합
		public String getHost_totalmail() {
			if(host_email_id != null && host_email_domain != null){
			return getHost_email_id()+""+getHost_email_domain();
			}
			else {
				return"";
			}
			
		}
	
	//호스트 주소 병합
	public String getHost_address() {
		if(host_post != null && host_basic_addr  != null && host_extra_addr != null){
		return"["+getHost_post()+"]"+""+getHost_basic_addr()+""+getHost_extra_addr();
		}
		else {
			return"";
		}
		
	}
		//호스트 은행계좌 병합
		public String getHost_bankaccount() {
			if(host_bank_name != null && host_bank_account != null){
			return"["+getHost_bank_name()+"]"+""+getHost_bank_account();
			}
			else {
				return"";
			}
	}
		
		//가입일 시간 변경
		public String getHost_joindatewithFormat() throws ParseException{
			//[1]내가 가진 가입일을 날짜 형식으로 변환 (java.util.date)			
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(host_joindate);
			//[2]변환한 형식을 다시 원하는 형식의 문자열로 변환
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
			String time = write.format(date);
			
			return time;
		}
		
		//최종 로그인 시간 변경
		public String getHost_lastloginwithFormat() throws ParseException{
			if(host_lastlogin == null) {
				return "";
			}
			else {
				//최종 로그인 날짜를 형식으로 변환
				SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
				Date date = read.parse(host_lastlogin);
				//변환한 형식을 다시 원하는 형식의 문자열로 변환
				SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 E요일 HH시 mm분 ss초");
				String time = write.format(date);
				return time;
			}
		}
}



