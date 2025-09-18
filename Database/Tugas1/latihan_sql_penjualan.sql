# membuat database
create database if not exists warung;

#menggunakan database yang sudah dibuat
use warung;

## pembuatan dan normalisasi tabel pelanggan
create table if not exists pelanggan (
	kode_pelanggan varchar(50) primary key,
    kode_jenis_kelamin int,
    nama_pelanggan varchar(100),
    alamat varchar(100),
    kode_kota int,
    constraint fk_pelanggan_jenis_kelamin
		foreign key (kode_jenis_kelamin) references jenis_kelamin(kode_jenis_kelamin)
        on delete cascade on update cascade, 
	constraint fk_pelanggan_kota
		foreign key (kode_kota) references kota(kode_kota)
        on delete cascade on update cascade
);

# membuat procedure insert pelanggan
DROP PROCEDURE IF EXISTS add_pelanggan;
DELIMITER //
CREATE PROCEDURE  add_pelanggan (
	kode_pelanggan varchar(50),
    kode_jenis_kelamin int,
    nama_pelanggan varchar(100),
    alamat varchar(100),
    kode_kota int
)
BEGIN
	INSERT INTO pelanggan VALUES (kode_pelanggan, kode_jenis_kelamin,nama_pelanggan,alamat,kode_kota);
    select 	* from	pelanggan;
END//
DELIMITER ;
call add_pelanggan ('PLG01',0,'Mohammad','Priok',1);
call add_pelanggan ('PLG02',0,'Naufal','Cilincing',1);
call add_pelanggan ('PLG03',0,'Atila','Bojongsoang',2);
call add_pelanggan ('PLG04',1,'Tsalsa','Buah Batu',2);
call add_pelanggan ('PLG05',1,'Damay','Gubeng',3);
call add_pelanggan ('PLG06',0,'Tsaniy','Darmo',3);
call add_pelanggan ('PLG07',1,'Nabila','Lebak Bulus',1);

# membuat procedure update pelanggan
# membuat procedure delete pelanggan

## pembuatan dan normalisasi tabel jenis_kelamin
create table if not exists jenis_kelamin (
	kode_jenis_kelamin int primary key,
    jenis_kelamin varchar(10)
);

# membuat procedure insert jenis kelamin
DELIMITER //
CREATE PROCEDURE add_jenis_kelamin (
	kode_jenis_kelamin int,
    jenis_kelamin varchar(10)
)
BEGIN
	INSERT jenis_kelamin VALUES (kode_jenis_kelamin, jenis_kelamin);
    select 	* from	jenis_kelamin;
END//
DELIMITER ;
call add_jenis_kelamin (0,'Laki-laki');
call add_jenis_kelamin (1,'Perempuan');

# membuat procedure update jenis kelamin
DELIMITER //
CREATE PROCEDURE update_jenis_kelamin (
	update_kode_jenis_kelamin int,
    update_jenis_kelamin varchar(10)
)
BEGIN
	UPDATE jenis_kelamin 
    SET jenis_kelamin = update_jenis_kelamin
    WHERE kode_jenis_kelamin = update_kode_jenis_kelamin;
    select 	* from	jenis_kelamin;
END//
DELIMITER ;
call update_jenis_kelamin (0,'Laki-laki');
call update_jenis_kelamin (1,'Perempuan');

# membuat procedure delete jenis kelamin
DELIMITER //
CREATE PROCEDURE delete_jenis_kelamin (
	delete_kode_jenis_kelamin int,
    delete_jenis_kelamin varchar(10)
)
BEGIN
	DELETE FROM jenis_kelamin 
    WHERE kode_jenis_kelamin = delete_kode_jenis_kelamin;
    select 	* from	jenis_kelamin;
END//
DELIMITER ;
call delete_jenis_kelamin (0,'Laki-laki');
call delete_jenis_kelamin (1,'Perempuan');

## pembuatan dan normalisasi tabel kota
create table if not exists kota (
	kode_kota int primary key,
    nama_kota varchar(50)
);

#membuat procedure insert kota
DELIMITER //
CREATE PROCEDURE add_kota (
	kode_kota int,
    nama_kota varchar(50)
)
BEGIN
	INSERT kota VALUES (kode_kota, nama_kota);
    select 	* from	kota;
END//
DELIMITER ;
call add_kota (1,'Jakarta');
call add_kota (2,'Bandung');
call add_kota (3,'Surabaya');

# membuat procedure update kota
DELIMITER //
CREATE PROCEDURE update_kota (
	update_kode_kota int,
    update_nama_kota varchar(50)
)
BEGIN
	UPDATE kota 
    SET nama_kota = update_nama_kota
    WHERE kode_kota = update_kode_kota;
    select 	* from	kota;
END//
DELIMITER ;
call update_kota (1,'Jakarta Update');
call update_kota (2,'Bandung Update');
call update_kota (3,'Surbaya Update');

#membuat procedure delete kota
DELIMITER //
CREATE PROCEDURE delete_kota (
	delete_kode_kota int,
    delete_nama_kota varchar(50)
)
BEGIN
	DELETE FROM kota 
    WHERE kode_kota = delete_kode_kota;
    select 	* from	kota;
END//
DELIMITER ;
call delete_kota (1,'Jakarta Update');
call delete_kota (2,'Bandung Update');
call delete_kota (3,'Surbaya Update');

## pembuatan dan normalisasi tabel produk
create table if not exists produk (
	kode_produk varchar(50) primary key,
    nama_produk varchar(255),
    kode_satuan_produk int,
    stok int,
    harga int,
    constraint fk_produk_satuan_produk
		foreign key (kode_satuan_produk) references satuan_produk(kode_satuan_produk)
        on delete cascade on update cascade
);

# membuat procedure insert produk
DROP PROCEDURE IF EXISTS add_produk;
DELIMITER //
CREATE PROCEDURE add_produk (
	kode_produk varchar(50),
    nama_produk varchar(255),
    kode_satuan_produk int,
    stok int,
    harga int
)
BEGIN
	INSERT produk VALUES (kode_produk, nama_produk,kode_satuan_produk,stok,harga);
    select 	* from produk;
END//
DELIMITER ;
call add_produk ('P001','Indomie',1,10,3000);
call add_produk ('P002','Roti',2,3,18000);
call add_produk ('P003','Kecap',3,8,4700);
call add_produk ('P004','Saos Tomat',3,8,5800);
call add_produk ('P005','Bihun',1,5,3500);
call add_produk ('P006','Sikat Gigi',2,5,15000);
call add_produk ('P007','Pasta Gigi',1,7,10000);
call add_produk ('P008','Saos Sambal',3,5,7300);

# membuat procedure update produk
# membuat procedure delete produk


## pembuatan dan normalisasi tabel satuan_produk
create table if not exists satuan_produk (
	kode_satuan_produk int primary key,
    satuan_produk varchar(50)
);

# membuat procedure insert satuan produk
DROP PROCEDURE IF EXISTS add_satuan_produk;
DELIMITER //
CREATE PROCEDURE add_satuan_produk (
	kode_satuan_produk int,
    satuan_produk varchar(50)
)
BEGIN
	INSERT satuan_produk VALUES (kode_satuan_produk, satuan_produk);
    select 	* from	satuan_produk;
END//
DELIMITER ;
call add_satuan_produk (1,'Bungkus');
call add_satuan_produk (2,'Pak');
call add_satuan_produk (3,'Botol');

# membuat procedure update
# membuat procedure delete

## pembuatan dan normalisasi tabel satuan_produk
create table if not exists penjualan (
	kode_penjualan int auto_increment primary key,
	tanggal_jual date,
    no_jual varchar(50),
    kode_pelanggan varchar(50),
    kode_produk varchar(50),
    jumlah int,
    constraint fk_penjualan_pelanggan
		foreign key (kode_pelanggan) references pelanggan(kode_pelanggan)
        on delete cascade on update cascade,
	constraint fk_penjualan_produk
		foreign key (kode_produk) references produk(kode_produk)
        on delete cascade on update cascade
    
);

# membuat procedure insert penjualan
DROP PROCEDURE IF EXISTS add_penjualan;
DELIMITER //
CREATE PROCEDURE add_penjualan(
	kode_penjualan int,
	tanggal_jual date,
    no_jual varchar(50),
    kode_pelanggan varchar(50),
    kode_produk varchar(50),
    jumlah int
)
BEGIN
	INSERT penjualan VALUES (kode_penjualan, tanggal_jual,no_jual,kode_pelanggan,kode_produk,jumlah);
    select 	* from	penjualan;
END//
DELIMITER ;
call add_penjualan (1,'2025-09-08','J001','PLG03','P001',2);
call add_penjualan (2,'2025-09-08','J001','PLG03','P003',1);
call add_penjualan (3,'2025-09-08','J001','PLG03','P004',1);
call add_penjualan (4,'2025-09-08','J002','PLG07','P006',3);
call add_penjualan (5,'2025-09-08','J002','PLG07','P007',1);
call add_penjualan (6,'2025-09-09','J003','PLG02','P001',5);
call add_penjualan (7,'2025-09-09','J003','PLG02','P004',2);
call add_penjualan (8,'2025-09-09','J003','PLG02','P008',2);
call add_penjualan (9,'2025-09-09','J003','PLG02','P003',1);
call add_penjualan (10,'2025-09-10','J004','PLG05','P002',3);
call add_penjualan (11,'2025-09-10','J004','PLG05','P004',2);
call add_penjualan (12,'2025-09-10','J004','PLG05','P008',2);
call add_penjualan (13,'2025-09-10','J004','PLG05','P006',2);
call add_penjualan (14,'2025-09-10','J004','PLG05','P007',1);

# membuat procedure update penjualan
# membuat procedure delete penjualan

# 07.virtual view
# virtual view pelanggan
create view tabel_pelanggan as
select pelanggan.kode_pelanggan,pelanggan.nama_pelanggan,jenis_kelamin.jenis_kelamin,pelanggan.alamat,kota.nama_kota
 from pelanggan
 join jenis_kelamin on jenis_kelamin.kode_jenis_kelamin = pelanggan.kode_jenis_kelamin 
 join kota on kota.kode_kota = pelanggan.kode_kota
 order by pelanggan.kode_pelanggan asc;
 
 select * from tabel_pelanggan;
 
#virtual view produk
create view tabel_produk as
select produk.kode_produk,produk.nama_produk,satuan_produk.satuan_produk,produk.stok,produk.harga
 from produk
 join satuan_produk on satuan_produk.kode_satuan_produk = produk.kode_satuan_produk
 order by produk.kode_produk asc;
 
select * from tabel_produk;
 
# virtual view penjualan
create view tabel_penjualan as
select penjualan.tanggal_jual,penjualan.no_jual,pelanggan.nama_pelanggan,produk.nama_produk,penjualan.jumlah
 from penjualan
 join pelanggan on pelanggan.kode_pelanggan = penjualan.kode_pelanggan
 join produk on produk.kode_produk = penjualan.kode_produk
 order by penjualan.tanggal_jual asc;
 
select * from tabel_penjualan;

# 08.fungsi menghitung penjualan
# fungsi menghitung jumlah produk yg terjual
DROP FUNCTION IF EXISTS get_jumlah_terjual;
DELIMITER //
CREATE FUNCTION get_jumlah_terjual(
    p_kode_produk VARCHAR(10)
    #p_tanggal DATE
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT IFNULL(SUM(jumlah), 0)
      INTO total
    FROM penjualan
    WHERE kode_produk = p_kode_produk;
      #AND tanggal_jual = p_tanggal;
    RETURN total;
END//
DELIMITER ;

# fungsi menghitung stok akhir
DROP FUNCTION IF EXISTS get_stok_akhir;
DELIMITER //
CREATE FUNCTION get_stok_akhir(
    p_kode_produk VARCHAR(10)
    #p_tanggal DATE
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stok_awal INT;
    DECLARE terjual INT;

    SELECT stok INTO stok_awal
    FROM produk
    WHERE kode_produk = p_kode_produk;

    #SET terjual = get_jumlah_terjual(p_kode_produk, p_tanggal);
    SET terjual = get_jumlah_terjual(p_kode_produk);

    RETURN (stok_awal - terjual);
END//
DELIMITER ;

# fungsi total_penjualan
DROP FUNCTION IF EXISTS get_total_penjualan_produk;
DELIMITER //
CREATE FUNCTION get_total_penjualan_produk(
    p_kode_produk VARCHAR(10)
    #p_tanggal DATE
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE harga_awal INT;
    DECLARE terjual INT;

    SELECT harga INTO harga_awal
    FROM produk
    WHERE kode_produk = p_kode_produk;

    #SET terjual = get_jumlah_terjual(p_kode_produk, p_tanggal);
    SET terjual = get_jumlah_terjual(p_kode_produk);

    RETURN (harga_awal * terjual);
END//
DELIMITER ;






# 09.procedure unutk mencari penjualan pada salah satu minitor record
DROP PROCEDURE IF EXISTS sp_lihat_penjualan_by_tanggal;
DELIMITER //
CREATE PROCEDURE sp_lihat_penjualan_by_tanggal(
    #IN p_tanggal DATE
)
BEGIN
    SELECT 
        pr.kode_produk,
        pr.nama_produk,
        pr.stok AS stok_awal,
        pr.harga as harga_satuan,
        #get_jumlah_terjual(pr.kode_produk, p_tanggal) AS jumlah_terjual,
        #get_total_penjualan_produk(pr.kode_produk, p_tanggal) as total_jual_produk,
        #get_stok_akhir(pr.kode_produk, p_tanggal) AS stok_akhir
		get_jumlah_terjual(pr.kode_produk) AS jumlah_terjual,
        get_total_penjualan_produk(pr.kode_produk) as total_jual_produk,
        get_stok_akhir(pr.kode_produk) AS stok_akhir
    FROM produk pr;
END//
DELIMITER ;

#CALL sp_lihat_penjualan_by_tanggal('2025-09-10');
CALL sp_lihat_penjualan_by_tanggal();




