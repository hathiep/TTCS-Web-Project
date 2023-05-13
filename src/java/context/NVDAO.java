package context;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.management.NV;

public class NVDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<NV> getAllNV(int work){
        List<NV> list = new ArrayList<>();
        String query1 = "SELECT * FROM nhanvien";
        String query2 = "SELECT * FROM nhanvien WHERE work=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query1);
            if(work != 2){
                ps = conn.prepareStatement(query2);
                ps.setInt(1, work);
            }
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
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addNV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String ngaynhanviec, String chucvu, int mucluong, String chuthich, String image){
        String query = "insert into nhanvien values(?,?,?,?,?,?,?,1,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, hoten);
            ps.setString(3, ngaysinh);
            ps.setString(4, gioitinh);
            ps.setString(5, sdt);
            ps.setString(6, diachi);
            ps.setString(7, ngaynhanviec);
            ps.setString(8, chucvu);
            ps.setInt(9, mucluong);
            ps.setString(10, chuthich);
            ps.setString(11, image);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateNV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String ngaynhanviec, String chucvu, int mucluong, String chuthich, String image){
        String query = "update nhanvien set hoten=?, ngaysinh=?, gioitinh=?, sdt=?, diachi=?, ngaynhanviec=?, chucvu=?, mucluong=?, chuthich=?, image=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hoten);
            ps.setString(2, ngaysinh);
            ps.setString(3, gioitinh);
            ps.setString(4, sdt);
            ps.setString(5, diachi);
            ps.setString(6, ngaynhanviec);
            ps.setString(7, chucvu);
            ps.setInt(8, mucluong);
            ps.setString(9, chuthich);
            ps.setString(10, image);
            ps.setInt(11, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteNV(int id){
        String query = "update nhanvien set work = 0 where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
        
    public void setLuong(int id, String thang){
        String query1 = "insert into luong (idnv, thang, hoten, chucvu, mucluong, thuong, phat, tongnhan, chuthich) "
                + "select id, ?, hoten, chucvu, mucluong, 0, 0, mucluong, '' "
                + "from nhanvien where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query1);
            ps.setString(1, thang);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateluong(int id, int thuong, int phat, String chuthich){
        String query = "update luong set thuong=?, phat=?, chuthich=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, thuong);
            ps.setInt(2, phat);
            ps.setString(3, chuthich);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<NV> getAllLuong(int id){
        List<NV> list = new ArrayList<>();
        String query;
        if(id == 0){
            query = "select * from luong";
        }
        else{
            query = "select * from luong where idnv = ?";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            if(id!=0) ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new NV(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<NV> getMonth(String thang, int id){
        List<NV> list = new ArrayList<>();
        String query;
        if(id == 0){
            query = "select * from luong where thang = ?";
        }
        else{
            query = "select * from luong where thang = ? and idnv = ?";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, thang);
            if(id!=0) ps.setInt(2, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new NV(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<NV> getAllYear(String year, int id){
        List<NV> list = new ArrayList<>();
        String query;
        if(id == 0){
            query = "select * from luong where right(thang,4) = ?";
        }
        else{
            query = "select * from luong where right(thang,4) = ? and idnv = ?";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, year);
            if(id!=0) ps.setInt(2, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new NV(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<NV> getAllMonth(String month, int id){
        List<NV> list = new ArrayList<>();
        String query;
        if(id == 0){
            query = "select * from luong where left(thang, 2) = ?";
        }
        else{
            query = "select * from luong where left(thang, 2) = ? and idnv = ?";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, month);
            if(id!=0) ps.setInt(2, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new NV(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
//    public List<NV> getNamLuongNV (String thang){
//        List<NV> list = new ArrayList<>();
//        String query = "SELECT SUM(salary) AS total_salary\n" +
//"FROM Employees\n" +
//"WHERE RIGHT(month_year, 4) = '2023';";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, thang);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                list.add(new NV(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getInt(6),
//                        rs.getInt(7),
//                        rs.getInt(8),
//                        rs.getString(10)
//                ));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    
}
