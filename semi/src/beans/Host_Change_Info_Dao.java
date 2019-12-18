package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Host_Change_Info_Dao {
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	public void host_change_info(Host_Change_Info_Dto HCIdto)throws Exception {
		Connection con =  getConnection();
		String sql = "update host set"
				+ " host_email_id=?, host_email_domain=?, "
				+ " host_interest=?, "
				+ " host_post=?, host_basic_addr=?, host_extra_addr=?, "
				+ " host_bank_name=?, host_bank_account=? "
				+ " where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, HCIdto.getHost_email_id());
		ps.setString(2, HCIdto.getHost_email_domain());
		ps.setString(3, HCIdto.getHost_interest());
		ps.setString(4, HCIdto.getHost_post());
		ps.setString(5, HCIdto.getHost_basic_addr());
		ps.setString(6, HCIdto.getHost_extra_addr());
		ps.setString(7, HCIdto.getHost_bank_name());
		ps.setString(8, HCIdto.getHost_bank_account());
		ps.setString(9, HCIdto.getHost_id());
		
		ps.execute();
		con.close();
	}
}
