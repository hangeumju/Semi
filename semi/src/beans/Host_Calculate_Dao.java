package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Host_Calculate_Dao {

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	
	//전체 금액 구하기
	public int total_pay(String host_id) throws Exception{
		Connection con = getConnection();
		
		String sql = " select sum(host_content_cost * user_qty) total_payment from ("
				+ " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
				" ) HC " + 
				" inner join content_history CH on HC.host_content_no = CH.host_history_no";
			
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int total_pay = rs.getInt(1);
		
		con.close();
		return total_pay;
	}
	
	//전달 금액 구하기
	public int before_total_pay(String host_id, String beforeMonth) throws Exception{
		Connection con = getConnection();
		
		String sql = " select sum(host_content_cost * user_qty) total_payment from ("
				+ " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
				" ) HC " + 
				" inner join content_history CH on HC.host_content_no = CH.host_history_no "+
				" where user_reservation_date like ?||'/%' ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ps.setString(2, beforeMonth);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int total_pay_month = rs.getInt(1);
		
		con.close();
		return total_pay_month;
		
	}
	
	//이번달 금액 구하기
		public int total_pay(String host_id, String month) throws Exception{
			Connection con = getConnection();
			
			String sql = " select sum(host_content_cost * user_qty) total_payment from ("
					+ " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
					" ) HC " + 
					" inner join content_history CH on HC.host_content_no = CH.host_history_no "+
					" where user_reservation_date like ?||'/%' ";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, host_id);
			ps.setString(2, month);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int total_pay_month = rs.getInt(1);
			
			con.close();
			return total_pay_month;
			
		}
	
	
}
