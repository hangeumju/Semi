package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Content_History_Dao {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	//콘텐츠 사용 내역 입력
	//매개변수 Content_History_Dto CHdto
	//반환값 없음
	
	public void users_history_pay(Content_History_Dto CHdto) throws Exception{
		Connection con = getConnection();
			
		String sql = "insert into content_history(history_no, host_history_no, USERS_HISTORY_NO, users_history_id, user_qty, user_reservation_date, user_class_date)"
				+ " values(content_history_seq.nextval, ?, ?, ?, ?, sysdate, ? )";
			
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, CHdto.getHost_history_no());
		ps.setInt(2, CHdto.getUsers_history_no());
		ps.setString(3, CHdto.getUsers_history_id());
		ps.setInt(4, CHdto.getUser_qty());
		ps.setString(5, CHdto.getUser_class_date());
		
		ps.execute();
		con.close();
	}
	
}
