CREATE DATABASE data_olshop;
---one to one---

CREATE TABLE pengguna(
    id_pengguna INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(225),
    password VARCHAR(255),
    PRIMARY key (id_pengguna)
);

INSERT INTO pengguna (username,password)
VALUES ('adigokil12','qwe123'),('inieca12','qwe123'),('kakarei12','qwe123'),
('bimalampung12','qwe123'),('kerjakalianapa','qwe123');

CREATE TABLE transaksi(
    kode_transaksi VARCHAR(255),
    jlh_transaksi INTEGER,
    nominal_transaksi INTEGER,
    tgl_transaksi DATE,
    id_pengguna INTEGER,
    id_produk INTEGER,
    PRIMARY key (kode_transaksi),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna (id_pengguna),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

INSERT INTO transaksi (kode_transaksi,jlh_transaksi,nominal_transaksi,tgl_transaksi,id_pengguna,id_produk)
VALUES ('AB22',1,800000,'2023-06-11',1,1),('AB23',2,280000,'2023-06-11',2,2),('AB24',1,200000,'2023-06-11',3,5),
('AB25',1,135000,'2023-06-11',3,3),('AB26',1,600000,'2023-06-11',4,4),('AB27',1,140000,'2023-06-11',4,2),
('AB28',1,800000,'2023-06-11',5,5);

SELECT pengguna.username, transaksi.kode_transaksi, transaksi.jlh_transaksi
FROM pengguna
JOIN transaksi ON pengguna.id_pengguna = transaksi.id_pengguna;

---one to many

CREATE TABLE produk(
    id_produk INTEGER GENERATED ALWAYS AS IDENTITY,
    nama_produk VARCHAR(225),
    harga_produk INTEGER,
    kategori_produk VARCHAR(255),
    PRIMARY key (id_produk)
);

INSERT INTO produk (nama_produk,harga_produk,kategori_produk)
VALUES ('vape ursa',800000,'vape'),('liquid manggo',140000,'liquid'),('liquid stroberi',135000,'liquid'),
('vape smoan',600000,'vape'),('tali leher',20000,'aksesoris'),('silicon vape',50000,'aksesoris');

CREATE TABLE transaksi(
    kode_transaksi VARCHAR(255),
    jlh_transaksi INTEGER,
    nominal_transaksi INTEGER,
    tgl_transaksi DATE,
    id_pengguna INTEGER,
    id_produk INTEGER,
    PRIMARY key (kode_transaksi),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna (id_pengguna),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

INSERT INTO transaksi (kode_transaksi,jlh_transaksi,nominal_transaksi,tgl_transaksi,id_pengguna,id_produk)
VALUES ('AB22',1,800000,'2023-06-11',1,1),('AB23',2,280000,'2023-06-11',2,2),('AB24',1,200000,'2023-06-11',3,5),
('AB25',1,135000,'2023-06-11',3,3),('AB26',1,600000,'2023-06-11',4,4),('AB27',1,140000,'2023-06-11',4,2),
('AB28',1,800000,'2023-06-11',5,5);

SELECT transaksi.kode_transaksi, produk.nama_produk, transaksi.jlh_transaksi
FROM transaksi
JOIN produk ON transaksi.id_produk = produk.id_produk;


---many to many---

CREATE TABLE pengguna(
    id_pengguna INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(225),
    password VARCHAR(255),
    PRIMARY key (id_pengguna)
);

INSERT INTO pengguna (username,password)
VALUES ('adigokil12','qwe123'),('inieca12','qwe123'),('kakarei12','qwe123'),
('bimalampung12','qwe123'),('kerjakalianapa','qwe123');

CREATE TABLE produk(
    id_produk INTEGER GENERATED ALWAYS AS IDENTITY,
    nama_produk VARCHAR(225),
    harga_produk INTEGER,
    kategori_produk VARCHAR(255),
    PRIMARY key (id_produk)
);

INSERT INTO produk (nama_produk,harga_produk,kategori_produk)
VALUES ('vape ursa',800000,'vape'),('liquid manggo',140000,'liquid'),('liquid stroberi',135000,'liquid'),
('vape smoan',600000,'vape'),('tali leher',20000,'aksesoris'),('silicon vape',50000,'aksesoris');

CREATE TABLE transaksi(
    kode_transaksi VARCHAR(255),
    jlh_transaksi INTEGER,
    nominal_transaksi INTEGER,
    tgl_transaksi DATE,
    id_pengguna INTEGER,
    id_produk INTEGER,
    PRIMARY key (kode_transaksi),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna (id_pengguna),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

INSERT INTO transaksi (kode_transaksi,jlh_transaksi,nominal_transaksi,tgl_transaksi,id_pengguna,id_produk)
VALUES ('AB22',1,800000,'2023-06-11',1,1),('AB23',2,280000,'2023-06-11',2,2),('AB24',1,200000,'2023-06-11',3,5),
('AB25',1,135000,'2023-06-11',3,3),('AB26',1,600000,'2023-06-11',4,4),('AB27',1,140000,'2023-06-11',4,2),
('AB28',1,800000,'2023-06-11',5,5);

SELECT transaksi.*, pengguna.username, produk.nama_produk
FROM transaksi
JOIN pengguna ON transaksi.id_pengguna = pengguna.id_pengguna
JOIN produk ON transaksi.id_produk = produk.id_produk;
