-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-09-2019 a las 11:03:40
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
-- Base de datos: `xarxasocialdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `FriendListID` int(6) NOT NULL AUTO_INCREMENT,
  `UserNick1` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `UserNick2` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `InitialFriendshipDescription` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`FriendListID`,`UserNick1`,`UserNick2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pictures`
--

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE IF NOT EXISTS `pictures` (
  `PictureID` int(6) NOT NULL,
  `PictureListID` int(6) NOT NULL AUTO_INCREMENT,
  `Place` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `URL` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`PictureListID`,`PictureID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserNick` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Name` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `FriendListID` int(6) NOT NULL,
  `PictureListID` int(6) NOT NULL,
  PRIMARY KEY (`UserNick`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
