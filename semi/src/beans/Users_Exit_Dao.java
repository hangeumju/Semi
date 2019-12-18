package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Users_Exit_Dao {
	
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}	
	
	//회원 탈퇴 기능
	//메소드 이름 : user_exit
	//매개변수 : String id
	//반환형 : 없음 void
	public void user_exit(String id) throws Exception {
		Connection con = getConnection();
		
		String sql = "delete from users where user_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		
		con.close();
		
	}
	
}
