-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 03-06-2021 a las 00:59:27
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `talento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areaempresa`
--

CREATE TABLE `areaempresa` (
  `ID_Area` int(11) NOT NULL,
  `Area_Especifica` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `areaempresa`
--

INSERT INTO `areaempresa` (`ID_Area`, `Area_Especifica`) VALUES
(1, 'Permanentes'),
(2, 'Servicios Profesionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletaspagos`
--

CREATE TABLE `boletaspagos` (
  `ID_boletasPago` int(11) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `Renta` float DEFAULT NULL,
  `AFP` float DEFAULT NULL,
  `ISSS` float DEFAULT NULL,
  `TotalBono` float DEFAULT NULL,
  `ID_Creador` int(11) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `boletaspagos`
--

INSERT INTO `boletaspagos` (`ID_boletasPago`, `Fecha`, `Renta`, `AFP`, `ISSS`, `TotalBono`, `ID_Creador`, `Fecha_Creacion`, `ID_Empleado`) VALUES
(1, '2021-05-31', 200, 145, 60, 75, 4, '2021-05-31 15:02:48', 4),
(2, '2021-05-31', 150, 0, 0, 50, 4, '2021-05-31 15:02:48', 5),
(5, '2021-05-31', 45, 0, 0, 150, 4, '2021-06-01 14:57:41', 6),
(6, '2021-05-31', 60, 43.5, 18, 50, 4, '2021-06-02 17:49:55', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonos`
--

CREATE TABLE `bonos` (
  `ID_Bono` int(11) NOT NULL,
  `Bono` varchar(100) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_Creador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bonos`
--

INSERT INTO `bonos` (`ID_Bono`, `Bono`, `Total`, `FechaCreacion`, `ID_Creador`) VALUES
(1, 'Bono Attendance', 50, '2021-06-01 15:00:03', 4),
(2, 'Bono navidad', 25, '2021-06-01 15:31:43', 4),
(3, 'Bono especiales por metas de venta', 25, '2021-06-02 17:49:30', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonosaplicados`
--

CREATE TABLE `bonosaplicados` (
  `ID_BonoAplicado` int(11) NOT NULL,
  `ID_Boleta` int(11) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Observaciones` varchar(80) DEFAULT NULL,
  `ID_Bono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bonosaplicados`
--

INSERT INTO `bonosaplicados` (`ID_BonoAplicado`, `ID_Boleta`, `Total`, `Observaciones`, `ID_Bono`) VALUES
(6, 1, 50, 'Llego bien todos los dias', 1),
(7, 1, 25, 'Navidad empleado', 2),
(8, 2, 50, 'Bono para todos los dias de asistencia', 1),
(9, 5, 50, 'navidad para el empleado', 2),
(10, 5, 100, 'Llego mas dias de los indicados', 1),
(11, 6, 50, 'se agrego $25 mas por meta sobresaliente', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID_Departamento` int(11) NOT NULL,
  `Departamento` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID_Departamento`, `Departamento`) VALUES
(1, 'Santa Ana'),
(2, 'San Miguel'),
(3, 'San Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Usuario` varchar(30) DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `Sueldo` float DEFAULT NULL,
  `ID_Area` int(11) DEFAULT NULL,
  `ID_Departamento` int(11) DEFAULT NULL,
  `ID_Tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `Nombres`, `Apellidos`, `Usuario`, `Password`, `Sueldo`, `ID_Area`, `ID_Departamento`, `ID_Tipo`) VALUES
(4, 'Bryan Danilo', 'Rauda Marquez', 'Brauda', 'e10adc3949ba59abbe56e057f20f883e', 2000, 1, 3, 1),
(5, 'Gustavo', 'Marquez', 'dmarquez', 'e10adc3949ba59abbe56e057f20f883e', 1500, 2, 2, 3),
(6, 'andres', 'guardado', 'ag123', 'e10adc3949ba59abbe56e057f20f883e', 450, 2, 2, 3),
(7, 'Mario', 'Hernandez', 'mhernandes', 'e10adc3949ba59abbe56e057f20f883e', 600, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `ID_Tipo` int(11) NOT NULL,
  `Tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`ID_Tipo`, `Tipo`) VALUES
(1, 'Administrador'),
(2, 'Recursos Humano'),
(3, 'Empleado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areaempresa`
--
ALTER TABLE `areaempresa`
  ADD PRIMARY KEY (`ID_Area`);

--
-- Indices de la tabla `boletaspagos`
--
ALTER TABLE `boletaspagos`
  ADD PRIMARY KEY (`ID_boletasPago`),
  ADD KEY `ID_Empleado` (`ID_Empleado`),
  ADD KEY `ID_Creador` (`ID_Creador`);

--
-- Indices de la tabla `bonos`
--
ALTER TABLE `bonos`
  ADD PRIMARY KEY (`ID_Bono`),
  ADD KEY `ID_Creador` (`ID_Creador`);

--
-- Indices de la tabla `bonosaplicados`
--
ALTER TABLE `bonosaplicados`
  ADD PRIMARY KEY (`ID_BonoAplicado`),
  ADD KEY `ID_Bono` (`ID_Bono`),
  ADD KEY `ID_Boleta` (`ID_Boleta`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_Departamento`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_Area` (`ID_Area`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Tipo` (`ID_Tipo`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID_Tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areaempresa`
--
ALTER TABLE `areaempresa`
  MODIFY `ID_Area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `boletaspagos`
--
ALTER TABLE `boletaspagos`
  MODIFY `ID_boletasPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `bonos`
--
ALTER TABLE `bonos`
  MODIFY `ID_Bono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bonosaplicados`
--
ALTER TABLE `bonosaplicados`
  MODIFY `ID_BonoAplicado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID_Departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID_Tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletaspagos`
--
ALTER TABLE `boletaspagos`
  ADD CONSTRAINT `boletaspagos_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`),
  ADD CONSTRAINT `boletaspagos_ibfk_2` FOREIGN KEY (`ID_Creador`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `bonos`
--
ALTER TABLE `bonos`
  ADD CONSTRAINT `bonos_ibfk_1` FOREIGN KEY (`ID_Creador`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `bonosaplicados`
--
ALTER TABLE `bonosaplicados`
  ADD CONSTRAINT `bonosaplicados_ibfk_1` FOREIGN KEY (`ID_Bono`) REFERENCES `bonos` (`ID_Bono`),
  ADD CONSTRAINT `bonosaplicados_ibfk_2` FOREIGN KEY (`ID_Boleta`) REFERENCES `boletaspagos` (`ID_boletasPago`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_Area`) REFERENCES `areaempresa` (`ID_Area`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamento` (`ID_Departamento`),
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`ID_Tipo`) REFERENCES `tipo` (`ID_Tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
