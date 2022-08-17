package story;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nuriReplyInput")
public class NuriReplyInput extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nuriIdx = request.getParameter("nuriIdx")==null ? 0 : Integer.parseInt(request.getParameter("nuriIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		NuriReplyVO replyVo = new NuriReplyVO();
		
		replyVo.setNuriIdx(nuriIdx);
		replyVo.setMid(mid);
		replyVo.setNickName(nickName);
		replyVo.setContent(content);
		
		NuriDAO dao = new NuriDAO();
		
		int res = dao.setReplyInputOk(replyVo);
		
		if(res==1) {
		response.getWriter().write("1");
		}
	}
}
