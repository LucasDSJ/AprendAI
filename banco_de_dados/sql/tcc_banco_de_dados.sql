-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2025 às 21:19
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
-- TABELA: cursos
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `imagem_capa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cursos` (`id_curso`, `titulo`, `descricao`, `carga_horaria`, `imagem_capa`) VALUES
(1, 'Introdução à Python', 'Aprenda os conceitos básicos da linguagem Python, incluindo variáveis, estruturas de decisão, laços de repetição, funções e manipulação de dados.', 12, 'img/python/curso_python_logo.png')
ON DUPLICATE KEY UPDATE id_curso=id_curso;

-- --------------------------------------------------------
-- TABELA: usuarios
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `numero_celular` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `numero_celular` (`numero_celular`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id_usuario`, `nome`, `sobrenome`, `email`, `numero_celular`, `senha`) VALUES
(1, 'Lucas', 'Teste', 'teste@teste.com', '11 123456789', '$2y$10$ZJrim54.jt2LRQvGjY27NO4PoLJexl1DH0iBFV39dfc0I8d22Ba66')
ON DUPLICATE KEY UPDATE id_usuario=id_usuario;

-- --------------------------------------------------------
-- TABELA: licoes
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `licoes` (
    `id_licao` int(11) NOT NULL AUTO_INCREMENT,
    `id_curso` int(11) NOT NULL,
    `titulo` varchar(200) NOT NULL,
    `conteudo` text NOT NULL,
    `ordem` int(11) NOT NULL,
    PRIMARY KEY (`id_licao`),
    KEY `id_curso` (`id_curso`),
    CONSTRAINT `licoes_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABELA: progresso
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `progresso` (
    `id_progresso` int(11) NOT NULL AUTO_INCREMENT,
    `id_usuario` int(11) NOT NULL,
    `id_curso` int(11) NOT NULL,
    `id_licao` int(11) NOT NULL,
    `completou` tinyint(1) NOT NULL DEFAULT 0,
    `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`id_progresso`),
    UNIQUE KEY `unique_user_progress` (`id_usuario`,`id_curso`,`id_licao`),
    KEY `id_usuario` (`id_usuario`),
    KEY `id_curso` (`id_curso`),
    KEY `id_licao` (`id_licao`),
    CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
    CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE,
    CONSTRAINT `progresso_ibfk_3` FOREIGN KEY (`id_licao`) REFERENCES `licoes` (`id_licao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
