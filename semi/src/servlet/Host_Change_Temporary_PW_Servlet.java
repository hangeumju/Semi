package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;
import semi.util.StringUtil;

@WebServlet(urlPatterns = "/info/host_change_temporary_pw.do")
public class Host_Change_Temporary_PW_Servlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		req.setCharacterEncoding("UTF-8");
		String host_id = req.getParameter("host_id");
		String host_pw = StringUtil.generateRandomString(8);
		
		Host_Info_Dao HIdao= new Host_Info_Dao();
		HIdao.host_change_temporary_pw(host_id, host_pw);
		
		resp.sendRedirect("host_change_temporary_pw.jsp?host_pw="+host_pw);	
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
		}
	}
}
