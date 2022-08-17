package entrance;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EnInputOkCommand implements EntranceInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pName = request.getParameter("pName")== null ? "" : request.getParameter("pName");
		String relation = request.getParameter("relation")== null ? "" : request.getParameter("relation");
		String tel = request.getParameter("tel")== null ? "" : request.getParameter("tel");
		String cName = request.getParameter("cName")== null ? "" : request.getParameter("cName");
		String gender = request.getParameter("gender")== null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")== null ? "" : request.getParameter("birthday");
		String content = request.getParameter("content")== null ? "" : request.getParameter("content");
		String address = request.getParameter("address")== null ? "" : request.getParameter("address");

		EntranceDAO dao = new EntranceDAO();
		
		EntranceVO vo = new EntranceVO();
			
			vo.setpName(pName);
			vo.setRelation(relation);
			vo.setTel(tel);
			vo.setcName(cName);
			vo.setGender(gender);
			vo.setBirthday(birthday);
			vo.setContent(content);
			vo.setAddress(address);
			
			int res = dao.setEnInputOk(vo);
			
			if(res==1) {
				request.setAttribute("msg", "enInputOk");
			}
			else {
				request.setAttribute("msg", "enInputNo");
			}
			request.setAttribute("url", request.getContextPath()+"/entranceInput.en");
	}

}
