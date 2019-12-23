package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Notice_Board_Dao {

	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//공지사항 게시판 목록보기 기능
	//메소드이름 : notice_board_list
	//매개변수 : 없음
	//반환형 : List<Notice_Board_Dto>
	
		public List<Notice_Board_Dto> notice_board_list() throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from notice";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<Notice_Board_Dto> list = new ArrayList<>();
			
			while(rs.next()) {
				Notice_Board_Dto NBdto = new Notice_Board_Dto();
				NBdto.setNotice_no(rs.getInt("notice_no"));
				NBdto.setNotice_title(rs.getString("notice_title"));
				NBdto.setNotice_content(rs.getString("notice_content"));
				NBdto.setNotice_writer(rs.getString("notice_writer"));
				NBdto.setNotice_date(rs.getString("notice_date"));
				
				list.add(NBdto);
			}			
		
			con.close();
			return list;
		}
		
		
//		전체글 수 구하는 메소드
//		메소드이름 : notice_board_count
//		매개변수 : void(없음)
//		반환형 : int
		public int notice_board_count() throws Exception{
			Connection con = getConnection();
			
			String sql = "select count(*) from notice"; //목록구하기
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			int count = rs.getInt(1);
			
			con.close();			
			return count;
		}
	}
