package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Host_Regist_Dao {
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");


		return con;
	}

	//호스트용 회원가입 메소드입니다
	public void host_regist(Host_Regist_Dto Hdto) throws Exception {
		Connection con = getConnection();
		
		//인서트로 밑의 것을 받습니다
		String sql = "insert into host values(host_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, Hdto.getHost_id());
		ps.setString(2, Hdto.getHost_pw());
		ps.setString(3, Hdto.getHost_name());
		ps.setString(4, Hdto.getHost_phone());
		ps.setString(5, Hdto.getHost_email_id());
		ps.setString(6, Hdto.getHost_email_domain());
		ps.setString(7, Hdto.getHost_interest());
		ps.setString(8, Hdto.getHost_post());
		ps.setString(9, Hdto.getHost_basic_addr());
		ps.setString(10, Hdto.getHost_extra_addr());
		ps.setString(11, Hdto.getHost_bank_name());
		ps.setString(12, Hdto.getHost_bank_account());
		
		ps.execute();
		con.close();
	}
}
