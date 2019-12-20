-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-12-2019 a las 11:54:06
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombEmpleado` varchar(50) NOT NULL,
  `dirección` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `puesto` varchar(15) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Empleado`
--

INSERT INTO `Empleado` (`idEmpleado`, `nombEmpleado`, `dirección`, `email`, `fechaNacimiento`, `sexo`, `puesto`, `foto`) VALUES
(5, 'José Domingo', 'c/Amilcar 45', 'jdomingo@gmail.com', '2000-12-03', 'Masculino', 'vendedor', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gafas`
--

CREATE TABLE `Gafas` (
  `idGafas` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(60) NOT NULL,
  `montura` varchar(50) NOT NULL,
  `graduación` varchar(50) NOT NULL,
  `colorMontura` varchar(60) NOT NULL,
  `colorCristales` varchar(60) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Gafas`
--

INSERT INTO `Gafas` (`idGafas`, `idProveedor`, `marca`, `modelo`, `montura`, `graduación`, `colorMontura`, `colorCristales`, `precio`) VALUES
(45, 785, 'PacoRabone', 'Aviador', 'Gruesa', '4', 'verde Caquí', 'Rosa', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombreEmp` varchar(45) NOT NULL,
  `dirección` varchar(80) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fax` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Proveedor`
--

INSERT INTO `Proveedor` (`idProveedor`, `nombreEmp`, `dirección`, `nif`, `telefono`, `fax`) VALUES
(785, 'GafasMartinez', 'C/poligono 38', '7753758D', '993875389', '993875390');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recomedación`
--

CREATE TABLE `Recomedación` (
  `idRecomedación` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomUser` varchar(60) NOT NULL,
  `direcciónUser` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `dataRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`idUsuario`, `nomUser`, `direcciónUser`, `email`, `telefono`, `dataRegistro`) VALUES
(1, 'Pepe', 'C/Sagrada Familia 18', 'pepe8@gmail.com', '678989098', '2019-12-01'),
(2, 'Paco', 'C/napoles 19', 'paco3@gmail.com', '971385679', '2019-12-04'),
(8, 'Paco', 'C/napoles 19', 'paco3@gmail.com', '971385679', '2019-12-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta`
--

CREATE TABLE `Venta` (
  `idVenta` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGafas` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `horaVenta` time NOT NULL,
  `totalGafas` varchar(10) NOT NULL,
  `subTotal` float NOT NULL,
  `Iva` float NOT NULL,
  `totalConIva` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Venta`
--

INSERT INTO `Venta` (`idVenta`, `idEmpleado`, `idUsuario`, `idGafas`, `fechaVenta`, `horaVenta`, `totalGafas`, `subTotal`, `Iva`, `totalConIva`) VALUES
(200, 5, 1, 45, '2019-12-20', '10:16:10', '1', 395, 21, 500);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD PRIMARY KEY (`idGafas`),
  ADD KEY `idProveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `Recomedación`
--
ALTER TABLE `Recomedación`
  ADD PRIMARY KEY (`idRecomedación`),
  ADD KEY `fk_Recomedación_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `Venta`
--
ALTER TABLE `Venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idEmpleado_idx` (`idEmpleado`),
  ADD KEY `idUsuario_idx` (`idUsuario`),
  ADD KEY `idGafas_idx` (`idGafas`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Recomedación`
--
ALTER TABLE `Recomedación`
  ADD CONSTRAINT `fk_Recomedación_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Venta`
--
ALTER TABLE `Venta`
  ADD CONSTRAINT `idEmpleado` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idGafas` FOREIGN KEY (`idGafas`) REFERENCES `Gafas` (`idGafas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
