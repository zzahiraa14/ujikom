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
    <title>Data Kategori | Admin</title>
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
            <h3>Ini adalah Halaman Data Kategori!</h3>
            <div class="box">
                <p class="kata"><a href="tambah-data-kategori.php"><input type="submit" name="submit" value="Tambah Data Kategori" class="btn3"></a></p>
                <table border="1" cellspacing="0" class="table">
                    <thead>
                        <tr>
                            <th width="60px">No</th>
                            <th>Nama Kategori</th>
                            <th width="80px">Gambar</th>
                            <th width="160px">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $no = 1;
                            $kategori = mysqli_query($conn, "SELECT * FROM kategori ORDER BY id_kategori DESC");
                            if(mysqli_num_rows($kategori) > 0){
                            
                            while($row = mysqli_fetch_array($kategori)){
                        ?>
                        <tr>
                            <td><?php echo $no++ ?></td>
                            <td><?php echo $row['nama_kategori'] ?></td>
                            <td><a href="produk/<?php echo $row['gambar_kategori']?>" target="_blank"><img src="produk/<?php echo $row['gambar_kategori'] ?>" width="120px"></a></td>
                            <td><a href="edit-data-kategori.php?id=<?php echo $row['id_kategori'] ?>"><input type="submit" name="submit" value="Edit" class="btn"></a> | <a href="hapus-data-kategori.php?idk=<?php echo $row['id_kategori'] ?>" onclick="return confirm('Konfirmasi hapus Data Kategori')"><input type="submit" name="submit" value="Hapus" class="btn2"></a></td>
                        </tr>
                        <?php }}else{ ?>
                            <tr>
                                <td colspan="4">Tidak Ada Data</td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
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