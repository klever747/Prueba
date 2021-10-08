-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2021 a las 19:11:52
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `orders`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarOrden` (IN `descipcion` TEXT, IN `cantidad` INT)  BEGIN
	DECLARE idOrden int;
    
	INSERT INTO orden(estado)
    VALUES('Activo');
    SET idOrden= LAST_INSERT_ID();
    INSERT INTO orden_det(orden_id, producto_descripcion, estado, cantidad)
    VALUES(idOrden,descipcion,'Activo',cantidad);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `estado`) VALUES
(13, 'Inactivo'),
(14, 'Inactivo'),
(16, 'Inactivo'),
(17, 'Inactivo'),
(19, 'Inactivo'),
(20, 'Inactivo'),
(23, 'Inactivo'),
(25, 'Inactivo'),
(29, 'Inactivo'),
(30, 'Inactivo'),
(31, 'Inactivo'),
(36, 'Activo'),
(37, 'Activo'),
(38, 'Activo'),
(39, 'Activo'),
(40, 'Activo'),
(41, 'Activo'),
(42, 'Inactivo'),
(43, 'Activo'),
(44, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_det`
--

CREATE TABLE `orden_det` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_descripcion` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_det`
--

INSERT INTO `orden_det` (`id`, `orden_id`, `producto_descripcion`, `cantidad`, `estado`) VALUES
(4, 13, 'asd', 123, 'Activo'),
(5, 14, 'dasd', 121, 'Activo'),
(8, 17, 'klever', 32, 'Activo'),
(10, 19, 'qweq', 11, 'Activo'),
(11, 20, 'reglas', 555, 'Activo'),
(14, 23, 'asdas', 12312, 'Activo'),
(16, 25, 'Klever Pardo', 52, 'Activo'),
(20, 29, 'valeria', 88, 'Activo'),
(21, 30, 'dasdasd', 3333, 'Activo'),
(22, 31, 'sdddd', 22, 'Activo'),
(27, 36, '', 22, 'Activo'),
(28, 37, 'dsss', 22, 'Activo'),
(29, 38, 'hghg', 333, 'Activo'),
(30, 39, 'sd', 22, 'Activo'),
(31, 40, 'yyy2dsds', 234, 'Activo'),
(32, 41, '', 333, 'Activo'),
(33, 42, 'flores', 22, 'Activo'),
(34, 43, 'flores 2 2', 23, 'Activo'),
(35, 44, 'dasd', 22, 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_det`
--
ALTER TABLE `orden_det`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orden_det` (`orden_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `orden_det`
--
ALTER TABLE `orden_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden_det`
--
ALTER TABLE `orden_det`
  ADD CONSTRAINT `fk_orden_det` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
