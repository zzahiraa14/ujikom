<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php"</script>';
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Produk | Babyshop</title>
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
            <h3>Ini adalah Halaman Data Produk!</h3>
            <div class="box">
                <p><a href="tambah-data-produk.php">Tambah Data Produk</a></p>
                <table border="1" cellspacing="0" class="table">
                    <thead>
                        <tr>
                            <th width="30px">No</th>
                            <th width="150px">Nama Kategori</th>
                            <th width="320px">Nama Produk</th>
                            <th width="120px">Harga</th>
                            <th width="500px">Deskripsi</th>
                            <th width="20px">Gambar</th>
                            <th width="70px">Status</th>
                            <th width="120px">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $no = 1;
                            $produk = mysqli_query($conn, "SELECT * FROM produk LEFT JOIN kategori USING (id_kategori) ORDER BY id_produk DESC");
                            if(mysqli_num_rows($produk) > 0){
                            while($row = mysqli_fetch_array($produk)){
                        ?>
                        <tr>
                            <td><?php echo $no++ ?></td>
                            <td><?php echo $row['nama_kategori'] ?></td>
                            <td><?php echo $row['nama_produk'] ?></td>
                            <td>Rp. <?php echo number_format($row['harga_produk']) ?></td>
                            <td><?php echo $row['deskripsi_produk'] ?></td>
                            <td><a href="produk/<?php echo $row['gambar_produk']?>" target="_blank"><img src="produk/<?php echo $row['gambar_produk'] ?>" width="50px"></a></td>
                            <td><?php echo ($row['status_produk'] == 0)? 'Tidak Aktif':'Aktif'; ?></td>
                            <td><a href="edit-data-produk.php?id=<?php echo $row['id_produk'] ?>">Edit</a> || <a href="hapus-data-produk.php?idp=<?php echo $row['id_produk'] ?>" onclick="return confirm('Konfirmasi hapus Data Produk')">Hapus</a></td>
                        </tr>
                        <?php }}else{ ?>
                            <tr>
                                <td colspan="8">Tidak ada data</td>
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