package foodMenu;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoDeleteOkCommand implements FoodMenuInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx= request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String[] fSNames = request.getParameter("fSName").split("/");
		FoodMenuDAO dao = new FoodMenuDAO();
		
		FoodMenuVO vo = dao.getFoContent(idx);
		
	//파일이 저장되어있는 서버의 절대경로 지정
		String realPath = request.getServletContext().getRealPath("/data/foodMenu/");
			
	//서버파일시스템에 존재하는 실제 파일 삭제처리
		for(String fSName : fSNames) {
			new File(realPath + fSName).delete();
		}
			
		//파일 삭제가 완료되면 자료파일을 DB에서 삭제시켜준다.
		int res =	dao.setFoDeleteOk(idx);
		if(res==1) {
			response.getWriter().write("1");
		}
	}
}
