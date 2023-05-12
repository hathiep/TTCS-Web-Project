package model.management;

import java.util.Comparator;

public class NV{
    private int id, idnv, work;
    private String hoten, ngaysinh, gioitinh, sdt, diachi, ngaynhanviec, chucvu, thang;
    private int mucluong, thuong, phat, tongnhan;
    private String chuthich;

    public NV() {
    }

    public NV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String ngaynhanviec, int work, String chucvu, int mucluong, String chuthich) {
        this.id = id;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.sdt = sdt;
        this.diachi = diachi;
        this.ngaynhanviec = ngaynhanviec;
        this.work = work;
        this.chucvu = chucvu;
        this.mucluong = mucluong;
        this.chuthich = chuthich;
    }

    public NV(int id, String thang, int idnv, String hoten, String chucvu, int mucluong, int thuong, int phat, String chuthich) {
        this.id = id;
        this.idnv = idnv;
        this.hoten = hoten;
        this.chucvu = chucvu;
        this.thang = thang;
        this.mucluong = mucluong;
        this.thuong = thuong;
        this.phat = phat;
        this.tongnhan = mucluong + thuong - phat;
        this.chuthich = chuthich;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdnv() {
        return idnv;
    }

    public void setIdnv(int idnv) {
        this.idnv = idnv;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(String ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getNgaynhanviec() {
        return ngaynhanviec;
    }

    public void setNgaynhanviec(String ngaynhanviec) {
        this.ngaynhanviec = ngaynhanviec;
    }

    public int getWork() {
        return work;
    }

    public void setWork(int work) {
        this.work = work;
    }
    
    public String getChucvu() {
        return chucvu;
    }

    public void setChucvu(String chucvu) {
        this.chucvu = chucvu;
    }

    public String getThang() {
        return thang;
    }

    public void setThang(String thang) {
        this.thang = thang;
    }

    public int getMucluong() {
        return mucluong;
    }

    public void setMucluong(int mucluong) {
        this.mucluong = mucluong;
    }

    public int getThuong() {
        return thuong;
    }

    public void setThuong(int thuong) {
        this.thuong = thuong;
    }

    public int getPhat() {
        return phat;
    }

    public void setPhat(int phat) {
        this.phat = phat;
    }

    public int getTongnhan() {
        return tongnhan;
    }

    public void setTongnhan(int tongnhan) {
        this.tongnhan = tongnhan;
    }

    public String getChuthich() {
        return chuthich;
    }

    public void setChuthich(String chuthich) {
        this.chuthich = chuthich;
    }
    
}
