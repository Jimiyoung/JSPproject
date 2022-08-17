package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		/*
		 * String nickName = request.getParameter("nickName")== null? "" :request.getParameter("nickName"); 
		 * String name =request.getParameter("name")== null? "" : request.getParameter("name");
		 * String birthday = request.getParameter("birthday")== null? "" : request.getParameter("birthday");
		*/
		String pwd = request.getParameter("pwd")== null? "" : request.getParameter("pwd");
		String childName = request.getParameter("childName")== null? "" : request.getParameter("childName");
		String ban = request.getParameter("ban")== null? "" : request.getParameter("ban");
		String tel = request.getParameter("tel")== null? "" : request.getParameter("tel");
		String address = request.getParameter("address")== null? "" : request.getParameter("address");
		String email = request.getParameter("email")== null? "" : request.getParameter("email");

		MemberDAO dao = new MemberDAO();
				
		// DB에 저장된 각각의 필드 길이 체크
		
	// 비밀번호 암호화처리(sha256)
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			
		// 비밀번호가 정확할 경우에만 회원정보를 수정처리할 수 있도록.
		MemberVO vo = dao.getMemLoginOk(mid, pwd);
		if(vo.getNickName()==null) {
			request.setAttribute("msg", "passwordNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdate.mem");
			return;
		}
		
		//모든 체크가 완료된 정확환 회원정보를 DB에 저장하기 위해 VO객체에 담아서 dao로 전송.
		vo = new MemberVO();
		
		vo.setMid(mid);
		vo.setChildName(childName);
		vo.setBan(ban);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);

		int res = dao.setMemUpdateOk(vo);
		
		if(res==1) {
			//session.setAttribute("sNickName", nickName);
			request.setAttribute("msg", "memUpdateOk");
		}
		else {
			request.setAttribute("msg", "memUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/memMain.mem");
	}

}
