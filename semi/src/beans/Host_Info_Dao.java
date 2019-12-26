package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sun.crypto.provider.RSACipher;

// host(판매자) 가입 및 로그인 관련 method 기능이 있는 Dao 입니다
public class Host_Info_Dao {
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");


		return con;
	}
	
		///////////////////////호스트용 회원가입(host_regist)
	public void host_regist(Host_Info_Dto HIdto) throws Exception {
		///////////////////////호스트용 회원가입(host_regist)
		Connection con = getConnection();
		
		//인서트로 밑의 것을 받습니다
		String sql = "insert into host values(host_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, HIdto.getHost_id());
		ps.setString(2, HIdto.getHost_pw());
		ps.setString(3, HIdto.getHost_name());
		ps.setString(4, HIdto.getHost_phone());
		ps.setString(5, HIdto.getHost_email_id());
		ps.setString(6, HIdto.getHost_email_domain());
		ps.setString(7, HIdto.getHost_post());
		ps.setString(8, HIdto.getHost_basic_addr());
		ps.setString(9, HIdto.getHost_extra_addr());
		ps.setString(10, HIdto.getHost_bank_name());
		ps.setString(11, HIdto.getHost_bank_account());
		
		
		ps.execute();
		con.close();
	}
	
		///////////////////////호스트용 로그인(host_login)
	public boolean host_login(String host_id, String host_pw) throws Exception {
		///////////////////////호스트용 회원가입(host_login)
		Connection con = getConnection();
		String sql ="select*from host where host_id=? and host_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ps.setString(2, host_pw);
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();
		return result;
	}
		///////////////////////호스트용 탈퇴(host_exit)
	public void exit(String host_id) throws Exception {
		///////////////////////호스트용 탈퇴(host_exit)
		Connection con = getConnection();
		String sql = "delete host where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		
		ps.execute();
		con.close();
		
	}
		///////////////////////호스트용 아이디 찾기(host_login_find)
	public String host_login_find(String host_name, String host_phone) throws Exception {
		///////////////////////호스트용 아이디 찾기(host_login_find)
		Connection con = getConnection();
		String sql = "select host_id from host where host_name=? and host_phone=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_name);
		ps.setString(2, host_phone);
		
		ResultSet rs = ps.executeQuery();
		String host_id = null;
		if(rs.next()) {
			host_id = rs.getString("host_id");
			
	}
		con.close();
		return host_id;
	}
	
		///////////////////////호스트용 정보 수정(host_change_info)
	public void host_change_info(Host_Info_Dto HIdto)throws Exception {
		///////////////////////호스트용 정보 수정(host_change_info)
		Connection con =  getConnection();
		String sql = "update host set host_email_id = ?, host_email_domain=?, host_post=?, host_basic_addr=?, host_extra_addr=?, host_bank_name = ? , host_bank_account=?, host_phone=? where host_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, HIdto.getHost_email_id());
		ps.setString(2, HIdto.getHost_email_domain());
		ps.setString(3, HIdto.getHost_post());
		ps.setString(4, HIdto.getHost_basic_addr());
		ps.setString(5, HIdto.getHost_extra_addr());
		ps.setString(6, HIdto.getHost_bank_name());
		ps.setString(7, HIdto.getHost_bank_account());
		ps.setString(8, HIdto.getHost_phone());
		ps.setString(9, HIdto.getHost_id());
		
		ps.execute();
		con.close();
	}
		///////////////////////호스트용 비밀번호 변경(host_change_password)
	public void host_change_password(String host_id, String host_pw) throws Exception {
		///////////////////////호스트용 비밀번호 변경(host_change_password)
		Connection con = getConnection();
		String sql = "update host set host_pw=? where host_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_pw);
		ps.setString(2, host_id);
		
		ps.execute();
		con.close();
	}
		///////////////////////호스트용 임시 비밀번호 발급(host_change_temporary_pw)
	public void host_change_temporary_pw(String host_id, String host_pw) throws Exception {
		///////////////////////호스트용 임시 비밀번호 발급(host_change_temporary_pw)
		Connection con = getConnection();
		
		String sql = "update host set host_pw=? where host_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_pw);
		ps.setString(2, host_id);
		
		ps.execute();
		con.close();
	}
		///////////////////////호스트용 로그인 정보 ID 저장(host_login)
	public Host_Info_Dto get(String host_id) throws Exception {
		///////////////////////호스트용 로그인 정보 ID 저장(host_login)
		Connection con = getConnection();
		String sql = "select*from host where host_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ResultSet rs = ps.executeQuery();
		
		Host_Info_Dto HIdto;
		if(rs.next()) {
			HIdto = new Host_Info_Dto();
			
			HIdto.setHost_id(rs.getString("host_id"));
			HIdto.setHost_pw(rs.getString("host_pw"));
			HIdto.setHost_name(rs.getString("host_name"));
			HIdto.setHost_phone(rs.getString("host_phone"));
			HIdto.setHost_joindate(rs.getString("host_joindate"));	
			HIdto.setHost_email_id(rs.getString("host_email_id"));
			HIdto.setHost_email_domain(rs.getString("host_email_domain"));
			HIdto.setHost_post(rs.getString("host_post"));
			HIdto.setHost_basic_addr(rs.getString("host_basic_addr"));
			HIdto.setHost_extra_addr(rs.getString("host_extra_addr"));
			HIdto.setHost_bank_name(rs.getString("host_bank_name"));	
			HIdto.setHost_bank_account(rs.getString("host_bank_account"));
			HIdto.setHost_lastlogin(rs.getString("host_lastlogin"));	
		}
		else {
			HIdto = null;
		}
		con.close();
		return HIdto;
	}
	
		///////////////////////호스트용 로그인 정보 ID 저장(host_login)
	public void updateHost_lastlogin(String host_id) throws Exception{
		///////////////////////호스트용 로그인 정보 ID 저장(host_login)
		Connection con = getConnection();
		String sql = "update host set host_lastlogin = sysdate where host_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ps.execute();
		con.close();
	}
	
		///////////////////////	호스트용 단일 정보 뽑아오기
		/////////////////////// 매개변수 아이디
		/////////////////////// 반환값 호스트 정보
		public Host_Info_Dto getOneHost(String id) throws Exception {
			Connection con = getConnection();
			String sql = "select * from host where host_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			ResultSet rs = ps.executeQuery();
			Host_Info_Dto HIdto = new Host_Info_Dto();
			if(rs.next()) {
				//이름, 아이디, 전화번호, 이메일, 주소를 받습니다
				HIdto.setHost_id(rs.getString("host_id"));
				HIdto.setHost_name(rs.getString("host_name"));
				HIdto.setHost_phone(rs.getString("host_phone"));
				HIdto.setHost_email_id(rs.getString("host_email_id"));
				HIdto.setHost_email_domain(rs.getString("host_email_domain"));
				HIdto.setHost_post(rs.getString("host_post"));
				HIdto.setHost_basic_addr(rs.getString("host_basic_addr"));
				HIdto.setHost_extra_addr(rs.getString("host_extra_addr"));
				
			}
			
			con.close();
			return HIdto;
		}
}

