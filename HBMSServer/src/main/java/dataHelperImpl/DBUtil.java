package dataHelperImpl;

import java.sql.*;

/**
 * @author 凡
 *
 */
public class DBUtil {
	
	private static final String URL = "jdbc:mysql://localhost:3306/hbmsdatabase?serverTimezone=GMT%2b8&characterEncoding=utf8&useUnicode=true&useSSL=false";
	private static final String USER = "root";
	private static final String PASSWORD = "818818";
	
	
	private static Connection connection = null;
	static{
		//1.加载驱动程序
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection= DriverManager.getConnection(URL,USER, PASSWORD);
			PreparedStatement preparedStatement= connection.prepareStatement("SET GLOBAL event_scheduler = 1");
			preparedStatement.execute();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//2.获得数据库连接
		
		
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
	
}
