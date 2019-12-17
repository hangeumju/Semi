package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.Users_Login_Dto;
import oracle.jdbc.proxy.annotation.Pre;

public class Users_Login_Dao {
	
	//연결 
	//이름 : getConnection
	//준비물:x
	//결과물:연결(Connection)
	
	private static DataSource source;
	static {
		//source에 context.xml의 Resource 정보를 설정
		//[1] 탐색 도구 생성
		//[2] 도구를 이용하여 탐색 후 source 에 대입
		try {
			InitialContext ctx = new InitialContext();//[1] 
		source =	(DataSource) ctx.lookup("java:comp/env/jdbc/oracle");  // context.xml의 resource 중에서 /jdbc/oracle을찾아라  
		} catch (NamingException e) { 
			e.printStackTrace();
		}
	}
	
	// 연결메소드
	public Connection getConnection() throws Exception {
//		return common-dbcp에서 관리하는 연결을 빌려와서 반환해라(빌려와라);
		return source.getConnection();
	}
	
	
	
	//이름 : 로그인 
	public boolean login(String user_id, String user_pw) throws Exception {
		Connection con = getConnection();

		String sql = "select * from users where user_id=? and user_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setString(2, user_pw);
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();
		return result;

	}
//	로그인2 오버로딩 dto방식
//	이름 : login
//	매개변수 : (String, String) or (KHMemberDto)
//	반환형 : boolean
//	public boolean login(MemberDto dto) throws Exception{
//		Connection con = getConnection();

	public boolean login(Users_Login_Dto ULdto) throws Exception {
		return this.login(ULdto.getUser_id(), ULdto.getUser_pw());

	}



	public Users_Login_Dto get(String user_id) throws Exception{
		Connection con = getConnection();
		
		String sql ="select * from users where user_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_id);
		ResultSet rs = ps.executeQuery();
		
		Users_Login_Dto ULdto;
		if(rs.next()) {
			ULdto = new Users_Login_Dto();
			
			ULdto.setUser_no(rs.getInt("user_no"));
			ULdto.setUser_id(rs.getString("user_id"));
			ULdto.setUser_pw(rs.getString("user_pw"));
			ULdto.setUser_name(rs.getString("user_name"));
			ULdto.setUser_phone(rs.getString("user_phone"));
			ULdto.setUser_email(rs.getString("user_email"));
			ULdto.setUser_email_domain(rs.getString("user_email_domain"));
			ULdto.setUser_point(rs.getInt("user_point"));
			ULdto.setUser_interest(rs.getString("user_interest"));
			ULdto.setUser_birth(rs.getString("user_birth"));
			ULdto.setUser_join_date(rs.getString("user_join_date"));
			ULdto.setUser_last_login(rs.getString("user_last_login"));
		}
		else {
			ULdto = null;
		}
		
		con.close();
		return ULdto;

	}
	// 최종 로그인 시각 변경 메소드
		public void updateLastLogin(String user_id) throws Exception {
			Connection con = getConnection();

			String sql = "update users set user_last_login = sysdate where user_id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			ps.execute();

			con.close();

		}

	

}
