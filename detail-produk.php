<?php
    error_reporting(0);
    include 'db.php';
    $kontak = mysqli_query($conn, "SELECT no_telp, email, alamat FROM admin WHERE id_admin =  1");
    $a = mysqli_fetch_object($kontak);

    $produk = mysqli_query($conn, "SELECT * FROM produk WHERE id_produk = '".$_GET['id']."' ");
    $p = mysqli_fetch_object($produk);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produk | Babyshop</title>
    <link rel="stylesheet" href="css/style.css">

    <!-- font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');
    </style>

    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon_io/apple-touch-icon.png">
</head>
<body>

    <!-- header -->
    <header>
        <div class="container">
        <img class="logo" src="img/bg-login.png" width="55px">
            <h1><a href="index.php">Babyshop</a></h1>
            <ul>
                <li><a href="index.php">Beranda</a></li>
                <li><a href="produk.php">Produk</a></li>
                <li><a href="tentang-kami.php">Tentang Kami</a></li>
                <li><a href="kontak.php">Kontak</a></li>
            </ul>
        </div>
    </header>

    <!-- search -->
    <div class="search">
        <div class="container">
            <form action="produk.php">
                <input type="search" name="search" placeholder="Cari disini..." value="<?php echo $_GET['search'] ?>">
                <input type="hidden" name="kat" value="<?php echo $_GET['kat'] ?>">
                <input type="submit" name="cari" value="Cari Produk">
            </form>
        </div>
    </div>

    <!-- detail produk -->
    <div class="section">
        <div class="container">
            <h3>Detail Produk</h3>
            <div class="box">
                <div class="col-2">
                    <img src="produk/<?php echo $p->gambar_produk ?>">
                </div>
                <div class="col-2">
                    <h3><?php echo $p->nama_produk ?></h3>
                    <h4>Rp. <?php echo number_format($p->harga_produk) ?></h4>
                    <p>Deskripsi Produk :<br>
                        <?php echo $p->deskripsi_produk ?>
                    </p>
                    <p class="kata"><a href="keranjang.php"><input type="submit" name="submit" value="Masukkan ke Keranjang" class="btn3"></a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <h4>Alamat</h4>
            <p><?php echo $a->alamat ?></p>

            <h4>Email</h4>
            <p><?php echo $a->email ?></p>

            <h4>No Handphone</h4>
            <p><a href="https://api.whatsapp.com/send?phone=<?php echo $a->no_telp ?>&text=Hai, Saya tertarik dengan produk Anda!" target="_blank"></a></p>
            <small>Copyright &copy; 2024 - Zalfa Zahira Putri | Babyshop</small>
        </div>
    </div>

</body>
</html>