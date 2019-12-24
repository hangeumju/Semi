package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Users_Review_Dao {
	
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
	//유저 리뷰를 가져오는 기능(단일조회)
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
				URdto.setReview_content(rs.getString("review_content"));
				URdto.setReview_date(rs.getString("review_date"));
				
			}
				else {
					URdto = null;
				}
			
				con.close();
				return URdto;
		}
		
		//유저 리뷰 목록보기 기능
		//메소드 이름 : users_review_list
		//매개변수 : String review_writer
		//반환형 : Users_Review_Dto
		public List<Users_Review_Dto> users_review_list(String review_writer) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from user_review where review_writer = ? order by review_no desc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, review_writer);
			ResultSet rs = ps.executeQuery();
			
			List<Users_Review_Dto> list = new ArrayList<>();

			
			while(rs.next()) { //데이터의 갯수만큼 반복합니다
				Users_Review_Dto URdto = new Users_Review_Dto();
				URdto.setReview_no(rs.getInt("review_no"));
				URdto.setReview_writer(rs.getString("review_writer"));
				URdto.setContent_original_no(rs.getInt("content_original_no"));
				URdto.setReview_content(rs.getString("review_content"));
				URdto.setReview_date(rs.getString("review_date"));
				list.add(URdto);
			}
			
			con.close();		
			return list;
		}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
//		회원 리뷰 작성 기능
//		메소드이름 : users_review_regist
//		매개변수 : Users_Review_Dto URdto
//		반환형 : 없음(void)
		public void users_review_regist(Users_Review_Dto URdto) throws Exception{
			Connection con = getConnection();
			
			String sql="insert into user_review values(user_review_seq.nextval, ?, ?, ?, sysdate)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, URdto.getReview_writer());
			ps.setInt(2, URdto.getContent_original_no());
			ps.setString(4, URdto.getReview_content());
			
			ps.execute();
			
			con.close();
		}
}
