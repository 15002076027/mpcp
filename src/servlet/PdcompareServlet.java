package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PdcompareServlet
 */
@WebServlet("/PdcompareServlet")
public class PdcompareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private List<String> cpList;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PdcompareServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		cpList = new ArrayList<String>();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aor = request.getParameter("aor");
		String pName = request.getParameter("pName");
		HttpSession session = request.getSession();

		/*
		 * 处理addCP ******************************
		 */
		if (aor.equals("add")) {
			cpList.add(pName);
			session.setAttribute("cpList", cpList);

			for (String name : cpList) {
				System.out.println("待比较列表 : " + name);
			}

			PrintWriter out = response.getWriter();
			String html = "<tr><td>" + pName + "</td><td><a class='removeCP'>remove</a></td></tr>";
			out.println(html);
		} else if (aor.equals("remove")) {
			for (int i = 0; i < cpList.size(); i++) {
				if (cpList.get(i).equals(pName)) {
					cpList.remove(i);
					i--;
				}
			}

			session.setAttribute("cpList", cpList);

			for (String name : cpList) {
				System.out.println("待比较列表 : " + name);
			}
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
