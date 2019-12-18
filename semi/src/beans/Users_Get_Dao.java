package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Users_Get_Dao {
	
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	

	//유저 정보를 가져오는 기능(단일조회)
	//메소드 이름 : users_get
	//매개변수 : String id
	//반환형 : Users_Get_Dto
	public Users_Get_Dto users_get(String id) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from users where user_id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery(); 
		
		
		//UGdto에 db에서 가져온 정보를 저장합니다
		Users_Get_Dto UGdto;
		if(rs.next()) {
			UGdto = new Users_Get_Dto();
			UGdto.setUser_id(rs.getString("user_id"));
			UGdto.setUser_pw(rs.getString("user_pw"));
			UGdto.setUser_name(rs.getString("user_name"));
			UGdto.setUser_phone(rs.getString("user_phone"));
			UGdto.setUser_email_id(rs.getString("user_email_id"));
			UGdto.setUser_email_domain(rs.getString("user_email_domail"));
			UGdto.setUser_point(rs.getInt("user_point"));
			UGdto.setUser_interest(rs.getString("user_interest"));
			UGdto.setUser_birth(rs.getString("user_birth"));
			UGdto.setUser_join_date(rs.getString("user_join_date"));
			UGdto.setUser_last_login(rs.getString("user_last_login"));			
		}
			else {
				UGdto = null;
			}
		
			con.close();
			return UGdto;
	}
}
