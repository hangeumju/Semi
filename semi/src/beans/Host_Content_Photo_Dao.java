package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Host_Content_Photo_Dao {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh22", "kh22");
		return con;
	}
	
	//사진입력 메소드입니다
	//매개변수 (사진3개 게시글 번호 )
	//반환값 없습니다
	public void host_content_photo_insert(Host_Content_Photo_Dto HCPdto) throws Exception{
		Connection con = getConnection();
		String sql = "insert into host_content_photo values(host_content_photo_seq.nextval, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, HCPdto.getHost_content_no());
		ps.setString(2, HCPdto.getHost_content_original_file());
		ps.setString(3, HCPdto.getHost_content_edit_file());
		
		ps.execute();
		con.close();
	}
	
	//사진 불러오기 메소드입니다
	//매개변수 : 게시글 번호
	//반환값 사진들
	public List<Host_Content_Photo_Dto> host_content_photo_getPhoto(Host_Content_Photo_Dto HCPdto) throws Exception{
		Connection con = getConnection();
		String sql = "select * from host_content_photo where host_content_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, HCPdto.getHost_content_no());
		
		ResultSet rs = ps.executeQuery();
		
		List<Host_Content_Photo_Dto> list = new ArrayList<>();
		
		while(rs.next()) {
			HCPdto.setHost_content_photo_no(rs.getInt("host_content_photo_no"));
			HCPdto.setHost_content_no(rs.getInt("host_content_no"));
			HCPdto.setHost_content_original_file(rs.getString("host_content_original_file"));
			HCPdto.setHost_content_edit_file(rs.getString("host_content_edit_file"));
			
			list.add(HCPdto);
		}
		
		con.close();
		return list;
	}
	
}


