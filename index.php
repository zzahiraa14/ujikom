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

    <!-- kategori -->
    <div class="section">
        <div class="container">
            <h1 class="tengah">Kategori</h1>
            <div class="box">
                <?php
                    $kategori = mysqli_query($conn, "SELECT * FROM kategori ORDER BY id_kategori DESC");
                    if(mysqli_num_rows($kategori) > 0){
                        while($k = mysqli_fetch_array($kategori)){   
                ?>

                    <a href="produk.php?kat=<?php echo $k['id_kategori'] ?>">
                <div class="col-6">
                    <img src="produk/<?php echo $k['gambar_kategori'] ?>" width="200px">
                    <p><input type="submit" name="submit" value="<?php echo $k['nama_kategori'] ?>" class="btn"></p>
                </div>   
                    </a> 
                <?php }}else{ ?>
                    <p>Kategori tidak ada</p>
                <?php } ?>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <small>Copyright &copy; 2024 - Zalfa Zahira Putri | Babyshop</small>
        </div>
    </div>

</body>
</html>