create database Minitest3;
use minitest3;
create table Vattu(
                      id int auto_increment primary key,
                      mavt varchar(50),
                      tenvt varchar(255),
                      dvtinh varchar(50),
                      giatien int
);
create table Tonkho(
                       id int auto_increment primary key,
                       vattu_id int,
                       sldau int,
                       tongsln int,
                       tongslx int,
                       foreign key (vattu_id) references vattu(id)
);
create table nhacungcap(
                           id int auto_increment primary key,
                           Ma_nha_cc varchar(50),
                           ten_nha_cc varchar(255),
                           diachi varchar(255),
                           sdt_nha_cc varchar(50)
);
create table dondathang(
                           id int auto_increment primary key,
                           ma_don varchar(50),
                           ngay_dat_hang datetime,
                           nha_cc_id int,
                           foreign key (nha_cc_id) references nhacungcap(id)
);
create table phieunhap(
                          id int auto_increment primary key,
                          so_phieu_nhap varchar(50),
                          ngay_nhap datetime,
                          don_hang_id int,
                          foreign key (don_hang_id) references dondathang(id)
);
create table phieuxuat(
                          id int auto_increment primary key,
                          ngay_xuat datetime,
                          ten_khach_hang varchar(100)
);
create table CT_DonHang(
                           id int auto_increment primary key,
                           don_hang_id int,
                           vat_tu_id int,
                           so_luong_dat int,
                           foreign key (don_hang_id) references dondathang(id),
                           foreign key (vat_tu_id) references vattu(id)
);
create table CT_PhieuNhap(
                             id int auto_increment primary key,
                             phieu_nhap_id int,
                             vat_tu_id int,
                             so_luong_nhap int,
                             don_gia_nhap int,
                             ghi_chu varchar(255),
                             foreign key (phieu_nhap_id) references phieunhap(id),
                             foreign key (vat_tu_id) references vattu(id)
);
create table CT_PhieuXuat(
                             id int auto_increment primary key,
                             phieu_xuat_id int,
                             vat_tu_id int,
                             so_luong_xuat int,
                             don_gia_nhap int,
                             ghi_chu varchar(255),
                             foreign key (phieu_xuat_id) references phieuxuat(id),
                             foreign key (vat_tu_id) references vattu(id)
);
INSERT INTO Vattu (mavt, tenvt, dvtinh, giatien) VALUES
                                                     ('VT001', 'Vật tư 1', 'Cái', 10000),
                                                     ('VT002', 'Vật tư 2', 'Bộ', 20000),
                                                     ('VT003', 'Vật tư 3', 'Thùng', 30000),
                                                     ('VT004', 'Vật tư 4', 'Hộp', 40000),
                                                     ('VT005', 'Vật tư 5', 'Cái', 50000);
INSERT INTO Tonkho (vattu_id, sldau, tongsln, tongslx) VALUES
                                                           (1, 100, 50, 30),
                                                           (2, 200, 60, 40),
                                                           (3, 300, 70, 50),
                                                           (4, 400, 80, 60),
                                                           (5, 500, 90, 70),
                                                           (1, 600, 100, 80),
                                                           (2, 700, 110, 90),
                                                           (3, 800, 120, 100),
                                                           (4, 900, 130, 110),
                                                           (5, 1000, 140, 120);
INSERT INTO Nhacungcap (Ma_nha_cc, ten_nha_cc, diachi, sdt_nha_cc) VALUES
                                                                       ('NCC001', 'Nhà cung cấp 1', 'Địa chỉ 1', '0900111111'),
                                                                       ('NCC002', 'Nhà cung cấp 2', 'Địa chỉ 2', '0900222222'),
                                                                       ('NCC003', 'Nhà cung cấp 3', 'Địa chỉ 3', '0900333333');
INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cc_id) VALUES
                                                              ('DH001', '2024-07-21 10:00:00', 1),
                                                              ('DH002', '2024-07-22 11:00:00', 2),
                                                              ('DH003', '2024-07-23 12:00:00', 3);
INSERT INTO PhieuNhap (so_phieu_nhap, ngay_nhap, don_hang_id) VALUES
                                                                  ('PN001', '2024-07-21 15:00:00', 1),
                                                                  ('PN002', '2024-07-22 16:00:00', 2),
                                                                  ('PN003', '2024-07-23 17:00:00', 3);
INSERT INTO PhieuXuat (ngay_xuat, ten_khach_hang) VALUES
                                                      ('2024-07-21 18:00:00', 'Khách hàng 1'),
                                                      ('2024-07-22 19:00:00', 'Khách hàng 2'),
                                                      ('2024-07-23 20:00:00', 'Khách hàng 3');
INSERT INTO CT_DonHang (don_hang_id, vat_tu_id, so_luong_dat) VALUES
                                                                  (1, 1, 10),
                                                                  (1, 2, 20),
                                                                  (2, 3, 30),
                                                                  (2, 4, 40),
                                                                  (3, 5, 50),
                                                                  (3, 1, 60);
INSERT INTO CT_PhieuNhap (phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
                                                                                              (1, 1, 10, 10000, 'Ghi chú 1'),
                                                                                              (1, 2, 20, 20000, 'Ghi chú 2'),
                                                                                              (2, 3, 30, 30000, 'Ghi chú 3'),
                                                                                              (2, 4, 40, 40000, 'Ghi chú 4'),
                                                                                              (3, 5, 50, 50000, 'Ghi chú 5'),
                                                                                              (3, 1, 60, 10000, 'Ghi chú 6');
INSERT INTO CT_PhieuXuat (phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_nhap, ghi_chu) VALUES
                                                                                              (1, 1, 10, 10000, 'Ghi chú 1'),
                                                                                              (1, 2, 20, 20000, 'Ghi chú 2'),
                                                                                              (2, 3, 30, 30000, 'Ghi chú 3'),
                                                                                              (2, 4, 40, 40000, 'Ghi chú 4'),
                                                                                              (3, 5, 50, 50000, 'Ghi chú 5'),
                                                                                              (3, 1, 60, 10000, 'Ghi chú 6');
create view vw_CTPNhap as
select phieunhap.so_phieu_nhap as so_phieu_nhap,
       CT_PhieuNhap.vat_tu_id as mavt,
       CT_PhieuNhap.so_luong_nhap as so_luong_nhap,
       CT_PhieuNhap.don_gia_nhap as don_gia_nhap,
       (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) as thanh_tien_nhap
from CT_PhieuNhap
         join phieunhap on CT_PhieuNhap.phieu_nhap_id = phieunhap.id;

CREATE VIEW vw_CTPNHAP_VT AS
SELECT
    phieunhap.so_phieu_nhap AS so_phieu_nhap,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuNhap.so_luong_nhap AS so_luong_nhap,
    CT_PhieuNhap.don_gia_nhap AS don_gia_nhap,
    (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) AS thanh_tien_nhap
FROM
    CT_PhieuNhap
        JOIN
    phieunhap ON CT_PhieuNhap.phieu_nhap_id = phieunhap.id
        JOIN
    vattu ON CT_PhieuNhap.vat_tu_id = vattu.id;

CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT
    phieunhap.so_phieu_nhap AS so_phieu_nhap,
    phieunhap.ngay_nhap AS ngay_nhap,
    dondathang.ma_don AS so_don_dat_hang,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuNhap.so_luong_nhap AS so_luong_nhap,
    CT_PhieuNhap.don_gia_nhap AS don_gia_nhap,
    (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) AS thanh_tien_nhap
FROM
    CT_PhieuNhap
        JOIN
    phieunhap ON CT_PhieuNhap.phieu_nhap_id = phieunhap.id
        JOIN
    dondathang ON phieunhap.don_hang_id = dondathang.id
        JOIN
    vattu ON CT_PhieuNhap.vat_tu_id = vattu.id;

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT
    phieunhap.so_phieu_nhap AS so_phieu_nhap,
    phieunhap.ngay_nhap AS ngay_nhap,
    dondathang.ma_don AS so_don_dat_hang,
    nhacungcap.Ma_nha_cc AS ma_nha_cc,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuNhap.so_luong_nhap AS so_luong_nhap,
    CT_PhieuNhap.don_gia_nhap AS don_gia_nhap,
    (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) AS thanh_tien_nhap
FROM
    CT_PhieuNhap
        JOIN
    phieunhap ON CT_PhieuNhap.phieu_nhap_id = phieunhap.id
        JOIN
    dondathang ON phieunhap.don_hang_id = dondathang.id
        JOIN
    nhacungcap ON dondathang.nha_cc_id = nhacungcap.id
        JOIN
    vattu ON CT_PhieuNhap.vat_tu_id = vattu.id;

CREATE VIEW vw_CTPNHAP_loc AS
SELECT
    phieunhap.so_phieu_nhap AS so_phieu_nhap,
    vattu.mavt AS ma_vtt,
    CT_PhieuNhap.so_luong_nhap AS so_luong_nhap,
    CT_PhieuNhap.don_gia_nhap AS don_gia_nhap,
    (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) AS thanh_tien_nhap
FROM
    CT_PhieuNhap
        JOIN
    phieunhap ON CT_PhieuNhap.phieu_nhap_id = phieunhap.id
WHERE
    CT_PhieuNhap.so_luong_nhap > 5;

CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
    phieunhap.so_phieu_nhap AS so_phieu_nhap,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuNhap.so_luong_nhap AS so_luong_nhap,
    CT_PhieuNhap.don_gia_nhap AS don_gia_nhap,
    (CT_PhieuNhap.so_luong_nhap * CT_PhieuNhap.don_gia_nhap) AS thanh_tien_nhap
FROM
    CT_PhieuNhap
        JOIN
    phieunhap ON CT_PhieuNhap.phieu_nhap_id = phieunhap.id
        JOIN
    vattu ON CT_PhieuNhap.vat_tu_id = vattu.id
WHERE
    vattu.dvtinh = 'Bộ';

CREATE VIEW vw_CTPXUAT AS
SELECT
    phieuxuat.id AS so_phieu_xuat,
    CT_PhieuXuat.vat_tu_id AS mavt,
    CT_PhieuXuat.so_luong_xuat AS so_luong_xuat,
    CT_PhieuXuat.don_gia_nhap AS don_gia_xuat,
    (CT_PhieuXuat.so_luong_xuat * CT_PhieuXuat.don_gia_nhap) AS thanh_tien_xuat
FROM
    CT_PhieuXuat
        JOIN
    phieuxuat ON CT_PhieuXuat.phieu_xuat_id = phieuxuat.id;

CREATE VIEW vw_CTPXUAT_VT AS
SELECT
    phieuxuat.id AS so_phieu_xuat,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuXuat.so_luong_xuat AS so_luong_xuat,
    CT_PhieuXuat.don_gia_nhap AS don_gia_xuat
FROM
    CT_PhieuXuat
        JOIN
    phieuxuat ON CT_PhieuXuat.phieu_xuat_id = phieuxuat.id
        JOIN
    vattu ON CT_PhieuXuat.vat_tu_id = vattu.id;

CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT
    phieuxuat.id AS so_phieu_xuat,
    phieuxuat.ten_khach_hang AS ten_khach_hang,
    vattu.mavt AS mavt,
    vattu.tenvt AS tenvt,
    CT_PhieuXuat.so_luong_xuat AS so_luong_xuat,
    CT_PhieuXuat.don_gia_nhap AS don_gia_xuat
FROM
    CT_PhieuXuat
        JOIN
    phieuxuat ON CT_PhieuXuat.phieu_xuat_id = phieuxuat.id
        JOIN
    vattu ON CT_PhieuXuat.vat_tu_id = vattu.id;

DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_vat_tu(IN p_mavt VARCHAR(50))
BEGIN
SELECT
    vattu.mavt,
    SUM(tonkho.tongsln - tonkho.tongslx) AS tong_so_luong_cuoi
FROM
    vattu
        JOIN
    tonkho ON vattu.id = tonkho.vattu_id
WHERE
    vattu.mavt = p_mavt
GROUP BY
    vattu.mavt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tong_tien_xuat_vat_tu(IN p_mavt VARCHAR(50))
BEGIN
SELECT
    vattu.mavt,
    SUM(CT_PhieuXuat.so_luong_xuat * CT_PhieuXuat.don_gia_nhap) AS tong_tien_xuat
FROM
    CT_PhieuXuat
        JOIN
    vattu ON CT_PhieuXuat.vat_tu_id = vattu.id
WHERE
    vattu.mavt = p_mavt
GROUP BY
    vattu.mavt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_vat_tu(IN p_mavt VARCHAR(50))
BEGIN
SELECT
    vattu.mavt,
    SUM(tonkho.tongsln - tonkho.tongslx) AS tong_so_luong_cuoi
FROM
    vattu
        JOIN
    tonkho ON vattu.id = tonkho.vattu_id
WHERE
    vattu.mavt = p_mavt
GROUP BY
    vattu.mavt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_vat_tu(IN p_mavt VARCHAR(50))
BEGIN
SELECT
    vattu.mavt,
    SUM(tonkho.tongsln - tonkho.tongslx) AS tong_so_luong_cuoi
FROM
    vattu
        JOIN
    tonkho ON vattu.id = tonkho.vattu_id
WHERE
    vattu.mavt = p_mavt
GROUP BY
    vattu.mavt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_vat_tu(IN p_mavt VARCHAR(50))
BEGIN
SELECT
    vattu.mavt,
    SUM(tonkho.tongsln - tonkho.tongslx) AS tong_so_luong_cuoi
FROM
    vattu
        JOIN
    tonkho ON vattu.id = tonkho.vattu_id
WHERE
    vattu.mavt = p_mavt
GROUP BY
    vattu.mavt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_xoa_nha_cung_cap(IN p_id INT)
BEGIN

UPDATE dondathang
SET nha_cc_id = NULL
WHERE nha_cc_id = p_id;


DELETE FROM nhacungcap
WHERE id = p_id;
END //
DELIMITER ;


