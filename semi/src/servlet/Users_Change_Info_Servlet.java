package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Change_Info_Dto;
import beans.Users_Info_Dao;

@WebServlet(urlPatterns = "/info/users_change_info.do")
public class Users_Change_Info_Servlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//수신
			String user_id=(String) req.getSession().getAttribute("user_id");
			
			req.setCharacterEncoding("UTF-8");
			String user_phone = req.getParameter("user_phone");
			String user_email_id = req.getParameter("user_email_id");
			String user_email_domain = req.getParameter("user_email_domain");
			String user_interest = req.getParameter("user_Interest");
			
			
			//처리
			Users_Change_Info_Dto UCIdto = new Users_Change_Info_Dto();
			UCIdto.setUser_phone(user_phone);
			UCIdto.setUser_email_id(user_email_id);
			UCIdto.setUser_email_domain(user_email_domain);
			UCIdto.setUser_interest(user_interest);
			UCIdto.setUser_id(user_id);
			
			Users_Info_Dao UCIdao = new Users_Info_Dao();
			UCIdao.users_change_info(UCIdto);
			
			//이동
			resp.sendRedirect("users_info.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
