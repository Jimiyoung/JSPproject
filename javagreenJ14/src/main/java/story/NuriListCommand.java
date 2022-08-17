package story;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NuriListCommand implements NuriInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NuriDAO dao = new NuriDAO();
		
	//페이징 처리를 위한 준비
			int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
			int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
			int totRecCnt = dao.totRecCnt();
			int totPage = (totRecCnt%pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize)+1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;

			int blockSize = 10;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
			
			ArrayList<NuryVO> voList = dao.getNuriList(startIndexNo, pageSize);
			
			request.setAttribute("voList", voList);
			request.setAttribute("curScrStartNo", curScrStartNo);
			request.setAttribute("pag", pag);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("totPage", totPage);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("lastBlock", lastBlock);
			
	}

}
