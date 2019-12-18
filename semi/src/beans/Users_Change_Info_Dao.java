package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




public class Users_Change_Info_Dao {
	
	
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
	
//	회원정보 수정기능
	// chageInfo
//	반환형 void
	public void changeInfo(Users_Change_Info_Dto UCIdto) throws Exception {
		Connection con = getConnection();

		String sql = "update users "
						+	"set user_phone=?, user_email_id=?, user_email_domain=?, user_interest=? "
						+	"where user_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, UCIdto.getUser_phone());
		ps.setString(2, UCIdto.getUser_email_id());
		ps.setString(3, UCIdto.getUser_email_domain());
		ps.setString(4, UCIdto.getUser_interest());
		ps.setString(5, UCIdto.getUser_id());

		ps.execute();

		con.close();

}
	
	//단일조회
			public Users_Change_Info_Dto get(String user_id) throws Exception{
				Connection con = getConnection();
				
				String sql = "select * from users where user_id=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, user_id);
				ResultSet rs = ps.executeQuery();//많아봐야 1개
				
//				Users_Change_Info_Dto = null or 객체;
				Users_Change_Info_Dto UCIdto;
				if(rs.next()) {
					UCIdto = new Users_Change_Info_Dto();
					
					UCIdto.setUser_id(rs.getString("user_id"));
					UCIdto.setUser_phone(rs.getString("user_phone"));
				}
				else {
					UCIdto = null;
				}
				
				con.close();
				
				return UCIdto;
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
//			로그인2 오버로딩 dto방식
//			이름 : login
//			매개변수 : (String, String) or (KHMemberDto)
//			반환형 : boolean
//			public boolean login(MemberDto dto) throws Exception{
//				Connection con = getConnection();

			public boolean login(Users_Change_Info_Dto UCIdto) throws Exception {
				return this.login(UCIdto.getUser_id(), UCIdto.getUser_pw());

			}

	

}
