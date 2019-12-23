package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Content_Dao;
import beans.Host_Content_Dto;

@WebServlet(urlPatterns = "/board/host_content_edit.do")
public class Host_Content_Edit_Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		Host_Content_Dto HCdto = new Host_Content_Dto();
		
		HCdto.setHost_content_no(Integer.parseInt(req.getParameter("host_content_no")));
		HCdto.setHost_content_ticket(Integer.parseInt(req.getParameter("host_content_ticket")));
		HCdto.setHost_content_ect_info(req.getParameter("host_content_ect_info"));
		HCdto.setHost_content_location(req.getParameter("host_content_location"));
		HCdto.setHost_content_name(req.getParameter("host_content_name"));
		HCdto.setHost_content_qa(req.getParameter("host_content_qa"));
		
		Host_Content_Dao HCdao = new Host_Content_Dao();
		HCdao.host_content_edit(HCdto);
		
		resp.sendRedirect("host_content_detail_view.jsp?host_content_no="+HCdto.getHost_content_no());
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
