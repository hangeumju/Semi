package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Host_Change_PW_Dao {
	
		public Connection getConnection() throws Exception {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
			return con;
		}

	public void host_change_password(String host_id, String host_pw) throws Exception {
		Connection con = getConnection();
		String sql = "update host set host_pw=? where host_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_pw);
		ps.setString(2, host_id);
		
		ps.execute();
		con.close();
		
	}
	
	//임시 비밀번호 발급 (host_change_temporary_pw)
	
}


