package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/os?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	private static String username = "root";
	private static String password = "192837";
	private static Connection conn = null;
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException {
		if(conn==null) {
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}
		else {
			return conn;
		}
	}
	public static void main(String[] args) {
		try {
			Connection conn = DBUtil.getConnection();
			if(conn!=null) {
				System.out.println("连接成功");
			}
			else {
				System.out.println("连接失败");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
