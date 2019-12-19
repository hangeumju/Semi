package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;


@WebServlet(urlPatterns = "/info/host_check.do")
public class Host_Check_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String host_id = (String)req.getSession().getAttribute("host_id");
		String host_pw = req.getParameter("host_pw");
		String go = req.getParameter("go");
		
		//처리
		Host_Info_Dao HIdao = new Host_Info_Dao();
		boolean result = HIdao.host_login(host_id,host_pw);
		
		//이동
		if(result) {//성공시
			resp.sendRedirect(req.getContextPath()+go);
		}
		else {//실패시
			resp.sendRedirect("host_check.jsp?error");
			
		}
	}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
