package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author havanthiep
 */
public class DBContext {
    
    public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://DESKTOP-KN4FE7O\\TTCS_SERVER:1433;databaseName=TestDB";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, "sa", "123456");
    }   
}
