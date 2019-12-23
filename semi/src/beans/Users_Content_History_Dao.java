package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Users_Content_History_Dao {

	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//유저 이용내역 목록보기 기능
	//메소드 이름 : users_history_list
	//매개변수 : String users_history_id
	//반환형 : Users_Content_History_Dto
	public List<Users_Content_History_Dto> users_history_list(String users_history_id) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from content_history_to_users where users_history_id = ? order by user_reservation_date desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, users_history_id);
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
			
			list.add(UCHdto);
		}
		
		con.close();		
		return list;
	}

}
