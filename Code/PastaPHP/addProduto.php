<?php
    
$nome = $_POST["nome"];
$preco = $_POST["preco"];
$descricao = $_POST["descricao"];

$con = mysqli_connect("localhost:3306", "root", "", "unimarket");

$query = "INSERT INTO produtos(nome, preco, descricao) VALUES ('$nome', '$preco', '$descricao')";
mysqli_query($con, $query);