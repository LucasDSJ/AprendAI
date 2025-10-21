<?php
$host = "localhost";
$usuario = "root";
$senha = "";
$nome_banco = "tcc_banco_de_dados";

// Cria a conexão
$conn = new mysqli($host, $usuario, $senha, $nome_banco);

// Verifica erro
if ($conn->connect_error) {
    die("Erro de conexão com o banco de dados: " . $conn->connect_error);
}

// Define charset para evitar erros com acentuação
$conn->set_charset("utf8mb4");
?>
