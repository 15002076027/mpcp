package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDao;

/**
 * Servlet implementation class PdmodifyServlet
 */
@WebServlet("/PdmodifyServlet")
public class PdmodifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PdmodifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pName = request.getParameter("pName");
		String pPrice = request.getParameter("pPrice");

		String pCpu = request.getParameter("pCpu");
		String pRamrom = request.getParameter("pRamrom");
		String pSize = request.getParameter("pSize");
		String pCamera = request.getParameter("pCamera");

		String pTime = request.getParameter("pTime");
		String pBattery = request.getParameter("pBattery");
		String pSim = request.getParameter("pSim");
		String pInterface = request.getParameter("pInterface");

		/*
		 * 调用dao ******************************
		 */
		ProductsDao.updateProduct(pName, pPrice, pCpu, pRamrom, pSize, pCamera, pTime, pBattery, pSim, pInterface);

		/*
		 * 重定向到AdminindexServlet ******************************
		 */
		response.sendRedirect("/mpcp/AdminindexServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
