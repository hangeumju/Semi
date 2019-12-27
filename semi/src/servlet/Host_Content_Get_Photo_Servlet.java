package servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import beans.Host_Content_Photo_Dao;
import beans.Host_Content_Photo_Dto;

@WebServlet(urlPatterns = "/board/download.do")
public class Host_Content_Get_Photo_Servlet extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
//         계획:
//         [1]파라미터를 받는다 (no)
         int no = Integer.parseInt(req.getParameter("no"));
         
//         [2]no 에 대한 파일정보를 불러와야 한다(단일조회)
         Host_Content_Photo_Dao HCPdao = new Host_Content_Photo_Dao();
         Host_Content_Photo_Dto HCPdto = HCPdao.host_content_photo_getPhoto1(no);
         
//         [3]실제 파일을 읽어들인다
         File target = new File("D:\\4. JAVA\\upload\\home", HCPdto.getHost_content_original_file());
         byte[] data = FileUtils.readFileToByteArray(target);
         
//         [4]읽어들인 파일 내용을 사용자에게 전송한다
//            -image/png, image/jpg, image/gif 와 같이 할 경우 이미지란 뜻
//            -application/octet-stream 으로 설정할 경우 "다운로드"받으란 뜻
         
//         resp.setContentType("application/octet-stream; cjarset=utf-8"); 아래와 같은명령
         resp.setHeader("Content-type", "image/png, image/jpg, image/gif; charset=utf-8"); 
         resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(HCPdto.getHost_content_original_file(), "UTF-8")+"\"");
         resp.setHeader("Content-Length", String.valueOf(HCPdto.getHost_content_original_file()));
//         resp.setHeader("Content-Length", ""+fdto.getFilesize()); 스트링으로 만들기
//         resp에 존재하는 outputstream으로 불러온 파일을 전송(파일 byte 입출력과 유사)
         resp.getOutputStream().write(data);
         
         
      } 
      catch (Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }         
   }
}