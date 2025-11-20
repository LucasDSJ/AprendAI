<?php
session_start();

// Verifica se está logado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.html");
    exit;
}

$nome_usuario = $_SESSION['usuario_nome'];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educação para Todos</title>
    <!-- Símbolos do Google -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
   
    <link rel="stylesheet" href="../styles/main.css">
    <link rel="stylesheet" href="../styles/navbar.css">
    <link rel="stylesheet" href="../styles/footer.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <div id="app" class="d-flex flex-column flex-fill">
        <!-- Navbar -->
        <navbar-login-component></navbar-login-component>
        
        <div class="main-content">
            <div class="content">
                <div class="container pt-3">
                    <div class="border border-2 border greenyellow p-4" id="area_conteudo">
                        <!-- <h1>Área de Conteúdo</h1>
                        <p>Explicativo sobre o site.</p> -->
                        <h1 class="text-center"> Olá, <span class="text-primary"><?php echo htmlspecialchars($nome_usuario); ?></span>!</h1>
                        <h3 class="text-center mt-3">O que deseja fazer hoje?</h3>

                        <div class="container mt-4">
                            <div class="row text-center d-flex flex-column flex-sm-row mt-4">
                                <a href="chatbot_logado.html" class="col-12 col-sm-6 p-0 text-decoration-none">
                                    <div class="border border-primary p-3 h-100">
                                        <h2 class="mt-3">Falar com bubbles</h2>
                                        <img src="../img/bubbles_3.png" class="img-fluid">
                                    </div>
                                </a>
                                <a href="cursos_logado.php" class="col-12 col-sm-6 p-0 text-decoration-none">
                                    <div class="border border-primary p-3 h-100">
                                        <h2 class="mt-3">Estudar</h2>
                                        <img src="../img/cursos2.png" class="img-fluid">
                                    </div>
                                </a>
                            </div>

                        </div>

                        <!-- <a href="banco_de_dados/logout.php">Sair</a> -->
                    </div>
                </div>
            </div>
            
        </div>
        <!-- footer -->
        <footer-component></footer-component>
    </div>

<script src="../components/navbar.js"></script>
<script src="../components/footer.js"></script>
<script src="../components/app.js"></script>

</body>
</html>
