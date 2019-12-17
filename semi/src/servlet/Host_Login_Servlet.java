package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Login_Dao;
@WebServlet (urlPatterns = "/login/host_login.do")

public class Host_Login_Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String id = req.getParameter("host_id");
			String pw = req.getParameter("host_pw");
			
			Host_Login_Dao hldao = new Host_Login_Dao();
			boolean result = hldao.host_login(id,pw);
			
			if(result) {
				resp.sendRedirect("http://www.naver.com");
			}
			else {
				resp.sendRedirect("http://www.google.com");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
