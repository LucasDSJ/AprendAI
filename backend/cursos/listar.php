<?php
// Conecta ao banco (ajuste os dados de conexão)
require_once __DIR__ . '/../../banco_de_dados/conexao.php';

$sql = "SELECT * FROM cursos ORDER BY id_curso ASC";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while ($curso = $result->fetch_assoc()) {
        echo '<div class="col-md-4 mb-4">';
        echo '  <div class="card h-100 shadow-sm border-primary bg-info">';
        
        // Imagem do curso (se existir)
        if (!empty($curso['imagem_capa'])) {
            echo '    <img src="' . htmlspecialchars($curso['imagem_capa']) . '" class="card-img-top img-fluid p-5" alt="' . htmlspecialchars($curso['titulo']) . '">';
        }

        echo '    <div class="card-body">';
        echo '      <h4 class="card-title text-center">' . htmlspecialchars($curso['titulo']) . '</h4>';
        echo '      <p class="card-text text-center">' . htmlspecialchars($curso['descricao']) . '</p>';
        echo '      <p class="text-muted">Carga horária: ' . htmlspecialchars($curso['carga_horaria']) . 'h</p>';
        echo '    </div>'; // card-body
        echo '  </div>';   // card
        echo '</div>';     // col
    }
} else {
    echo '<div class="col-12 text-center text-muted">Nenhum curso disponível no momento.</div>';
}

$conn->close();
?>
