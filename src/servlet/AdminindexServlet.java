package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ProductBean;
import dao.ProductsDao;

/**
 * Servlet implementation class AdminindexServlet
 */
@WebServlet("/AdminindexServlet")
public class AdminindexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminindexServlet() {
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
		/*
		 * session保存pList和brandList ******************************
		 */
		HttpSession session = request.getSession();
		List<ProductBean> pList = ProductsDao.selectProducts();
		List<String> brandList = new ArrayList<String>();

		if (brandList != null) {
			for (ProductBean product : pList) {
				if (brandList.isEmpty()) {
					brandList.add(product.getpBrand());
				} else {
					for (int i = 0; i < brandList.size(); i++) {
						if (product.getpBrand().equals(brandList.get(i))) {
							break;
						} else if (i == brandList.size() - 1) {
							brandList.add(product.getpBrand());
						}
					}
				}
			}
		}
		session.setAttribute("pList", pList);
		session.setAttribute("brandList", brandList);

		/*
		 * 转发到adminindex.jsp ******************************
		 */
		request.getRequestDispatcher("/page/adminindex.jsp").forward(request, response);
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
