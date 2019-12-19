package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Info_Dao;

@WebServlet(urlPatterns = "/login/users_login.do") // http://localhost:8080/semi/login/users_login.do 처리 서블릿
public class Users_Login_Servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String user_id = req.getParameter("user_id");
			String user_pw = req.getParameter("user_pw");
			
			//처리
			Users_Info_Dao ULdao = new Users_Info_Dao();
			boolean result = ULdao.users_login(user_id,user_pw);
			
			//출력
			if(result) { //로그인 성공시
				
//				session에 아이디와 권한을 저장
//				session.setAttribute("user_id", user_id);
//				req.getSession().setAttribute("user_id", user_id);
//				Users_Login_Dto ULdto = dao.get(user_id);
//				
//				
//				추가 : 사용자의 최종 로그인 시각을 수정 
//				dao.updateLastLogin(user_id);
				
				resp.sendRedirect("http://www.naver.com");
			}
			else { //로그인 실패시
//				error 메시지가 표시되는 로그인 화면으로 이동해라
//				resp.sendRedirect("login.jsp?error");
				resp.sendRedirect("http://www.google.com");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
