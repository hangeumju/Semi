package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Reservation_Dao {
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
	//예약 차트 전체 보기
	public List<Reservation_Dto> reservation_list()throws Exception{
	Connection con = getConnection();
	
	String sql = "select * from content_history_to_host";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<Reservation_Dto> list = new ArrayList<>();
	
	while(rs.next()) { //데이터의 갯수만큼 반복합니다
		Reservation_Dto Rdto = new Reservation_Dto();
		Rdto.setHistory_no(rs.getInt("history_no"));
		Rdto.setUser_name(rs.getString("user_name"));
		Rdto.setUser_phone(rs.getString("user_phone"));
		Rdto.setUser_qty(rs.getInt("user_qty"));
		Rdto.setUser_reservation_date(rs.getString("user_reservation_date"));
		Rdto.setUsers_history_id(rs.getString("users_history_id"));	
		Rdto.setHost_content_name(rs.getString("host_content_name"));
		
		list.add(Rdto);
	}
	con.close();		
	return list;
}
	
	//예약 차트 조회
	public List<Reservation_Dto> search(String type, String keyword)throws Exception{
		Connection con = getConnection();
		String sql = "select * from content_history_to_host "
				+ " where " + type + " like '%'||?||'%' " + "order by " + type + " asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		List<Reservation_Dto> list = new ArrayList<>();
		while(rs.next()) { //데이터의 갯수만큼 반복합니다
			Reservation_Dto Rdto = new Reservation_Dto();
			Rdto.setHistory_no(rs.getInt("history_no"));
			Rdto.setUser_name(rs.getString("user_name"));
			Rdto.setUser_phone(rs.getString("user_phone"));
			Rdto.setUser_qty(rs.getInt("user_qty"));
			Rdto.setUser_reservation_date(rs.getString("user_reservation_date"));
			Rdto.setUsers_history_id(rs.getString("users_history_id"));	
			Rdto.setHost_content_name(rs.getString("host_content_name"));
			
			list.add(Rdto);
		}
		con.close();		
		return list;
	}

}
