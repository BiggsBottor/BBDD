-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-09-2019 a las 08:57:13
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
-- Base de datos: `culdampolladb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `BrandID` int(4) NOT NULL AUTO_INCREMENT,
  `SupplierID` int(4) NOT NULL,
  `Name` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`BrandID`, `SupplierID`, `Name`) VALUES
(1, 1, 'Afflelou'),
(2, 1, 'Ray-Ban'),
(3, 2, 'Oakley'),
(4, 3, 'Esprit'),
(5, 3, 'Guess'),
(6, 3, 'Comma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int(4) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `PostalAddress` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `PhoneNum` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `RegisterDate` date NOT NULL COMMENT 'YYYY-MM-DD',
  `RecomededBy` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `PostalAddress`, `PhoneNum`, `email`, `RegisterDate`, `RecomededBy`) VALUES
(1, 'Enrique Molina Garrido', 'falsa, 123', '652-55-6108', 'enrique.molina@gmail.com', '2019-09-05', 'su tia Anselma'),
(2, 'Pau Vargas Medina', 'falsa, 12', '955-21-1821', 'pauvargas@gmail.com', '2019-09-04', 'nadie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

DROP TABLE IF EXISTS `glasses`;
CREATE TABLE IF NOT EXISTS `glasses` (
  `GlassesID` int(4) NOT NULL AUTO_INCREMENT,
  `BrandID` int(4) NOT NULL,
  `LeftPowerLense` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `RightPowerLense` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Frame` int(1) NOT NULL COMMENT '0=flotant, 1=pasta, 2=metal·lica',
  `FrameColor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `LeftLenseColor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `RightLenseColor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`GlassesID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`GlassesID`, `BrandID`, `LeftPowerLense`, `RightPowerLense`, `Frame`, `FrameColor`, `LeftLenseColor`, `RightLenseColor`, `Price`) VALUES
(1, 1, '-.75,1,35', '-.75,1,35', 0, 'Negro', 'sin', 'sin', '210.50'),
(2, 2, '-.75,-1,10', '-.75,1,35', 1, 'Negro', 'marrón', 'marrón', '310.90'),
(3, 2, '-.95,-.50,100', '.75,-.50,80', 2, 'plateado', 'azul', 'azul', '510.90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incomes`
--

DROP TABLE IF EXISTS `incomes`;
CREATE TABLE IF NOT EXISTS `incomes` (
  `ItemListID` int(3) NOT NULL AUTO_INCREMENT,
  `IncomeID` int(5) NOT NULL,
  `GlassesID` int(4) NOT NULL,
  `Quantity` int(4) NOT NULL,
  PRIMARY KEY (`ItemListID`,`IncomeID`,`GlassesID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `incomes`
--

INSERT INTO `incomes` (`ItemListID`, `IncomeID`, `GlassesID`, `Quantity`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sells`
--

DROP TABLE IF EXISTS `sells`;
CREATE TABLE IF NOT EXISTS `sells` (
  `IncomeID` int(5) NOT NULL AUTO_INCREMENT,
  `ItemListID` int(3) NOT NULL,
  `SellerID` int(3) NOT NULL,
  `CustomerID` int(4) NOT NULL,
  PRIMARY KEY (`IncomeID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sells`
--

INSERT INTO `sells` (`IncomeID`, `ItemListID`, `SellerID`, `CustomerID`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `SupplierID` int(4) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Street` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `StNum` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `Floor` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `Door` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `City` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `PostalCode` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Country` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `PhoneNum` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `FaxNum` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `NIF` varchar(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'CIF',
  PRIMARY KEY (`SupplierID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `Name`, `Street`, `StNum`, `Floor`, `Door`, `City`, `PostalCode`, `Country`, `PhoneNum`, `FaxNum`, `NIF`) VALUES
(1, 'TodoGafas', 'falsa', '120', '0', '1', 'Barcelona', '08099', 'España', '586-94-2454', '586-94-2453', 'F0888538F'),
(2, 'Moturas Malageñas S.A.', 'no falsa', '69', '3', '5', 'Malaga', '29099', 'España', '333-41-9529', '333-41-9528', 'R2233817B'),
(3, 'Estilistas Gafales Factorizados S.L.', 'falsa', '8', '15', '6', 'Barcelona', '08099', 'España', '276-87-0016', '276-87-0016', 'E69826923');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
