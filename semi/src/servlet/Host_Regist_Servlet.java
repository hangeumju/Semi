package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Content_Photo_Dao;
import beans.Host_Info_Dao;
import beans.Host_Info_Dto;

@WebServlet(urlPatterns = "/join/host_regist.do")
public class Host_Regist_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("utf-8");
			
			//다오와 디티오를 불러옵니다
			Host_Info_Dao HIdao = new Host_Info_Dao();
	
			Host_Info_Dto HIdto = new Host_Info_Dto();
			
			
			//파라미터를 받습니다
			HIdto.setHost_id(req.getParameter("host_id"));
			HIdto.setHost_pw(req.getParameter("host_pw"));
			HIdto.setHost_name(req.getParameter("host_name"));
			HIdto.setHost_phone(req.getParameter("host_phone"));
			HIdto.setHost_email_id(req.getParameter("host_email_id"));
			HIdto.setHost_email_domain(req.getParameter("host_email_domain"));
			HIdto.setHost_interest(req.getParameter("host_interest"));
			HIdto.setHost_post(req.getParameter("host_post"));
			HIdto.setHost_basic_addr(req.getParameter("host_basic_addr"));
			HIdto.setHost_extra_addr(req.getParameter("host_extra_addr"));
			HIdto.setHost_bank_name(req.getParameter("host_bank_name"));
			HIdto.setHost_bank_account(req.getParameter("host_bank_account"));
			
			//다오를 불러와 계산합니다
			HIdao.host_regist(HIdto);
			
			
			
			//로그인창으로 이동합니다
			resp.sendRedirect(req.getContextPath()+"/login/host_login.jsp");
			
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
