package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Content_Dao;

@WebServlet(urlPatterns = "/board/host_content_delete.do")
public class Host_Content_Delete_Servlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			//삭제 기능입니다
			Host_Content_Dao HCdao = new Host_Content_Dao();
			String host_id = req.getParameter("host_id"); //아이디를 받고
			int no = Integer.parseInt(req.getParameter("host_content_no")); //번호를 받아 지웁니다
			System.out.println(host_id);
			System.out.println(no);
			
			HCdao.host_content_delete(host_id, no);
			
			resp.sendRedirect(req.getContextPath()+"/board/host_confirm_list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
