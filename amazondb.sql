-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-09-2019 a las 10:22:00
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amazondb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `AuthorID` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Direction` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `Published` int(4) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `BookID` int(10) NOT NULL AUTO_INCREMENT,
  `Stock` int(4) NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `AuthorID` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoces`
--

DROP TABLE IF EXISTS `invoces`;
CREATE TABLE IF NOT EXISTS `invoces` (
  `InvoceID` int(6) NOT NULL AUTO_INCREMENT,
  `ItemListID` int(100) NOT NULL,
  `UserNick` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`InvoceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemlists`
--

DROP TABLE IF EXISTS `itemlists`;
CREATE TABLE IF NOT EXISTS `itemlists` (
  `ItemListID` int(100) NOT NULL,
  `BookID` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Quantity` int(5) NOT NULL,
  PRIMARY KEY (`ItemListID`,`BookID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserNick` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`UserNick`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
