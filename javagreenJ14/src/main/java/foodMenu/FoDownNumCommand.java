package foodMenu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoDownNumCommand implements FoodMenuInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx= request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		FoodMenuDAO	dao = new FoodMenuDAO();
		
		dao.setFoDownNum(idx);
	}

}
