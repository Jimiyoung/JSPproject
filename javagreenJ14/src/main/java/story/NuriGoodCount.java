package story;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.deploy.NamingResourcesImpl;

@WebServlet("/nuriGoodCount")
public class NuriGoodCount extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
	
		NuriDAO dao = new NuriDAO();
		
		// '좋아요' 수 증가처리
		HttpSession session = request.getSession();
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx==null) {  // 없으면 생성. board content에 처음 들어갔을 때.
			goodIdx = new ArrayList<String>();
			
		}
		String imsiGoodIdx="good"+idx;
		if(!goodIdx.contains(imsiGoodIdx)) {  //없으면 조회수 증가
			dao.setGoodCount(idx);
			goodIdx.add(imsiGoodIdx);
		}
		session.setAttribute("sGoodIdx", goodIdx);
		
	}
}
