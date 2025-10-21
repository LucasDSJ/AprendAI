<?php
session_start();
include_once("conexao.php");

// Recebe dados do formulário
$email = $_POST['email'] ?? '';
$senha = $_POST['senha'] ?? '';

// Validação de campos
if (empty($email) || empty($senha)) {
    echo "<script>alert('Por favor, preencha todos os campos.'); window.history.back();</script>";
    exit;
}

// Validação de formato de e-mail
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "<script>alert('E-mail inválido.'); window.history.back();</script>";
    exit;
}

// Consulta o usuário no banco
$stmt = $conn->prepare("SELECT id_usuario, nome, sobrenome, senha FROM usuarios WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

// Verifica se o e-mail existe
if ($result->num_rows === 0) {
    echo "<script>alert('E-mail não encontrado.'); window.history.back();</script>";
    $stmt->close();
    $conn->close();
    exit;
}

$usuario = $result->fetch_assoc();

// Verifica senha
if (!password_verify($senha, $usuario['senha'])) {
    echo "<script>alert('Senha incorreta.'); window.history.back();</script>";
    $stmt->close();
    $conn->close();
    exit;
}

// Login OK → salva dados na sessão
$_SESSION['usuario_id'] = $usuario['id_usuario'];
$_SESSION['usuario_nome'] = $usuario['nome'];
$_SESSION['usuario_sobrenome'] = $usuario['sobrenome'];

// Redireciona para página inicial ou dashboard
echo "<script>alert('Login realizado com sucesso!'); window.location.href='../pagina_principal.php';</script>";

// Fecha conexão
$stmt->close();
$conn->close();
?>
