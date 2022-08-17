package story;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class NuriInputOkCommand implements NuriInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/nuri/");
		int maxSize = 1024*1024*20;
		String encoding = "utf-8";
		
		//파일 업로드처리
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 DB에 처리하기 위한 작업  Enumeration - 검색을 용이하게 할 목적으로 사용
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String originalFileName = "";
		String filesystemName="";
		while(fileNames.hasMoreElements()) { //hasMoreElements() 다음 위치에 데이터가 있는지 확인
			String file = (String) fileNames.nextElement();  //nextElement();다음 위치에 존재하는 데이터를 리턴받음

			if(multipartRequest.getOriginalFileName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) +"/";  //사용자가 올릴 때 이름
				filesystemName += multipartRequest.getFilesystemName(file) +"/";  // 서버에 저장되는 이름
			}
		}
		originalFileName = originalFileName.substring(0,originalFileName.length()-1);
		filesystemName = filesystemName.substring(0,filesystemName.length()-1);
		//세션에서 아이디와 닉네임 가져오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
	// 전송폼의 값 모두 받아오기
			int fSize = multipartRequest.getParameter("fileSize") ==null? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));  // request 대신 multipartRequest
			String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
			String openSw = multipartRequest.getParameter("openSw") == null ? "" : multipartRequest.getParameter("openSw");
			String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
			
			//앞에서 전송된 자료들과 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있도록 한다.
			NuryVO vo = new NuryVO();
			vo.setMid(mid);
			vo.setNickName(nickName);
			vo.setfName(originalFileName);
			vo.setfSName(filesystemName);
			vo.setfSize(fSize);
			vo.setTitle(title);
			vo.setOpenSw(openSw);
			vo.setContent(content);
			
			NuriDAO dao = new NuriDAO();
			int res = dao.setNuriInputOk(vo);
			
			if(res == 1) {
				request.setAttribute("msg", "nuriInputOk");
				request.setAttribute("url", request.getContextPath()+"/nuriList.nu");
			}
			else {
				request.setAttribute("msg", "nuriInputNo");
				request.setAttribute("url", request.getContextPath()+"/nuriInput.nu");
			}
		
		
	}

}
