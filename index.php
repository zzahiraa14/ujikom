<?php
    include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beranda | Babyshop</title>
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
                <input type="search" name="search" placeholder="Cari disini...">
                <input type="submit" name="cari" value="Cari Produk">
            </form>
        </div>
    </div>

    <!-- kategori -->
    <div class="section">
        <div class="container">
            <div class="box">
                <?php 
                    $kategori = mysqli_query($conn, "SELECT * FROM kategori ORDER BY id_kategori DESC");
                    if(mysqli_num_rows($kategori) > 0){
                    while($k = mysqli_fetch_array($kategori)){
                ?>
                <div class="col-5">
                    <h1>Kategori</h1>
                    <p>Kami menyediakan berbagai perlengkapan bayi, dengan mengedepankan Profesionalitas ✓, Kualitas ✓ dan Pelayanan ✓. Mengadakan produk dari <a rel="sponsored" href="https://www.cussonsbaby.co.id/" target="_blank">Cussons Baby</a>, <a rel="sponsored" href="https://www.pigeon.co.id/" target="_blank">Pigeon</a> dan <a rel="sponsored" href="https://www.sweetycare.co.id/" target="_blank">Sweety</a>.</p>
                    <div class="row">
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/set-baju.png" width="200px" alt="Set Baju">
                            <h3 class="text-center mt-3 mb-3">Set Baju</h3>
                            <p class="text-center"><a class="btn btn-success" href="set-baju.php">Lihat Produk</a></p>
                        </div>
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/sepatu.png" width="200px" alt="Sepatu">
                            <h3 class="text-center mt-3 mb-3">Sepatu</h3>
                            <p class="text-center"><a class="btn btn-success" href="sepatu.php">Lihat Produk</a></p>
                        </div>
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/botol-susu.png" width="200px" alt="Botol Susu">
                            <h3 class="text-center mt-3 mb-3">Botol Susu</h3>
                            <p class="text-center"><a class="btn btn-success" href="botol-susu.php">Lihat Produk</a></p>
                        </div>
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/mainan.png" width="200px" alt="Mainan">
                            <h3 class="text-center mt-3 mb-3">Mainan</h3>
                            <p class="text-center"><a class="btn btn-success" href="mainan.php">Lihat Produk</a></p>
                        </div>
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/popok.png" width="200px" alt="Popok">
                            <h3 class="text-center mt-3 mb-3">Popok</h3>
                            <p class="text-center"><a class="btn btn-success" href="popok.php">Lihat Produk</a></p>
                        </div>
                        <div class="col-12 col-md-4 p-5 mt-3">
                            <img class="img-fluid" src="img/perlengkapan-mandi.png" width="200px" alt="Perlengkapan Mandi">
                            <h3 class="text-center mt-3 mb-3">Perlengkapan Mandi</h3>
                            <p class="text-center"><a class="btn btn-success" href="perlengkapan-mandi.php">Lihat Produk</a></p>
                        </div>
                        <?php }}else{ ?>
                            <p>Kategori Tidak Ada</p>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>