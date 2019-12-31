package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Host_Info_Dao;
@WebServlet (urlPatterns = "/login/host_login.do")

public class Host_Login_Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String host_id = req.getParameter("id");
			String host_pw = req.getParameter("pw");
			
			Host_Info_Dao HIdao = new Host_Info_Dao();
			boolean result = HIdao.host_login(host_id,host_pw);
			
			//최종 로그인 시간 변경
			
			String isHost = (String) req.getSession().getAttribute("user_id");
			
			if(result) {
				req.getSession().setAttribute("host_id", host_id);
				
				if(isHost != null) {
					HIdao.updatehost_lastlogin(host_id);
					req.getSession().removeAttribute("user_id");
				}

				//Host_Info_Dto HIdto = HIdao.get(host_id);//id瑜� �씠�슜�븯�뿬 �쟾泥� �쉶�썝�젙蹂대�� 遺덈윭�삩�떎.

				resp.sendRedirect(req.getContextPath()+"/host/host_submain.jsp");
			}
			else {
				resp.sendRedirect("host_login.jsp?error");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
