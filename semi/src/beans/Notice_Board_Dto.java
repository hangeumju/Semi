package beans;

public class Notice_Board_Dto {
	private int notice_no;
	private String notice_writer, notice_title, notice_content, notice_date;
	@Override
	public String toString() {
		return "Notice_Board_Dto [notice_no=" + notice_no + ", notice_writer=" + notice_writer + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", notice_date=" + notice_date + "]";
	}
	public Notice_Board_Dto() {
		super();
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
}
