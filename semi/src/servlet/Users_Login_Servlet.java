package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Info_Dao;
import beans.Users_Login_Dto;

@WebServlet(urlPatterns = "/login/users_login.do") // http://localhost:8080/semi/login/users_login.do 처리 서블릿
public class Users_Login_Servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String user_id = req.getParameter("id");
			String user_pw = req.getParameter("pw");
			
			//처리
			Users_Info_Dao ULdao = new Users_Info_Dao();
			boolean result = ULdao.users_login(user_id, user_pw);
			String isHost = (String) req.getSession().getAttribute("host_id");
			//출력
			if(result) { //로그인 성공시
				
//				session에 아이디와 권한을 저장
				req.getSession().setAttribute("user_id", user_id);			
				if(isHost!=null) {
				req.getSession().removeAttribute("host_id");
				}
//				추가 : 사용자의 최종 로그인 시각을 수정 
				ULdao.users_update_last_login(user_id);
				
//				resp.sendRedirect("http://www.naver.com"); 경로 임시인덱스로 연결해놓음
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
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
