package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Host_Login_Dao {
	public Connection getConnecion()throws Exception{
	      Class.forName("oracle.jdbc.OracleDriver");
	      return DriverManager.getConnection(
	      "jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
	      
	}

	public boolean host_login(String host_id, String host_pw) throws Exception {
		Connection con = getConnecion();
		String sql ="select*from host where host_id=? and host_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ps.setString(2, host_pw);
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();

		return result;
	}

}

