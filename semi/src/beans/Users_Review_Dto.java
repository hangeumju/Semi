package beans;

public class Users_Review_Dto {
	private int review_no;
	private String review_writer;
	private int content_original_no;
	private String review_title;
	private String review_content;
	private String review_date;
	
	
	@Override
	public String toString() {
		return "Users_review_Dto [review_no=" + review_no + ", review_writer=" + review_writer
				+ ", content_original_no=" + content_original_no + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_date=" + review_date + "]";
	}
	
	
	public Users_Review_Dto() {
		super();
	}
	
	
	public Users_Review_Dto(int review_no, String review_writer, int content_original_no, String review_title,
			String review_content, String review_date) {
		super();
		this.review_no = review_no;
		this.review_writer = review_writer;
		this.content_original_no = content_original_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
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
