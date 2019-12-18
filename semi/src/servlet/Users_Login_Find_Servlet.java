package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Login_Find_Dao;
//유저 아이디 찾기 서블릿
@WebServlet(urlPatterns = "/login/users_login_find.do")
public class Users_Login_Find_Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			try {
				//수신 
				req.setCharacterEncoding("UTF-8");
				String user_name = req.getParameter("user_name");
				String user_phone = req.getParameter("user_phone");
				
				//처리
				Users_Login_Find_Dao ULFdao = new Users_Login_Find_Dao();
				String user_id = ULFdao.find(user_name, user_phone);
				
				//이동
				if(user_id == null) { //id가 없으면
					 resp.sendRedirect("users_login_find_result.jsp");
				}
				else {
					resp.sendRedirect("users_login_find_result.jsp?user_id="+user_id);
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
				
			}
	}
	

}
