package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//컨텐츠 생성 다오 입니다
public class Host_ContentProduce_Dao {
	//생성 통로입니다
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	//컨텐츠 생성 입니다
	//매개변수 : 카테고리, 참여비용, 컨텐츠 이름, 판매수량, 소개,  위치, 기타정보안내, 예약차트, 원본파일, 수정파일, 컨텐츠QA
	//나올값 : void 없음
	
	public void host_contentproduce(Host_ContentProduce_Dto HCdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into host_content values("
				+ "host_content_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '보류')";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, HCdto.getHost_id());
		ps.setString(2, HCdto.getHost_content_category());
		ps.setInt(3, HCdto.getHost_content_cost());
		ps.setString(4, HCdto.getHost_content_name());
		ps.setInt(5, HCdto.getHost_content_ticket());
		ps.setString(6, HCdto.getHost_content_info());
		ps.setString(7, HCdto.getHost_content_date());
		ps.setString(8, HCdto.getHost_content_location());
		ps.setString(9, HCdto.getHost_content_ect_info());
		ps.setString(10, HCdto.getHost_content_original_file());
		ps.setString(11, HCdto.getHost_content_edit_file());
		ps.setString(12, HCdto.getHost_content_qa());
		
		ps.execute();
		con.close();
	}
	
}
