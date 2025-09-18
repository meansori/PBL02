create database imanapp;
use imanapp;
create table kegiatan (
	id_kegiatan int auto_increment primary key,
    nama_kegiatan varchar(100) not null,
    lokasi varchar(100),
	waktu_mulai datetime not null,
    waktu_selesai datetime,
    pemateri varchar(100),
    materi varchar(100),
    penanggung_jawab varchar(100),
    created_at timestamp default current_timestamp
);

create table peserta (
	id_peserta int auto_increment primary key,
    nama varchar(100) not null,
    asal varchar(100),
    status_enum  enum('pranikah','remaja','praremaja','caberawit') not null,
    created_at timestamp default current_timestamp
);

create table absensi (
	id_absensi int auto_increment primary key ,
    id_kegiatan int not null,
    id_peserta int not null,
    status_kehadiran enum('hadir','izin','sakit','alfa') not null,
    waktu_absen timestamp default current_timestamp,
    constraint fk_absensi_kegiatan 
		foreign key (id_kegiatan) references kegiatan(id_kegiatan)
        on delete cascade on update cascade,
	constraint fk_absensi_peserta
		foreign key (id_peserta) references peserta(id_peserta)
        on delete cascade on update cascade,
	unique key uniq_kegiatan_peserta (id_kegiatan,id_peserta)	
);

-- kegiatan
INSERT INTO kegiatan (nama_kegiatan, lokasi, waktu_mulai, waktu_selesai, pemateri,materi, penanggung_jawab)
VALUES 
('Pelatihan Pemuda', 'Balai Desa', '2025-09-20 08:00:00', '2025-09-20 12:00:00', 'Pak Budi','akhlak manusia', 'Panitia A'),
('Seminar Remaja', 'Gedung Serbaguna', '2025-09-25 09:00:00', '2025-09-25 13:00:00', 'Bu Sari','akhlak manusia 2', 'Panitia B');

-- peserta
INSERT INTO peserta (nama, asal, status_enum)
VALUES
('Andi', 'Desa Sukamaju', 'remaja'),
('Budi', 'Desa Mekarjaya', 'pranikah'),
('Citra', 'Desa Harapan', 'caberawit');

-- absensi
INSERT INTO absensi (id_kegiatan, id_peserta, status_kehadiran)
VALUES
(1, 1, 'hadir'),
(1, 2, 'izin'),
(2, 3, 'hadir');

select * from kegiatan;
select * from peserta;
select * from absensi;

select kegiatan.nama_kegiatan,peserta.nama,absensi.status_kehadiran,absensi.waktu_absen
 from kegiatan,peserta,absensi
 where kegiatan.id_kegiatan = 1;