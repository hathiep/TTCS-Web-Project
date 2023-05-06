CREATE TABLE luong (
    id INT NOT NULL,
	thang NVARCHAR(50) NOT NULL,
	idnv INT NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
    chucvu NVARCHAR NOT NULL,
	mucluong INT NOT NULL,
	thuong INT NOT NULL,
	phat INT NOT NULL,
	tongnhan INT NOT NULL,
	chuthich NVARCHAR(100),
	FOREIGN KEY (idnv) REFERENCES nhanvien (id),
    PRIMARY KEY (id)
);
