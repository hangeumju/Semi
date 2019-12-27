package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Users_Info_Dao;

@WebServlet(urlPatterns = "/info/users_exit.do")
public class Users_Exit_Servlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1]탈퇴 시킬 회원의 id를 세션에서 받아옵니다
			HttpSession session = req.getSession();
			String user_id = (String)session.getAttribute("user_id");
			
//			[2]탈퇴와 로그아웃 처리를 합니다
			//로그아웃 처리(세션에서 id삭제)
			req.getSession().removeAttribute("user_id"); //id 항목 삭제			
			
			//탈퇴 처리
			Users_Info_Dao UEdao = new Users_Info_Dao();
			UEdao.users_exit(user_id);
			
			//메인 페이지로 이동
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
