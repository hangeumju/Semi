package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;

@WebServlet(urlPatterns = "/info/host_change_pw.do")
public class Host_Change_PW_Servlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		req.setCharacterEncoding("UTF-8");
		String host_pw = req.getParameter("host_pw");
		String host_id = req.getParameter("host_id");
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		HIdao.host_change_password(host_id,host_pw);
		resp.sendRedirect("host_change_pw_result.jsp");
		
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
  }
}
