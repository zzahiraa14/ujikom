-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2024 pada 01.53
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
(1, 'Zalfa Zahira Putri', 'admin', '21232f297a57a5a743894a0e4a801fc3', '089678273021', 'zzahiraa13@gmail.com', 'Jl. Raya Pajajaran No.217 A, RT.02/RW.11, Bantarjati, Kec. Bogor Utara, Kota Bogor, Jawa Barat 16153');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL,
  `gambar_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `gambar_kategori`) VALUES
(1, 'Set Baju', 'kategori1710926924.png'),
(2, 'Sepatu', 'kategori1710926909.png'),
(3, 'Botol Susu', 'kategori1710926896.png'),
(4, 'Mainan', 'kategori1710926886.png'),
(5, 'Popok', 'kategori1710926875.png'),
(6, 'Perlengkapan Mandi', 'kategori1710926861.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_user`, `id_produk`, `nama_produk`, `qty`, `harga_produk`) VALUES
(1, 19, 1, 'Set Baju Lilo Kimono Bodysuit', 1, 107000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `status_pesanan` tinyint(1) NOT NULL,
  `tanggal_pembuatan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kode_pos` varchar(50) NOT NULL,
  `terima` varchar(50) NOT NULL,
  `tolak` varchar(50) NOT NULL,
  `cek_produk` int(11) NOT NULL,
  `bukti_pembayaran` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `invoice`, `id_user`, `nama_user`, `no_telp`, `id_produk`, `nama_produk`, `qty`, `harga_produk`, `status_pesanan`, `tanggal_pembuatan`, `provinsi`, `kota`, `alamat`, `kode_pos`, `terima`, `tolak`, `cek_produk`, `bukti_pembayaran`) VALUES
(1, '1', 19, 'zalfa', '089678273021', 1, 'Set Baju Lilo Kimono Bodysuit', 1, 107000, 0, '2024-03-25 21:59:42', 'jawa barat', 'bogor', 'Jl. Padjajaran', '16710', '1', '', 1, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_stok` int(11) DEFAULT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_dibutuhkan` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status_produk` tinyint(1) NOT NULL,
  `tanggal_pembuatan` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_stok`, `nama_produk`, `harga_produk`, `deskripsi_produk`, `gambar_produk`, `stok`, `stok_dibutuhkan`, `qty`, `status_produk`, `tanggal_pembuatan`) VALUES
(1, 1, NULL, 'Set Baju Lilo Kimono Bodysuit', 107000, 'Lilo Kimono Bodysuit adalah pakaian bayi one-piece, membantu memberikan kenyamanan ekstra bagi si Kecil saat beraktivitas sehari-hari. Dilengkapi dengan Pengait di Bagian Dalam, Snap Button di Bagian Bawah, dan Opening yang Dapat Di-Adjust Ikatannya. \r\n\r\nBerbahan Material 100% Cotton yang Sangat Lembut di Kulit. \r\nAman untuk Digunakan pada Kulit Bayi.', 'produk1708865914.png', 10, 0, 0, 1, '2024-02-25 12:58:34'),
(2, 1, NULL, 'Set Baju Kirby Bodysuit ', 156000, 'Terdiri dari 1 pakaian bayi one-piece dan 1 celana pendek bayi yang terdapat karet elastis di bagian pinggang, membantu memberikan kenyamanan ekstra bagi si Kecil saat beraktivitas sehari-hari. Dilengkapi dengan Opening Button di Bagian Depan dan Snap Button di Bagian Bawah. \r\n\r\nBerbahan Material 100% Cotton yang Sangat Lembut di Kulit. \r\nAman untuk Digunakan pada Kulit Bayi.', 'produk1708866643.png', 23, 0, 0, 1, '2024-02-25 13:10:43'),
(3, 1, NULL, 'Set Baju Kimono Orchid', 107000, 'Lilo Kimono Bodysuit adalah pakaian bayi one-piece, membantu memberikan kenyamanan ekstra bagi si Kecil saat beraktivitas sehari-hari. Dilengkapi dengan Opening Button di Bagian Depan dan Snap Button di Bagian Bawah. \r\n\r\nBerbahan Material 100% Cotton yang Sangat Lembut di Kulit. \r\nAman untuk Digunakan pada Kulit Bayi.', 'produk1708866755.png', 23, 0, 0, 1, '2024-02-25 13:12:35'),
(4, 1, NULL, 'Set Baju Wynter Long Mud', 176000, 'Terdiri dari 1 pakaian bayi one-piece dan 1 celana panjang bayi yang terdapat karet elastis di bagian pinggang, membantu memberikan kenyamanan ekstra bagi si Kecil saat beraktivitas sehari-hari. Dilengkapi dengan Opening Button di Bagian Depan dan Snap Button di Bagian Bawah. \r\n\r\nBerbahan Material 100% Cotton yang Sangat Lembut di Kulit. \r\nAman untuk Digunakan pada Kulit Bayi.', 'produk1708866857.png', 17, 0, 0, 1, '2024-02-25 13:14:17'),
(5, 1, NULL, 'Set Baju Dolittle Proudre', 69000, 'Dolittle Sleeveless Bodysuit premium merupakan pakaian bayi one-piece lengan panjang. Bodysuit Tanpa Lengan. \r\n\r\nDengan Desain Simple yang Kekinian.\r\nAman untuk Digunakan pada Kulit Bayi. \r\nBahan Katun Premium yang Lembut dan Nyaman.', 'produk1708867053.png', 23, 0, 0, 1, '2024-02-25 13:17:33'),
(6, 1, NULL, 'Set Baju Booboo Apricot', 70000, 'Booboo Long Sleeve Sleepsuit premium merupakan pakaian tidur one-piece dengan lengan panjang multifungsi. \r\n\r\nDengan Desain Simple yang Kekinian. \r\nBahan Katun Premium yang Lembut dan Nyaman. \r\nAman untuk Kulit Bayi.', 'produk1708867165.png', 20, 0, 0, 1, '2024-02-25 13:19:25'),
(7, 1, NULL, 'Set Baju Booboo Midnight', 70000, 'Booboo Button Set premium terdiri dari atasan lengan pendek dan celana lengan panjang. Terdiri dari Set Baju Lengan Pendek dan Celana Panjang. \r\n\r\nDesain Simple yang Kekinian.\r\nDilengkapi dengan Kancing Hidup.\r\nBahan Katun Premium yang Lembut dan Nyaman.\r\nAman untuk Kulit Bayi.', 'produk1708867290.png', 24, 0, 0, 1, '2024-02-25 13:21:30'),
(8, 1, NULL, 'Set Baju Booboo Button Fawn', 70000, 'Booboo Button Set premium terdiri dari atasan lengan pendek dan celana lengan panjang. Terdiri dari Set Baju Lengan Pendek dan Celana Panjang.\r\n\r\nDengan Desain Simple yang Kekinian.\r\nDilengkapi dengan Kancing Hidup.\r\nBahan Katun Premium yang Lembut dan Nyaman.\r\nAman untuk Kulit Bayi.', 'produk1708867375.png', 11, 0, 0, 1, '2024-02-25 13:22:55'),
(9, 1, NULL, 'Set Baju Kirby Bodysuit Orchid', 156000, 'Terdiri dari 1 pakaian bayi one-piece dan 1 celana pendek bayi yang terdapat karet elastis di bagian pinggang, membantu memberikan kenyamanan ekstra bagi si Kecil saat beraktivitas sehari-hari. Dilengkapi dengan Opening Button di Bagian Depan dan Snap Button di Bagian Bawah.\r\n\r\nBerbahan Material 100% Cotton yang Sangat Lembut di Kulit.\r\nAman untuk Digunakan pada Kulit Bayi.', 'produk1708867440.png', 22, 0, 0, 1, '2024-02-25 13:24:00'),
(10, 2, NULL, 'Sepatu Thanksgiving Turkey ', 185000, 'Sempurna untuk menjaga jari-jari kaki si kecil tetap hangat, sepatu boot kalkun ini nyaman dan imut!. \r\n\r\nDesain bordir.\r\n95% katun, 1% elastane, 4% lainnya.\r\nBisa dicuci dengan mesin.', 'produk1708867698.png', 14, 0, 0, 1, '2024-02-25 13:28:18'),
(11, 2, NULL, 'Sepatu Reindeer Chrochet ', 185000, 'Sempurna untuk menjaga jari-jari kaki si kecil tetap hangat, sepatu boot kalkun ini nyaman dan imut!. \r\n\r\nDesain bordir.\r\n95% katun, 1% elastane, 4% lainnya.\r\nBisa dicuci dengan mesin.', 'produk1708912299.jpg', 18, 0, 0, 1, '2024-02-26 01:51:39'),
(12, 2, NULL, 'Sepatu Athletic Soft Sneaker', 154000, 'Didesain untuk pertumbuhan kaki si kecil, sepatu ini sangat cocok untuk bayi. \r\n\r\nSepatu boks sol lembut.\r\nSol empuk.\r\nDesain slip on yang mudah.\r\n100% bahan buatan manusia.\r\nBersih.', 'produk1708912355.jpg', 11, 0, 0, 1, '2024-02-26 01:52:35'),
(13, 2, NULL, 'Sepatu Soft Sole Marry Jane', 185000, 'Didesain untuk pertumbuhan kaki, Mary Janes ini sangat cocok untuk bayi. \r\n\r\nSepatu boks sol lembut.\r\nSol empuk.\r\nDesain slip on yang mudah.\r\nPenutupan kait dan putaran.', 'produk1708912403.jpg', 12, 0, 0, 1, '2024-02-26 01:53:23'),
(14, 2, NULL, 'Sepatu Striped Bow Soft ', 135000, 'Sempurnakan penampilannya dengan sandal busur bergaris ini. Desain yang mudah membuatnya mudah dan pita bergaris yang menggemaskan menjadikannya super bergaya. \r\n\r\nSepatu boks sol lembut.\r\nPenutupan kait dan putaran.\r\nDesain slip on yang mudah.', 'produk1708912448.jpg', 15, 0, 0, 1, '2024-02-26 01:54:08'),
(15, 2, NULL, 'Sepatu Moccasin Every Boots', 416000, 'Saat dia belajar berjalan, sepatu bot Every Step yang penuh gaya ini membuatnya tetap imut di setiap langkah. \r\n\r\nSol dalam dan luar sensorik.\r\nLapisan mulus.\r\nPenutupan kait dan putaran.\r\nTahan lama.\r\nOutsole lembut dan fleksibel.', 'produk1708912501.jpg', 14, 0, 0, 1, '2024-02-26 01:55:01'),
(16, 2, NULL, 'Sepatu Athletic Every Step ', 401000, 'Menghadirkan gaya tinggi dari kenyamanan kursi makan bayi, sepatu kets kami yang mudah dipakai adalah sepatu pilihan bayi. Tidak hanya lucu dan klasik dengan semua detail, tetapi juga dibuat dengan lapisan mulus untuk kenyamanan maksimal. \r\n\r\nPenutupan kait dan putaran.\r\nDesain ringan.\r\nLapisan lembut dan mulus.\r\nKonstruksi fleksibel mendukung pergerakan multi arah.\r\nBahan tahan lama tahan terhadap waktu bermain.', 'produk1708912572.jpg', 14, 0, 0, 1, '2024-02-26 01:56:12'),
(17, 2, NULL, 'Sepatu Pull On Fashion Soft ', 143000, 'Gaya adalah yang utama dengan sepatu kets ramping yang menampilkan desain blok warna dan gaya yang santai. \r\n\r\nSepatu boks sol lembut.\r\nSol dalam yang empuk.\r\nDesain blok warna.', 'produk1708912619.jpg', 25, 0, 0, 1, '2024-02-26 01:56:59'),
(18, 2, NULL, 'Sepatu Soft Boat Shoe', 135000, 'Dari pesta hingga ke dermaga, sepatu ini sangat cocok untuk pertumbuhan kaki bayi.\r\n\r\nSepatu boks sol lembut.\r\nSol dalam yang empuk.\r\nLoop Looker.', 'produk1708912667.jpg', 13, 0, 0, 1, '2024-02-26 01:57:47'),
(19, 3, NULL, 'Botol Susu Wide Neck 160ml', 91000, 'Botol BPA Free dengan desain lebar ukuran 160 ml yang terbuat dari bahan Gelas Borosilicate, botol ini menawarkan transparansi yang baik dan tahan suhu panas untuk sterilisasi. \r\n\r\nBerbahan Gelas Borosilicate (BPA Free).\r\nFood Contact Grade.\r\nDilengkapi dengan Peristaltic Plus Nipple ukuran S.', 'produk1708912746.jpg', 16, 0, 0, 1, '2024-02-26 01:59:06'),
(20, 3, NULL, 'Botol Susu Wide Neck 240ml', 156000, 'Botol BPA Free dengan desain lebar ukuran 240 ml yang terbuat dari bahan Gelas Borosilicate, botol ini menawarkan transparansi yang baik dan tahan suhu panas untuk sterilisasi. \r\n\r\nBerbahan Gelas Borosilicate (BPA Free).\r\nFood Contact Grade.\r\nDilengkapi dengan Dot Peristaltic Slim Neck (M).', 'produk1708912801.jpg', 20, 0, 0, 1, '2024-02-26 02:00:01'),
(21, 3, NULL, 'Botol Susu Wide Neck 330ml', 230000, 'Botol desain lebar ukuran 330 ml yang terbuat dari bahan PP (Polypropylene).\r\n\r\nBerbahan Polypropylene (PP) dengan warna alami putih agak keruh. \r\nBentuk botol lebar dan mudah dipegang.\r\nBPA Free.\r\nFood Contact Grade.\r\nTahan panas sampai suhu 110°C.', 'produk1708912855.jpg', 25, 0, 0, 1, '2024-02-26 02:00:55'),
(23, 3, NULL, 'Botol Susu Wide Neck 160ml ', 153000, 'Botol BPA Free dengan desain lebar ukuran 160 ml yang terbuat dari bahan Gelas Borosilicate, botol ini menawarkan transparansi yang baik dan tahan suhu panas untuk sterilisasi. Terdapat karakter Jerapah yang terbuat dari tinta Food Contact Grade yang sesuai untuk wadah pangan bayi. \r\n\r\nDilengkapi dengan SofTouch Peristaltic Plus (SS) untuk bayi baru lahir. \r\nBerbahan Gelas Borosilicate (BPA Free).\r\nFood Contact Grade.', 'produk1708914409.jpg', 25, 0, 0, 1, '2024-02-26 02:26:49'),
(24, 3, NULL, 'Botol Susu Wide Neck 240ml ', 156000, 'Botol BPA Free dengan desain lebar ukuran 240 ml yang terbuat dari bahan Gelas Borosilicate, botol ini menawarkan transparansi yang baik dan tahan suhu panas untuk sterilisasi. Terdapat karakter Lebah yang terbuat dari tinta Food Contact Grade yang sesuai untuk wadah pangan bayi. \r\n\r\nDilengkapi dengan SofTouch Peristaltic Plus (M).\r\nBerbahan Gelas Borosilicate (BPA Free).\r\nFood Contact Grade.', 'produk1708914509.jpg', 10, 0, 0, 1, '2024-02-26 02:28:29'),
(25, 3, NULL, 'Botol Susu Wide Neck 160ml ', 100000, 'Botol desain lebar ukuran 160 ml yang terbuat dari bahan PP (Polypropylene) berwarna pink, botol ini tahan lama dan ringan, ideal untuk digunakan di dalam dan di luar ruangan. \r\n\r\nBerbahan Polypropylene (PP) dengan warna alami putih agak keruh. \r\nBentuk botol lebar dan mudah dipegang.\r\nFood Contact Grade.\r\nBPA Free.\r\nTahan panas sampai suhu 110°C', 'produk1708914554.jpg', 17, 0, 0, 1, '2024-02-26 02:29:14'),
(26, 3, NULL, 'Botol Susu Pp Rp 50ml Sapi', 38000, 'Botol desain bulat dengan karakter Sapi yang terbuat dari bahan Polypropylene (PP), botol ini tahan lama dan ringan, ideal untuk digunakan di dalam dan di luar ruangan.\r\n\r\nBerbahan Polypropylene (BPA Free) .\r\nFood Contact Grade.\r\nDilengkapi dengan Dot Peristaltic Slim Neck (S).\r\nTahan panas sampai suhu 110°C', 'produk1708914611.jpg', 19, 0, 0, 1, '2024-02-26 02:30:11'),
(27, 3, NULL, 'Botol Susu Pp Rp 240ml Batik ', 48000, 'Botol desain bulat dengan karakter Burung Phoenix yang terbuat dari bahan Polypropylene (PP), botol ini tahan lama dan ringan, ideal untuk digunakan di dalam dan di luar ruangan. \r\n\r\nBerbahan Polypropylene (BPA Free) .\r\nFood Contact Grade.\r\nDilengkapi dengan Dot Peristaltic Slim Neck (M).\r\nTahan panas sampai suhu 110°C', 'produk1708914713.jpg', 22, 0, 0, 1, '2024-02-26 02:31:53'),
(28, 3, NULL, 'Botol Susu Pp Rp 240ml Penyu', 50000, 'Botol desain bulat ukuran 240 ml yang terbuat dari bahan Polypropylene lebih jernih yang bebas BPA dan tahan panas hingga suhu 110 derajat celsius. Botol dengan karakter Penyu yang merupakan hewan langka khas Indonesia. \r\n\r\nBerbahan Polypropylene (BPA Free) .\r\nFood Contact Grade.\r\nDilengkapi dengan Dot Peristaltic Slim Neck (M).\r\nTahan panas sampai suhu 110°C', 'produk1708914786.jpg', 24, 0, 0, 1, '2024-02-26 02:33:06'),
(29, 4, NULL, 'Mainan Clip Clop Musical ', 800000, 'Mendorong bayi untuk bermain, mendengarkan, melihat, dan menyentuh. Matras empuk memastikan bayi merasa nyaman saat bereksplorasi bersama Clip Clop. \r\n\r\nTeether daun dan bunga yang lembut untuk meredakan sakit gusi.\r\nMatras empuk tebal dengan motif modern dan warna cerah.\r\nKeset yang bisa dicuci dengan mesin.', 'produk1708914860.jpg', 21, 0, 0, 1, '2024-02-26 02:34:20'),
(30, 4, NULL, 'Mainan Music and Lights Pop ', 375000, 'Kejutan! Bayi akan senang saat teman hutannya muncul saat mereka memutar dan menekan tombol. Dalam mode Pengenalan, bayi akan mempelajari aksi dan reaksi saat mereka menekan tombol bertekstur dan suara binatang diputar.\r\n\r\nHewan yang menyala meningkatkan kesadaran sebab dan akibat.\r\nPegangan jinjing yang nyaman untuk bermain saat bepergian.', 'produk1708914959.jpg', 21, 0, 0, 1, '2024-02-26 02:35:59'),
(31, 4, NULL, 'Mainan Stacks Animals Cups', 95000, 'Mereka melibatkan pemikiran kognitif, pemecahan masalah, dan belajar tentang ukuran, keteraturan, dan hubungan. \r\n\r\nSains: Pemecahan masalah melalui trial and error.\r\nTeknik: Tindakan menumpuk, bersarang, menyendok, dan menuangkan.\r\nSeni: Tema binatang mendorong permainan peran dan imajinasi.\r\nMatematika: Penyortiran dan pengurutan memperkenalkan konsep keteraturan, ukuran, dan hubungan.', 'produk1708915024.jpg', 12, 0, 0, 1, '2024-02-26 02:37:04'),
(32, 4, NULL, 'Mainan Float – Fully Sealed', 231000, 'Ketiga karakter menggemaskan ini; anjing, kucing, dan burung, mengapung melintasi air dengan perahu bertekstur lembut. Semuanya disegel secara higienis untuk mencegah berkembangnya jamur di dalam, sehingga aman untuk dikunyah bayi. \r\n\r\nWarna-warna cerah merangsang indera penglihatan dan imajinasi.\r\nBerukuran sempurna untuk tangan kecil.\r\nAman untuk dikunyah.', 'produk1708915104.png', 18, 0, 0, 1, '2024-02-26 02:38:24'),
(33, 4, NULL, 'Mainan Penguin Tummy Time', 2300000, 'Sangat lembut dan nyaman. Lima mainan mainan dan mainan gigi yang dapat dilepas mendorong bayi untuk meraih, menggenggam, dan melacak gerakan secara visual, dan cermin penguin mencerminkan citra bayi yang meningkatkan kesadaran diri.\r\n\r\nMatras mewah yang besar dan super lembut.\r\nLengkungan yang dapat dilepas untuk aktivitas duduk dan bermain.\r\nPalet dan pola warna kontemporer yang lembut.', 'produk1708915172.png', 13, 0, 0, 1, '2024-02-26 02:39:32'),
(34, 4, NULL, 'Mainan Soothe Natural Teether', 71000, 'Terbuat dari 100% lateks karet alam yang bersumber dari pohon Hevea yang dibudidayakan secara berkelanjutan, Jerry adalah pendamping tumbuh gigi yang aman dan ramah bayi untuk si kecil.\r\n\r\nBenjolan lembut, bentuk dan tekstur untuk meredakan tumbuh gigi.\r\nRingan dan mudah digenggam.\r\nBebas BPA, ftalat, dan PVC.', 'produk1708915271.png', 23, 0, 0, 1, '2024-02-26 02:41:11'),
(35, 4, NULL, 'Mainan The Beach Activity Book', 74000, 'Bergabunglah dengan Jerry Giraffe dan teman-temannya dalam perjalanan sehari di pantai! Dengan karakter penuh warna dan beragam tekstur untuk disentuh dan dirasakan.\r\n\r\nCerita lembut berukuran besar.\r\nWarna dan tekstur cerah.\r\nKlip C agar mudah dipasang pada sebagian besar kereta bayi, kereta dorong bayi, atau kapsul.', 'produk1708915474.png', 19, 0, 0, 1, '2024-02-26 02:44:34'),
(36, 4, NULL, 'Mainan The Farm Teether Book', 105000, 'Bayi dapat menenangkan gusi yang sakit dengan gigi bergelombang, mendengarkan halaman buku berkerut dan berdecit, serta meningkatkan indra perabanya saat menyentuh pita dan bola sutra.\r\n\r\nPermukaan bertekstur sempurna untuk bayi yang sedang tumbuh gigi.\r\nHalaman dengan bantalan lembut mudah dipahami.\r\nBahan taktil untuk mengeksplorasi indra peraba.\r\nSuara kerut dan mencicit.', 'produk1708915567.png', 15, 0, 0, 1, '2024-02-26 02:46:07'),
(37, 4, NULL, 'Mainan Jungley Teether Book', 108000, 'Buku cerita lembut ini menampilkan hewan-hewan hutan menggemaskan yang dirancang untuk menarik perhatian bayi dan membantu melatih keterampilan pengenalan mereka.\r\n\r\nSuara crinkle & squeaker untuk stimulasi pendengaran.\r\nTeether bertekstur untuk meredakan sakit gusi.\r\nC-klip agar mudah dipasang.', 'produk1708915728.png', 24, 0, 0, 1, '2024-02-26 02:48:48'),
(38, 5, NULL, 'Popok Sweety Gold NB 52', 85000, 'Produk popok perekat pertama dan satu-satunya di Indonesia dengan teknologi Diamond Layer (bermotif berlian), telah teruji klinis oleh Australian dermatologist mengurangi resiko cairan bersentuhan dengan kulit bayi hingga 50%, serta mendistribusikan dan menyerap cairan extra cepat.\r\n\r\nDesain popok yang tipis, pas si badan bayi dan lebih nyaman di pakai.\r\nPerekat lembut yang dapat merekat berulang kali.', 'produk1708916394.png', 18, 0, 0, 1, '2024-02-26 02:59:54'),
(39, 5, NULL, 'Popok Sweety Gold S 50', 83000, 'Produk popok perekat pertama dan satu-satunya di Indonesia dengan teknologi Diamond Layer (bermotif berlian), telah teruji klinis oleh Australian dermatologist mengurangi resiko cairan bersentuhan dengan kulit bayi hingga 50%, serta mendistribusikan dan menyerap cairan extra cepat.\r\n\r\nDesain popok yang tipis, pas si badan bayi dan lebih nyaman di pakai.\r\nPerekat lembut yang dapat merekat berulang kali.', 'produk1708918606.png', 23, 0, 0, 1, '2024-02-26 03:36:46'),
(40, 5, NULL, 'Popok Sweety Gold Pants S 36', 67000, 'Popok dengan Adaptive Intelligence technology, teknologi cerdas yang dirancang untuk menghasilkan popok premium generasi terbaru yang dapat menyesuaikan dengan bentuk tubuh & pergerakan bayi.\r\n\r\nGantilah popok saat warna indikator berwarna hijau.\r\nMelindungi kulit bayi dari kering & iritasi.\r\nNyaman dipakai semalaman menjaga bayi tidur nyenyak.\r\nPerekat untuk menggulung popok bekas pakai.', 'produk1708918670.png', 12, 0, 0, 1, '2024-02-26 03:37:50'),
(41, 5, NULL, 'Popok Sweety Gold Pants M 34', 90000, 'Popok dengan Adaptive Intelligence technology, teknologi cerdas yang dirancang untuk menghasilkan popok premium generasi terbaru yang dapat menyesuaikan dengan bentuk tubuh & pergerakan bayi.\r\n\r\nGantilah popok saat warna indikator berwarna hijau.\r\nMelindungi kulit bayi dari kering & iritasi.\r\nNyaman dipakai semalaman menjaga bayi tidur nyenyak.\r\nPerekat untuk menggulung popok bekas pakai.', 'produk1708918753.png', 24, 0, 0, 1, '2024-02-26 03:39:13'),
(42, 5, NULL, 'Popok Sweety Gold Pants L 28', 78000, 'Popok dengan Adaptive Intelligence technology, teknologi cerdas yang dirancang untuk menghasilkan popok premium generasi terbaru yang dapat menyesuaikan dengan bentuk tubuh & pergerakan bayi\r\n\r\nGantilah popok saat warna indikator berwarna hijau.\r\nMelindungi kulit bayi dari kering & iritasi.\r\nNyaman dipakai semalaman menjaga bayi tidur nyenyak.\r\nPerekat untuk menggulung popok bekas pakai.', 'produk1708918887.png', 14, 0, 0, 1, '2024-02-26 03:41:27'),
(43, 5, NULL, 'Popok Sweety Gold Pants XL 26', 90000, 'Popok dengan Adaptive Intelligence technology, teknologi cerdas yang dirancang untuk menghasilkan popok premium generasi terbaru yang dapat menyesuaikan dengan bentuk tubuh & pergerakan bayi.\r\n\r\nGantilah popok saat warna indikator berwarna hijau.\r\nMelindungi kulit bayi dari kering & iritasi.\r\nNyaman dipakai semalaman menjaga bayi tidur nyenyak.\r\nPerekat untuk menggulung popok bekas pakai.', 'produk1708918996.png', 17, 0, 0, 1, '2024-02-26 03:43:16'),
(44, 5, NULL, 'Popok Sweety Gold XXL 22', 115000, 'Popok tipe perekat khusus untuk bayi baru lahir dengan Diamond Layer Technology yang mampu menyerap cepat, hanya dalam 1 Detik serta mengurangi kontak kulit bayi dengan pipis dan pup.\r\n\r\nBahan lebih lembut untuk mencegah iritasi pada kulit bayi.\r\nKulit bebas bernafas untuk mencegah iritasi pada kulit bayi.\r\nDesain popok elastis, pas dan nyaman dipakai.\r\nPerekat lembut yang dapat merekat berulang kali.', 'produk1708921018.png', 11, 0, 0, 1, '2024-02-26 04:16:58'),
(45, 5, NULL, 'Popok Sweety Silver NB S 40', 63000, 'Popok tipe perekat khusus untuk bayi baru lahir dengan Diamond Layer Technology yang mampu menyerap cepat, hanya dalam 1 Detik serta mengurangi kontak kulit bayi dengan pipis dan pup. \r\n\r\nBahan lebih lembut untuk mencegah iritasi pada kulit bayi.\r\nKulit bebas bernafas untuk mencegah iritasi pada kulit bayi.\r\nDesain popok elastis, pas dan nyaman dipakai.\r\nPerekat lembut yang dapat merekat berulang kali.', 'produk1708921107.png', 19, 0, 0, 1, '2024-02-26 04:18:27'),
(46, 5, NULL, 'Popok Sweety Silver Boy M 30', 56000, 'Sweety Silver Pants merupakan popok celana pertama dan satu-satunya di Indonesia dengan teknologi Diamond Layer (bermotif berlian), telah teruji klinis oleh Australian dermatologis.\r\n\r\nMelindungi kulit bayi dari kekeringan dan iritasi.\r\nBagian belakang popok bayi lebih lebar dan menutup pantat bayi sehingga lebih nyaman.\r\nMencegah kebocoran dari segala sisi saat bayi beraktivitas.', 'produk1708921167.png', 15, 0, 0, 1, '2024-02-26 04:19:27'),
(47, 6, NULL, 'Perlengkapan Mandi Essential ', 62000, 'Rangkaian lengkap perawatan bayi yang tersedia dalam design menarik, kemasan yang mudah dibawa kemana saja dan material Non PVC sehingga dapat didaur ulang. \r\n\r\nBaby Hair & Body Wash 200ml.\r\nBaby Powder XF 100gr + 50gr.\r\nBaby Hair Lotion Candlenut 50ml.\r\nCB Liquid Cleanser 100ml.', 'produk1710655078.png', 12, 0, 0, 1, '2024-03-17 05:57:58'),
(48, 6, NULL, 'Perlengkapan Mandi Fun', 62000, 'Rangkaian lengkap perawatan bayi yang tersedia dalam design menarik, kemasan yang mudah dibawa kemana saja dan material Non PVC sehingga dapat didaur ulang.\r\n\r\nBaby Milk Bath FN 200ml.\r\nBaby Shampo Candlenut 100ml.\r\nBaby PowderXF 100gr + 50gr.\r\nBaby Cream 50g.', 'produk1710655546.png', 15, 0, 0, 1, '2024-03-17 06:05:46'),
(49, 6, NULL, 'Perlengkapan Mandi Basic', 40000, 'Rangkaian lengkap perawatan bayi yang tersedia dalam design menarik, kemasan yang mudah dibawa kemana saja dan material Non PVC sehingga dapat didaur ulang. \r\n\r\nBaby Hair & Body Wash 100ml.\r\nBaby Powder XF 50gr+25gr.\r\nBaby Oil 50ml.\r\nBaby Hair Lotion Candlenut 50ml.', 'produk1710655988.png', 16, 0, 0, 1, '2024-03-17 06:13:08'),
(50, 6, NULL, 'Perlengkapan Mandi Daily', 26000, 'Rangkaian lengkap perawatan bayi yang tersedia dalam design menarik, kemasan yang mudah dibawa kemana saja dan material Non PVC sehingga dapat didaur ulang. \r\n\r\nBaby Hair & Body Wash 50ml.\r\nBaby Powder 50g.\r\nBaby Oil 50ml.\r\nBaby Cologne 50ml.', 'produk1710656109.png', 25, 0, 0, 1, '2024-03-17 06:15:09'),
(51, 6, NULL, 'Perlengkapan Mandi Travel', 18000, 'Rangkaian lengkap perawatan bayi yang tersedia dalam design menarik, kemasan yang mudah dibawa kemana saja dan material Non PVC sehingga dapat didaur ulang. Dapat digunakan untuk melengkapi aktivitas bayi dan bunda di mana pun. \r\n\r\nBaby Hair & Body Wash 50ml.\r\nBaby Powder 50g.\r\nBaby Cologne 50ml.', 'produk1710656180.png', 22, 0, 0, 1, '2024-03-17 06:16:20'),
(52, 6, NULL, 'Perlengkapan Mandi Mild & Gentle', 30000, 'Mild & Gentle Hair & Body Wash adalah cara yang nyaman untuk membersihkan dan melembabkan rambut dan badan bayi Bunda, dengan wangi khas bayi yang lembut. \r\n\r\nDiperkaya dengan Honey untuk menutrisi rambut dan kulit bayi serta Chamomile untuk menjaga kenyamanan kulit bayi.\r\n\r\npH seimbang.', 'produk1710656227.png', 21, 0, 0, 1, '2024-03-17 06:17:07'),
(53, 6, NULL, 'Perlengkapan Mandi Soft Bath', 30000, 'Soft & Smooth Baby Milk Bath diformulasikan khusus untuk melembabkan kulit dengan perpaduan Almond Oil untuk membersihkan dan memelihara kelembutan kulit dan Rose Oil untuk membuat bayi Bunda tenang. \r\n\r\nDermatologically tested - lulus uji dokter kulit.\r\nFormula lembut.\r\npH seimbang.', 'produk1710656277.png', 20, 0, 0, 1, '2024-03-17 06:17:57'),
(54, 6, NULL, 'Perlengkapan Mandi  Fresh & Nourish', 24000, 'Formula extra lembut yang bebas sabun, pH seimbang, lembut di mata dan memberikan 100% Extra Kelembaban untuk menjadikan kulit bayi tetap terasa lembab dan kenyal. Membersihkan dengan lembut dan menutrisi dengan perpaduan Blueberry, Yoghurt, Vit E, Dual Moisturizers dan keharuman buah yang segar. \r\n\r\nDidesain khusus untuk kulit bayi.\r\nDibanding dengan formula sabun.', 'produk1710656323.png', 10, 0, 0, 1, '2024-03-17 06:18:43'),
(55, 6, NULL, 'Perlengkapan Mandi Newborn Gift', 70000, 'Satu-satunya set lengkap yang dirancang khusus untuk newborn, dengan kandungan minyak zaitun organik, chamomile alami, dan air murni. \r\n\r\nNewborn Body Wash 200ml.\r\nNewborn Lotion 100ml.\r\nNewborn Cream 50gr.\r\nSensitive Wipes 50’s.', 'produk1710656373.png', 13, 0, 0, 1, '2024-03-17 06:19:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `no_telp`, `email`, `alamat`) VALUES
(14, 'Melika', 'melika', 'melika', '', 'melika@gmail.com', 'Jl Margomulyo 44 Bl BB 47, Jawa Timur'),
(15, 'Ayu', 'ayu', 'ayu', '', 'ayu@gmail.com', 'Jl P Diponegoro, Dki Jakarta'),
(16, 'Salwa', 'salwa', 'salwa', '', 'salwa@gmail.com', 'Jl Pd Bambu Batas 14, Dki Jakarta'),
(17, 'Tsabitah', 'bita', 'bita', '', 'bita@gmail.com', 'Jl Mampang Prapatan Raya 1 Wisma Mampang Lt'),
(19, 'zalfa', 'zalfa', 'zalfa', '', 'zalfa@gmail.com', 'Jl Margomulyo 44 Bl BB 47, Jawa Timur');

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
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD UNIQUE KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

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
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
