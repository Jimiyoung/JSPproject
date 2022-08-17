package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")== null? "" : request.getParameter("pwd");
		String name = request.getParameter("name")== null? "" : request.getParameter("name");
		String name_ = name;
		String nickName = request.getParameter("nickName")== null? "" : request.getParameter("nickName");
		String childName = request.getParameter("childName")== null? "" : request.getParameter("childName");
		String ban = request.getParameter("ban")== null? "" : request.getParameter("ban");
		String birthday = request.getParameter("birthday")== null? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel")== null? "" : request.getParameter("tel");
		String email = request.getParameter("email")== null? "" : request.getParameter("email");
		String address = request.getParameter("address")== null? "" : request.getParameter("address");

		MemberDAO dao = new MemberDAO();
		
		//아이디와 닉네임 다시 한 번 중복 체크
		name= dao.memIdCheck(mid);
		if(!name.equals("")) {
			request.setAttribute("msg", "idCheckNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		name = dao.memNickCheck(nickName);
		if(!name.equals("")) {  //사용불가(중복)
			request.setAttribute("msg", "nickCheckNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		// 비밀번호 암호화처리(sha256)
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			
		//모든 체크가 완료된 정확환 회원정보를 DB에 저장하기 위해 VO객체에 담아서 dao로 전송.
			MemberVO vo = new MemberVO();
			
			vo.setMid(mid);
			vo.setPwd(pwd);
			vo.setName(name_);
			vo.setNickName(nickName);
			vo.setChildName(childName);
			vo.setBan(ban);
			vo.setBirthday(birthday);
			vo.setTel(tel);
			vo.setEmail(email);
			vo.setAddress(address);
			
			int res = dao.setMemJoinOk(vo);
			
			if(res==1) {
				request.setAttribute("msg", "memJoinOk");
				request.setAttribute("url", request.getContextPath()+"/");
			}
			else {
				request.setAttribute("msg", "memJoinNo");
				request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			}
			
	}

}
