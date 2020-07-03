-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2020 at 06:12 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nama_dokter`, `no_telp`, `jenis_kelamin`, `alamat`) VALUES
('D001', 'AHMAD', '08564534234', 'Laki-Laki', 'BLIMBING'),
('D003', 'SUSENODY', '08566567267', 'Laki-Laki', 'KRA'),
('D004', 'TINA', '08675464387', 'Perempuan', 'solo');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_obat` varchar(10) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_obat`, `nama_obat`, `dosis`, `harga`) VALUES
('OB001', 'MEGADON', 'OBAT KERAS', 10000),
('OB002', 'MIXAGRIP', 'ANAK-ANAK', 8000),
('OB003', 'TOLAK ANGIN', 'ANAK & DEWASA', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `umur` varchar(10) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`kd_pasien`, `nama_pasien`, `umur`, `jenis_kelamin`, `alamat`) VALUES
('P002', 'DEFANI', '22', 'Laki-Laki', 'SUKOHARJO'),
('P003', 'RAHMA', '33', 'Perempuan', 'NGUTEROK'),
('P005', 'YUMA', '55', 'Laki-Laki', 'KARANGANYAR'),
('P006', 'AHMAD', '20', 'Laki-Laki', 'BLIMBING'),
('P007', 'RAMADHAN', '30', 'Laki-Laki', 'WONOREJO'),
('P008', 'RAHMATINA CANTIK AJA', '35', 'Perempuan', 'NGUTEROK');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `kd_pemeriksaan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `diagnosa` varchar(100) NOT NULL,
  `tgl_pemeriksaan` varchar(10) NOT NULL,
  `hasil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`kd_pemeriksaan`, `kd_dokter`, `nama_dokter`, `kd_pasien`, `nama_pasien`, `diagnosa`, `tgl_pemeriksaan`, `hasil`) VALUES
('KP001', 'D001', 'AHMAD', 'P003', 'RAHMA', 'Berat', '2020-06-01', 'Rawat Inap'),
('KP002', 'D004', 'TINA', 'P002', 'DEFANI', 'Ringan', '2020-05-31', 'Rawat Jalan'),
('KP003', 'D004', 'TINA', 'P005', 'YUMA', 'Berat', '2020-06-02', 'Rawat Inap'),
('KP004', 'D001', 'AHMAD', 'P006', 'AHMAD', 'Ringan', '2020-06-02', 'Rawat Jalan');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `kd_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`kd_perawat`, `nama_perawat`, `no_telp`, `jenis_kelamin`, `alamat`) VALUES
('PE001', 'TONO', '089867455654', 'Perempuan', 'TER'),
('PE002', 'TINI', '2312231', 'Laki-Laki', 'ROOK'),
('PE003', 'DWI', '8757567567', 'Perempuan', 'KRA');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `kd_inap` varchar(10) NOT NULL,
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(20) NOT NULL,
  `tgl_inap` varchar(10) NOT NULL,
  `tgl_keluar` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`kd_inap`, `kd_ruangan`, `nama_ruangan`, `kd_dokter`, `nama_dokter`, `kd_pasien`, `nama_pasien`, `kd_perawat`, `nama_perawat`, `tgl_inap`, `tgl_keluar`) VALUES
('RI001', 'R002', 'ANGGREK', 'D001', 'AHMAD', 'P003', 'RAHMA', 'PE002', 'TINI', '2020-06-02', '2020-06-04'),
('RI002', 'R003', 'BANGKAI', 'D004', 'TINA', 'P005', 'YUMA', 'PE003', 'DWI', '2020-06-01', '2020-06-17');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `kd_jalan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(100) NOT NULL,
  `tgl_periksa` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat_jalan`
--

INSERT INTO `rawat_jalan` (`kd_jalan`, `kd_dokter`, `nama_dokter`, `kd_pasien`, `nama_pasien`, `kd_resep`, `resep_obat`, `tgl_periksa`) VALUES
('RJ001', 'D001', 'AHMAD', 'P006', 'AHMAD', 'OB002', 'MIXAGRIP', '2020-06-02'),
('RJ002', 'D004', 'TINA', 'P002', 'DEFANI', 'OB001', 'MEGADON', '2020-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `nama_ruangan`) VALUES
('R001', 'MELATI'),
('R002', 'ANGGREK'),
('R003', 'BANGKAI');

-- --------------------------------------------------------

--
-- Table structure for table `user_pengguna`
--

CREATE TABLE `user_pengguna` (
  `id_pengguna` varchar(4) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `no_telp_pengguna` varchar(14) NOT NULL,
  `alamat_pengguna` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_pengguna`
--

INSERT INTO `user_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `no_telp_pengguna`, `alamat_pengguna`) VALUES
('P001', 'DEFANI AHMAD RAMADHAN', 'admin', 'dfn', '081225310991', 'POLOKARTO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kd_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`kd_pasien`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`kd_pemeriksaan`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`kd_perawat`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`kd_inap`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`kd_jalan`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indexes for table `user_pengguna`
--
ALTER TABLE `user_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
