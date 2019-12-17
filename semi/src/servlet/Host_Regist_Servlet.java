package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Regist_Dao;
import beans.Host_Regist_Dto;

@WebServlet(urlPatterns = "/join/host_regist.do")
public class Host_Regist_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("utf-8");
			
			//다오와 디티오를 불러옵니다
			Host_Regist_Dao hdao = new Host_Regist_Dao();
			Host_Regist_Dto hdto = new Host_Regist_Dto();
			
			
			//파라미터를 받습니다
			hdto.setHost_id(req.getParameter("host_id"));
			hdto.setHost_pw(req.getParameter("host_pw"));
			hdto.setHost_name(req.getParameter("host_name"));
			hdto.setHost_phone(req.getParameter("host_phone"));
			hdto.setHost_email_id(req.getParameter("host_email_id"));
			hdto.setHost_email_domain(req.getParameter("host_email_domain"));
			hdto.setHost_interest(req.getParameter("host_interest"));
			hdto.setHost_post(req.getParameter("host_post"));
			hdto.setHost_basic_addr(req.getParameter("host_basic_addr"));
			hdto.setHost_extra_addr(req.getParameter("host_extra_addr"));
			hdto.setHost_bank_name(req.getParameter("host_bank_name"));
			hdto.setHost_bank_account(req.getParameter("host_bank_account"));
			
			//다오를 불러와 계산합니다
			hdao.host_regist(hdto);
			
			//로그인창으로 이동합니다
			resp.sendRedirect(req.getContextPath()+"/login/host_login.jsp");
			
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
