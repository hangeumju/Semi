package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Content_History_Dto {
	private int history_no;
	private int host_history_no;
	private int users_history_no;
	private String users_history_id;
	private int user_qty;
	private String user_reservation_date;
	private String user_class_date;
	
	public Content_History_Dto() {
		super();
	}
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public int getHost_history_no() {
		return host_history_no;
	}
	public void setHost_history_no(int host_history_no) {
		this.host_history_no = host_history_no;
	}
	public int getUsers_history_no() {
		return users_history_no;
	}
	public void setUsers_history_no(int users_history_no) {
		this.users_history_no = users_history_no;
	}
	public String getUsers_history_id() {
		return users_history_id;
	}
	public void setUsers_history_id(String users_history_id) {
		this.users_history_id = users_history_id;
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
	public String getUser_class_date() {
		return user_class_date;
	}
	public void setUser_class_date(String user_class_date) {
		this.user_class_date = user_class_date;
	}

}
