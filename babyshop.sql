-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Feb 2024 pada 05.43
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
-- Database: `babyshop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`, `no_telp`, `email`, `alamat`) VALUES
(1, 'Zalfa Zahira Putri', 'zalfa', '706f24650e4960e82513e6722a9918d6', '089678273021', 'zzahiraa13@gmail.com', 'Jalan Babakan Kemasan, Rt.01/Rw.02 No.42, Kelurahan Cilebut Barat, Kecamatan Sukaraja, 16710');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Set Baju'),
(2, 'Sepatu'),
(3, 'Botol Susu'),
(4, 'Mainan'),
(5, 'Popok'),
(6, 'Perlengkapan Mandi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `status_produk` tinyint(1) NOT NULL,
  `tanggal_pembuatan` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `deskripsi_produk`, `gambar_produk`, `status_produk`, `tanggal_pembuatan`) VALUES
(1, 1, 'Lilo Kimono Bodysuit', 107000, 'Dilengkapi dengan pengait dibagian dalam, snap button dibagian bawah dan opening yang dapat diadjust ikatannya.', 'produk1708865914.png', 1, '2024-02-25 12:58:34'),
(2, 1, 'Kirby Bodysuit Set', 156000, 'Berbahan material 100% cotton yang sangat lembut dikulit.', 'produk1708866643.png', 1, '2024-02-25 13:10:43'),
(3, 1, 'Kimono Bodysuit Orchid', 107000, 'Dengan desain simple yang kekinian.', 'produk1708866755.png', 1, '2024-02-25 13:12:35'),
(4, 1, 'Wynter Long Bodysuit Set Mud', 176000, 'Bahan katun premium yang lembut dan nyaman.', 'produk1708866857.png', 1, '2024-02-25 13:14:17'),
(5, 1, 'Dolittle Slveless Bodysuit Proudre', 69000, 'Bodysuit tanpa lengan.', 'produk1708867053.png', 1, '2024-02-25 13:17:33'),
(6, 1, 'Booboo Long Sleeve Sleepsuit Apricot', 70000, 'Dilengkapi dengan kancing hidup.', 'produk1708867165.png', 1, '2024-02-25 13:19:25'),
(7, 1, 'Booboo Button Set Midnight', 70000, 'Terdiri dari set baju lengan pendek dan celana panjang.', 'produk1708867290.png', 1, '2024-02-25 13:21:30'),
(8, 1, 'Booboo Button Set Fawn', 70000, 'Aman untuk kulit bayi.', 'produk1708867375.png', 1, '2024-02-25 13:22:55'),
(9, 1, 'Kirby Bodysuit Set Orchid', 156000, 'Dilengkapi dengan opening button dibagian depan dan snap button dibagian bawah.', 'produk1708867440.png', 1, '2024-02-25 13:24:00'),
(10, 2, 'Thanksgiving Turkey Chrochet Booties', 185000, 'Sempurna untuk menjaga jari-jari kaki si kecil tetap hangat, sepatu boot kalkun ini nyaman dan imut!.', 'produk1708867698.png', 1, '2024-02-25 13:28:18'),
(11, 2, 'Reindeer Chrochet Booties', 185000, 'Desain bordir.', 'produk1708912299.jpg', 1, '2024-02-26 01:51:39'),
(12, 2, 'Athletic Soft Sneaker', 154000, 'Sepatu boks sol lembut.', 'produk1708912355.jpg', 1, '2024-02-26 01:52:35'),
(13, 2, 'Soft Sole Marry Jane', 185000, 'Sol empuk.', 'produk1708912403.jpg', 1, '2024-02-26 01:53:23'),
(14, 2, 'Striped Bow Soft Sandals', 135000, 'Penutupan kait dan putaran.', 'produk1708912448.jpg', 1, '2024-02-26 01:54:08'),
(15, 2, 'Moccasin Every Step Boots', 416000, 'Sol dalam dan luar sensorik.', 'produk1708912501.jpg', 1, '2024-02-26 01:55:01'),
(16, 2, 'Athletic Every Step Sneaker', 401000, 'Konstruksi fleksibel mendukung pergerakan multi arah.', 'produk1708912572.jpg', 1, '2024-02-26 01:56:12'),
(17, 2, 'Pull On Fashion Soft Sneaker', 143000, 'Sepatu boks sol lembut.', 'produk1708912619.jpg', 1, '2024-02-26 01:56:59'),
(18, 2, 'Soft Boat Shoe', 135000, 'Loop looker.', 'produk1708912667.jpg', 1, '2024-02-26 01:57:47'),
(19, 3, 'Wide Neck 160ml', 91000, 'Berbahan gelas borosilicate (BPA Free).', 'produk1708912746.jpg', 1, '2024-02-26 01:59:06'),
(20, 3, 'Wide Neck 240ml', 156000, 'Food contact grade.', 'produk1708912801.jpg', 1, '2024-02-26 02:00:01'),
(21, 3, 'Wide Neck 330ml', 230000, 'Berbahan polypropylene (PP) dengan warna alami putih agak keruh.', 'produk1708912855.jpg', 1, '2024-02-26 02:00:55'),
(23, 3, 'Wide Neck 160ml Giraffe', 153000, 'Dilengkapi dengan softouch peristaltic plus (SS).', 'produk1708914409.jpg', 1, '2024-02-26 02:26:49'),
(24, 3, 'Wide Neck 240ml Bee', 156000, 'Dilengkapi dengan peristaltic plus nipple ukuran M.', 'produk1708914509.jpg', 1, '2024-02-26 02:28:29'),
(25, 3, 'Wide Neck 160ml Clear Pink', 100000, 'Bentuk botol lebar dan mudah dipegang.', 'produk1708914554.jpg', 1, '2024-02-26 02:29:14'),
(26, 3, 'Botol Pp Rp 50ml Sapi', 38000, 'Tahan panas sampai suhu 110°C.', 'produk1708914611.jpg', 1, '2024-02-26 02:30:11'),
(27, 3, 'Botol Pp Rp 240ml Batik Burung Phoenix', 48000, 'Dilengkapi dengan dot peristaltic slim neck (M).', 'produk1708914713.jpg', 1, '2024-02-26 02:31:53'),
(28, 3, 'Botol Pp Rp 240ml Penyu', 50000, 'Food contact grade.', 'produk1708914786.jpg', 1, '2024-02-26 02:33:06'),
(29, 4, 'Clip Clop Musical Activity Gym', 800000, 'Mainan yang dapat dilepas untuk menghibur bayi saat bepergian.', 'produk1708914860.jpg', 1, '2024-02-26 02:34:20'),
(30, 4, 'Music and Lights Pop Up Jungle Pals', 375000, 'Karakter pop up yang menyenangkan mendorong perkembangan kognitif.', 'produk1708914959.jpg', 1, '2024-02-26 02:35:59'),
(31, 4, 'Stacks Of Animals Sort And Nest Cups', 95000, 'Tema binatang mendorong permainan peran dan imajinasi.', 'produk1708915024.jpg', 1, '2024-02-26 02:37:04'),
(32, 4, 'Splash And Float Friends – Fully Sealed', 231000, 'Warna-warna cerah merangsang indera penglihatan dan imajinasi.', 'produk1708915104.png', 1, '2024-02-26 02:38:24'),
(33, 4, 'Snuggle Me Penguin Tummy Time Gym', 2300000, 'Matras mewah yang besar dan super lembut.', 'produk1708915172.png', 1, '2024-02-26 02:39:32'),
(34, 4, 'Squeak and Soothe Natural Teether', 71000, 'Bebas BPA, ftalat, dan PVC.', 'produk1708915271.png', 1, '2024-02-26 02:41:11'),
(35, 4, 'A Day At The Beach Activity Book', 74000, 'Klip C agar mudah dipasang pada sebagian besar kereta bayi, kereta dorong bayi, atau kapsul.', 'produk1708915474.png', 1, '2024-02-26 02:44:34'),
(36, 4, 'A Day At The Farm Teether Book', 105000, 'Halaman dengan bantalan lembut mudah dipahami.', 'produk1708915567.png', 1, '2024-02-26 02:46:07'),
(37, 4, 'Jazzy Jungley Teether Book', 108000, 'Teether bertekstur untuk meredakan sakit gusi.', 'produk1708915728.png', 1, '2024-02-26 02:48:48'),
(38, 5, 'Sweety Gold Comfort NB 52', 85000, 'Bahan yang lembut dan bersirkulasi udara, mencegah kelembapan pada bayi.', 'produk1708916394.png', 1, '2024-02-26 02:59:54'),
(39, 5, 'Sweety Gold Comfort S 50', 83000, 'Perekat lembut yang dapat merekat berulang kali.', 'produk1708918606.png', 1, '2024-02-26 03:36:46'),
(40, 5, 'Sweety Gold Pants S 36', 67000, 'Mendistribusikan cairan & menyerap cairan ekstra cepat.', 'produk1708918670.png', 1, '2024-02-26 03:37:50'),
(41, 5, 'Sweety Gold Pants M 34', 90000, 'Melindungi kulit bayi dari kering & iritasi.', 'produk1708918753.png', 1, '2024-02-26 03:39:13'),
(42, 5, 'Sweety Gold Pants L 28', 78000, 'Nyaman dipakai semalaman menjaga bayi tidur nyenyak.', 'produk1708918887.png', 1, '2024-02-26 03:41:27'),
(43, 5, 'Sweety Gold Pants XL 26', 90000, 'Daya serap cepat dan tidak gembung, bahkan dengan kapasitas urin yang tinggi.', 'produk1708918996.png', 1, '2024-02-26 03:43:16'),
(44, 5, 'Sweety Gold Comfort XXL 22', 115000, 'Desain popok elastis, pas dan nyaman dipakai.', 'produk1708921018.png', 1, '2024-02-26 04:16:58'),
(45, 5, 'Sweety Silver Comfort NB S 40', 63000, 'Menyerap hingga 12 jam dengan jumlah urin normal bayi - 1-2mL/KgBB/Jam.', 'produk1708921107.png', 1, '2024-02-26 04:18:27'),
(46, 5, 'Sweety Silver Boy M 30', 56000, 'Melindungi kulit bayi dari kekeringan dan iritasi.', 'produk1708921167.png', 1, '2024-02-26 04:19:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
