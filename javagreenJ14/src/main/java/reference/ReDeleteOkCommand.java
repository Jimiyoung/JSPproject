package reference;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReDeleteOkCommand implements ReferenceInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx= request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ReferenceDAO dao = new ReferenceDAO();
		
		int res = dao.setReDeleteOk(idx);

		if(res==1) {
			request.setAttribute("msg", "noticeDeleteOk");
			request.setAttribute("url", request.getContentType()+"/noticeList.no?idx="+idx);
		}
		else {
			request.setAttribute("msg", "noticeDeleteNo");
			request.setAttribute("url", request.getContentType()+"/noticeContent.no?idx="+idx);
		}
	}

}
