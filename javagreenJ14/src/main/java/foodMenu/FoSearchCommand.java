package foodMenu;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoSearchCommand implements FoodMenuInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null?"":request.getParameter("search");
		String searchString = request.getParameter("searchString")==null?"":request.getParameter("searchString");
		
		int pag = request.getParameter("pag")== null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")== null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		FoodMenuDAO dao = new FoodMenuDAO();
		// 페이징처리를 위한 준비
		int totRecCnt = dao.totRecCnt(0);
		int totPage = (totRecCnt%pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
		
		
		ArrayList<FoodMenuVO> vos = dao.getFoSearch(search,searchString,startIndexNo,pageSize);
		
		String searchTitle="";
		if(search.equals("title")) searchTitle="글제목";
		else if(search.equals("nickName")) searchTitle="작성자";
		else searchTitle="글내용";

		request.setAttribute("vos", vos);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("searchTitle", searchTitle);
		
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("totPage", totPage);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
