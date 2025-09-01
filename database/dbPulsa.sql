-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2025 pada 05.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpulsa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin'),
('user', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbbeli`
--

CREATE TABLE `tbbeli` (
  `nomor` varchar(10) NOT NULL,
  `idprov` varchar(10) NOT NULL,
  `namaprov` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `tglin` date NOT NULL,
  `shift` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbbeli`
--

INSERT INTO `tbbeli` (`nomor`, `idprov`, `namaprov`, `jenis`, `jumlah`, `sumber`, `tglin`, `shift`, `penerima`, `keterangan`) VALUES
('1', 'PRV-1', 'Telkomsel', 'Kuota 35GB - 30 Hari', '10', 'PT Gemilang', '2025-07-02', 'Siang', 'Admin', 'Ok');

--
-- Trigger `tbbeli`
--
DELIMITER $$
CREATE TRIGGER `stokmasuk` AFTER INSERT ON `tbbeli` FOR EACH ROW BEGIN
 UPDATE tbstok SET stokprov = stokprov + NEW.jumlah
 WHERE idprov = NEW.idprov;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbjual`
--

CREATE TABLE `tbjual` (
  `nomor` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `idprov` varchar(100) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `stok` int(100) NOT NULL,
  `customer` varchar(100) NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbjual`
--

INSERT INTO `tbjual` (`nomor`, `supplier`, `idprov`, `provider`, `jenis`, `stok`, `customer`, `telp`, `jumlah`, `tanggal`, `keterangan`) VALUES
('1', 'PT Gemilang', 'PRV-1', 'Telkomsel', 'Kuota 35GB - 30 Hari', 2010, 'Abang', '081', 5, '2025-07-02', 'Sip');

--
-- Trigger `tbjual`
--
DELIMITER $$
CREATE TRIGGER `Penjualan` AFTER INSERT ON `tbjual` FOR EACH ROW BEGIN
UPDATE tbstok SET stokprov = stokprov - NEW.jumlah
WHERE idprov = NEW.idprov;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbstok`
--

CREATE TABLE `tbstok` (
  `noprov` varchar(20) NOT NULL,
  `idprov` varchar(10) NOT NULL,
  `namaprov` varchar(25) NOT NULL,
  `jenispaket` varchar(100) NOT NULL,
  `stokprov` varchar(25) NOT NULL,
  `beliprov` varchar(15) NOT NULL,
  `jualprov` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbstok`
--

INSERT INTO `tbstok` (`noprov`, `idprov`, `namaprov`, `jenispaket`, `stokprov`, `beliprov`, `jualprov`) VALUES
('1', 'PRV-1', 'Telkomsel', 'Kuota 35GB - 30 Hari', '2005', '5000', '7500'),
('2', 'PRV-2', 'XL Axiata', 'Kuota 5 GB - 7 Hari', '2000', '15000', '20000'),
('3', 'PRV-3', 'Indosat', 'Kuota Data 10GB  7 Hari', '50', '15000', '17500'),
('4', 'PRV-4', 'Smartfren', 'Kuota 20GB - 15 Hari', '50', '18000', '20000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbsupplier`
--

CREATE TABLE `tbsupplier` (
  `no` varchar(10) NOT NULL,
  `idsupplier` varchar(10) NOT NULL,
  `namasupplier` varchar(25) NOT NULL,
  `alamatsupplier` varchar(25) NOT NULL,
  `telpsupplier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbsupplier`
--

INSERT INTO `tbsupplier` (`no`, `idsupplier`, `namasupplier`, `alamatsupplier`, `telpsupplier`) VALUES
('1', 'SUP-1', 'PT Gemilang', 'Jakbar', '08123'),
('2', 'SUP-2', 'PT Surya Kencana', 'Jakarta Timur', '0896'),
('3', 'SUP-3', 'CV Jaya Abadi', 'Jakarta', '021'),
('4', 'SUP-4', 'CV Rahayu', 'Bekasi', '022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbuser`
--

CREATE TABLE `tbuser` (
  `nouser` varchar(100) NOT NULL,
  `iduser` varchar(10) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `user` varchar(10) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbuser`
--

INSERT INTO `tbuser` (`nouser`, `iduser`, `nama`, `user`, `password`) VALUES
('1', 'KYW-1', 'Ujang', 'Laki-Laki', 'Gudang S.Part'),
('2', 'KYW-2', 'Sinta Ayu', 'Perempuan', 'Corrugator'),
('3', 'KYW-3', 'Jimmy', 'Laki-Laki', 'Corrugator'),
('4', 'KYW-4', 'Dewi Lestari', 'Perempuan', 'Gudang S.Part'),
('5', 'KYW-5', 'Azil Muhammad', 'Laki-Laki', 'Gudang S.Part'),
('6', 'KYW-6', 'Ganjar', 'Laki-Laki', 'Gudang S.Part'),
('7', 'KYW-7', 'AA', 'Laki-Laki', 'Gudang S.Part'),
('8', 'KYW-8', 'Prabowo', 'Laki-Laki', 'Gudang S.Part');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbbeli`
--
ALTER TABLE `tbbeli`
  ADD PRIMARY KEY (`nomor`);

--
-- Indeks untuk tabel `tbjual`
--
ALTER TABLE `tbjual`
  ADD PRIMARY KEY (`nomor`);

--
-- Indeks untuk tabel `tbstok`
--
ALTER TABLE `tbstok`
  ADD PRIMARY KEY (`idprov`);

--
-- Indeks untuk tabel `tbsupplier`
--
ALTER TABLE `tbsupplier`
  ADD PRIMARY KEY (`idsupplier`);

--
-- Indeks untuk tabel `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
