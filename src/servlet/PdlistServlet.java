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
 * Servlet implementation class PdlistServlet
 */
@WebServlet("/PdlistServlet")
public class PdlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PdlistServlet() {
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
		 * request中的product不确定是pBrand还是pName，依次处理 ******************************
		 */
		String product = request.getParameter("product");
		HttpSession session = request.getSession();
		List<ProductBean> pList = ProductsDao.selectProducts();
		List<String> nameList = new ArrayList<String>();

		if (nameList != null) {
			for (ProductBean pro : pList) {
				if (pro.getpBrand().contains(product)) {
					if (nameList.isEmpty()) {
						nameList.add(pro.getpName());
					} else {
						for (int i = 0; i < nameList.size(); i++) {
							if (pro.getpName().equals(nameList.get(i))) {
								break;
							} else if (i == nameList.size() - 1) {
								nameList.add(pro.getpName());
							}
						}
					}
				} else if (pro.getpName().contains(product)) {
					if (nameList.isEmpty()) {
						nameList.add(pro.getpName());
					} else {
						for (int i = 0; i < nameList.size(); i++) {
							if (pro.getpName().equals(nameList.get(i))) {
								break;
							} else if (i == nameList.size() - 1) {
								nameList.add(pro.getpName());
							}
						}
					}
				}
			}
		}

		session.setAttribute("pList", pList);
		session.setAttribute("nameList", nameList);

		/*
		 * 转发到pdlist.jsp ******************************
		 */
		request.getRequestDispatcher("/page/pdlist.jsp").forward(request, response);
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
