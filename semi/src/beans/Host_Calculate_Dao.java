package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
   
      //전년도 총금액 
      public int plastYear_total_pay(String host_id, String lastYear) throws Exception{
    	  Connection con = getConnection();
          
          String sql = " select sum(host_content_cost * user_qty) total_payment from ("
                + " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
                " ) HC " + 
                " inner join content_history CH on HC.host_content_no = CH.host_history_no "+
                " where user_reservation_date like ?||'/%' ";
             
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, host_id);
          ps.setString(2, lastYear);
          
          ResultSet rs = ps.executeQuery();
          
          rs.next();
          
          int total_pay = rs.getInt(1);
          
          con.close();
          return total_pay;
       }
      
      //상반기
      public int first(String host_id, String lastYear) throws Exception{
    	  Connection con = getConnection();
          
          String sql = " select sum(host_content_cost * user_qty) total_payment from ("
                + " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
                " ) HC " + 
                " inner join content_history CH on HC.host_content_no = CH.host_history_no "+
                " where user_reservation_date like ?||'/01/%' or user_reservation_date like ?||'/02/%' or user_reservation_date like ?||'/03/%' or user_reservation_date like ?||'/04/%' "
                + " or user_reservation_date like ?||'/05/%'  or user_reservation_date like ?||'/06/%' ";
             
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, host_id);
          ps.setString(2, lastYear);
          ps.setString(3, lastYear);
          ps.setString(4, lastYear);
          ps.setString(5, lastYear);
          ps.setString(6, lastYear);
          ps.setString(7, lastYear);
          ResultSet rs = ps.executeQuery();
          
          rs.next();
          
          int total_pay = rs.getInt(1);
          
          con.close();
          return total_pay;
       }
      
      //하반기
      public int second(String host_id, String lastYear) throws Exception{
    	  Connection con = getConnection();
          
          String sql = " select sum(host_content_cost * user_qty) total_payment from ("
                + " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
                " ) HC " + 
                " inner join content_history CH on HC.host_content_no = CH.host_history_no "+
                " where user_reservation_date like ?||'/07/%' or user_reservation_date like ?||'/08/%' or user_reservation_date like ?||'/09/%' or user_reservation_date like ?||'/10/%' "
                + " or user_reservation_date like ?||'/11/%'  or user_reservation_date like ?||'/12/%' ";
             
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, host_id);
          ps.setString(2, lastYear);
          ps.setString(3, lastYear);
          ps.setString(4, lastYear);
          ps.setString(5, lastYear);
          ps.setString(6, lastYear);
          ps.setString(7, lastYear);
          ResultSet rs = ps.executeQuery();
          
          rs.next();
          
          int total_pay = rs.getInt(1);
          
          con.close();
          return total_pay;
       }
      
    //올해 총금액 
      public int pYear_total_pay(String host_id, String toYear) throws Exception{
    	  Connection con = getConnection();
          
          String sql = " select sum(host_content_cost * user_qty) total_payment from ("
                + " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
                " ) HC " + 
                " inner join content_history CH on HC.host_content_no = CH.host_history_no "+
                " where user_reservation_date like ?||'/%' ";
             
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, host_id);
          ps.setString(2, toYear);
          
          ResultSet rs = ps.executeQuery();
          
          rs.next();
          
          int total_pay = rs.getInt(1);
          
          con.close();
          return total_pay;
       }
      
    //연도별 총 금액
      public List<Host_Yearly_Dto> yearly(String host_id) throws Exception{
    	  Connection con = getConnection();
          
          String sql = " select sum(host_content_cost * user_qty) total_payment, extract(year from user_reservation_date) year from ("
                  + " select host_id, host_content_no, host_content_cost  from host_content where host_id = ? " + 
                  " ) HC " + 
                  " inner join content_history CH on HC.host_content_no = CH.host_history_no "+
                  " group by extract(year from user_reservation_date) order by year desc";
             
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, host_id);
          
          ResultSet rs = ps.executeQuery();
          List<Host_Yearly_Dto> list = new ArrayList<Host_Yearly_Dto>();
         
          while(rs.next()) {
        	  Host_Yearly_Dto dto = new Host_Yearly_Dto();
        	  dto.setTotal_payment(rs.getInt("total_payment"));
        	  dto.setYear(rs.getString("year"));
        	  list.add(dto);
          }
          
          con.close();
          return list;
       }
}
