/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.management.NV;

/**
 *
 * @author havanthiep
 */
public class LuongDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void setLuong(){
//        INSERT INTO order_details (order_id, product_id, quantity)
//        SELECT order_id, product_id, quantity
//        FROM orders
//        WHERE order_id = <your_order_id>;
        String query = "INSERT INTO luong (idnv, hoten, chucvu)"
                + "SELECT id, hoten, chucvu FROM nhanvien"
                + "WHERE id";
    }
    
    public List<NV> getAllNV(){
        List<NV> list = new ArrayList<>();
        String query = "select * from luong";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new NV(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addNV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String chinhanh, String chucvu, int mucluong, String chuthich){
        String query = "insert into nhanvien values(?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, hoten);
            ps.setString(3, ngaysinh);
            ps.setString(4, gioitinh);
            ps.setString(5, sdt);
            ps.setString(6, diachi);
            ps.setString(7, chinhanh);
            ps.setString(8, chucvu);
            ps.setInt(9, mucluong);
            ps.setString(10, chuthich);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void updateNV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String chinhanh, String chucvu, int mucluong, String chuthich){
        String query = "update nhanvien set hoten=?, ngaysinh=?, gioitinh=?, sdt=?, diachi=?, chinhanh=?, chucvu=?, mucluong=?, chuthich=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hoten);
            ps.setString(2, ngaysinh);
            ps.setString(3, gioitinh);
            ps.setString(4, sdt);
            ps.setString(5, diachi);
            ps.setString(6, chinhanh);
            ps.setString(7, chucvu);
            ps.setInt(8, mucluong);
            ps.setString(9, chuthich);
            ps.setInt(10, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
