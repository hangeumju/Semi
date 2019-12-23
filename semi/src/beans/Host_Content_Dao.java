package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// 컨텐츠 생성 다오 입니다
// - host가 컨텐츠 (클래스) 생성시 사용하는 method 저장 해놓은 Dao 입니다
public class Host_Content_Dao {
	
	//생성 통로입니다
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	
	//컨텐츠 생성 입니다
	//매개변수 : 카테고리, 참여비용, 컨텐츠 이름, 판매수량, 소개,  위치, 기타정보안내, 예약차트, 원본파일, 수정파일, 컨텐츠QA
	//나올값 : void 없음
	
	public void host_contentproduce(Host_Content_Dto HCdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into host_content values("
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '보류', sysdate, 0, 0)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, HCdto.getHost_content_no());
		ps.setString(2, HCdto.getHost_id());
		ps.setString(3, HCdto.getHost_content_category());
		ps.setInt(4, HCdto.getHost_content_cost());
		ps.setString(5, HCdto.getHost_content_name());
		ps.setInt(6, HCdto.getHost_content_ticket());
		ps.setString(7, HCdto.getHost_content_info());
		ps.setString(8, HCdto.getHost_content_start_date());
		ps.setString(9, HCdto.getHost_content_last_date());
		ps.setString(10, HCdto.getHost_content_location());
		ps.setString(11, HCdto.getHost_content_ect_info());
		ps.setString(12, HCdto.getHost_content_qa());
		
		ps.execute();
		con.close();
	}
	
	
	
	//전체 컨텐츠 리스트를 불러오는 다오입니다
	//매개변수 : 카테고리(아직 미구현했습니다) 
	//반환값 : 카테고리에 해당하는 컨텐츠 리스트
	//아직 사진을 못넣었어요 추가해야 합니다 아직 미완성이에요
	public List<Host_Content_Dto> getList(String type) throws Exception{
		
		Connection con = getConnection();
		String sql = "select * from host_content where host_content_category = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		ResultSet rs = ps.executeQuery();
		List<Host_Content_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			Host_Content_Dto HCdto = new Host_Content_Dto();
			HCdto.setHost_content_name(rs.getString("Host_content_name"));
			HCdto.setHost_content_cost(rs.getInt("Host_content_cost"));
			HCdto.setHost_content_no(rs.getInt("host_content_no"));
			HCdto.setHost_content_view_count(rs.getInt("host_content_view_count"));
			list.add(HCdto);
		}
		
		con.close();
		return list;
	}
	
	
	
	//중분류 컨텐츠 리스트를 불러오는 다오입니다
	//매개변수 : 카테고리(type으로 받습니다)와 (가격, 날짜선택, 최신, 조회수, 결제카운트 
 
	//반환값 : 카테고리에 해당하는 컨텐츠 리스트
	
	public List<Host_Content_Dto> getSelectList(String type, String middle_type) throws Exception{
		String sort="";
		switch(middle_type) {
		case "host_content_cost" : sort = "asc"; break;
		case "host_content_create_date" : sort = "desc"; break;
		case "host_content_view_count" : sort = "desc"; break;
		case "host_content_payment_count" : sort = "desc"; break;
		}
		
		Connection con = getConnection();
		String sql = "select * from host_content where host_content_category = "+type+" order by "+middle_type+" "+sort;
		PreparedStatement ps = con.prepareStatement(sql);
	
		ResultSet rs = ps.executeQuery();
		List<Host_Content_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			Host_Content_Dto HCdto = new Host_Content_Dto();
			HCdto.setHost_content_name(rs.getString("Host_content_name"));
			HCdto.setHost_content_cost(rs.getInt("Host_content_cost"));
			list.add(HCdto);
		}
		
		con.close();
		return list;
		
	}
	
	
// 	사진 삽입을 위한 	
//	 Sequence 생성명령입니다 --------------------------------------------------------
	public int host_content_sequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "select host_content_no_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}
	
//컨텐츠 상세 페이지에서 게시글의 정보를 불러오는 다오입니다
//	매개변수 host_content_number
//	반환 Host_Content_Dto
	public Host_Content_Dto getOneContent(int no) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from host_content where host_content_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		ResultSet rs = ps.executeQuery();
		
		
		Host_Content_Dto HCdto = new Host_Content_Dto();
		if(rs.next()) {
		HCdto.setHost_content_name(rs.getString("host_content_name"));
		HCdto.setHost_content_cost(rs.getInt("host_content_cost"));
		HCdto.setHost_id(rs.getString("host_id"));
		HCdto.setHost_content_info(rs.getString("host_content_info"));
		HCdto.setHost_content_start_date(rs.getString("host_content_start_date"));
		HCdto.setHost_content_last_date(rs.getString("host_content_last_date"));
		HCdto.setHost_content_location(rs.getString("host_content_location"));
		HCdto.setHost_content_ect_info(rs.getString("host_content_ect_info"));
		HCdto.setHost_content_qa(rs.getString("host_content_qa"));
		HCdto.setHost_content_ticket(rs.getInt("host_content_ticket"));
		HCdto.setHost_content_payment_count(rs.getInt("host_content_payment_count"));
		HCdto.setHost_content_view_count(rs.getInt("host_content_view_count"));
		HCdto.setHost_content_no(rs.getInt("host_content_no"));
		HCdto.setHost_content_category(rs.getString("host_content_category"));
		
		}
		
		con.close();
		return HCdto;
	}
	
//	--------------------------------조회수 증가------------------------------------
	 public void readCountUp(int no) throws Exception {
		 Connection con = getConnection();
		 
		 String sql = "update host_content set host_content_view_count = host_content_view_count + 1 where host_content_no =?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setInt(1, no);
		 
		 ps.executeUpdate();
		 
		 con.close();
		 
	 }
	 
	 //컨텐츠 삭제 Dao
	 //매개값 호스트 아이디, 글번호
	 //반환 없음
	 
	 public void host_content_delete(String host_id, int no) throws Exception{
		 Connection con = getConnection();
		 
		 String sql = "delete from host_content where host_id = ? and host_content_no = ?";
		 
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, host_id);
		 ps.setInt(2, no);
		 
		 ps.execute();
		 con.close();
	 }

}
