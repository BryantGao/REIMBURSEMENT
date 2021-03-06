package hrbeu.controller;

import hrbeu.dao.FeeKindDaoImpl;
import hrbeu.dao.HosRankDaoImpl;
import hrbeu.dao.YaoPinDaoImpl;
import hrbeu.dao.ZhenLiaoDaoImpl;
import hrbeu.entity.YaoPin;
import hrbeu.entity.ZhenLiao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ZhenLiaoAddServlet
 */
@WebServlet("/ZhenLiaoAddServlet")
public class ZhenLiaoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZhenLiaoAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String projId = request.getParameter("projId");
		String projName = request.getParameter("projName");
		String hosRank = request.getParameter("hosRank");
		String feeKind = request.getParameter("feeKind");
		String company = request.getParameter("company");
		String manufacturer = request.getParameter("manufacturer");
		String rge = request.getParameter("rge");
		String chargeRank = request.getParameter("chargeRank");
		String remarks = request.getParameter("remarks");
		ZhenLiao z = new ZhenLiao(projId, projName, feeKind, chargeRank, company, manufacturer, remarks, rge, hosRank);
		//System.out.println(z);
		ZhenLiaoDaoImpl zlpi = new ZhenLiaoDaoImpl();
		zlpi.add(z);
		request.getRequestDispatcher("/page/zhenliaoquery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
