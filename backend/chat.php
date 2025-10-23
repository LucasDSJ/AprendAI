<?php
// Carrega variáveis do arquivo .env
$env = parse_ini_file(__DIR__ . "/.env");
$apiKey = $env["OPENAI_API_KEY"] ?? "";

// Define CORS (mude para seu domínio real em produção)
header("Access-Control-Allow-Origin: http://localhost");

// Define o tipo de resposta
header("Content-Type: application/json; charset=UTF-8");

// Obtém e valida o corpo da requisição
$input = json_decode(file_get_contents("php://input"), true);
$message = trim($input["message"] ?? "");

if (!$message) {
    http_response_code(400);
    echo json_encode(["error" => "Mensagem vazia"]);
    exit;
}

// VERIFICA SE A REQUISIÇÃO VEIO DO NOSSO PROJETO :)
$token = $input["token"] ?? "";
if ($token !== "voce-e-um-de-nos") {
    http_response_code(403);
    echo json_encode(["error" => "Acesso não autorizado"]);
    exit;
}

// Valida se a API key foi carregada
if (!$apiKey) {
    http_response_code(500);
    echo json_encode(["error" => "API_KEY não configurada"]);
    exit;
}

// Limita tamanho da mensagem (evita abusos)
if (strlen($message) > 500) {
    http_response_code(400);
    echo json_encode(["error" => "Mensagem muito longa"]);
    exit;
}

// Monta o payload da requisição para a OpenAI
$url = "https://api.openai.com/v1/chat/completions";
$data = [
    "model" => "gpt-4o-mini",
    "messages" => [
        [
            "role" => "system",
            "content" => "
                Você é um assistente de estudantes especializado exclusivamente em tecnologia.
                Responda apenas perguntas relacionadas ao mundo da tecnologia.
                Se a pergunta não estiver relacionada a esses temas, recuse a responder educadamente.
                Sempre retorne respostas **em texto puro**, sem marcação Markdown, sem blocos de código (```) e sem negrito ou itálico.
            "
        ],
        [
            "role" => "user",
            "content" => $message
        ]
    ],
    "temperature" => 0.3
];

// Configura contexto da requisição HTTP
$options = [
    "http" => [
        "header" => [
            "Content-Type: application/json",
            "Authorization: Bearer $apiKey"
        ],
        "method"  => "POST",
        "content" => json_encode($data),
        "ignore_errors" => true // Permite capturar erros HTTP
    ]
];

// Executa requisição e captura resposta
$context  = stream_context_create($options);
$response = file_get_contents($url, false, $context);

// Verifica se houve erro de conexão
if ($response === false) {
    http_response_code(500);
    echo json_encode(["error" => "Falha ao conectar à API da OpenAI"]);
    exit;
}

// Decodifica e valida resposta da API
$result = json_decode($response, true);

if (isset($result["error"])) {
    http_response_code(400);
    echo json_encode(["error" => $result["error"]["message"]]);
    exit;
}

// Envia resposta final ao frontend
$resposta = $result["choices"][0]["message"]["content"] ?? "Sem resposta";
echo json_encode(["resposta" => $resposta]);
?>
