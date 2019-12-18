package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Change_Pw_Dao;

@WebServlet(urlPatterns = "/info2/users_change_pw.do")
public class Users_Change_Pw_Servlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		try {
			//수신
			req.setCharacterEncoding("UTF-8");
			String user_pw = req.getParameter("user_pw");
			String user_id =(String)req.getSession().getAttribute("user_id");
			
			//처리
			Users_Change_Pw_Dao UCPdao = new Users_Change_Pw_Dao();
			UCPdao.changePassword(user_id, user_pw);
			
			//이동
			resp.sendRedirect("users_change_pw_result.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
