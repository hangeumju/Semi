package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Change_Info_Dao;

//비밀번호 확인 서블릿
@WebServlet(urlPatterns = "/info/users_check.do")
public class Users_Check_servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//수신
			String user_id = (String)req.getSession().getAttribute("user_id");
			String user_pw = req.getParameter("user_pw");
			String go = req.getParameter("go");
//			go= /info/users_change_pw.jsp or /info/users_change_info.jsp 
			
			//처리
			Users_Change_Info_Dao UCIdao = new Users_Change_Info_Dao();
			boolean result = UCIdao.login(user_id,user_pw);
			
			//이동
			if(result) {//성공시
				resp.sendRedirect(req.getContextPath()+go);
			}
			else {//실패시
				resp.sendRedirect("users_check.jsp?error");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
