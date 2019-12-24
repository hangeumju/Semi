package beans;

public class Users_Review_Dto {
	private int review_no;
	private String review_writer;
	private int content_original_no;
	private String review_content;
	private String review_date;
	@Override
	public String toString() {
		return "Users_Review_Dto [review_no=" + review_no + ", review_writer=" + review_writer
				+ ", content_original_no=" + content_original_no + ", review_content=" + review_content
				+ ", review_date=" + review_date + "]";
	}
	public Users_Review_Dto() {
		super();
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public int getContent_original_no() {
		return content_original_no;
	}
	public void setContent_original_no(int content_original_no) {
		this.content_original_no = content_original_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	

}
