package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Content_History_Dao;
import beans.Content_History_Dto;
import beans.Users_Get_Dto;
import beans.Users_Info_Dao;

@WebServlet(urlPatterns = "/board/user_pay.do")
public class Users_pay_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			//받아오는 정보들
			String host_content_name = req.getParameter("host_content_name");// 호스트 컨텐츠 이름
			String host_name = req.getParameter("host_name");//호스트 이름
			String host_phone = req.getParameter("host_phone");//호스트 번호
			int host_content_no = Integer.parseInt(req.getParameter("host_content_no"));//호스트 컨텐츠 넘버
			String host_content_location = req.getParameter("host_content_location");//호스트 컨텐츠 위치
			int host_content_cost = Integer.parseInt(req.getParameter("host_content_cost"));//호스트 컨텐츠 가격
			int ticketing = Integer.parseInt(req.getParameter("ticketing"));//유저가 구매하려는 티켓수
			String start_date = req.getParameter("start_date");//유저가 원하는 날짜
			
			String user_id = (String) req.getSession().getAttribute("user_id");
			
			Users_Info_Dao DIdao = new Users_Info_Dao();
			Users_Get_Dto UGdto = DIdao.users_get(user_id);
			
			Content_History_Dto CHdto = new Content_History_Dto();
			System.out.println(UGdto.getUser_no());
			CHdto.setHost_history_no(host_content_no);
			CHdto.setUsers_history_no(UGdto.getUser_no());
			CHdto.setUsers_history_id(user_id);
			CHdto.setUser_qty(ticketing);
			CHdto.setUser_class_date(start_date);;
			
			Content_History_Dao CHdao = new Content_History_Dao();
			CHdao.users_history_pay(CHdto);
				
			resp.sendRedirect(req.getContextPath()+"/info/users_history.jsp");
			
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
