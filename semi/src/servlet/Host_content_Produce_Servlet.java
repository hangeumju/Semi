package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_ContentProduce_Dao;
import beans.Host_ContentProduce_Dto;

@WebServlet(urlPatterns = "/board/host_content_list.do")
public class Host_content_Produce_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			
			//콘텐츠 생성 다오 및 디티오 받기
			Host_ContentProduce_Dao HCdao = new Host_ContentProduce_Dao();
			Host_ContentProduce_Dto HCdto = new Host_ContentProduce_Dto();
			
			///board/host_content_list.jsp 에서 보내는 변수를 받는다
			HCdto.setHost_id(req.getParameter("host_id"));
			HCdto.setHost_content_category(req.getParameter("host_content_category"));
			HCdto.setHost_content_cost(Integer.parseInt(req.getParameter("host_content_cost")));
			HCdto.setHost_content_name(req.getParameter("host_content_name"));
			HCdto.setHost_content_ticket(Integer.parseInt(req.getParameter("host_content_ticket")));
			HCdto.setHost_content_info(req.getParameter("host_content_info"));
			HCdto.setHost_content_date(req.getParameter("host_content_date"));
			HCdto.setHost_content_location(req.getParameter("host_content_location"));
			HCdto.setHost_content_ect_info(req.getParameter("host_content_ect_info"));
			HCdto.setHost_content_original_file(req.getParameter("host_content_file"));
			HCdto.setHost_content_edit_file(req.getParameter("host_content_file"));
			HCdto.setHost_content_qa(req.getParameter("host_content_qa"));
			
			//파일다오를 통해 입력받은 컨텐츠를 생성한다
			HCdao.host_contentproduce(HCdto);
			
			//아직 보내는 곳은 미정입니다
			resp.sendRedirect("#");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
