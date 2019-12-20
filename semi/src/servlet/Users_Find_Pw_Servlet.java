package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Info_Dao;
import semi.util.StringUtil;

@WebServlet(urlPatterns = "/login/users_find_pw.do")
public class Users_Find_Pw_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1]비밀번호 찾기 창에서 사용자의 아이디, 이름, 전화번호를 받아옵니다.
			req.setCharacterEncoding("UTF-8");
			String user_name = req.getParameter("user_name");
			String user_phone = req.getParameter("user_phone");
			
//			[2]정보가 맞는지 확인합니다
			Users_Info_Dao UIdao = new Users_Info_Dao();
			String user_id = UIdao.users_find(user_name, user_phone);
			
			
			//이동
			if(user_id == null) { //입력값과 일치하는 id가 없으면
				 resp.sendRedirect("users_find_pw_result.jsp");
			}
			else {
				resp.sendRedirect("users_find_pw_result.jsp?user_id="+user_id);
			}
			
			
//			
////			[3]정보가 맞으면 임시비밀번호를 발급 아니면 메세지띄우기
//			if(user_id != null) { //맞으면
////				- 처리(임시 비밀번호를 생성 + 데이터베이스 수정)
////				- 임시 비밀번호는 10자리로 생성(알파벳+숫자+특수문자)
//				String user_pw = StringUtil.generateRandomString(10);
////				생성한 임시비밀번호를 해당 회원 정보로 업데이트
//				UIdao.users_change_password(user_id, user_pw);
//				
////				[3]임시비밀번호 보여주는 페이지로 이동
//				resp.sendRedirect("users_find_pw_result.jsp");			
//				
//			}
//			else {
//				resp.sendRedirect("http://www.google.com");
//				
//			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}
}
