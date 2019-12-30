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

public class Users_Content_History_Dao {

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
	
	//유저 이용내역 목록보기 기능
	//메소드 이름 : users_history_list
	//매개변수 : String users_history_id, int start, int finish
	//반환형 : Users_Content_History_Dto
	public List<Users_Content_History_Dto> users_history_list(String users_history_id, int start, int finish) throws Exception{
		Connection con = getConnection();
		
//		"select * from content_history_to_users where users_history_id = ? order by user_reservation_date desc";
		
//		네비게이터 서브쿼리추가
		String sql = "select * from(" + 
			"    select rownum rn, A.* from( " + 
			"        select * from content_history_to_users where users_history_id = ? order by user_reservation_date desc " + 
			"    )A " + 
			")where rn between ? and ?"; //최신순
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, users_history_id);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<Users_Content_History_Dto> list = new ArrayList<>();
		
		while(rs.next()) { //데이터의 갯수만큼 반복합니다
			Users_Content_History_Dto UCHdto = new Users_Content_History_Dto();
			UCHdto.setUsers_history_id(rs.getString("users_history_id"));
			UCHdto.setUser_reservation_date(rs.getString("user_reservation_date"));
			UCHdto.setHost_content_name(rs.getString("host_content_name"));
			UCHdto.setHost_content_cost(rs.getInt("host_content_cost"));
			UCHdto.setUser_qty(rs.getInt("user_qty"));
			UCHdto.setHost_name(rs.getString("host_name"));
			UCHdto.setHost_phone(rs.getString("host_phone"));
			UCHdto.setHost_content_location(rs.getString("host_content_location"));			
			UCHdto.setUser_class_date(rs.getString("user_class_date"));
			
			list.add(UCHdto);
		}
		
		con.close();		
		return list;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//전체글 수 구하는 메소드
	//메소드이름 : users_content_history_count
	//매개변수 : String user_id
	//반환형 : int
	public int users_content_history_count(String user_id) throws Exception{
		Connection con = getConnection();
		
		String sql = "select count(*) from content_history where users_history_id=?"; //목록구하기
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_id);
	
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();			
		return count;
		}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//유저 총 이용금액 구하는 메소드
	//메소드이름 : users_pay_total
	//매개변수 : String users_history_id
	//반환형 : int
	public int users_pay_total(String users_history_id) throws Exception {
		Connection con = getConnection();
		
		String sql = " select sum(user_pay_total) from( " + 
						" select users_history_id, (host_content_cost * user_qty)user_pay_total from content_history_to_users where users_history_id = ?" + 
				"    )";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, users_history_id);
		
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int money = rs.getInt(1);
		
		con.close();			
		return money;
		}
	
	}
