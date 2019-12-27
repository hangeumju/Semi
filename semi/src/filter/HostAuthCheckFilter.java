package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import beans.Host_Content_Dao;
import beans.Host_Content_Dto;


public class HostAuthCheckFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		목표 관리자 이거나 본인글인 경우만 통과시키고 나머지는 403 송출
//		대상 : 게시글 수정, 삭제
//		대상들의 특징
//		-반드시 파라미터에 no가 존재한다
//		계획
//		-파라미터에 no를 꺼내서 게시글 정보를 불러오고 세션에서 사용자 정보를 불러온다
//		-검사후 통과/거절을 결정
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp =(HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		try {
		int host_content_no = Integer.parseInt(request.getParameter("host_content_no"));
		
		Host_Content_Dao HCdao = new Host_Content_Dao();
		Host_Content_Dto dto = HCdao.get(host_content_no);
		
		String id = dto.getHost_id();
		
		String hostid = (String)session.getAttribute("host_id");
		
		
		boolean isMine = hostid.equals(id);
		
		if(isMine) {
			chain.doFilter(request, response);
			
		}
		else {
			resp.sendError(403);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
