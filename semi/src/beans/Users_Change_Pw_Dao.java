package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//유저 비밀번호 변경 DAO
public class Users_Change_Pw_Dao {
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
	
//	비밀번호 변경 메소드 
	// chagnepassword
//	반환형 void
	public void changePassword(String user_id, String user_pw) throws Exception {
		Connection con = getConnection();

		String sql = "update users set user_pw = ? where user_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_pw);
		ps.setString(2, user_id);

		ps.execute();

		con.close();

	}

}
