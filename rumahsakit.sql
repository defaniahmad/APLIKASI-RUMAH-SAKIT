-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2020 at 01:05 PM
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
  `alamat` varchar(30) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nama_dokter`, `no_telp`, `jenis_kelamin`, `alamat`, `spesialis`, `harga`) VALUES
('D003', 'SUSENODY', '08566567267', 'Laki-Laki', 'KRA', 'ANAK', 2000000),
('D004', 'TINA', '08675464387', 'Perempuan', 'solo', 'KANDUNGAN', 3000000),
('D005', 'TANA', '08562772676', 'Laki-Laki', 'SUKOHARJO', 'JANTUNG', 500000),
('D006', 'TIARA', '081281828128', 'Perempuan', 'WONOGIRI', 'TULANG', 700000),
('D007', 'AHMAD', '2323121', 'Laki-Laki', 'KARANGANYAR', 'MATA', 230000);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(100) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_resep`, `resep_obat`, `dosis`, `harga`) VALUES
('OB001', 'MEGADON', 'OBAT KERAS', 10000),
('OB002', 'OBAT KHUSUS MATA', 'DEWASA', 180000);

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
('P007', 'RAMADHAN', '30', 'Laki-Laki', 'WONOREJO'),
('P008', 'RAMA', '25', 'Laki-Laki', 'POLOKARTO'),
('P009', 'DORA', '23', 'Perempuan', 'SOLO'),
('P010', 'DEFANI AHMAD', '20', 'Laki-Laki', 'SUKOHARJO');

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
('KP001', 'D007', 'AHMAD', 'P010', 'DEFANI AHMAD', 'Berat', '2020-07-12', 'Rawat Inap');

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
('PE003', 'DWI', '8757567567', 'Perempuan', 'KRA'),
('PE004', 'HARSA', '0827272828', 'Laki-Laki', 'KARANGANYAR'),
('PE005', 'RIANA', '081721827', 'Perempuan', 'SUKOHARJO'),
('PE006', 'RAHMA', '19028190', 'Perempuan', 'KARANGANYAR');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `kd_inap` varchar(10) NOT NULL,
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `biaya` int(30) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `biaya_dokter` int(30) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(20) NOT NULL,
  `tgl_inap` date NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `lama_menginap` varchar(10) DEFAULT NULL,
  `total_biaya` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`kd_inap`, `kd_ruangan`, `nama_ruangan`, `biaya`, `kd_dokter`, `nama_dokter`, `spesialis`, `biaya_dokter`, `kd_pasien`, `nama_pasien`, `kd_perawat`, `nama_perawat`, `tgl_inap`, `tgl_keluar`, `lama_menginap`, `total_biaya`) VALUES
('RI001', 'R006', 'MAWAR', 240000, 'D007', 'AHMAD', 'MATA', 230000, 'P010', 'DEFANI AHMAD', 'PE006', 'RAHMA', '2020-07-12', '2020-07-15', '3', 'Rp. 950.000');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `kd_jalan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `biaya_dokter` int(30) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(100) NOT NULL,
  `harga` int(30) NOT NULL,
  `tgl_periksa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `biaya` int(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `nama_ruangan`, `biaya`, `type`) VALUES
('R001', 'MELATI', 200000, 'UMUM'),
('R002', 'ANGGREK', 20000, 'UMUM'),
('R003', 'BANGKAI', 450000, 'VIP'),
('R005', 'BANGSAL', 350000, 'UMUM'),
('R006', 'MAWAR', 240000, 'VIP');

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
  ADD PRIMARY KEY (`kd_resep`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`kd_pasien`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`kd_pemeriksaan`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`kd_perawat`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`kd_inap`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_perawat` (`kd_perawat`),
  ADD KEY `kd_ruangan` (`kd_ruangan`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`kd_jalan`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_resep` (`kd_resep`);

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pasien` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pemeriksaan` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`kd_ruangan`) REFERENCES `ruangan` (`kd_ruangan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_ibfk_3` FOREIGN KEY (`kd_perawat`) REFERENCES `perawat` (`kd_perawat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD CONSTRAINT `rawat_jalan_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pemeriksaan` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jalan_ibfk_2` FOREIGN KEY (`kd_resep`) REFERENCES `obat` (`kd_resep`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
