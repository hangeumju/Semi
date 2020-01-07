package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import beans.Host_Content_Dao;
import beans.Host_Content_Dto;
import beans.Host_Content_Photo_Dao;
import beans.Host_Content_Photo_Dto;

@WebServlet(urlPatterns = "/board/host_content_produce.do")
public class Host_content_Produce_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			

			MultipartRequest mRequest = new MultipartRequest(req, "D:\\upload\\kh2\\home", 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());

			
			ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
			String saveDir = context.getRealPath(req.getContextPath()+"/image"); //절대경로를 가져옴
			
			
			
			//콘텐츠 생성 다오 및 디티오 받기
			String host_id = (String)req.getSession().getAttribute("host_id");
			Host_Content_Dao HCdao = new Host_Content_Dao();
			Host_Content_Dto HCdto = new Host_Content_Dto();
			Host_Content_Photo_Dao HCPdao = new Host_Content_Photo_Dao();
			String host_post = mRequest.getParameter("host_post");
			String host_basic_addr = mRequest.getParameter("host_basic_addr");
			String host_extra_addr = mRequest.getParameter("host_extra_addr");
			
			String location = host_post +" "+ host_basic_addr +" "+ host_extra_addr;
			String host_content_QA = mRequest.getParameter("host_content_QA");
			
			///board/host_content_list.jsp 에서 보내는 변수를 받는다
			HCdto.setHost_id(mRequest.getParameter("host_id"));
			HCdto.setHost_content_category(mRequest.getParameter("host_content_category"));
			HCdto.setHost_content_cost(Integer.parseInt(mRequest.getParameter("host_content_cost")));
			HCdto.setHost_content_name(mRequest.getParameter("host_content_name"));
			HCdto.setHost_content_ticket(Integer.parseInt(mRequest.getParameter("host_content_ticket")));
			HCdto.setHost_content_info(mRequest.getParameter("host_content_info"));
			HCdto.setHost_content_start_date(mRequest.getParameter("start_date"));
			HCdto.setHost_content_last_date(mRequest.getParameter("last_date"));
			HCdto.setHost_content_location(location);
			HCdto.setHost_content_ect_info(mRequest.getParameter("host_content_ect_info"));
			HCdto.setHost_content_qa(mRequest.getParameter("host_content_QA"));
			
			int no = HCdao.host_content_sequence();
			
			HCdto.setHost_content_no(no);
			
			HCdao.host_contentproduce(HCdto);
			
			for(int i = 1; i < 4; i++) {
			File file = mRequest.getFile("host_content_file"+i);
			Host_Content_Photo_Dto HCPdto = new Host_Content_Photo_Dto();
			HCPdto.setHost_content_no(no);
			HCPdto.setHost_content_original_file(mRequest.getOriginalFileName("host_content_file"+i));
			HCPdto.setHost_content_edit_file(mRequest.getFilesystemName("host_content_file"+i));
			//파일다오를 통해 입력받은 컨텐츠를 생성한다 이걸 3번한다
			HCPdao.host_content_photo_insert(HCPdto);
			}

			
			
			//아직 보내는 곳은 미정입니다
			resp.sendRedirect(req.getContextPath()+"/board/host_confirm_list.jsp");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}		
	}
}
