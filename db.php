<?php
    $hostname = 'localhost';
    $username = 'root';
    $password = '';
    $dbname   = 'babyshop';

    $conn     = mysqli_connect($hostname, $username, $password, $dbname) or die ('Gagal Terhubung, Coba Lagi!');
?>