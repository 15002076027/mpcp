package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ProductsDao;

/**
 * Servlet implementation class PdaddServlet
 */
@WebServlet("/PdaddServlet")
public class PdaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PdaddServlet() {
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
		 * 处理file文件上传 ******************************
		 */
		// 存放file图片名
		String pImg = null;
		// 存放其它数据
		List<String> pDetail = new ArrayList<String>();

		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 类实例化
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置file文件大小的最大值，10MB
		upload.setFileSizeMax(1024 * 1024 * 10);
		// 字符处理
		upload.setHeaderEncoding("UTF-8");
		// 获取上传路径（tomcat中的运行路径与workspace中的开发路径，相对应），若目录不存在则创建
		String uploadPath = getServletContext().getRealPath("/img/product");
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		// 控制台打印上传路径
		System.out.println("目录路径：" + uploadPath);
		try {
			// 获取request中的form数据
			List<FileItem> formItems = upload.parseRequest(request);
			if (formItems != null && formItems.size() > 0) {
				// 遍历form，file做单独处理
				for (FileItem item : formItems) {
					if (!item.isFormField()) {
						// 获取文件名及路径
						String fileName = item.getName();
						String filePath = uploadPath + File.separator + fileName;
						// 控制台打印完整的上传路径
						System.out.println("文件路径：" + filePath);
						// 创建上传路径
						File pFile = new File(filePath);
						// 割除file图片名，用于存放数据库
						pImg = filePath;
						int i = pImg.lastIndexOf("\\");
						pImg = pImg.substring(i + 1);
						// 若文件不存在则上传
						if (!pFile.exists()) {
							item.write(pFile);
							// 控制台打印图片名
							System.out.println("成功写入文件：" + pImg);
						}
					} else {
						pDetail.add(item.getString("UTF-8"));
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("写入文件失败");
		}

		/*
		 * 调用dao ******************************
		 */
		ProductsDao.insertProduct(pDetail.get(0), pDetail.get(1), pDetail.get(2), pImg, pDetail.get(3), pDetail.get(4),
				pDetail.get(5), pDetail.get(6), pDetail.get(7), pDetail.get(8), pDetail.get(9), pDetail.get(10));

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
