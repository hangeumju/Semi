package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Host_Calculate_Dao {

private static DataSource source;
	
	static {
		try {
			InitialContext ctx = new InitialContext();//[1]
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} 
		catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return source.getConnection();
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
