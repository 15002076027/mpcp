package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminsDao;

/**
 * Servlet implementation class AdminloginServlet
 */
@WebServlet("/AdminloginServlet")
public class AdminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminloginServlet() {
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
		String adminName = request.getParameter("adminName");
		String adminPassword = request.getParameter("adminPassword");
		/*
		 * 验证name和password ******************************
		 */
		String checkAdmin = AdminsDao.checkAdmin(adminName);
		if (checkAdmin.equals(adminPassword)) {
			/*
			 * 重定向到AdminindexServlet ******************************
			 */
			response.sendRedirect("/mpcp/AdminindexServlet");
		} else {
			/*
			 * 转发到adminlogin.jsp ******************************
			 */
			request.getRequestDispatcher("/page/adminlogin.jsp?login=error").forward(request, response);
		}
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
