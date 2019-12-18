package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Host_Exit_Dao {
	public Connection getConnecion()throws Exception{
	      Class.forName("oracle.jdbc.OracleDriver");
	      return DriverManager.getConnection(
	      "jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
	      
	}

	public void exit(String host_id) throws Exception {
		Connection con = getConnecion();
		String sql = "delete host where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		
		ps.execute();
		con.close();
		
	}
}
