package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Users_Info_Dao {
	
	
	//연결 메소드(Connection)
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@116.38.170.78:1521:xe", "kh22", "kh22");
//				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22","kh22");
				return con;
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//유저 회원가입 기능
	//메소드 이름 : users_regist
	//매개변수 : Users_Regist_Dto dto
	//반환형 : 없음(void)
	public void users_regist(Users_Regist_Dto URdto) throws Exception{
		Connection con =  getConnection();
		
		String sql = "insert into users values(users_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, null)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, URdto.getUser_id());
		ps.setString(2, URdto.getUser_pw());
		ps.setString(3, URdto.getUser_name());
		ps.setString(4, URdto.getUser_phone());
		ps.setString(5, URdto.getUser_email_id());
		ps.setString(6, URdto.getUser_email_domain());
		ps.setInt(7, URdto.getUser_point());
		ps.setString(8, URdto.getUser_interest());
		ps.setString(9, URdto.getUser_birth());
		
		ps.execute();
		
		con.close();
	}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//유저 정보를 가져오는 기능(단일조회)
	//메소드 이름 : users_get
	//매개변수 : String id
	//반환형 : Users_Get_Dto
		public Users_Get_Dto users_get(String user_id) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from users where user_id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
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
				UGdto.setUser_email_domain(rs.getString("user_email_domain"));
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
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//회원 탈퇴 기능
		//메소드 이름 : users_exit
		//매개변수 : String id
		//반환형 : 없음 void
		public void users_exit(String user_id) throws Exception {
			Connection con = getConnection();
			
			String sql = "delete from users where user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			ps.execute();
			
			con.close();
			
		}
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//		회원정보 수정기능
//		메소드 이름 :  users_change_info
//		매개변수 : Users_Change_Info_Dto UCIdto
//		반환형 void
		public void users_change_info(Users_Change_Info_Dto UCIdto) throws Exception {
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
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//회원 로그인 기능
		//메소드 이름 : users_login
		//매개변수 : String user_id, String user_pw
		//반환형 : boolean
			public boolean users_login(String user_id, String user_pw) throws Exception {
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
//			메소드이름 : users_login
//			매개변수 : Users_Login_Dto ULdto
//			반환형 : boolean
			public boolean users_login(Users_Login_Dto ULdto) throws Exception {
				return this.users_login(ULdto.getUser_id(), ULdto.getUser_pw());

			}
			
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
// 			최종 로그인 시각 변경 메소드
//			메소드 이름 : users_update_last_login
//			매개변수 : String user_id
//			반환형 : 없음
			public void users_update_last_login(String user_id) throws Exception {
				Connection con = getConnection();

				String sql = "update users set user_last_login = sysdate where user_id =?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, user_id);
				ps.execute();

				con.close();

		}
			
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//			비밀번호 변경 메소드 
// 			메소드 이름 : users_change_password
// 			매개변수 : String user_id, String user_pw
//			반환형 void
				public void users_change_password(String user_id, String user_pw) throws Exception {
					Connection con = getConnection();

					String sql = "update users set user_pw = ? where user_id = ?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, user_pw);
					ps.setString(2, user_id);

					ps.execute();

					con.close();

				}
			
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 			아이디 찾기 
//			메소드 이름 : users_find_id
//			매개변수 : String user_name, String user_phone
//			반환형 : String(id)
			public String users_find_id(String user_name, String user_phone) throws Exception {
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
