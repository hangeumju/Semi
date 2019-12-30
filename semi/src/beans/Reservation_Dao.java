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

public class Reservation_Dao {
   
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
   
   //예약 차트 전체 보기
   public List<Reservation_Dto> reservation_list(String host_id, int start, int finish)throws Exception{
   Connection con = getConnection();
   
   String sql = "select * from ("
         + " select rownum rn, A.* from ("
         + " select * from content_history_to_host where host_id = ?"
         + " connect by prior history_no=superno "
         + " start with superno is null "
         + " order siblings by groupno desc, history_no asc"
      + " )A "
   + ") where rn between ? and ?";
   
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setString(1, host_id);
   ps.setInt(2, start);
   ps.setInt(3, finish);
   ResultSet rs = ps.executeQuery();
   
   List<Reservation_Dto> list = new ArrayList<>();
   
   while(rs.next()) { //데이터의 갯수만큼 반복합니다
      int rn = rs.getInt("rn");
      Reservation_Dto Rdto = new Reservation_Dto();
      Rdto.setHistory_no(rs.getInt("history_no"));
      Rdto.setUser_name(rs.getString("user_name"));
      Rdto.setUser_phone(rs.getString("user_phone"));
      Rdto.setUser_qty(rs.getInt("user_qty"));
      Rdto.setUser_reservation_date(rs.getString("user_reservation_date"));
      Rdto.setUsers_history_id(rs.getString("users_history_id"));   
      Rdto.setHost_content_name(rs.getString("host_content_name"));
      Rdto.setUser_class_date(rs.getString("user_class_date"));
      
      list.add(Rdto);
   }
   con.close();      
   return list;
}
   
   //예약 차트 검색어 받기
   public List<Reservation_Dto> search(String type, String keyword,int start, int finish)throws Exception{
      Connection con = getConnection();
      String sql = "select * from( "
            +" select rownum rn, A.* from ( "
            + "select * from content_history_to_host "
            + " where "+type+" like '%'||?||'%' "
            + " connect by prior history_no = superno "
            + " start with superno is null "
            + " order siblings by groupno desc, history_no asc "
            + " )A "
         + " ) where rn between ? and ? ";

      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, keyword);
      ps.setInt(2, start);
      ps.setInt(3, finish);
      
      ResultSet rs = ps.executeQuery();
      List<Reservation_Dto> list = new ArrayList<>();
      while(rs.next()) { //데이터의 갯수만큼 반복합니다
         Reservation_Dto Rdto = new Reservation_Dto();
         
         Rdto.setHistory_no(rs.getInt("history_no"));
         Rdto.setUser_name(rs.getString("user_name"));
         Rdto.setUser_phone(rs.getString("user_phone"));
         Rdto.setUser_qty(rs.getInt("user_qty"));
         Rdto.setUser_reservation_date(rs.getString("user_reservation_date"));
         Rdto.setUsers_history_id(rs.getString("users_history_id"));   
         Rdto.setHost_content_name(rs.getString("host_content_name"));
         Rdto.setGroupno(rs.getInt("groupno"));
         Rdto.setSuperno(rs.getInt("superno"));
         Rdto.setDepth(rs.getInt("depth"));
         
         list.add(Rdto);
      }
      con.close();      
      return list;
   }
   
   public int getCount(String host_id, String type, String keyword)throws Exception{
      Connection con = getConnection();
      boolean isSearch = type != null && keyword != null ;
      String sql = "select count(*) from content_history_to_host ";
      if(isSearch) {
         sql += " where "+type+" like '%'||?||'%' and host_id = ?";
      }
      else {
         sql += " where host_id = ?";
      }
      
      PreparedStatement ps = con.prepareStatement(sql);
      if(isSearch) {
         ps.setString(1, keyword);
         ps.setString(2, host_id);
      }
      else {
         ps.setString(1, host_id);
      }
      ResultSet rs = ps.executeQuery();
      rs.next();
      int count = rs.getInt(1);
      
      con.close();
      return count;
   }

}