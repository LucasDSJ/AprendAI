<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Cursos AprendAI</title>
	<link rel="shortcut icon" type="imagex/png" href="../img/logo_brain_primary.png">
    
	<!-- Google Icons -->
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Vue.js -->
	<script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>

	<link href="../styles/main.css" rel="stylesheet">
	<link href="../styles/navbar.css" rel="stylesheet">
	<link href="../styles/footer.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">
	<div id="app" class="d-flex flex-column flex-fill">

    	<!-- Navbar -->
    	<navbar-cursos-logado-component></navbar-cursos-logado-component>

		<!-- Conteúdo principal -->
		<main class="flex-fill">
			<div class="main-content">
				<div class="content">
					<div class="container pt-3">
						<div class="border border-2 border-primary p-4 rounded-3 shadow-sm" id="area_conteudo">
							<h1 class="text-primary mb-4">Cursos Disponíveis</h1>

							<div class="row">
								<?php
								// Inclui o backend que lista os cursos
								include "cursos/listar_logado.php";
								?>
							</div>

						</div>
					</div>
				</div>
			</div>
		</main>

		<!-- Footer -->
    	<footer-component></footer-component>
  </div>

   <!-- Componentes Vue -->
  <script src="../components/navbar.js"></script>
  <script src="../components/footer.js"></script>
  <script src="../components/app.js"></script>

</body>
</html>
