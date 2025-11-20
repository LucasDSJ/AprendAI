<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: ../../banco_de_dados/login.php");
    exit();
}

require_once __DIR__ . '/../../banco_de_dados/conexao.php';

// Verifica se o ID do curso foi enviado
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo "Curso inválido.";
    exit();
}

$id_curso = intval($_GET['id']);
$id_usuario = intval($_SESSION['id_usuario']);

// =========================
// Buscar informações do curso
// =========================
$sqlCurso = "SELECT * FROM cursos WHERE id_curso = ?";
$stmtCurso = $conn->prepare($sqlCurso);
$stmtCurso->bind_param("i", $id_curso);
$stmtCurso->execute();
$resultCurso = $stmtCurso->get_result();

if ($resultCurso->num_rows === 0) {
    echo "Curso não encontrado.";
    exit();
}

$curso = $resultCurso->fetch_assoc();

// =========================
// Buscar lições do curso
// =========================
$sqlLicoes = "SELECT * FROM licoes WHERE id_curso = ? ORDER BY ordem ASC";
$stmtLicoes = $conn->prepare($sqlLicoes);
$stmtLicoes->bind_param("i", $id_curso);
$stmtLicoes->execute();
$resultLicoes = $stmtLicoes->get_result();

$licoes = [];
while ($linha = $resultLicoes->fetch_assoc()) {
    $licoes[] = $linha;
}

$total_licoes = count($licoes);

// =========================
// Calcular progresso
// =========================
$sqlProgresso = "
    SELECT COUNT(*) AS completas 
    FROM progresso 
    WHERE id_usuario = ? AND id_curso = ? AND completou = 1
";
$stmtProgresso = $conn->prepare($sqlProgresso);
$stmtProgresso->bind_param("ii", $id_usuario, $id_curso);
$stmtProgresso->execute();
$resultProgresso = $stmtProgresso->get_result();
$dadosProgresso = $resultProgresso->fetch_assoc();

$completas = intval($dadosProgresso['completas']);
$porcentagem = ($total_licoes > 0) ? round(($completas / $total_licoes) * 100) : 0;

?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($curso['titulo']) ?></title>

    <!-- ÍCONES DO GOOGLE -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Vue.js -->
	<script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>


    <link href="../../styles/main.css" rel="stylesheet">
    <link href="../../styles/navbar.css" rel="stylesheet">
    <link href="../../styles/footer.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">
    <div id="app" class="d-flex flex-column flex-fill">

        <!-- Navbar -->
        <navbar-abrir-curso-component></navbar-abrir-curso-component>

        <!-- Conteúdo principal -->
        <main class="flex-fill">
            <div class="container pt-4">

                <div class="border border-2 border-primary p-4 rounded-3 shadow-sm">

                    <h1 class="text-primary"><?= htmlspecialchars($curso['titulo']) ?></h1>
                    <p class="text-white"><?= htmlspecialchars($curso['descricao']) ?></p>

                    <h5 class="text-white mt-4">Progresso do curso</h5>

                    <!-- Barra de progresso -->
                    <div class="progress mb-3">
                        <div class="progress-bar bg-success" role="progressbar"
                             style="width: <?= $porcentagem ?>%;"
                             aria-valuenow="<?= $porcentagem ?>" aria-valuemin="0" aria-valuemax="100">
                            <?= $porcentagem ?>%
                        </div>
                    </div>

                    <h4 class="text-primary mt-4">Lições</h4>

                    <ul class="list-group">

                        <?php foreach ($licoes as $licao): ?>

                            <?php
                            // Verificar se a lição foi concluída
                            $sqlCheck = "
                                SELECT completou FROM progresso 
                                WHERE id_usuario = ? AND id_licao = ? LIMIT 1
                            ";
                            $stmtCheck = $conn->prepare($sqlCheck);
                            $stmtCheck->bind_param("ii", $id_usuario, $licao['id_licao']);
                            $stmtCheck->execute();
                            $resCheck = $stmtCheck->get_result();
                            $finalizado = ($resCheck->num_rows > 0 && $resCheck->fetch_assoc()['completou'] == 1);
                            ?>

                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <a href="licao.php?id=<?= $licao['id_licao'] ?>" class="text-decoration-none">
                                    <?= htmlspecialchars($licao['ordem']) ?>. <?= htmlspecialchars($licao['titulo']) ?>
                                </a>

                                <?php if ($finalizado): ?>
                                    <span class="badge bg-success">Concluída</span>
                                <?php else: ?>
                                    <span class="badge bg-secondary">Pendente</span>
                                <?php endif; ?>
                            </li>

                        <?php endforeach; ?>

                    </ul>

                </div>

            </div>
        </main>

        <!-- Footer -->
        <footer-component></footer-component>

    </div>

    <!-- Vue Components -->
    <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
    <script src="../../components/navbar.js"></script>
    <script src="../../components/footer.js"></script>
    <script src="../../components/app.js"></script>

</body>
</html>
