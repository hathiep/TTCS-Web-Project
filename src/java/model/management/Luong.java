/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.management;

/**
 *
 * @author havanthiep
 */
public class Luong {
    private int id, idnv;
    private String hoten, chucvu;
    private int mucluong, thuong, phat, tongnhan;
    private String chuthich;

    public Luong() {
    }

    public Luong(int id, int idnv, String hoten, String chucvu, int mucluong, int thuong, int phat, String chuthich) {
        this.id = id;
        this.idnv = idnv;
        this.hoten = hoten;
        this.chucvu = chucvu;
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

    public String getChucvu() {
        return chucvu;
    }

    public void setChucvu(String chucvu) {
        this.chucvu = chucvu;
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
