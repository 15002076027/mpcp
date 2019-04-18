package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ProductBean;
import oracle.jdbc.oracore.OracleType;

public class ProductsDao {
	private static final String DRIVENAME = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "scott";
	private static final String PASSWORD = "123";

	private static Connection conn = null;
	private static CallableStatement call = null;

	/*
	 * getConn() 连接Oracle数据库 ******************************
	 */
	public static Connection getConn() {
		try {
			// 加载驱动
			Class.forName(DRIVENAME);
			// 获取连接
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return conn;
	}

	/*
	 * close() 关闭连接 ******************************
	 */
	public static void restore1(Connection conn, CallableStatement call) {
		try {
			if (conn != null) {
				conn.close();
			}
			if (call != null) {
				call.close();
			}
			conn = null;
			call = null;
		} catch (SQLException e) {
			// TODO: handle exception
			conn = null;
			call = null;
		}
	}

	public static void restore2(Connection conn, CallableStatement call, ResultSet rs) {
		try {
			if (conn != null) {
				conn.close();
			}
			if (call != null) {
				call.close();
			}
			if (rs != null) {
				rs.close();
			}
			conn = null;
			call = null;
			rs = null;
		} catch (SQLException e) {
			// TODO: handle exception
			conn = null;
			call = null;
			rs = null;
		}
	}

	/*
	 * insertProduct() 插入一条product数据 ******************************
	 */
	public static void insertProduct(String pBrand, String pName, String pPrice, String pImg, String pCpu,
			String pRamrom, String pSize, String pCamera, String pTime, String pBattery, String pSim,
			String pInterface) {
		String sql = "{CALL p_insert_pd(?,?,?,?,?,?,?,?,?,?,?,?)}";
		try {
			conn = getConn();
			call = conn.prepareCall(sql);
			call.setString(1, pBrand);
			call.setString(2, pName);
			call.setString(3, pPrice);
			call.setString(4, pImg);
			call.setString(5, pCpu);
			call.setString(6, pRamrom);
			call.setString(7, pSize);
			call.setString(8, pCamera);
			call.setString(9, pTime);
			call.setString(10, pBattery);
			call.setString(11, pSim);
			call.setString(12, pInterface);
			call.execute();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			restore1(conn, call);
		}
	}

	/*
	 * deleteProduct() 删除一条product数据 ******************************
	 */
	public static void deleteProduct(String pName) {
		String sql = "{CALL p_delete_pd(?)}";
		try {
			conn = getConn();
			call = conn.prepareCall(sql);
			call.setString(1, pName);
			call.execute();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			restore1(conn, call);
		}
	}

	/*
	 * selectProducts() 查询所有product数据 ******************************
	 */
	public static List<ProductBean> selectProducts() {
		String sql = "{CALL p_select_pds(?)}";
		ResultSet rs = null;
		ProductBean product = null;
		List<ProductBean> pList = new ArrayList<ProductBean>();
		try {
			conn = getConn();
			call = conn.prepareCall(sql);
			call.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
			call.execute();
			rs = (ResultSet) call.getObject(1);
			while (rs.next()) {
				product = new ProductBean(rs.getString("p_BRAND"), rs.getString("P_NAME"), rs.getString("P_PRICE"),
						rs.getString("P_IMG"), rs.getString("P_CPU"), rs.getString("P_RAMROM"), rs.getString("P_SIZE"),
						rs.getString("P_CAMERA"), rs.getString("P_TIME"), rs.getString("P_BATTERY"),
						rs.getString("P_SIM"), rs.getString("P_INTERFACE"));
				pList.add(product);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			restore2(conn, call, rs);
		}
		return pList;
	}

	/*
	 * updateProduct() 更新一条product数据 ******************************
	 */
	public static void updateProduct(String pName, String pPrice, String pCpu, String pRamrom, String pSize,
			String pCamera, String pTime, String pBattery, String pSim, String pInterface) {
		String sql = "{CALL p_update_pd(?,?,?,?,?,?,?,?,?,?)}";
		try {
			conn = getConn();
			call = conn.prepareCall(sql);
			call.setString(1, pName);
			call.setString(2, pPrice);
			call.setString(3, pCpu);
			call.setString(4, pRamrom);
			call.setString(5, pSize);
			call.setString(6, pCamera);
			call.setString(7, pTime);
			call.setString(8, pBattery);
			call.setString(9, pSim);
			call.setString(10, pInterface);
			call.execute();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			restore1(conn, call);
		}
	}
}