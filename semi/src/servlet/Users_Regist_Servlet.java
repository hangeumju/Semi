package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Regist_Dao;
import beans.Users_Regist_Dto;

@WebServlet(urlPatterns = "/join/users_regist.do")
public class Users_Regist_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1]회원가입창에서 사용자의 가입정보(파라미터)를 받아옵니다
			req.setCharacterEncoding("UTF-8");
			Users_Regist_Dto URdto = new Users_Regist_Dto();
			URdto.setUser_id(req.getParameter("user_id"));
			URdto.setUser_pw(req.getParameter("user_pw"));
			URdto.setUser_name(req.getParameter("user_name"));
			URdto.setUser_phone(req.getParameter("user_phone"));
			URdto.setUser_email_id(req.getParameter("user_email_id"));
			URdto.setUser_email_domain(req.getParameter("user_email_domain"));
			URdto.setUser_interest(req.getParameter("user_interest"));
			URdto.setUser_birth(req.getParameter("user_birth"));
			
//			[2]dao를 불러와 메소드 사용, 가입 처리를 합니다
			Users_Regist_Dao URdao = new Users_Regist_Dao();
			URdao.users_regist(URdto);
			
//			[3]결과 페이지로 이동합니다
			resp.sendRedirect("http://www.naver.com");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
