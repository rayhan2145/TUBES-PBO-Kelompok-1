-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 15, 2026 at 04:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `id_kategori` varchar(20) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `id_kategori`, `satuan`) VALUES
('B001', 'Laptop Lenovo', 55, 'K001', 'Unit'),
('B003', 'Meja Kantor', 30, 'K002', 'Unit'),
('B004', 'Kursi Kantor', 25, 'K002', 'Unit'),
('B005', 'Pulpen Pilot', 200, 'K003', 'Pcs'),
('B006', 'legion', 20, 'K001', 'Unit'),
('B007', 'legion', 10, 'K002', 'Unit');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('K001', 'Elektronik'),
('K002', 'Furniture'),
('K003', 'ATK');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `jenis_transaksi` enum('masuk','keluar') NOT NULL,
  `id_barang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `jumlah`, `supplier`, `jenis_transaksi`, `id_barang`) VALUES
('T001', '2026-01-10', 20, 'PT Sumber Jaya', 'masuk', 'B001'),
('T002', '2026-01-15', 5, 'PT Sumber Jaya', 'keluar', 'B001'),
('T005', '2026-03-05', 40, 'PT Sentosa', 'masuk', 'B003'),
('T006', '2026-03-18', 15, 'PT Sentosa', 'keluar', 'B003'),
('T007', '2026-04-10', 25, 'PT Maju Jaya', 'masuk', 'B001'),
('T008', '2026-04-15', 15, 'PT Maju Jaya', 'keluar', 'B001'),
('T011', '2026-06-05', 20, 'PT Sumber Jaya', 'masuk', 'B003'),
('T012', '2026-06-18', 40, 'PT Sumber Jaya', 'keluar', 'B003'),
('T013', '2026-07-07', 70, 'PT Maju Bersama', 'masuk', 'B001'),
('T014', '2026-07-21', 10, 'PT Maju Bersama', 'keluar', 'B001'),
('T017', '2026-09-09', 65, 'PT Sumber Jaya', 'masuk', 'B003'),
('T018', '2026-09-25', 60, 'PT Sumber Jaya', 'keluar', 'B003'),
('T019', '2026-10-12', 30, 'PT Maju Jaya', 'masuk', 'B001'),
('T020', '2026-10-22', 25, 'PT Maju Jaya', 'keluar', 'B001'),
('T023', '2026-12-08', 55, 'PT Maju Bersama', 'masuk', 'B003'),
('T024', '2026-12-20', 45, 'PT Maju Bersama', 'keluar', 'B003'),
('T025', '2006-03-12', 10, 'PT sejahtera', 'masuk', 'B001'),
('T026', '2006-03-12', 20, 'PT sejahtera', 'masuk', 'B006'),
('T027', '2026-06-15', 5, 'PT sejahtera', 'keluar', 'B001');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('staff','supervisor','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `username`, `password`, `role`) VALUES
('1827e368-4709-4017-b68c-a551fd3d2505', 'udin', '123', 'staff'),
('8e96d2f6-67d8-11f1-b3d0-40c2ba384fe4', 'adminbaru', '123', 'admin'),
('U001', 'admin', '123', 'admin'),
('U002', 'staff', '123', 'staff'),
('U003', 'supervisor', '123', 'supervisor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
