-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-03-2026 a las 05:16:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

CREATE DATABASE IF NOT EXISTS sig
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE sig;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sig`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

CREATE TABLE IF NOT EXISTS `aplicaciones` (
  `Aplcodigo` int(11) NOT NULL,
  `Aplnombre` varchar(100) NOT NULL,
  `Aplestado` varchar(100) NOT NULL,
  PRIMARY KEY (`Aplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionaplicacionperfil`
--

CREATE TABLE IF NOT EXISTS `asignacionaplicacionperfil` (
  `Aplcodigo` int(11) NOT NULL,
  `Percodigo` int(11) NOT NULL,
  `APLPins` varchar(1) NOT NULL,
  `APLPsel` varchar(1) NOT NULL,
  `APLPupd` varchar(1) NOT NULL,
  `APLPdel` varchar(1) NOT NULL,
  `APLPrep` varchar(1) NOT NULL,
  PRIMARY KEY (`Aplcodigo`,`Percodigo`),
  KEY `Percodigo` (`Percodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionaplicacionusuarios`
--

CREATE TABLE IF NOT EXISTS `asignacionaplicacionusuarios` (
  `Aplcodigo` int(11) NOT NULL,
  `Usucodigo` int(11) NOT NULL,
  `APLUins` varchar(1) NOT NULL,
  `APLUsel` varchar(1) NOT NULL,
  `APLUupd` varchar(1) NOT NULL,
  `APLUdel` varchar(1) NOT NULL,
  `APLUrep` varchar(1) NOT NULL,
  PRIMARY KEY (`Aplcodigo`,`Usucodigo`),
  KEY `Usucodigo` (`Usucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionperfilusuario`
--

CREATE TABLE IF NOT EXISTS `asignacionperfilusuario` (
  `Usucodigo` int(11) NOT NULL,
  `Percodigo` int(11) NOT NULL,
  PRIMARY KEY (`Usucodigo`,`Percodigo`),
  KEY `Percodigo` (`Percodigo`),
  KEY `Usucodigo` (`Usucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `Bitcodigo` int(11) NOT NULL,
  `Usucodigo` int(11) DEFAULT NULL,
  `Aplcodigo` int(11) DEFAULT NULL,
  `Bitfecha` datetime DEFAULT NULL,
  `Bitip` varchar(50) DEFAULT NULL,
  `Bitequipo` varchar(100) DEFAULT NULL,
  `Bitaccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Bitcodigo`),
  KEY `Usucodigo` (`Usucodigo`),
  KEY `Aplcodigo` (`Aplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE IF NOT EXISTS `perfiles` (
  `Percodigo` int(11) NOT NULL,
  `Pernombre` varchar(100) NOT NULL,
  `Perestado` char(1) NOT NULL,
  PRIMARY KEY (`Percodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `Usucodigo` int(11) NOT NULL,
  `Usunombre` varchar(100) NOT NULL,
  `Usucontraseña` varchar(200) NOT NULL,
  `Usuestado` varchar(100) NOT NULL,
  PRIMARY KEY (`Usucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Ajustes de AUTO_INCREMENT
--

ALTER TABLE `aplicaciones`
MODIFY `Aplcodigo` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bitacora`
MODIFY `Bitcodigo` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `perfiles`
MODIFY `Percodigo` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usuario`
MODIFY `Usucodigo` INT(11) NOT NULL AUTO_INCREMENT;

--
-- Filtros para la tabla `asignacionaplicacionperfil`
--
ALTER TABLE `asignacionaplicacionperfil`
DROP FOREIGN KEY IF EXISTS `asignacionaplicacionperfil_ibfk_1`,
DROP FOREIGN KEY IF EXISTS `asignacionaplicacionperfil_ibfk_2`;

ALTER TABLE `asignacionaplicacionperfil`
  ADD CONSTRAINT `asignacionaplicacionperfil_ibfk_1` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`),
  ADD CONSTRAINT `asignacionaplicacionperfil_ibfk_2` FOREIGN KEY (`Percodigo`) REFERENCES `perfiles` (`Percodigo`);

--
-- Filtros para la tabla `asignacionaplicacionusuarios`
--
ALTER TABLE `asignacionaplicacionusuarios`
DROP FOREIGN KEY IF EXISTS `asignacionaplicacionusuarios_ibfk_1`,
DROP FOREIGN KEY IF EXISTS `asignacionaplicacionusuarios_ibfk_2`;

ALTER TABLE `asignacionaplicacionusuarios`
  ADD CONSTRAINT `asignacionaplicacionusuarios_ibfk_1` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`),
  ADD CONSTRAINT `asignacionaplicacionusuarios_ibfk_2` FOREIGN KEY (`Usucodigo`) REFERENCES `usuario` (`Usucodigo`);

--
-- Filtros para la tabla `asignacionperfilusuario`
--
ALTER TABLE `asignacionperfilusuario`
DROP FOREIGN KEY IF EXISTS `asignacionperfilusuario_ibfk_1`,
DROP FOREIGN KEY IF EXISTS `asignacionperfilusuario_ibfk_2`;

ALTER TABLE `asignacionperfilusuario`
  ADD CONSTRAINT `asignacionperfilusuario_ibfk_1` FOREIGN KEY (`Usucodigo`) REFERENCES `usuario` (`Usucodigo`),
  ADD CONSTRAINT `asignacionperfilusuario_ibfk_2` FOREIGN KEY (`Percodigo`) REFERENCES `perfiles` (`Percodigo`);

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
DROP FOREIGN KEY IF EXISTS `bitacora_ibfk_1`,
DROP FOREIGN KEY IF EXISTS `bitacora_ibfk_2`;

ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Usucodigo`) REFERENCES `usuario` (`Usucodigo`),
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`);

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
