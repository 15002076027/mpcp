package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

public class AdminsDao {
	private static final String DRIVENAME = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "scott";
	private static final String PASSWORD = "123";

	private static Connection conn = null;
	private static CallableStatement call = null;
	private static ResultSet rs = null;
	private static String adminPassword = null;

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
	public static void restore(Connection conn, CallableStatement call, ResultSet rs) {
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
	 * checkAdmin() admin身份验证 ******************************
	 */
	public static String checkAdmin(String adminName) {
		String sql = "{CALL p_check_am(?,?)}";
		try {
			conn = getConn();
			call = conn.prepareCall(sql);
			call.setString(1, adminName);
			call.registerOutParameter(2, Types.VARCHAR);
			call.execute();
			adminPassword = call.getString(2);
		} catch (SQLException e) {
			// TODO: handle exception
			return "notAdmin";
		} finally {
			restore(conn, call, rs);
		}
		return adminPassword;
	}
}
