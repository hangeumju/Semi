package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Change_Info_Dao;
import beans.Host_Change_Info_Dto;

@WebServlet(urlPatterns = "/info/Host_Change_Info.do")
public class Host_Change_Info_Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String host_id = (String)req.getSession().getAttribute("host_id");
			
			String host_email_id = req.getParameter("host_email_id");
			String host_email_domain = req.getParameter("host_email_domain");
			String host_interest = req.getParameter("host_interest");
			String host_post = req.getParameter("host_post");
			String host_basic_addr = req.getParameter("host_basic_addr");
			String host_extra_addr = req.getParameter("host_extra_addr");
			String host_bank_name = req.getParameter("host_bank_name");
			String host_bank_account = req.getParameter("host_bank_account");
			
			Host_Change_Info_Dto HCIdto = new Host_Change_Info_Dto();
			HCIdto.setHost_email_id(host_email_id);
			HCIdto.setHost_email_domain(host_email_domain);
			HCIdto.setHost_interest(host_interest);
			HCIdto.setHost_post(host_post);
			HCIdto.setHost_basic_addr(host_basic_addr);
			HCIdto.setHost_extra_addr(host_extra_addr);
			HCIdto.setHost_bank_name(host_bank_name);
			HCIdto.setHost_bank_account(host_bank_account);
			
			Host_Change_Info_Dao HCIdao = new Host_Change_Info_Dao();
			HCIdao.host_change_info(HCIdto);
			
			resp.sendRedirect("host_info");
			
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
