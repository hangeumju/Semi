/*
 * package beans;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.util.ArrayList; import java.util.List;
 * 
 * public class Reservation_Dao {
 * 
 * public List<Reservation_Dto> getList(int start, int finish) throws Exception
 * { Connection con = getConnection(); String sql = "select*from ("
 * +" select rownum rn,A.* from( " + " select*from content_history_to_host " +
 * " connect by prior history_no=superno " + " start with superno is null " +
 * " order siblings by groupno desc, no asc " + " )A " +
 * " ) where rn between ? and ? "; PreparedStatement ps =
 * con.prepareStatement(sql); ps.setInt(1, start); ps.setInt(2, finish);
 * ResultSet rs = ps.executeQuery();
 * 
 * List<Reservation_Dto>list = new ArrayList<>();
 * 
 * while (rs.next()) { int rn = rs.getInt("rn");
 * 
 * Reservation_Dto Rdto = new Reservation_Dto(); Rdto.setNo(rs.getInt("no"));
 * Rdto.setHead(rs.getString("head")); Rdto.setTitle(rs.getString("title"));
 * Rdto.setReplycount(rs.getInt("replycount"));
 * Rdto.setWriter(rs.getString("writer")); Rdto.setWdate(rs.getString("wdate"));
 * Rdto.setContent(rs.getString("content"));
 * Rdto.setReadcount(rs.getInt("readcount")); Rdto.setRn(rs.getInt("rn"));
 * Rdto.setReadcount(rs.getInt("readcount"));
 * Rdto.setReplycount(rs.getInt("replycount"));
 * Rdto.setGroupno(rs.getInt("groupno")); Rdto.setSuperno(rs.getInt("superno"));
 * Rdto.setDepth(rs.getInt("depth"));
 * 
 * list.add(Rdto); } con.close(); return list; }
 * 
 * private Connection getConnection() { // TODO Auto-generated method stub
 * return null; }
 * 
 * }
 */