<?php

    include 'db.php';

    if(isset($_GET['idp'])){
        $produk = mysqli_query($conn, "SELECT gambar_produk FROM produk WHERE id_produk = '".$_GET['idp']."' ");
        $p = mysqli_fetch_object($produk);

        unlink('./produk/'.$p->gambar_produk);

        $delete = mysqli_query($conn, "DELETE FROM produk WHERE id_produk = '".$_GET['idp']."' ");
        echo '<script>window.location="data-produk.php"</script>';
    }

?>