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
    <title>Tambah Produk | Admin</title>
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
            <h3>Ini adalah Halaman Tambah Data Produk!</h3>
            <div class="box">
                <form action="" method="POST" enctype="multipart/form-data">
                    <select class="input-control" name="kategori" required>
                        <option value="">--Pilih Kategori--</option>
                        <?php 
                            $kategori = mysqli_query($conn, "SELECT * FROM kategori ORDER BY id_kategori DESC");
                            while($r = mysqli_fetch_array($kategori)){
                        ?>
                        <option value="<?php echo $r['id_kategori'] ?>"><?php echo $r['nama_kategori'] ?></option>
                        <?php } ?>
                    </select>

                    <input type="text" name="nama" class="input-control" placeholder="Nama Produk" required>
                    <input type="text" name="harga" class="input-control" placeholder="Harga Produk" required>
                    <input type="file" name="gambar" class="input-control" required>
                    <textarea class="input-control" name="deskripsi" placeholder="Deskripsi Produk"></textarea>
                    <select class="input-control" name="status">
                        <option value="">--Pilih Status--</option>
                        <option value="1">Aktif</option>
                        <option value="0">Tidak Aktif</option>
                    </select>
                    <input type="submit" name="submit" value="Tambah Produk" class="btn">
                </form>
                <?php
                if(isset($_POST['submit'])){

                    // print_r($_FILES['gambar']);

                    // inputan dari form
                    $kategori  = $_POST['kategori'];
                    $nama      = $_POST['nama'];
                    $harga     = $_POST['harga'];
                    $deskripsi = $_POST['deskripsi'];
                    $status    = $_POST['status'];

                    // data file yang diupload
                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    $type1 = explode('.', $filename);
                    $type2 = $type1[1];

                    $newname = 'produk'.time().'.'.$type2;

                    // data format file yang diizinkan
                    $tipe_diizinkan = array('jpg', 'jpeg', 'png', 'gif');

                    // validasi format file
                    if(!in_array($type2, $tipe_diizinkan)){

                    // jika format file tidak ada dalam array tipe diizinkan
                        echo '<script>alert("Format file tidak diizinkan!")</script>';

                    }else{

                        // jika format file sesuai dalam array tipe diizinkan
                        // proses upload file + insert ke database
                        move_uploaded_file($tmp_name, './produk/'.$newname);

                        $insert = mysqli_query($conn, "INSERT INTO produk VALUE (null, '".$kategori."', '".$nama."', '".$harga."', '".$deskripsi."', '".$newname."', '".$status."', null) ");

                        if($insert){
                            echo '<script>alert("Berhasil Menambahkan Data Produk!")</script>';
                            echo '<script>window.location="data-produk.php"</script>';
                        }else{
                            echo 'Tambah Data Produk Gagal!'.mysqli_error($conn);
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