<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login-admin.php"</script>';
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Kategori | Admin</title>
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
            <h1><a href="profil.php">Babyshop</a></h1>
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
            <h3>Ini adalah Halaman Tambah Data Kategori!</h3>
            <div class="box">
                <form action="" method="POST" enctype="multipart/form-data">
                    <input type="text" name="nama" placeholder="Nama Kategori" class="input-control" required>
                    <input type="file" name="gambar" class="input-control" required>
                    <input type="submit" name="submit" value="Tambah Kategori" class="btn">
                </form>
                <?php
                if(isset($_POST['submit'])){

                    $nama = ucwords($_POST['nama']);

                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    $type1 = explode('.', $filename);
                    $type2 = $type1[1];

                    $newname = 'kategori'.time().'.'.$type2;

                    $tipe_diizinkan = array('jpg', 'jpeg', 'png', 'gif');

                    if(!in_array($type2, $tipe_diizinkan)){
                        echo '<script>alert("Format file tidak diizinkan!")</script>';

                    }else{
                        move_uploaded_file($tmp_name, './produk/'.$newname);

                    $insert = mysqli_query($conn, "INSERT INTO kategori VALUE (null, '".$nama."', '".$newname."') ");
                    if($insert){
                        echo '<script>alert("Data Kategori Berhasil Ditambahkan!")</script>';
                        echo '<script>window.location="data-kategori.php"</script>';
                    }else{
                        echo 'Data Kategori Gagal Ditambahkan!' .mysqli_error($conn);
                    }
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