<?php
    error_reporting(0);
    include 'db.php';
    $kontak = mysqli_query($conn, "SELECT no_telp, email, alamat FROM admin WHERE id_admin =  1");
    $a = mysqli_fetch_object($kontak);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontak | Babyshop</title>
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

    <!-- kontak -->
    <div class="section">
        <div class="container">
            <h1 class="tengah">Hubungi Kami</h1>
            <p class="teks1">Jika ada kesalahan atau kendala dalam pembelian silahkan hubungi kami. Bisa juga untuk mendatangi store kami dibawah ini! Terima kasih.</p>
        </div>
    </div>

    <!-- map -->
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3963.541586414477!2d106.80565337587196!3d-6.579386564318654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69c42f04ec14ff%3A0x778608e7163880f1!2sSMK%20Kosgoro%20Bogor!5e0!3m2!1sid!2sid!4v1710903109453!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

    <!-- banner -->
    <section class="bg-success">
        <div class="container">
        <h4>Alamat</h4>
            <p><?php echo $a->alamat ?></p>

            <h4>Email</h4>
            <p><?php echo $a->email ?></p>

            <h4>No Handphone</h4>
            <p><a href="tel:<?php echo $a->no_telp ?>"></a>089678273021</p>
        </div>  
    </section>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <small>Copyright &copy; 2024 - Zalfa Zahira Putri | Babyshop</small>
        </div>
    </div>
</body>
</html>