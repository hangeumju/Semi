package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Users_Review_Dao {
	
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
	//유저 정보를 가져오는 기능(단일조회)
	//메소드 이름 : users_review_get
	//매개변수 : String review_writer
	//반환형 : Users_Review_Dto
		public Users_Review_Dto users_review_get(String review_writer) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from user_review where review_writer =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, review_writer);
			ResultSet rs = ps.executeQuery(); 
			
			
			//URdto에 db에서 가져온 정보를 저장합니다
			Users_Review_Dto URdto;
			if(rs.next()) {
				URdto = new Users_Review_Dto();
				URdto.setReview_no(rs.getInt("review_no"));
				URdto.setReview_writer(rs.getString("review_writer"));
				URdto.setContent_original_no(rs.getInt("content_original_no"));
				URdto.setReview_title(rs.getString("review_title"));
				URdto.setReview_content(rs.getString("review_content"));
				URdto.setReview_date(rs.getString("review_date"));
				
			}
				else {
					URdto = null;
				}
			
				con.close();
				return URdto;
		}

}
