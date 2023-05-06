package model.management;

import java.util.Comparator;

public class NV{
    private int id;
    private String hoten, ngaysinh, gioitinh, sdt, diachi, chinhanh, chucvu;
    private int mucluong;
    private String chuthich="";

    public NV() {
    }

    public NV(int id, String hoten, String ngaysinh, String gioitinh, String sdt, String diachi, String chinhanh, String chucvu, int mucluong, String chuthich) {
        this.id = id;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.sdt = sdt;
        this.diachi = diachi;
        this.chinhanh = chinhanh;
        this.chucvu = chucvu;
        this.mucluong = mucluong;
        this.chuthich = chuthich;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getChinhanh() {
        return chinhanh;
    }

    public void setChinhanh(String chinhanh) {
        this.chinhanh = chinhanh;
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

    public String getChuthich() {
        return chuthich;
    }

    public void setChuthich(String chuthich) {
        this.chuthich = chuthich;
    }

    public static Comparator<NV> id_sort1 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return Integer.compare(o1.id, o2.id);
        }
        
    };
    
    public static Comparator<NV> id_sort2 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return Integer.compare(o2.id, o1.id);
        }
        
    };
    
    public static Comparator<NV> hoten_sort1 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o1.hoten.compareTo(o2.hoten);
        }
        
    };
    
    public static Comparator<NV> hoten_sort2 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o2.hoten.compareTo(o1.hoten);
        }
        
    };
    
    public static Comparator<NV> ngaysinh_sort1 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o1.ngaysinh.compareTo(o2.ngaysinh);
        }
        
    };
    
    public static Comparator<NV> ngaysinh_sort2 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o2.ngaysinh.compareTo(o1.ngaysinh);
        }
        
    };
    
    public static Comparator<NV> chucvu_sort1 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o1.chucvu.compareTo(o2.chucvu);
        }
        
    };
    
    public static Comparator<NV> chucvu_sort2 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return o2.chucvu.compareTo(o1.chucvu);
        }
        
    };
    
    public static Comparator<NV> mucluong_sort1 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return Integer.compare(o1.mucluong, o2.mucluong);
        }
        
    };
    
    public static Comparator<NV> mucluong_sort2 = new Comparator<NV>(){

        @Override
        public int compare(NV o1, NV o2) {
            return Integer.compare(o2.mucluong, o1.mucluong);
        }
        
    };

//    @Override
//    public int compareTo(NV o) {
//        return this.hoten.compareTo(o.hoten);
//    }
//    
    
}
