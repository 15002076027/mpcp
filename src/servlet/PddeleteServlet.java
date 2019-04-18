package servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDao;

/**
 * Servlet implementation class PddeleteServlet
 */
@WebServlet("/PddeleteServlet")
public class PddeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PddeleteServlet() {
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
		 * 处理file文件删除 ******************************
		 */
		String pName = URLDecoder.decode(request.getParameter("pName"), "UTF-8");
		System.out.println("获取pName : " + pName);
		// 获取删除路径（tomcat中的运行路径与workspace中的开发路径，相对应），若目录不存在则创建
		String deletePath = getServletContext().getRealPath("/img/product");
		try {
			// 获取文件路径
			String filePath = deletePath + File.separator + pName + ".jpg";
			File pfile = new File(filePath);
			if (pfile.exists()) {
				pfile.delete();
				System.out.println("删除文件成功 : " + pName);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("删除文件失败");
		}

		/*
		 * 调用dao ******************************
		 */
		ProductsDao.deleteProduct(pName);

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
