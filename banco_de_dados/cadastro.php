<?php
include_once("conexao.php");

$nome           = $_POST['nome'] ?? '';
$sobrenome      = $_POST['sobrenome'] ?? '';
$email          = $_POST['email'] ?? '';
$numero_celular = $_POST['numero_celular'] ?? '';
$senha          = $_POST['senha'] ?? '';

if (empty($nome) || empty($sobrenome) || empty($email) || empty($numero_celular) || empty($senha)) {
    die("Por favor, preencha todos os campos.");
}

//================================= VERIFICADOR DE EMAIL ===============================================//
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("Formato de e-mail inválido.");
}

list($usuario, $dominio) = explode('@', $email);
if (!checkdnsrr($dominio, 'MX')) {
    die("O domínio do e-mail não existe.");
}
//=====================================================================================================//

$senha_hash = password_hash($senha, PASSWORD_DEFAULT);

$stmt = $conn->prepare("INSERT INTO usuarios (nome, sobrenome, email, numero_celular, senha) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $nome, $sobrenome, $email, $numero_celular, $senha_hash);

if ($stmt->execute()) {
    echo "<script>alert('Usuário cadastrado com sucesso!'); window.location.href='../login.html';</script>";
} else {
    if ($conn->errno === 1062) {
        echo "<script>alert('Este e-mail já está cadastrado!'); window.history.back();</script>";
    } else {
        echo "Erro ao cadastrar: " . $conn->error;
    }
}

$stmt->close();
$conn->close();
?>
