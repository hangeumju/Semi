package beans;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

public class Notice_Board_Dto {
	private int notice_no;
	private String notice_writer, notice_title, notice_content, notice_date;
//	줄번호(rownum)를 저장하기 위한 변수 추가
	private int rn;
	
	
	@Override
	public String toString() {
		return "Notice_Board_Dto [notice_no=" + notice_no + ", notice_writer=" + notice_writer + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", rn=" + rn
				+ "]";
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
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	
	//공지사항 날짜 시간 변환을 수행하여 출력하는 메소드
		public String getNotice_date_WithFormat() throws ParseException {
			if(notice_date==null) {
				return"";
			}
			else {
				
			// [1]내가 가진 작성일을 날짜 형식(java.util.Date)으로 변환 - .Parse()
			// [2] 1번 결과를 다시 원하는 형식의 문자열로 변환 	- .format()
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(notice_date);   
			SimpleDateFormat write = new SimpleDateFormat("y-M-d HH:mm");
			String time = write.format(date);
			
			return time;
		}
	}
}
