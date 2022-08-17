package notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemJoinOkCommand;

@WebServlet("*.no")
public class NoticeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("noticeList")) {
			command = new NoticeListCommand();
			command.execute(request, response); 
			viewPaged += "/board/notice/noticeList.jsp";
		}
		else if(com.equals("noticeInput")) {
			viewPaged += "/board/notice/noticeInput.jsp";
		}
		else if(com.equals("noticeInputOk")) {
			command = new NoticeInputOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("noticeSearch")) {
			command = new NoticeSearchCommand();
			command.execute(request, response); 
			viewPaged += "/board/notice/noticeSearch.jsp";
		}
		else if(com.equals("noticeContent")) {
			command = new NoticeContentCommand();
			command.execute(request, response); 
			viewPaged += "/board/notice/noticeContent.jsp";
		} 
		else if(com.equals("noticeDeleteOk")) {
			command = new NoticeDeleteOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		else if(com.equals("noticeUpdate")) {
			command = new NoticeUpdateCommand();
			command.execute(request, response); 
			viewPaged += "/board/notice/noticeUpdate.jsp";
		} 
		else if(com.equals("noticeUpdateOk")) {
			command = new NoticeUpdateOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
