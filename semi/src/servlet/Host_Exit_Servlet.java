package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;

@WebServlet(urlPatterns = "/info/host_exit.do")
public class Host_Exit_Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			
		String host_id = (String)req.getSession().getAttribute("host_id");
		req.getSession().removeAttribute("host_id");
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		HIdao.exit(host_id);
		
		resp.sendRedirect("host_exit_result.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
