package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("memJoin")) {
			viewPaged += "/member/memJoin.jsp";
		}
		else if(com.equals("memJoinOk")) {
			command = new MemJoinOkCommand();
			command.execute(request, response); 
			viewPaged  = "/message/message.jsp";
		} 
		else if(com.equals("memIdCheck")) {
			command = new MemIdCheckCommand();
			command.execute(request, response);
			viewPaged += "/member/memIdCheck.jsp";
		}
		else if(com.equals("memNickCheck")) {
			command = new MemNickCheckCommand();
			command.execute(request, response);
			viewPaged += "/member/memNickCheck.jsp";
		}
		else if(com.equals("memLogin")) {
			command = new MemLoginCommand();
			command.execute(request, response); 
			viewPaged += "/member/memLogin.jsp";
		} 
		else if(com.equals("memLoginOk")) { 
			command = new MemLoginOkCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memFind")) {
			viewPaged += "/member/memFind.jsp";
		}
		else if(com.equals("memIdFind")) { 
			command = new MemIdFindCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memPwdFind")) { 
			command = new MemPwdFindCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memPwdReset")) {
			viewPaged += "/member/memPwdReset.jsp";
		}
		else if(com.equals("memPwdResetOk")) { 
			command = new MemPwdResetOkCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(level > 4) { 	// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄. 로그인하기 전에 하는것들은 다 이 위로
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("memMain")) {
			command = new MemMainCommand();
			command.execute(request, response);
			viewPaged += "/member/memMain.jsp";
		}
		else if(com.equals("memLogOut")) {
			command = new MemLogOutCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memUpdate")) {
			command = new MemUpdateCommand();
			command.execute(request, response);
			viewPaged += "/member/memUpdate.jsp";
		}
		else if(com.equals("memUpdateOk")) {
			command = new MemUpdateOkCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memDelete")) {
			command = new MemDeleteCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memUserDelete")) {
			command = new MemUserDeleteCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("memInfor")) {
			command = new MemInforCommand();
			command.execute(request, response);
			viewPaged += "/member/memInfor.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
