CREATE TABLE luong (
    id INT IDENTITY(1,1) NOT NULL,
	thang NVARCHAR(50) NOT NULL,
	idnv INT NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
    chucvu NVARCHAR(50) NOT NULL,
	mucluong INT NOT NULL,
	thuong INT,
	phat INT,
	tongnhan INT,
	chuthich NVARCHAR(max),
	FOREIGN KEY (idnv) REFERENCES nhanvien (id),
    PRIMARY KEY (id)
);
