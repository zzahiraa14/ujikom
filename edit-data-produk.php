<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php"</script>';
    }

    $produk = mysqli_query($conn, "SELECT * FROM produk WHERE id_produk = '".$_GET['id']."' ");
    if(mysqli_num_rows($produk) == 0){
        echo '<script>window.location="data-produk.php"</script>';
    }
    $p = mysqli_fetch_object($produk);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Produk | Admin</title>
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
                <li><a href="data-pesanan.php">Data Pesanan</a></li>
                <li><a href="keluar.php">Keluar</a></li>
            </ul>
        </div>
    </header>

    <!-- content -->
    <div class="section">
        <div class="container">
            <h3>Ini adalah Halaman Edit Data Produk!</h3>
            <div class="box">
                <form action="" method="POST" enctype="multipart/form-data">
                    <select class="input-control" name="kategori" required>
                        <option value="">--Pilih Kategori--</option>
                        <?php 
                            $kategori = mysqli_query($conn, "SELECT * FROM kategori ORDER BY id_kategori DESC");
                            while($r = mysqli_fetch_array($kategori)){

                        ?>
                        <option value="<?php echo $r['id_kategori'] ?>" <?php echo ($r['id_kategori'] == $p->id_kategori)?'selected':''; ?>><?php echo $r['nama_kategori'] ?></option>
                        <?php } ?>
                    </select>

                    <input type="text" name="nama" class="input-control" placeholder="Nama Produk" value="<?php echo $p->nama_produk ?>" required>
                    <input type="text" name="harga" class="input-control" placeholder="Harga Produk" value="<?php echo $p->harga_produk ?>" required>
                    <img src="produk/<?php echo $p->gambar_produk ?>" width="150px">
                    <input type="hidden" name="foto" value="<?php echo $p->gambar_produk ?>">
                    <input type="file" name="gambar" class="input-control">
                    <textarea class="input-control" name="deskripsi" placeholder="Deskripsi Produk"><?php echo $p->deskripsi_produk ?></textarea>
                    <select class="input-control" name="status">
                        <option value="">--Pilih Status--</option>
                        <option value="1" <?php echo ($p->status_produk == 1)? 'selected':''; ?>>Aktif</option>
                        <option value="0" <?php echo ($p->status_produk == 0)? 'selected':''; ?>>Tidak Aktif</option>
                    </select>
                    <input type="submit" name="submit" value="Ubah Produk" class="btn">
                </form>
                <?php
                if(isset($_POST['submit'])){

                    // data inputan form
                    $kategori  = $_POST['kategori'];
                    $nama      = $_POST['nama'];
                    $harga     = $_POST['harga'];
                    $deskripsi = $_POST['deskripsi'];
                    $status    = $_POST['status'];
                    $foto      = $_POST['foto'];

                    // data gambar baru
                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    // jika admin mengganti gambar
                    if($filename != ''){

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
                        unlink('./produk/'.$foto);
                        move_uploaded_file($tmp_name, './produk/'.$newname);
                        $namagambar = $newname;
                    }
                    }else{

                        // jika admin tidak mengganti gambar
                        $namagambar = $foto;

                    }

                    // query update data produk
                    $update = mysqli_query($conn, "UPDATE produk SET id_kategori = '".$kategori."', nama_produk = '".$nama."', harga_produk = '".$harga."', deskripsi_produk = '".$deskripsi."', gambar_produk = '".$namagambar."', status_produk = '".$status."' WHERE id_produk = '".$p->id_produk."' ");

                    if($update){
                        echo '<script>alert("Berhasil Mengedit Data Produk!")</script>';
                        echo '<script>window.location="data-produk.php"</script>';
                    }else{
                        echo 'Edit Data Produk Gagal!'.mysqli_error($conn);
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