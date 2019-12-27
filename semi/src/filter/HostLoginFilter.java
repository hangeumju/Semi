package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//로그인 필터 
//판단기준 : session에 host_id가 있으면 통과, 없으면 로그인페이지로 강제이동
//주의 : 비회원이 접근 가능한 페이지는 검사하면 안됨
//@WebFilter(urlPatterns = {"/admin/*","/member/change_info.jsp","/member/change_info.do", "/member/change_pw.do","/member/change_pw.jsp", "/member/check.do","/member/check.jsp", "/member/exit.do", 
//		"/member/find.do", "/member/logout.do", "/member/info.jsp", "/member/change_pw_result"})
public class HostLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		boolean result = req.getSession().getAttribute("host_id") != null;

		if (result) {
			chain.doFilter(request, response);
		}
		else {
			String context = req.getContextPath();
			resp.sendRedirect(context+"/index.jsp");
		}
	}
}
