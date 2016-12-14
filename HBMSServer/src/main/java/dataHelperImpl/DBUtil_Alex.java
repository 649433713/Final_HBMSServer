package dataHelperImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by alex on 12/4/16.
 */
public class DBUtil_Alex {
    //just for test
    //just for test
    private static final String HOST_IP="127.0.0.1";
    private static final String DB_PORT="3306";
    private static final String DB_NAME="hbmsdatabase";
    private static final String URL="jdbc:mysql://"+HOST_IP+":"+DB_PORT+"/"+DB_NAME+"?characterEncoding=utf8&useSSL=true";
    private static final String NAME="root";
    private static final String PASSWORD="818818";
    private static Connection connection = null;
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection(URL,NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() {
        return connection;
    }
    
}
