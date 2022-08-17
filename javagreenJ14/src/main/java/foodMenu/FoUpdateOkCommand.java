package foodMenu;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FoUpdateOkCommand implements FoodMenuInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/data/foodMenu/");
		int maxSize = 1024*1024*20;
		String encoding = "utf-8";
		
		//파일 업로드처리
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		int idx=multipartRequest.getParameter("idx")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("idx"));
		int pag=multipartRequest.getParameter("pag")==null ? 1 : Integer.parseInt(multipartRequest.getParameter("pag"));
		int pageSize=multipartRequest.getParameter("pageSize")==null ? 5 : Integer.parseInt(multipartRequest.getParameter("pageSize"));
		
		String imsiFname = multipartRequest.getParameter("imsiFname")==null ? "" : multipartRequest.getParameter("imsiFname");
		String imsiFSname = multipartRequest.getParameter("imsiFSname")==null ? "" : multipartRequest.getParameter("imsiFSname");
		
		String originalFileName = "";
		String filesystemName="";
		if(imsiFname.equals("")) {  // 앞에서 원본파일을 삭제후 다시 추가했을 경우에 수행..
			// 업로드된 파일의 정보를 DB에 처리하기 위한 작업  Enumeration - 검색을 용이하게 할 목적으로 사용
			Enumeration fileNames = multipartRequest.getFileNames();
			
			while(fileNames.hasMoreElements()) { //hasMoreElements() 다음 위치에 데이터가 있는지 확인
				String file = (String) fileNames.nextElement();  //nextElement();다음 위치에 존재하는 데이터를 리턴받음
	
				if(multipartRequest.getOriginalFileName(file) != null) {
					originalFileName += multipartRequest.getOriginalFileName(file) +"/";  //사용자가 올릴 때 이름
					filesystemName += multipartRequest.getFilesystemName(file) +"/";  // 서버에 저장되는 이름
				}
			}
			originalFileName = originalFileName.substring(0,originalFileName.length()-1);
			filesystemName = filesystemName.substring(0,filesystemName.length()-1);
		}
		
	// 전송폼의 값 모두 받아오기
  		int fSize = multipartRequest.getParameter("fileSize") ==null? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));  // request 대신 multipartRequest
			String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
			String openSw = multipartRequest.getParameter("openSw") == null ? "" : multipartRequest.getParameter("openSw");
			String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
			
			//앞에서 전송된 자료들과 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있도록 한다.
			FoodMenuVO vo = new FoodMenuVO();
			vo.setIdx(idx);
			if(!originalFileName.equals("")) {
				vo.setfName(originalFileName);
				vo.setfSName(filesystemName);
			}
			else {
				vo.setfName(imsiFname);
				vo.setfSName(imsiFSname);
			}
			vo.setfSize(fSize);
			vo.setTitle(title);
			vo.setOpenSw(openSw);
			vo.setContent(content);
			
			FoodMenuDAO dao = new FoodMenuDAO();
			int res = dao.setFoUpdateOk(vo);
			
			if(res==1) {
				request.setAttribute("msg", "foUpdateOk");
			}
			else {
				request.setAttribute("msg", "foUpdateNo");
			}
			request.setAttribute("url", request.getContentType()+"/foContent.fo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
			
		
	}

}
