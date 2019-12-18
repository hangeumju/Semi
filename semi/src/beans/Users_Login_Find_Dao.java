package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Users_Login_Find_Dao {
//	필수기능 : 연결
//	이름 : getConnection
//	준비물(매개변수) : x
//	결과물(반환형) : 연결(Connection)
	// 연결메소드
	public Connection getConnection() throws Exception {
	      Class.forName("oracle.jdbc.OracleDriver");
	      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");


	      return con;
	   }

	// 아이디 찾기 
		public String find(String user_name, String user_phone) throws Exception {
			Connection con = getConnection();

			String sql = "select user_id from users where user_name=? and user_phone=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_name);
			ps.setString(2, user_phone);
			ResultSet rs = ps.executeQuery();

			String user_id = null;
			if (rs.next()) {
				user_id = rs.getString("user_id");
			}
			con.close();
			return user_id;

		}


	}


