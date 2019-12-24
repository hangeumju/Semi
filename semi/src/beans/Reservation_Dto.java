package beans;

public class Reservation_Dto {
	private int history_no;
	private String user_name;
	private String user_phone;
	private int user_qty;
	private String user_reservation_date;
	private String users_history_id;
	private String host_content_name;
	
	public Reservation_Dto() {
		super();
	}

	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
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
	public int getUser_qty() {
		return user_qty;
	}
	public void setUser_qty(int user_qty) {
		this.user_qty = user_qty;
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

	public String getHost_content_name() {
		return host_content_name;
	}

	public void setHost_content_name(String host_content_name) {
		this.host_content_name = host_content_name;
	}
	
	
	
}


