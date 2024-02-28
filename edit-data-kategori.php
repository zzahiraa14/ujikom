<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php"</script>';
    }

    $kategori = mysqli_query($conn, "SELECT * FROM kategori WHERE id_kategori = '".$_GET['id']."' ");
    if(mysqli_num_rows($kategori) ==0){
        echo '<script>window.location="data-kategori.php"</script>';
    }
    $k = mysqli_fetch_object($kategori);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Kategori | Babyshop</title>
    <link rel="stylesheet" href="css/style.css">

    <!-- font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');
    </style>

    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon1.ico">
</head>
<body>

    <!-- header -->
    <header>
        <div class="container">
            <h1><a href="dashboard.php">Babyshop</a></h1>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="profil.php">Profil</a></li>
                <li><a href="data-kategori.php">Data Kategori</a></li>
                <li><a href="data-produk.php">Data Produk</a></li>
                <li><a href="keluar.php">Keluar</a></li>
            </ul>
        </div>
    </header>

    <!-- content -->
    <div class="section">
        <div class="container">
            <h3>Ini adalah Halaman Edit Data Kategori!</h3>
            <div class="box">
                <form action="" method="POST">
                    <input type="text" name="nama" placeholder="Nama Kategori" class="input-control" value="<?php echo $k->nama_kategori ?>" required>
                    <input type="submit" name="submit" value="Ubah Kategori" class="btn">
                </form>
                <?php
                if(isset($_POST['submit'])){

                    $nama = ucwords($_POST['nama']);
                    
                    $update = mysqli_query($conn, "UPDATE kategori SET nama_kategori = '".$nama."' WHERE id_kategori = '".$k->id_kategori."' ");

                    if($update){
                        echo '<script>alert("Edit Data Kategori Berhasil!")</script>';
                        echo '<script>window.location="data-kategori.php"</script>';
                    }else{
                        echo 'Edit Kategori Gagal!' .mysqli_error($conn);
                    }

                }
                ?>
            </div>
        </div>
    </div>

    <!-- footer -->
    <footer>
        <div class="container">
            <small>Copyright &copy, 2024 - Zalfa Zahira Putri</small>
        </div>
    </footer>
</body>
</html>