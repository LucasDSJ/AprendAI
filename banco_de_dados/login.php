<?php
session_start();
include_once("conexao.php");

$email = $_POST['email'] ?? '';
$senha = $_POST['senha'] ?? '';

if (empty($email) || empty($senha)) {
    die("Por favor, preencha todos os campos.");
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("E-mail inválido.");
}

$stmt = $conn->prepare("SELECT id_usuario, nome, sobrenome, senha FROM usuarios WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "<script>alert('E-mail não encontrado.'); window.history.back();</script>";
    exit;
}

$usuario = $result->fetch_assoc();

if (!password_verify($senha, $usuario['senha'])) {
    echo "<script>alert('Senha incorreta.'); window.history.back();</script>";
    exit;
}

$_SESSION['usuario_id'] = $usuario['id_usuario'];
$_SESSION['usuario_nome'] = $usuario['nome'];
$_SESSION['usuario_sobrenome'] = $usuario['sobrenome'];

echo "<script>alert('Login realizado com sucesso!'); window.location.href='../index.html';</script>";

$stmt->close();
$conn->close();
?>
