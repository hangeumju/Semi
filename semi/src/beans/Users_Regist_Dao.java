package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Users_Regist_Dao {
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
	
	//유저 회원가입 기능
	//메소드 이름 : users_regist
	//매개변수 : Users_Regist_Dto dto
	//반환형 : 없음(void)
	public void users_regist(Users_Regist_Dto dto) throws Exception{
		Connection con =  getConnection();
		
		String sql = "insert into users values(users_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, null)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getUser_id());
		ps.setString(2, dto.getUser_pw());
		ps.setString(3, dto.getUser_name());
		ps.setString(4, dto.getUser_phone());
		ps.setString(5, dto.getUser_email_id());
		ps.setString(6, dto.getUser_email_domain());
		ps.setInt(7, dto.getUser_point());
		ps.setString(8, dto.getUser_interest());
		ps.setString(9, dto.getUser_birth());
		
		ps.execute();
		
		con.close();
	}
		
}
