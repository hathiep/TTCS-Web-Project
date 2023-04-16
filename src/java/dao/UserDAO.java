package dao;

import context.DBContext;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//public class UserDAO extends DBContext{
//    public List<User> getAll(){
//        List<User> list = new ArrayList<>();
//        String sql = "select * from student";
//        
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while(rs.next()){
//                User c = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"));
//                list.add(c);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }
//    
//    public static void main(String[] args) {
//        UserDAO c = new UserDAO();
//        List<User> list=c.getAll();
//        System.out.println(list.get(0).getName());
//    }
//}

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<User> getAllUsers(){
        List<User> list = new ArrayList<>();
        String query = "select * from users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public User login(String email){
        String query = "select * from users where email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while(rs.next()){
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void signup(String fullname, String email, String phone_num, String password){
        String query = "insert into users values(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone_num);
            ps.setString(4, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}