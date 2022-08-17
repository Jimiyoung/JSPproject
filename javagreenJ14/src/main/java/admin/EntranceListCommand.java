package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entrance.EntranceDAO;
import entrance.EntranceVO;

public class EntranceListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sw = request.getParameter("sw")==null ? "전체" : request.getParameter("sw");
		
		EntranceDAO dao = new EntranceDAO();
		
		// 리스트 번호처리
		int curScrStartNo = dao.totRecCnt();
		ArrayList<EntranceVO> vos = dao.getEntranceList(sw);
		
		request.setAttribute("vos", vos);
		request.setAttribute("sw", sw);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
	}

}
