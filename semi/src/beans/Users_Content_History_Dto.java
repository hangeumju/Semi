package beans;

public class Users_Content_History_Dto {
	private int user_qty,	host_content_cost;
	private String user_reservation_date, users_history_id, host_content_name, 
						host_content_location, host_phone, host_name;
	@Override
	public String toString() {
		return "Users_Content_History_Dto [user_qty=" + user_qty + ", host_content_cost=" + host_content_cost
				+ ", user_reservation_date=" + user_reservation_date + ", users_history_id=" + users_history_id
				+ ", host_content_name=" + host_content_name + ", host_content_location=" + host_content_location
				+ ", host_phone=" + host_phone + ", host_name=" + host_name + "]";
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
	
}