package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author havanthiep
 */
public class DBContext {
//    protected Connection connection;
//    public DBContext(){
//        try {
//            String url = "jdbc:sqlserver://TTCS_SERVER:1433;databaseName=TestDB";
////            trustServerCertificate=true"
//            String username = "sa";
//            String password = "123456";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, username, password);
//        } catch (ClassNotFoundException | SQLException ex) {
//            System.out.println(ex);
//        }
//    }
    
    public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://DESKTOP-KN4FE7O\\CSDLTEST2019:1433;databaseName=TestDB";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, "sa", "123456");
    }   
}
