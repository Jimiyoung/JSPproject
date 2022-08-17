package reference;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReSearchCommand implements ReferenceInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		int pag = request.getParameter("pag")== null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		ReferenceDAO dao = new ReferenceDAO();
		
		ArrayList<ReferenceVO> vos = dao.getReSearch(search,searchString);
		
		String searchTitle = "";
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
	}

}
