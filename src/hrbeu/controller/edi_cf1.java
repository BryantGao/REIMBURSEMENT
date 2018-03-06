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
 * Servlet implementation class edi_cf1
 */
@WebServlet("/edi_cf1")
public class edi_cf1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String personId = request.getParameter("personId");
		String solveId = request.getParameter("solveId");
		String ide = request.getParameter("ide");
		LisDaoImpl lisd = new LisDaoImpl();
		List<Lis> liss = lisd.query(solveId, ide, 1);
		request.setAttribute("lis", liss.get(0));
		request.setAttribute("personId", personId);
		request.setAttribute("solveId", solveId);
		request.getRequestDispatcher("/page/edi_cf.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
