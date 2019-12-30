package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Users_Review_Dao {
	
	//연결 메소드(Connection)
private static DataSource source;
	
	static {
		try {
			InitialContext ctx = new InitialContext();//[1]
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} 
		catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return source.getConnection();
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
		public List<Users_Review_Dto> users_review_list(String review_writer, int start, int finish) throws Exception{
			Connection con = getConnection();
			
//			String sql = "select * from user_review where review_writer = ? order by review_no desc";
			
//			네비게이터 서브쿼리추가
			String sql = "select * from(" + 
				"    select rownum rn, A.* from( " + 
				"        select * from user_review where review_writer = ? order by review_no desc " + 
				"    )A " + 
				")where rn between ? and ?"; //최신순
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, review_writer);
			ps.setInt(2, start);
			ps.setInt(3, finish);
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
			ps.setString(3, URdto.getReview_content());
			
			ps.execute();
			
			con.close();
		}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//전체글 수 구하는 메소드
	//메소드이름 : users_review_count
	//매개변수 :	String review_writer
	//반환형 : int
		public int users_review_count(String review_writer) throws Exception{
			Connection con = getConnection();
			
			String sql = "select count(*) from user_review where review_writer = ?"; //목록구하기
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, review_writer);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			int count = rs.getInt(1);
			
			con.close();			
			return count;
			}
}
