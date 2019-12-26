package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Users_Content_History_Dto {

	private int user_qty,	host_content_cost, groupno, superno, depth;
	private String user_reservation_date, users_history_id, user_phone, host_content_name, 
						host_content_location, host_phone, host_name, user_class_date;
	@Override
	public String toString() {
		return "Users_Content_History_Dto [user_qty=" + user_qty + ", host_content_cost=" + host_content_cost
				+ ", groupno=" + groupno + ", superno=" + superno + ", depth=" + depth + ", user_reservation_date="
				+ user_reservation_date + ", users_history_id=" + users_history_id + ", user_phone=" + user_phone
				+ ", host_content_name=" + host_content_name + ", host_content_location=" + host_content_location
				+ ", host_phone=" + host_phone + ", host_name=" + host_name + ", user_class_date=" + user_class_date
				+ "]";
	}
	public Users_Content_History_Dto() {
		super();
	}
	public int getUser_qty() {
		return user_qty;
	}
	public void setUser_qty(int user_qty) {
		this.user_qty = user_qty;
	}
	public int getHost_content_cost() {
		return host_content_cost;
	}
	public void setHost_content_cost(int host_content_cost) {
		this.host_content_cost = host_content_cost;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getSuperno() {
		return superno;
	}
	public void setSuperno(int superno) {
		this.superno = superno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getUser_reservation_date() {
		return user_reservation_date;
	}
	public void setUser_reservation_date(String user_reservation_date) {
		this.user_reservation_date = user_reservation_date;
	}
	public String getUsers_history_id() {
		return users_history_id;
	}
	public void setUsers_history_id(String users_history_id) {
		this.users_history_id = users_history_id;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getHost_content_name() {
		return host_content_name;
	}
	public void setHost_content_name(String host_content_name) {
		this.host_content_name = host_content_name;
	}
	public String getHost_content_location() {
		return host_content_location;
	}
	public void setHost_content_location(String host_content_location) {
		this.host_content_location = host_content_location;
	}
	public String getHost_phone() {
		return host_phone;
	}
	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getUser_class_date() {
		return user_class_date;
	}
	public void setUser_class_date(String user_class_date) {
		this.user_class_date = user_class_date;
	}
	
	// 유저 예약 날짜 시간 변환을 수행하여 출력하는 메소드
	public String getUser_reservation_date_WithFormat() throws ParseException {
		if(user_reservation_date==null) {
			return"";
		}
		else {
			
		// [1]내가 가진 가입일을 날짜 형식(java.util.Date)으로 변환 - .Parse()
		// [2] 1번 결과를 다시 원하는 형식의 문자열로 변환 	- .format()
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(user_reservation_date);   
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		
		return time;
	}
	}
	
	//클래스 이용 날짜 시간 변환을 수행하여 출력하는 메소드
	public String getUser_class_date_WithFormat() throws ParseException {
		if(user_class_date==null) {
			return"";
		}
		else {
			
		// [1]내가 가진 가입일을 날짜 형식(java.util.Date)으로 변환 - .Parse()
		// [2] 1번 결과를 다시 원하는 형식의 문자열로 변환 	- .format()
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(user_class_date);   
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		
		return time;
	}
	}
}


