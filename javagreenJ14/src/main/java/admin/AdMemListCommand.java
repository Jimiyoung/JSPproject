package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdMemListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ban = request.getParameter("ban")==null ? "전체" : request.getParameter("ban");
		
		MemberDAO dao = new MemberDAO();
		
	//페이징 처리를 위한 준비
			int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
			int pageSize = request.getParameter("pageSize")==null ? 20 : Integer.parseInt(request.getParameter("pageSize"));
			int totRecCnt = dao.totRecCnt();
			int totPage = (totRecCnt%pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize)+1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;

			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
			
		ArrayList<MemberVO> vos = dao.getMemList(startIndexNo, pageSize, ban);
		
		request.setAttribute("vos", vos);
		
		request.setAttribute("ban", ban);
		
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);

		
	}

}
