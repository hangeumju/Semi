package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Host_Login_Find_Dao {
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");


		return con;
	}

	public String host_login_find(String host_name, String host_phone) throws Exception {
		Connection con = getConnection();
		String sql = "select host_id from host where host_name=? and host_phone=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_name);
		ps.setString(2, host_phone);
		
		ResultSet rs = ps.executeQuery();
		String host_id = null;
		if(rs.next()) {
			host_id = rs.getString("host_id");
			
	}
		con.close();
		return host_id;
	}
}
