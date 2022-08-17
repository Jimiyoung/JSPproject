package reference;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReOkCommand implements ReferenceInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid")==null? "" : (String) session.getAttribute("sMid");
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
		
		String title = request.getParameter("title")==null ? "" : (String) request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : (String) request.getParameter("content");
		
		ReferenceVO vo = new ReferenceVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		
		ReferenceDAO dao = new ReferenceDAO();
		int res= dao.setReInputOk(vo);
		
		if(res==1) {
			request.setAttribute("msg", "noticeOk");
			request.setAttribute("url", request.getContextPath()+"/noticeList.no");
		}
		else {
			request.setAttribute("msg", "noticeNo");
			request.setAttribute("url", request.getContextPath()+"/noticeInput.no");
		}
	}

}
