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
    <title>Tentang Kami | Babyshop</title>
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

    <!-- banner -->
    <section class="bg-success">
        <div class="container">
            <div class="wrap">
            <img class="banner" src="img/bg-login2.png" width="300px">
            </div>
            <h1 class="teks">Tentang Kami</h1>
                <p class="teks">BabyShop | Mom's care adalah perusahaan yang bergerak dalam bidang pengadaan segala perlengkapan bayi. Dengan mengedepankan kualitas dan pelayanan, kami siap membantu para Bunda dalam memenuhi kebutuhan buah hati.</p>
                <p class="teks">Kami menyediakan berbagai perlengkapan bayi, dengan mengedepankan profesionalitas, kualitas & pelayanan.</p>
        </div>  
    </section>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <h4>Alamat</h4>
            <p><?php echo $a->alamat ?></p>

            <h4>Email</h4>
            <p><?php echo $a->email ?></p>

            <h4>No Handphone</h4>
            <p><?php echo $a->no_telp ?></p>
            <small>Copyright &copy; 2024 - Zalfa Zahira Putri | Babyshop</small>
        </div>
    </div>
</body>
</html>