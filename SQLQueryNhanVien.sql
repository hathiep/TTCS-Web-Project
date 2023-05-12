CREATE TABLE nhanvien (
    id INT NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
	ngaysinh DATE NOT NULL,
	gioitinh NVARCHAR(10) NOT NULL,
	sdt VARCHAR(10) NOT NULL,
	diachi NVARCHAR(max) NOT NULL,
	ngaynhanviec DATE NOT NULL,
	work INT NOT NULL,
    chucvu NVARCHAR(50) NOT NULL,
	mucluong INT NOT NULL,
	chuthich NVARCHAR(max),
    PRIMARY KEY (id)
);
