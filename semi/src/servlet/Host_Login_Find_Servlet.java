package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;


@WebServlet(urlPatterns = "/login/host_login_find.do")
public class Host_Login_Find_Servlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		req.setCharacterEncoding("UTF-8");
		String host_name = req.getParameter("host_name");
		String host_phone = req.getParameter("host_phone");
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		String host_id = HIdao.host_login_find(host_name,host_phone);
		if(host_id == null) {
			resp.sendRedirect("host_login_find_result.jsp");
		}
		else {
			resp.sendRedirect("host_login_find_result.jsp?host_id="+host_id);
		}
	}
	catch(Exception e){
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
