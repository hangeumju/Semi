package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Info_Dao;
import semi.util.StringUtil;

@WebServlet(urlPatterns = "/info/users_spare_pw.do")
public class Users_Spare_Pw_Servlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1]id를 수신합니다
			req.setCharacterEncoding("UTF-8");
			String user_id = req.getParameter("user_id");
			
//			[2] 처리(임시 비밀번호를 생성 + 데이터베이스 수정)
//			- 임시 비밀번호는 10자리로 생성(알파벳+숫자+특수문자)
			String user_pw = StringUtil.generateRandomString(10);
//			생성한 임시비밀번호를 해당 회원 정보로 업데이트
			Users_Info_Dao UIdao = new Users_Info_Dao();
			UIdao.users_change_password(user_id, user_pw);
			
//			[3]임시비밀번호 보여주는 페이지로 이동
			resp.sendRedirect("users_spare_result.jsp");
			
		} 
		catch (Exception e) {
			
		}
	}

}
