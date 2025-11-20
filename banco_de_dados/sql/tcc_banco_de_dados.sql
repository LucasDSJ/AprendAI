-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/11/2025 às 05:03
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcc_banco_de_dados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `imagem_capa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `titulo`, `descricao`, `carga_horaria`, `imagem_capa`) VALUES
(1, 'Introdução à Python', 'Aprenda os conceitos básicos da linguagem Python, incluindo variáveis, estruturas de decisão, laços de repetição, funções e manipulação de dados.', 12, 'img/python/curso_python_logo.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `licoes`
--

CREATE TABLE `licoes` (
  `id_licao` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `conteudo` text NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `licoes`
--

INSERT INTO `licoes` (`id_licao`, `id_curso`, `titulo`, `conteudo`, `ordem`) VALUES
(1, 1, 'Introdução ao Python', 'Python é uma linguagem de programação de alto nível, conhecida por sua simplicidade e legibilidade. \r\nEla é usada em diversas áreas, como desenvolvimento web, ciência de dados, automação, inteligência artificial e muito mais.\r\n\r\nPrincipais características do Python:\r\n- Sintaxe simples e clara.\r\n- Interpretada, ou seja, não precisa ser compilada.\r\n- Possui uma grande comunidade e muitas bibliotecas prontas.\r\n- Suporta programação orientada a objetos, funcional e procedural.\r\n\r\nNeste curso, você aprenderá o básico desta linguagem.', 1),
(2, 1, 'Instalação e Primeiro Programa', 'Para começar a programar em Python, você precisa instalá-lo em seu computador. Siga os passos abaixo:\r\n\r\n1. Acesse o site oficial do Python: https://www.python.org/downloads/\r\n2. Baixe a versão recomendada para o seu sistema operacional (Windows, macOS ou Linux).\r\n3. Durante a instalação, marque a opção \"Add Python to PATH\" para poder executar Python pelo terminal.\r\n\r\nApós a instalação, abra o terminal ou prompt de comando e digite `python --version` para verificar se a instalação foi bem-sucedida.\r\n\r\n**Primeiro programa em Python:**\r\nAbra um editor de texto ou um IDE (como VS Code ou PyCharm) e digite o seguinte código:\r\n```python\r\nprint(\"Olá, mundo!\")\r\n```\r\nSalve o arquivo com a extensão `.py`, por exemplo `ola_mundo.py`, e execute-o pelo terminal com o comando:\r\n```\npython ola_mundo.py\n```\r\nVocê verá a mensagem `Olá, mundo!` sendo exibida, confirmando que seu ambiente está funcionando corretamente.\r\n\r\nAgora você está pronto para começar a escrever seus programas em Python!', 2),
(3, 1, 'Variáveis e Tipos de Dados', 'Em Python, **variáveis** são espaços na memória usados para armazenar valores, que podem ser números, textos ou outros tipos de dados.\n\n**Criando variáveis:**\n```python\nx = 10          # inteiro\nnome = \"Lucas\"  # string\npreco = 19.99    # float\nativo = True    # booleano\n```\n\n**Principais tipos de dados em Python:**\n- **int**: números inteiros (ex: 10, -3, 42)\n- **float**: números decimais (ex: 3.14, 0.5)\n- **str**: texto (ex: \"Olá, mundo!\")\n- **bool**: valores lógicos True ou False\n\nVocê pode verificar o tipo de uma variável usando a função `type()`:\n```python\ntipo = type(x)\nprint(tipo)  # <class \\\'int\\\'>\n```\n\n**Regras para nomes de variáveis:**\n- Não podem começar com número.\n- Não podem conter espaços (use underscore `_` se necessário).\n- Evite palavras reservadas do Python (como `if`, `for`, `print`).\n\nNesta lição, você aprendeu a criar variáveis e identificar os tipos de dados básicos em Python.', 3),
(4, 1, 'Operadores Aritméticos', 'Em Python, os operadores aritméticos são usados para realizar cálculos matemáticos básicos.\n\n**Principais operadores aritméticos:**\n- `+` : adição (ex: 5 + 3 = 8)\n- `-` : subtração (ex: 5 - 3 = 2)\n- `*` : multiplicação (ex: 5 * 3 = 15)\n- `/` : divisão (ex: 5 / 2 = 2.5)\n- `//` : divisão inteira (ex: 5 // 2 = 2)\n- `%` : resto da divisão (ex: 5 % 2 = 1)\n- `**` : potência (ex: 2 ** 3 = 8)\n\n**Exemplos em Python:**\n```python\na = 10\nb = 3\nprint(a + b)  # 13\nprint(a - b)  # 7\nprint(a * b)  # 30\nprint(a / b)  # 3.3333333\nprint(a // b) # 3\nprint(a % b)  # 1\nprint(a ** b) # 1000\n```\n\nNesta lição, você aprendeu a usar os operadores aritméticos em Python para realizar cálculos simples.', 4),
(5, 1, 'Operadores de Comparação', 'Os operadores de comparação em Python são usados para comparar valores e retornar **True** ou **False**.\n\n**Principais operadores de comparação:**\n- `==` : igual a\n- `!=` : diferente de\n- `>`  : maior que\n- `<`  : menor que\n- `>=` : maior ou igual a\n- `<=` : menor ou igual a\n\n**Exemplos em Python:**\n```python\nx = 5\ny = 8\nprint(x == y)  # False\nprint(x != y)  # True\nprint(x > y)   # False\nprint(x < y)   # True\nprint(x >= 5)  # True\nprint(y <= 10) # True\n```\n\nNesta lição, você aprendeu a usar operadores de comparação para avaliar condições e controlar o fluxo do seu programa.', 5),
(6, 1, 'Operadores Lógicos', 'Os **operadores lógicos** em Python são usados para combinar expressões booleanas e controlar o fluxo do programa de maneira mais complexa.\n\nOs principais operadores lógicos são:\n\n- `and` : retorna **True** se **todas** as expressões forem verdadeiras.\n- `or`  : retorna **True** se **pelo menos uma** expressão for verdadeira.\n- `not` : inverte o valor lógico da expressão (True → False e False → True).\n\n**Exemplos básicos:**\n```python\nx = True\ny = False\nprint(x and y)  # False, porque y é False\nprint(x or y)   # True, porque x é True\nprint(not x)    # False, inverte True para False\n```\n\n**Exemplos práticos:**\nImagine um sistema de login:\n```python\nusuario_logado = True\nsenha_correta = False\nif usuario_logado and senha_correta:\n    print(\"Acesso permitido\")\nelse:\n    print(\"Acesso negado\")\n```\nResultado: `Acesso negado` porque ambas as condições precisam ser verdadeiras com `and`.\n\nVerificando múltiplas condições com `or`:\n```python\ntem_ingresso = True\nconvidado_vip = False\nif tem_ingresso or convidado_vip:\n    print(\"Pode entrar no show\")\nelse:\n    print(\"Não pode entrar\")\n```\nResultado: `Pode entrar no show` porque pelo menos uma condição é verdadeira.\n\n**Combinação de operadores:**\nVocê pode combinar `and`, `or` e `not` para criar expressões mais complexas:\n```python\nidade = 20\ntem_permissao = True\nif (idade >= 18 and tem_permissao) or usuario_admin:\n    print(\"Acesso liberado\")\n```\n> Dica: Use parênteses para garantir a ordem correta das operações lógicas.\n\nNesta lição, você aprendeu a usar operadores lógicos para criar condições complexas em Python, permitindo que seus programas tomem decisões inteligentes com base em múltiplos critérios.', 6),
(7, 1, 'Estruturas de Condição', 'Em Python, as **estruturas de condição** permitem que seu programa tome decisões com base em certas condições. Elas usam os operadores de comparação e lógicos que já aprendemos.\n\n### 1. if\nA estrutura `if` executa um bloco de código apenas se a condição for verdadeira.\n```python\nidade = 18\nif idade >= 18:\n    print(\"Você é maior de idade\")\n```\nSe `idade` for maior ou igual a 18, a mensagem será exibida.\n\n### 2. else\nO `else` define o que fazer caso a condição do `if` seja falsa.\n```python\nidade = 16\nif idade >= 18:\n    print(\"Você é maior de idade\")\nelse:\n    print(\"Você é menor de idade\")\n```\nResultado: `Você é menor de idade`.\n\n### 3. elif (else if)\nO `elif` permite testar múltiplas condições de forma sequencial.\n```python\nnota = 75\nif nota >= 90:\n    print(\"Excelente\")\nelif nota >= 70:\n    print(\"Bom\")\nelif nota >= 50:\n    print(\"Regular\")\nelse:\n    print(\"Precisa melhorar\")\n```\nResultado: `Bom` porque a primeira condição falsa leva ao próximo `elif`.\n\n### 4. Combinação com operadores lógicos\nVocê pode usar `and`, `or` e `not` para criar condições mais complexas.\n```python\nidade = 20\ntem_permissao = True\nif idade >= 18 and tem_permissao:\n    print(\"Pode acessar a área restrita\")\nelse:\n    print(\"Acesso negado\")\n```\nResultado: `Pode acessar a área restrita`.\n\n### 5. Dicas importantes\n- Use **indentação correta** (4 espaços) em Python; é obrigatória.\n- Combine operadores lógicos com cuidado e utilize **parênteses** para controlar a ordem das operações.\n- Teste sempre suas condições com diferentes valores para garantir que o fluxo funcione como esperado.\n\nNesta lição, você aprendeu a usar `if`, `else` e `elif`, combinando com operadores lógicos, para criar programas que podem tomar decisões inteligentes com base em múltiplas condições.', 7),
(8, 1, 'Laços de Repetição (Loops)', 'Os **laços de repetição** permitem executar um bloco de código várias vezes. Em Python, os dois principais tipos de loops são **for** e **while**. Eles são essenciais para automatizar tarefas repetitivas e percorrer listas, textos e outros tipos de dados.\n\n---\n\n### 1. Loop for\nO `for` é usado para percorrer itens de uma sequência (lista, string, range, etc.).\n```python\nfor i in range(5):\n    print(i)\n```\nSaída:\n```\n0\n1\n2\n3\n4\n```\nO `range(5)` gera números de 0 até 4.\n\n#### Percorrendo uma lista\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nfor fruta in frutas:\n    print(fruta)\n```\nResultado:\n```\nmaçã\nbanana\nuva\n```\n\n#### Percorrendo uma string\n```python\nfor letra in \"Python\":\n    print(letra)\n```\nIsso imprime cada letra separadamente.\n\n---\n\n### 2. Loop while\nO `while` repete enquanto a condição for verdadeira.\n```python\ncontador = 1\nwhile contador <= 5:\n    print(contador)\n    contador += 1\n```\nNesse exemplo, o loop roda até `contador` chegar a 6.\n\n⚠️ **Cuidado:** Se a condição nunca se tornar falsa, o loop será infinito.\n\nExemplo de loop infinito (NÃO FAÇA):\n```python\nwhile True:\n    print(\"Para com CTRL+C!\")\n```\n\n---\n\n### 3. Usando break\n`break` encerra o loop imediatamente.\n```python\nfor i in range(10):\n    if i == 4:\n        break\n    print(i)\n```\nSaída:\n```\n0\n1\n2\n3\n```\nO loop para quando `i` chega a 4.\n\n---\n\n### 4. Usando continue\n`continue` pula a iteração atual e vai para a próxima.\n```python\nfor i in range(6):\n    if i == 3:\n        continue\n    print(i)\n```\nSaída:\n```\n0\n1\n2\n4\n5\n```\nO número 3 é ignorado.\n\n---\n\n### 5. Loop com else\nO `else` é executado quando o loop termina normalmente (sem `break`).\n```python\nfor i in range(3):\n    print(i)\nelse:\n    print(\"Loop finalizado com sucesso!\")\n```\n\nSe houver `break`, o `else` não executa.\n\n---\n\n### 6. Dicas importantes\n- Use `for` quando quiser percorrer uma sequência de itens.\n- Use `while` quando quiser repetir até uma condição mudar.\n- Evite loops infinitos não intencionais.\n- `break` e `continue` ajudam a controlar melhor o fluxo.\n- O `else` em loops é pouco usado, mas é útil em verificações.\n\nNesta lição você aprendeu a criar loops com `for` e `while`, usar `break`, `continue` e ainda aproveitar o `else` para comportamentos adicionais. Com isso, você pode construir programas mais automatizados e poderosos.', 8),
(9, 1, 'Listas (Parte 1)', 'As **listas** são um dos tipos de dados mais usados em Python. Elas permitem armazenar vários valores em uma única variável.\n\n### 1. Criando listas\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nnumeros = [1, 2, 3, 4]\nmistos = [\"texto\", 10, True]\n```\nListas podem conter vários tipos diferentes de dados.\n\n### 2. Acessando elementos\nCada item tem um índice, começando do 0.\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nprint(frutas[0])  # maçã\nprint(frutas[2])  # uva\n```\n\n### 3. Índices negativos\nPermitem acessar itens do fim para o começo.\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nprint(frutas[-1])  # uva\nprint(frutas[-2])  # banana\n```\n\n### 4. Alterando itens da lista\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nfrutas[1] = \"laranja\"\nprint(frutas)  # [\"maçã\", \"laranja\", \"uva\"]\n```\n\n### 5. Tamanho da lista\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nprint(len(frutas))  # 3\n```\n\n### 6. Percorrendo listas com for\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nfor fruta in frutas:\n    print(fruta)\n```\n\nNesta primeira parte você aprendeu como criar, acessar, modificar e percorrer listas em Python. Na próxima lição vamos explorar operações mais avançadas como adicionar, remover, ordenar e fatiar listas.', 9),
(10, 1, 'Listas (Parte 2)', 'Na segunda parte sobre listas, vamos aprender como **adicionar, remover, ordenar e fatiar** listas em Python.\n\n### 1. Adicionando elementos\n#### append()\nAdiciona um item ao final da lista.\n```python\nfrutas = [\"maçã\", \"banana\"]\nfrutas.append(\"uva\")\nprint(frutas)\n```\n\n#### insert()\nAdiciona um item em uma posição específica.\n```python\nfrutas.insert(1, \"laranja\")\n```\n\n### 2. Removendo elementos\n#### remove()\nRemove a primeira ocorrência do valor.\n```python\nfrutas.remove(\"banana\")\n```\n\n#### pop()\nRemove pelo índice e retorna o valor removido.\n```python\ntirada = frutas.pop(0)\nprint(tirada)\n```\n\n#### clear()\nEsvazia a lista.\n```python\nfrutas.clear()\n```\n\n---\n\n### 3. Ordenando listas\n#### sort()\nOrdena a lista permanentemente.\n```python\nnumeros = [3, 1, 2]\nnumeros.sort()\nprint(numeros)\n```\n\n#### sorted()\nCria uma nova lista ordenada, sem modificar a original.\n```python\nnumeros = [3, 1, 2]\nordenada = sorted(numeros)\n```\n\n---\n\n### 4. Fatiamento (slicing)\nPermite pegar partes da lista.\n```python\nnumeros = [0, 1, 2, 3, 4, 5]\nprint(numeros[1:4])  # [1, 2, 3]\nprint(numeros[:3])   # [0, 1, 2]\nprint(numeros[3:])   # [3, 4, 5]\nprint(numeros[::2])  # [0, 2, 4]\n```\n\n---\n\n### 5. Verificando valores\n```python\nfrutas = [\"maçã\", \"banana\", \"uva\"]\nif \"banana\" in frutas:\n    print(\"Tem banana!\")\n```\n\n---\n\n### 6. Copiando listas\n#### copy()\n```python\nlista2 = frutas.copy()\n```\n\n#### list()\n```python\nlista2 = list(frutas)\n```\n\n---\n\n### 7. Por que listas são importantes?\n- São usadas em 90% dos programas iniciais.\n- Permitem armazenar coleções de dados.\n- Funcionam bem com loops e condições.\n- Têm muitos métodos úteis.\n\nNesta parte você aprendeu os métodos mais importantes das listas e como trabalhar com elas de forma eficiente. Agora você já está pronto para conhecer **Tuplas**, a próxima estrutura de dados do Python.', 10),
(11, 1, 'Tuplas', 'As **tuplas** são estruturas muito parecidas com listas, mas com uma diferença importante: **tuplas são imutáveis**. Isso significa que, depois de criadas, seus valores não podem ser alterados.\n\n### 1. Criando tuplas\n```python\ntupla1 = (1, 2, 3)\ntupla2 = (\"maçã\", \"banana\", \"uva\")\ntupla3 = (10, \"texto\", True)\n```\n\n### 2. Acessando elementos\nAssim como nas listas, usamos índices.\n```python\nfrutas = (\"maçã\", \"banana\", \"uva\")\nprint(frutas[0])   # maçã\nprint(frutas[-1])  # uva\n```\n\n### 3. Imutabilidade\nTuplas **não podem ser modificadas**:\n```python\nfrutas = (\"maçã\", \"banana\")\nfrutas[0] = \"laranja\"  # ERRO\n```\nIsso torna tuplas mais seguras quando você não quer que valores mudem.\n\n### 4. Desempacotamento\nPodemos separar os valores da tupla em variáveis:\n```python\npessoa = (\"Lucas\", 20)\nnome, idade = pessoa\nprint(nome)\nprint(idade)\n```\n\n### 5. Métodos básicos\nTuplas têm poucos métodos, pois não podem ser alteradas:\n```python\ntupla = (1, 2, 2, 3)\nprint(tupla.count(2))  # 2\nprint(tupla.index(3))  # 3\n```\n\n### 6. Quando usar tuplas?\n- Quando você quer garantir que os dados **não sejam alterados**.\n- Quando o conteúdo é fixo (ex.: coordenadas).\n- Para retornos múltiplos de funções.\n\nTuplas são simples, rápidas e úteis em casos específicos. Agora que você entende listas e tuplas, vamos seguir para os **Dicionários**, uma das estruturas mais importantes do Python.', 11),
(12, 1, 'Dicionários (Parte 1)', 'Os **dicionários** em Python são estruturas que armazenam dados no formato **chave → valor**. Eles são muito úteis quando você precisa acessar informações pelo nome da coisa, e não por uma posição.\n\n### 1. Criando dicionários\nExistem várias formas de criar um dicionário:\n```python\npessoa = {\"nome\": \"Lucas\", \"idade\": 20}\ncarro = dict(marca=\"Fiat\", ano=2010)\ndados = {}\ndados[\"cidade\"] = \"São Paulo\"\n```\n\n### 2. Acessando valores\nUsamos a **chave** para acessar um valor:\n```python\nprint(pessoa[\"nome\"])   # Lucas\nprint(pessoa[\"idade\"])  # 20\n```\n\n### 3. Adicionando ou alterando valores\n```python\npessoa[\"curso\"] = \"Python\"     # adicionando\npessoa[\"idade\"] = 21            # alterando\n```\n\n### 4. Removendo valores\n```python\ndel pessoa[\"curso\"]\n```\n\n### 5. Métodos importantes\nDicionários possuem métodos úteis:\n```python\npessoa.keys()     # retorna apenas as chaves\npessoa.values()   # retorna os valores\npessoa.items()    # retorna pares chave-valor\npessoa.get(\"altura\")   # evita erro se a chave não existir\n```\n\n### 6. Iterando sobre dicionários\n```python\nfor chave in pessoa:\n    print(chave)\n\nfor valor in pessoa.values():\n    print(valor)\n\nfor chave, valor in pessoa.items():\n    print(chave, valor)\n```\n\nDicionários são fundamentais para representar objetos, usuários, produtos e muito mais. Na próxima lição veremos recursos avançados, como dicionários aninhados, update(), pop() e boas práticas.', 12),
(13, 1, 'Dicionários (Parte 2)', 'Agora vamos aprofundar o uso de **dicionários**, aprendendo técnicas mais avançadas que facilitam o desenvolvimento de programas mais complexos.\n\n### 1. Verificando existência de uma chave\nUse o operador **in** para saber se uma chave existe:\n```python\npessoa = {\"nome\": \"Lucas\", \"idade\": 20}\n\nif \"nome\" in pessoa:\n    print(\"Chave encontrada!\")\n```\n\n### 2. Método get() com valor padrão\nEvita erro quando a chave não existe:\n```python\naltura = pessoa.get(\"altura\", \"Não informado\")\nprint(altura)\n```\n\n### 3. Removendo itens\n```python\npessoa.pop(\"idade\")        # remove e retorna o valor\npessoa.popitem()            # remove o último item\n```\n\n### 4. Atualizando dicionários\nO método **update()** permite adicionar vários valores de uma vez:\n```python\npessoa.update({\"cidade\": \"SP\", \"curso\": \"Python\"})\n```\n\n### 5. Dicionários aninhados (dicionários dentro de dicionários)\nMuito usados para representar dados mais complexos:\n```python\nusuario = {\n    \"nome\": \"Lucas\",\n    \"contatos\": {\n        \"email\": \"lucas@email.com\",\n        \"telefone\": \"1199999-0000\"\n    }\n}\n\nprint(usuario[\"contatos\"][\"email\"])  # acessando chave interna\n```\n\n### 6. Listas dentro de dicionários\n```python\nproduto = {\n    \"nome\": \"Notebook\",\n    \"precos\": [2500, 2700, 3000]\n}\n\nprint(produto[\"precos\"][1])\n```\n\n### 7. Dicionários dentro de listas\nMuito comum em sistemas, APIs, bancos de dados etc.:\n```python\nusuarios = [\n    {\"id\": 1, \"nome\": \"Lucas\"},\n    {\"id\": 2, \"nome\": \"Maria\"}\n]\n\nprint(usuarios[1][\"nome\"])  # Maria\n```\n\n### 8. Copiando dicionários corretamente\n```python\ncopia = pessoa.copy()   # cópia independente\n```\nSe você fizer:\n```python\ncopia = pessoa\n```\nAs duas variáveis apontarão para o **mesmo dicionário**.\n\n---\nCom isso, você domina o essencial e o intermediário sobre dicionários. Agora podemos seguir para **Funções**.', 13),
(14, 1, 'Funções (Parte 1)', 'As **funções** em Python servem para organizar o código em blocos reutilizáveis, facilitando a leitura, manutenção e reaproveitamento.\n\n### 1. O que é uma função?\nUma função é um bloco de código que executa uma tarefa específica. Você a define uma vez e pode reutilizá-la quantas vezes quiser.\n\n### 2. Criando uma função\nUsamos a palavra-chave `def`.\n```python\ndef saudacao():\n    print(\"Olá! Seja bem-vindo ao Python!\")\n```\n\n### 3. Chamando (executando) a função\n```python\nsaudacao()  # Chama a função\n```\n\n### 4. Funções com parâmetros\nParâmetros permitem que a função receba valores.\n```python\ndef apresentar(nome):\n    print(f\"Olá, {nome}! Tudo bem?\")\n\napresentar(\"Lucas\")\napresentar(\"Maria\")\n```\n\n### 5. Funções com múltiplos parâmetros\n```python\ndef somar(a, b):\n    resultado = a + b\n    print(\"Soma:\", resultado)\n\nsomar(3, 5)\n```\n\n### 6. Funções com retorno (return)\n`return` devolve um valor.\n```python\ndef multiplicar(a, b):\n    return a * b\n\nresultado = multiplicar(4, 6)\nprint(resultado)\n```\nSe uma função não tiver `return`, ela retorna `None`.\n\nFunções tornam seu código mais organizado e reutilizável. Na próxima parte, veremos funções mais avançadas.', 14),
(15, 1, 'Funções (Parte 2)', 'Agora vamos aprofundar o uso de funções em Python, entendendo argumentos opcionais, valores padrão e diferentes formas de retornar dados.\n\n### 1. Parâmetros com valor padrão\nVocê pode definir valores padrão para parâmetros.\n```python\ndef apresentar(nome=\"Visitante\"):\n    print(f\"Olá, {nome}!\")\n\napresentar()          # Usa o valor padrão\napresentar(\"Lucas\")   # Usa o valor informado\n```\n\n### 2. Retornando múltiplos valores\nFunções podem retornar mais de um valor usando tuplas.\n```python\ndef calcular(a, b):\n    soma = a + b\n    produto = a * b\n    return soma, produto\n\nresultado_soma, resultado_produto = calcular(3, 5)\nprint(resultado_soma)\nprint(resultado_produto)\n```\n\n### 3. Funções com argumentos nomeados\nVocê pode chamar funções especificando o nome do parâmetro.\n```python\ndef criarPerfil(nome, idade):\n    print(f\"Nome: {nome}, Idade: {idade}\")\n\ncriarPerfil(idade=20, nome=\"Lucas\")\n```\n\n### 4. *args (quantidade variável de argumentos)\n```python\ndef somarTudo(*numeros):\n    total = 0\n    for n in numeros:\n        total += n\n    return total\n\nprint(somarTudo(1, 2, 3, 4))\n```\n`*args` recebe vários argumentos e os coloca em uma tupla.\n\n### 5. **kwargs (argumentos nomeados variáveis)\n```python\ndef mostrarDados(**info):\n    for chave, valor in info.items():\n        print(f\"{chave}: {valor}\")\n\nmostrarDados(nome=\"Lucas\", idade=20, cidade=\"SP\")\n```\n`**kwargs` armazena os argumentos como um dicionário.\n\n### 6. Escopo de variáveis\nVariáveis dentro da função são **locais**.\n```python\ndef teste():\n    x = 10  # Variável local\n    print(x)\n\nteste()\n# print(x)  # ERRO: x não existe fora da função\n```\n\nAgora você domina funções simples e avançadas em Python! A partir daqui, você já consegue criar programas mais estruturados e funcionais.', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `progresso`
--

CREATE TABLE `progresso` (
  `id_progresso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_licao` int(11) NOT NULL,
  `completou` tinyint(1) NOT NULL DEFAULT 0,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `progresso`
--

INSERT INTO `progresso` (`id_progresso`, `id_usuario`, `id_curso`, `id_licao`, `completou`, `atualizado_em`) VALUES
(1, 1, 1, 1, 1, '2025-11-19 22:10:56'),
(2, 3, 1, 1, 1, '2025-11-20 00:48:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `numero_celular` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `sobrenome`, `email`, `numero_celular`, `senha`) VALUES
(1, 'Lucas', 'Teste', 'teste@teste.com', '11 123456789', '$2y$10$ZJrim54.jt2LRQvGjY27NO4PoLJexl1DH0iBFV39dfc0I8d22Ba66'),
(3, 'Maykon', 'Putini', 'maykonputini9@gmail.com', '11 111111111', '$2y$10$SJ4LtCghpj5t4bJ2kkBP3u703Fz7ul7KMtmFxdYxMmyV9h4CMMH3W');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices de tabela `licoes`
--
ALTER TABLE `licoes`
  ADD PRIMARY KEY (`id_licao`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Índices de tabela `progresso`
--
ALTER TABLE `progresso`
  ADD PRIMARY KEY (`id_progresso`),
  ADD UNIQUE KEY `unique_user_progress` (`id_usuario`,`id_curso`,`id_licao`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_licao` (`id_licao`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_celular` (`numero_celular`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `licoes`
--
ALTER TABLE `licoes`
  MODIFY `id_licao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `progresso`
--
ALTER TABLE `progresso`
  MODIFY `id_progresso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `licoes`
--
ALTER TABLE `licoes`
  ADD CONSTRAINT `licoes_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE;

--
-- Restrições para tabelas `progresso`
--
ALTER TABLE `progresso`
  ADD CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE,
  ADD CONSTRAINT `progresso_ibfk_3` FOREIGN KEY (`id_licao`) REFERENCES `licoes` (`id_licao`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
