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

public class Notice_Board_Dao {

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
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//공지사항 게시판 목록보기 기능
	//메소드이름 : notice_board_list
	//매개변수 : int start, int finish
	//반환형 : List<Notice_Board_Dto>
	
		public List<Notice_Board_Dto> notice_board_list(int start, int finish) throws Exception{
			Connection con = getConnection();
			
//			String sql = "select * from notice";
			String sql =  "select * from(" + 
					"    select rownum rn, A.* from( " + 
					"        select * from notice order by notice_no desc " + 
					"    )A " + 
					")where rn between ? and ?"; //최신순
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, finish);
			ResultSet rs = ps.executeQuery();
			
			List<Notice_Board_Dto> list = new ArrayList<>();
			
			while(rs.next()) {
				Notice_Board_Dto NBdto = new Notice_Board_Dto();
				//rownum을 추가로 추출
				NBdto.setRn(rs.getInt("rn"));
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
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//공지사항 글 보기 메소드(단일조회)
		//메소드이름 : notice_board_datail
		//매개변수 : notice_no
		//반환형 : Notice_Board_Dto
		public Notice_Board_Dto notice_board_datail(int no) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from notice where notice_no = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			
			//ResultSet ----> Notice_Board_Dto 변환
			Notice_Board_Dto NBdto = new Notice_Board_Dto();
					if(rs.next()) {
						NBdto.setNotice_no(rs.getInt("notice_no"));
						NBdto.setNotice_title(rs.getString("notice_title"));
						NBdto.setNotice_content(rs.getString("notice_content"));
						NBdto.setNotice_writer(rs.getString("notice_writer"));
						NBdto.setNotice_date(rs.getString("notice_date"));
					}
					
					con.close();
					return NBdto;	
		}
	}
