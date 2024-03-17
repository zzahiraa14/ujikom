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
    <title>Edit Kategori | Admin</title>
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
            <h1><a href="profil.php">Babyshop</a></h1>
            <ul>
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
                <form action="" method="POST" enctype="multipart/form-data">
                    <input type="text" name="nama" placeholder="Nama Kategori" class="input-control" value="<?php echo $k->nama_kategori ?>" required>
                    <img src="produk/<?php echo $k->gambar_kategori ?>" width="150px">
                    <input type="hidden" name="foto" value="<?php echo $k->gambar_kategori ?>">
                    <input type="file" name="gambar" class="input-control">
                    <input type="submit" name="submit" value="Ubah Kategori" class="btn">
                </form>
                <?php
                if(isset($_POST['submit'])){

                    $nama = ucwords($_POST['nama']);
                    $foto = $_POST['foto'];

                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    if($filename != ''){

                        $type1 = explode('.', $filename);
                        $type2 = $type1[1];
    
                        $newname = 'kategori'.time().'.'.$type2;

                        $tipe_diizinkan = array('jpg', 'jpeg', 'png', 'gif');

                        if(!in_array($type2, $tipe_diizinkan)){
                            echo '<script>alert("Format file tidak diizinkan!")</script>';
                        }else{
                            unlink('./produk/'.$foto);
                            move_uploaded_file($tmp_name, './produk/'.$newname);
                            $namagambar = $newname;
                        }
                        }else{
                            $namagambar = $foto;

                    }
                    
                    $update = mysqli_query($conn, "UPDATE kategori SET nama_kategori = '".$nama."', gambar_kategori = '".$namagambar."' WHERE id_kategori = '".$k->id_kategori."' ");

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