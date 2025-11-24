<?php
session_start();

// Usuário precisa estar logado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: ../../banco_de_dados/login.php");
    exit();
}

require_once __DIR__ . '/../../banco_de_dados/conexao.php';

// Verificar ID da lição
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo "Lição inválida.";
    exit();
}

$id_licao = intval($_GET['id']);
$id_usuario = intval($_SESSION['id_usuario']);

// =========================
// Buscar informações da lição
// =========================
$sql = "
    SELECT l.*, c.titulo AS curso_titulo, c.id_curso
    FROM licoes l
    JOIN cursos c ON c.id_curso = l.id_curso
    WHERE l.id_licao = ?
    LIMIT 1
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_licao);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "Lição não encontrada.";
    exit();
}

$licao = $result->fetch_assoc();

// =========================
// Marcar como concluída (quando POST)
// =========================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['concluir'])) {

    $sqlCheck = "SELECT * FROM progresso WHERE id_usuario = ? AND id_licao = ? LIMIT 1";
    $stmtCheck = $conn->prepare($sqlCheck);
    $stmtCheck->bind_param("ii", $id_usuario, $id_licao);
    $stmtCheck->execute();
    $resCheck = $stmtCheck->get_result();

    if ($resCheck->num_rows === 0) {
        // Criar registro
        $sqlInsert = "INSERT INTO progresso (id_usuario, id_curso, id_licao, completou) VALUES (?, ?, ?, 1)";
        $stmtInsert = $conn->prepare($sqlInsert);
        $stmtInsert->bind_param("iii", $id_usuario, $licao['id_curso'], $id_licao);
        $stmtInsert->execute();
    } else {
        // Atualizar registro
        $sqlUpdate = "UPDATE progresso SET completou = 1 WHERE id_usuario = ? AND id_licao = ?";
        $stmtUpdate = $conn->prepare($sqlUpdate);
        $stmtUpdate->bind_param("ii", $id_usuario, $id_licao);
        $stmtUpdate->execute();
    }

    // Voltar ao curso
    header("Location: abrir_curso.php?id=" . $licao['id_curso']);
    exit();
}

require_once 'Parsedown.php';
$Parsedown = new Parsedown();

?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($licao['titulo']) ?></title>
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo_brain_primary.png">

    <!-- GOOGLE ICONS -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Vue.js -->
	<script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>

    <link href="../../styles/main.css" rel="stylesheet">
    <link href="../../styles/navbar.css" rel="stylesheet">
    <link href="../../styles/footer.css" rel="stylesheet">
    <link href="../../styles/licoes.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">
<div id="app" class="d-flex flex-column flex-fill">

    <!-- Navbar -->
    <navbar-abrir-curso-component></navbar-abrir-curso-component>

    <!-- Conteúdo principal -->
    <main class="flex-fill">
        <div class="container pt-4">
            <div class="border border-2 border-primary p-4 rounded-3 shadow-sm">

                <h1 class="text-primary"><?= htmlspecialchars($licao['ordem']) ?>. <?= htmlspecialchars($licao['titulo']) ?></h1>
                <h5 class="text-white mb-3">Curso: <?= htmlspecialchars($licao['curso_titulo']) ?></h5>

                <!-- Conteúdo da lição -->
                <div class="text-white mb-4" style="white-space: pre-line;">
                    <?= $Parsedown->text($licao['conteudo']); ?>
                </div>

                <!-- Botão concluir -->
                <form method="POST">
                    <button type="submit" name="concluir" class="btn btn-primary">
                        Concluir lição
                    </button>
                </form>

                <a href="abrir_curso.php?id=<?= $licao['id_curso'] ?>" class="btn btn-secondary mt-3">
                    Voltar ao curso
                </a>

            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer-component></footer-component>

</div>

<!-- Vue -->
<script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
<script src="../../components/navbar.js"></script>
<script src="../../components/footer.js"></script>
<script src="../../components/app.js"></script>

</body>
</html>
