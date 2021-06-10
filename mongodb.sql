-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jun-2021 às 19:12
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mongodb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `drone`
--

CREATE TABLE `drone` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `tipe` enum('DUAL',' ZOOM','MATRICE') DEFAULT NULL,
  `acquisitionDate` date DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `drone`
--

INSERT INTO `drone` (`id`, `name`, `code`, `tipe`, `acquisitionDate`, `enabled`) VALUES
(1, 'spende', '-PP', 'DUAL', '2021-05-01', 1),
(3, 'NULL', 'NULL', '', '0000-00-00', 0),
(4, 'romeu', '-pp', 'DUAL', '0000-00-00', 0),
(5, 'romeu', '-pp', 'DUAL', '0000-00-00', 0),
(6, 'romeu', '-pp', 'DUAL', '0000-00-00', 0),
(7, 'romeu', '-pp', 'DUAL', '0000-00-00', 0),
(8, 'romeu', '-pp', 'DUAL', '0000-00-00', 0),
(9, 'julieta', '-pp', 'DUAL', '2021-06-01', 0),
(10, 'julieta garcia', '-pp', '', '2021-06-01', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `planta`
--

CREATE TABLE `planta` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `drone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `planta`
--

INSERT INTO `planta` (`id`, `name`, `enabled`, `drone_id`) VALUES
(1, 'helio', 0, 1),
(2, 'romeo', 0, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `drone`
--
ALTER TABLE `drone`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drone_id` (`drone_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `drone`
--
ALTER TABLE `drone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `planta`
--
ALTER TABLE `planta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `planta`
--
ALTER TABLE `planta`
  ADD CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`drone_id`) REFERENCES `drone` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
