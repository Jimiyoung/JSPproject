package reference;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReUpdateOkCommand implements ReferenceInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx=request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag=request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize=request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		String title=request.getParameter("title")==null? "" : request.getParameter("title");
		String content=request.getParameter("content")==null? "" : request.getParameter("content");
		
		ReferenceVO vo = new ReferenceVO();
		vo.setIdx(idx);
		vo.setTitle(title);
		vo.setContent(content);
		
		ReferenceDAO dao = new ReferenceDAO();
		
		int res = dao.setReUpdateOk(vo);
		
		if(res==1) {
			request.setAttribute("msg", "noticeUpdateOk");
		}
		else {
			request.setAttribute("msg", "noticeUpdateNo");
		}
		request.setAttribute("url", request.getContentType()+"/noticeContent.no?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		
		
	}

}
