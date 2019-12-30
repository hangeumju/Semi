package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


// 컨텐츠 생성 다오 입니다
// - host가 컨텐츠 (클래스) 생성시 사용하는 method 저장 해놓은 Dao 입니다
public class Host_Content_Dao {
	
	//생성 통로입니다
private static DataSource source;
	
	static {
		try {
			InitialContext ctx = new InitialContext();//[1]
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} 
		catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}
	
	
	//컨텐츠 생성 입니다
	//매개변수 : 카테고리, 참여비용, 컨텐츠 이름, 판매수량, 소개,  위치, 기타정보안내, 예약차트, 원본파일, 수정파일, 컨텐츠QA
	//나올값 : void 없음
	
	public void host_contentproduce(Host_Content_Dto HCdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into host_content(host_content_no, "
				+ "host_id, "
				+ "host_content_category, "
				+ "host_content_cost, "
				+ "host_content_name, "
				+ "host_content_ticket, "
				+ "host_content_info, "
				+ "host_content_start_date, "
				+ "host_content_last_date, "
				+ "host_content_location, "
				+ "host_content_ect_info, "
				+ "host_content_qa, "
				+ "host_content_approval, "
				+ "host_content_create_date, "
				+ "host_content_view_count, "
				+ "host_content_payment_count, "
				+ "groupno) values("
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '보류', sysdate, 0, 0, ?)";
		
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
		ps.setInt(13, HCdto.getHost_content_no());
		
		ps.execute();
		con.close();
	}
	
	
	
	//전체 컨텐츠 리스트를 불러오는 다오입니다
	//매개변수 : 카테고리(아직 미구현했습니다) 
	//반환값 : 카테고리에 해당하는 컨텐츠 리스트
	//아직 사진을 못넣었어요 추가해야 합니다 아직 미완성이에요
	public List<Host_Content_Dto> getList(String category, int start, int finish) throws Exception{
		
		Connection con = getConnection();
		String sql = "select * from "
				+ "(select rownum rn, A.* "
				+ " from( "
				+ " select * from host_content "
				+ " where host_content_category = ?"
				+ " connect by prior host_content_no=superno "
				+ " start with superno is null "
				+ " order siblings by groupno desc, host_content_no asc "
				+ " ) "
				+ " A) where host_content_approval='승인' and rn between ? and ?";
						
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, category);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		List<Host_Content_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			Host_Content_Dto HCdto = new Host_Content_Dto();
			HCdto.setHost_content_name(rs.getString("Host_content_name"));
			HCdto.setHost_content_cost(rs.getInt("Host_content_cost"));
			HCdto.setHost_content_no(rs.getInt("host_content_no"));
			HCdto.setHost_content_view_count(rs.getInt("host_content_view_count"));
			HCdto.setHost_content_category(rs.getString("host_content_category"));
			HCdto.setHost_content_ticket(rs.getInt("host_content_ticket"));
			list.add(HCdto);
		}
		
		con.close();
		return list;
	}
	
	
	//호스트가 자기의 리스트를 확인하는 다오
	//매개변수 호스트아이디
public List<Host_Content_Dto> getList2(String host_id, int start, int finish) throws Exception{
		
		Connection con = getConnection();
		String sql = "select * from "
				+ "(select rownum rn, A.* "
				+ " from( "
				+ " select * from host_content "
				+ " where host_id = ?"
				+ " connect by prior host_content_no=superno "
				+ " start with superno is null "
				+ " order siblings by groupno desc, host_content_no asc "
				+ " ) "
				+ " A) where rn between ? and ?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		
		ResultSet rs = ps.executeQuery();
		List<Host_Content_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			Host_Content_Dto HCdto = new Host_Content_Dto();
			HCdto.setHost_content_name(rs.getString("Host_content_name"));
			HCdto.setHost_content_cost(rs.getInt("Host_content_cost"));
			HCdto.setHost_content_no(rs.getInt("host_content_no"));
			HCdto.setHost_content_view_count(rs.getInt("host_content_view_count"));
			HCdto.setHost_content_category(rs.getString("host_content_category"));
			HCdto.setHost_content_approval(rs.getString("host_content_approval"));
			HCdto.setHost_content_ticket(rs.getInt("host_content_ticket"));
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
		 
		 String sql = "delete from host_content where host_id = ? and host_content_no = ? ";
		 
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, host_id);
		 ps.setInt(2, no);
		 
		 ps.execute();
		 con.close();
	 }

	//컨텐츠 수정 Dao 입니다.
	public void host_content_edit(Host_Content_Dto HCdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "update host_content set host_content_ticket = ?, "
				+ " host_content_ect_info = ?, host_content_location = ?, "
				+ " host_content_name = ?, host_content_qa = ? "
				+ " where host_content_no =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,HCdto.getHost_content_ticket());
		ps.setString(2, HCdto.getHost_content_ect_info());
		ps.setString(3, HCdto.getHost_content_location());
		ps.setString(4, HCdto.getHost_content_name());
		ps.setString(5, HCdto.getHost_content_qa());
		ps.setInt(6, HCdto.getHost_content_no());
		
		ps.execute();
		con.close();
	
	}
	
	//단일조회 Dao
	public Host_Content_Dto getOneHost(int host_content_no) throws Exception {
		Connection con = getConnection();
		String sql = "select * from host_content where host_content_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, host_content_no);
		
		ResultSet rs = ps.executeQuery();
		Host_Content_Dto HCdto = new Host_Content_Dto();
		
		if(rs.next()) {
			//이름, 아이디, 전화번호, 이메일, 주소를 받습니다
			int host_content_no1 = rs.getInt("host_content_no");
			String host_id = rs.getString("host_id");
			String host_content_category = rs.getString("host_content_category");
			int host_content_cost = rs.getInt("host_content_cost");
			String host_content_name = rs.getString("host_content_name");
			int host_content_ticket = rs.getInt("host_content_ticket");
			String host_content_info = rs.getString("host_content_info");
			String host_content_start_date = rs.getString("host_content_start_date");
			String host_content_last_date = rs.getString("host_content_last_date");
			String host_content_location = rs.getString("host_content_location");
			String host_content_ect_info = rs.getString("host_content_ect_info");
			String host_content_qa = rs.getString("host_content_qa");
			String host_content_approval = rs.getString("host_content_approval");
			String host_content_Create_date = rs.getString("host_content_Create_date");
			int host_content_view_count = rs.getInt("host_content_view_count");
			int host_content_payment_count = rs.getInt("host_content_payment_count");
			
			/*
			 * int groupno = rs.getInt("groupno"); 
			 * int superno = rs.getInt("superno"); 
			 * int depth = rs.getInt("depth");
			 */

			HCdto.setHost_content_no(host_content_no1);
			HCdto.setHost_id(host_id);
			HCdto.setHost_content_category(host_content_category);
			HCdto.setHost_content_cost(host_content_cost);
			HCdto.setHost_content_name(host_content_name);
			HCdto.setHost_content_ticket(host_content_ticket);
			HCdto.setHost_content_info(host_content_info);
			HCdto.setHost_content_start_date(host_content_start_date);
			HCdto.setHost_content_last_date(host_content_last_date);
			HCdto.setHost_content_location(host_content_location);
			HCdto.setHost_content_ect_info(host_content_ect_info);
			HCdto.setHost_content_qa(host_content_qa);
			HCdto.setHost_content_approval(host_content_approval);
			HCdto.setHost_content_Create_date(host_content_Create_date);
			HCdto.setHost_content_view_count(host_content_view_count);
			HCdto.setHost_content_payment_count(host_content_payment_count);
			
			
		} else {
			HCdto = null;
		}

		con.close();
		return HCdto;
		}
	

	//결제 카운트 증가 및 티켓 수량 감소
	//매개변수 티켓 갯수, 해당 컨텐츠 번호 
	//반환 없음
	public boolean content_quantity_reduction(int ticketing, int host_content_no) throws Exception{
		Connection con = getConnection();
		String sql = "update host_content set "
				+ " host_content_payment_count = host_content_payment_count + 1, "
				+ " host_content_ticket =  host_content_ticket - ? where host_content_no = ?";

		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ticketing);
		ps.setInt(2, host_content_no);
		
		ResultSet rs = ps.executeQuery();
		
		boolean result = rs.next();
		con.close();
		return result;
		
	}
	


	// 차트 검색어 받기
	public List<Host_Content_Dto> search(String type, String keyword,int start, int finish)throws Exception{
		Connection con = getConnection();
		String sql = "select * from( "
				+" select rownum rn, A.* from ( "
				+ "select * from host_content "
				+ " where "+type+" like '%'||?||'%' "
				+ " connect by prior host_content_no = superno "
				+ " start with superno is null "
				+ " order siblings by groupno desc, host_content_no asc "
				+ " )A "
			+ " ) where host_content_approval='승인' and rn between ? and ? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		
		ResultSet rs = ps.executeQuery();
		List<Host_Content_Dto> list = new ArrayList<>();
		while(rs.next()) { //데이터의 갯수만큼 반복합니다
			Host_Content_Dto HCdto = new Host_Content_Dto();
			
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
			HCdto.setGroupno(rs.getInt("groupno"));
			HCdto.setSuperno(rs.getInt("superno"));
			HCdto.setDepth(rs.getInt("depth"));
			
			list.add(HCdto);
		}
		con.close();		
		return list;
	}
	
	//컨텐츠 리스트 확인용 카운트
	public int getCount(String type, String keyword, String category)throws Exception{
		Connection con = getConnection();
		boolean isSearch = type != null && keyword != null ;
		String sql = "select count(*) from host_content ";
		if(isSearch) {
			sql += " where "+type+" like '%'||?||'%'";
		}
		else {
			sql += " where host_content_category = ?";
		}
		
		PreparedStatement ps = con.prepareStatement(sql);
		if(isSearch) {
			ps.setString(1, keyword);
			
		}
		else {
			ps.setString(1, category);
		}
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		return count;
	}
	
	public int getCount(String type, String keyword)throws Exception{
	      Connection con = getConnection();
	      boolean isSearch = type != null && keyword != null ;
	      String sql = "select count(*) from host_content ";
	      if(isSearch) {
	         sql += " where "+type+" like '%'||?||'%'";
	      }
	      
	      PreparedStatement ps = con.prepareStatement(sql);
	      if(isSearch) {
	         ps.setString(1, keyword);
	      }
	      ResultSet rs = ps.executeQuery();
	      rs.next();
	      int count = rs.getInt(1);
	      
	      con.close();
	      return count;
	   }
	
	//호스트가 자기걸 확인하는 카운트
	public int getCount(String host_id)throws Exception{
		Connection con = getConnection();
		
		String sql = "select count(*) from host_content where host_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, host_id);

		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		return count;
	}
	
	// 호스트 결제 예약 리스트
	public List<Host_Content_Dto> reservation_list(int start, int finish)throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from host_content "
				+ "connect by prior host_content_no=superno "
				+ "start with superno is null "
				+ "order siblings by groupno desc, host_content_no asc"
			+ ")A"
		+ ") where host_content_approval='승인' and rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<Host_Content_Dto> list2 = new ArrayList<>();
		
		while(rs.next()) { //데이터의 갯수만큼 반복합니다
			int rn = rs.getInt("rn");
			Host_Content_Dto HCdto = new Host_Content_Dto();
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

			list2.add(HCdto);
		}
		con.close();		
		return list2;
	}
	
	public List<Host_Content_Dto> mainViewTop5() throws Exception{
		Connection con = getConnection();
		String sql = "select * from (select rownum rn, E.* from (select * from host_content where HOST_CONTENT_APPROVAL = '승인' order by host_content_view_count desc) E) where rn between 1 and 5";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<Host_Content_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			Host_Content_Dto HCdto = new Host_Content_Dto();
			HCdto.setHost_content_no(rs.getInt("host_content_no"));
			HCdto.setHost_content_category(rs.getString("host_content_category"));
			HCdto.setHost_content_name(rs.getString("host_content_name"));
			HCdto.setHost_content_cost(rs.getInt("host_content_cost"));
			HCdto.setHost_content_ticket(rs.getInt("host_content_ticket"));
			
			list.add(HCdto);
		}
		
		con.close();
		return list;
	}
	


	public Host_Content_Dto get(int host_content_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from host_content where host_content_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, host_content_no);
		
		ResultSet rs = ps.executeQuery();
		
		Host_Content_Dto HCdto = new Host_Content_Dto();
		if(rs.next()) {
			
			HCdto.setHost_content_category(rs.getString("host_content_category"));
			HCdto.setHost_id(rs.getString("host_id"));
			HCdto.setHost_content_no(rs.getInt("host_content_no"));
			
		}
		
		con.close();
		return HCdto;
	}
	
}

