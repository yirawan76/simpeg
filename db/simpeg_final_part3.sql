-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2020 at 03:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpeg`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_pangkat_golongan`
--

CREATE TABLE `master_pangkat_golongan` (
  `id` int(11) NOT NULL,
  `golongan` varchar(4) NOT NULL,
  `pangkat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_pangkat_golongan`
--

INSERT INTO `master_pangkat_golongan` (`id`, `golongan`, `pangkat`) VALUES
(1, 'IA', 'Juru Muda'),
(2, 'IB', 'Juru Muda Tingkat 1'),
(3, 'IC', 'Juru'),
(4, 'ID', 'Juru Tingkat 1'),
(5, 'IIA', 'Pengatur Muda'),
(6, 'IIB', 'Pengatur Muda Tingkat 1'),
(7, 'IIC', 'Pengatur'),
(8, 'IID', 'Pengatur Tingkat 1'),
(9, 'IIIA', 'Penata Muda'),
(10, 'IIIB', 'Penata Muda Tingkat 1'),
(11, 'IIIC', 'Penata'),
(12, 'IIID', 'Penata Tingkat 1'),
(13, 'IVA', 'Pembina'),
(14, 'IVB', 'Pembina Tingkat 1'),
(15, 'IVC', 'Pembina Utama Muda'),
(16, 'IVD', 'Pembina Utama Madya'),
(17, 'IVE', 'Pembina Utama');

-- --------------------------------------------------------

--
-- Table structure for table `master_tingkat_pendidikan`
--

CREATE TABLE `master_tingkat_pendidikan` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `nama_short` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_tingkat_pendidikan`
--

INSERT INTO `master_tingkat_pendidikan` (`id`, `nama`, `nama_short`) VALUES
(1, 'Sekolah Dasar', 'SD'),
(2, 'Sekolah Menengah Pertama', 'SMP'),
(3, 'Sekolah Menengah Atas', 'SMA'),
(4, 'Strata 1', 'S1');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nip` varchar(32) NOT NULL,
  `tmt` date NOT NULL,
  `nama` text NOT NULL,
  `foto` text NOT NULL,
  `tempat_lahir` varchar(32) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` tinyint(1) NOT NULL,
  `jenis_kelamin` tinyint(1) NOT NULL,
  `nikah` tinyint(1) NOT NULL,
  `status_pegawai` tinyint(1) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(32) NOT NULL,
  `salt` text NOT NULL,
  `password` text NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pangkat_golongan`
--

CREATE TABLE `pegawai_pangkat_golongan` (
  `id` int(11) NOT NULL,
  `id_master_pangkat_golongan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal_sk` date NOT NULL,
  `no_sk` varchar(30) NOT NULL,
  `scan` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pendidikan`
--

CREATE TABLE `pegawai_pendidikan` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_tingkat_pendidikan` int(11) NOT NULL,
  `no_ijazah` text NOT NULL,
  `scan_ijazah` text NOT NULL,
  `tahun_lulus` varchar(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_pangkat_golongan`
--
ALTER TABLE `master_pangkat_golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_tingkat_pendidikan`
--
ALTER TABLE `master_tingkat_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai_pangkat_golongan`
--
ALTER TABLE `pegawai_pangkat_golongan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_master_pangkat_golongan` (`id_master_pangkat_golongan`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pegawai_pendidikan`
--
ALTER TABLE `pegawai_pendidikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_tingkat_pendidikan` (`id_tingkat_pendidikan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_pangkat_golongan`
--
ALTER TABLE `master_pangkat_golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `master_tingkat_pendidikan`
--
ALTER TABLE `master_tingkat_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_pangkat_golongan`
--
ALTER TABLE `pegawai_pangkat_golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_pendidikan`
--
ALTER TABLE `pegawai_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pegawai_pangkat_golongan`
--
ALTER TABLE `pegawai_pangkat_golongan`
  ADD CONSTRAINT `pegawai_pangkat_golongan_ibfk_1` FOREIGN KEY (`id_master_pangkat_golongan`) REFERENCES `master_pangkat_golongan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_pangkat_golongan_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pegawai_pendidikan`
--
ALTER TABLE `pegawai_pendidikan`
  ADD CONSTRAINT `pegawai_pendidikan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_pendidikan_ibfk_2` FOREIGN KEY (`id_tingkat_pendidikan`) REFERENCES `master_tingkat_pendidikan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
