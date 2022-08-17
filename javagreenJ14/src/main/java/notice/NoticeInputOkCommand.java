package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoticeInputOkCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid")==null? "" : (String) session.getAttribute("sMid");
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
		
		String title = request.getParameter("title")==null ? "" : (String) request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : (String) request.getParameter("content");
		
		NoticeVO vo = new NoticeVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		
		NoticeDAO dao = new NoticeDAO();
		int res= dao.setNoticeInputOk(vo);
		
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
