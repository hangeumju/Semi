package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users_Review_Dao;
import beans.Users_Review_Dto;

@WebServlet(urlPatterns = "/board/users_review_regist.do")
public class Users_Review_Regist_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1] 리뷰작성페이지에서 파라미터를 받아옵니다
			req.setCharacterEncoding("UTF-8");
			Users_Review_Dto URdto = new Users_Review_Dto();

			URdto.setReview_writer(req.getParameter("review_writer"));
			URdto.setContent_original_no(Integer.parseInt(req.getParameter("content_original_no")));
			URdto.setReview_content(req.getParameter("review_content"));
			URdto.setReview_date(req.getParameter("review_date"));
			
			String login = req.getParameter("review_writer");
			boolean isLogin = login != null;
//			[2]dao를 불러와 users_review_regist 사용, 리뷰 작성 처리를 합니다
			Users_Review_Dao URdao = new Users_Review_Dao();
			if(!isLogin) {
			URdao.users_review_regist(URdto);
			resp.sendRedirect(req.getContextPath()+"/board/host_content_detail_view.jsp?host_content_no="+ URdto.getContent_original_no());
			} 
			
//			[3]해당 상품 페이지로 다시 이동합니다
			else {
			resp.sendRedirect(req.getContextPath()+"/board/host_content_detail_view.jsp?host_content_no="+ URdto.getContent_original_no());
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
