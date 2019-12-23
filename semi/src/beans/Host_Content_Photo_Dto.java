package beans;

//- 컨텐츠 생성에 사진을(3개 Fix) 업로드하기 위한 필드(변수)를 모아 놓은 Dto 입니다
public class Host_Content_Photo_Dto {
	private int host_content_photo_no;
	private int host_content_no;
	private String host_content_original_file;
	private String host_content_edit_file;
	
	public Host_Content_Photo_Dto() {
		super();
	}

	public int getHost_content_photo_no() {
		return host_content_photo_no;
	}

	public void setHost_content_photo_no(int host_content_photo_no) {
		this.host_content_photo_no = host_content_photo_no;
	}

	public int getHost_content_no() {
		return host_content_no;
	}

	public void setHost_content_no(int host_content_no) {
		this.host_content_no = host_content_no;
	}

	public String getHost_content_original_file() {
		return host_content_original_file;
	}

	public void setHost_content_original_file(String host_content_original_file) {
		this.host_content_original_file = host_content_original_file;
	}

	public String getHost_content_edit_file() {
		return host_content_edit_file;
	}

	public void setHost_content_edit_file(String host_content_edit_file) {
		this.host_content_edit_file = host_content_edit_file;
	}
	
	
	
}
