package hrbeu.controller;

import hrbeu.dao.LisDaoImpl;
import hrbeu.entity.Lis;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class msg_zlxm
 */
@WebServlet("/msg_zlxm")
public class msg_zlxm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String solveId= request.getParameter("solveId");
		String personId = request.getParameter("personId");
		String page = request.getParameter("page");
		int pagenow =1;
		if(page != null){
			pagenow = Integer.parseInt(page);
		}
		LisDaoImpl lisd = new LisDaoImpl();
		List<Lis> liss = lisd.queryPage(solveId, null, pagenow, 2);
		if(liss.size() > 0) request.setAttribute("liss", liss);
		int total = lisd.page(solveId, null, 1);
		int pages = total%5==0?total/5:total/5+1;
		request.setAttribute("pages", pages);
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("solveId", solveId);
		request.setAttribute("personId", personId);
		request.getRequestDispatcher("/page/msg_zlxm.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
