-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2021 a las 03:07:25
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `retiro10%`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `RUT` int(11) NOT NULL,
  `primer_nombre` varchar(25) NOT NULL,
  `segundo_nombre` varchar(25) NOT NULL,
  `primer_apellido` varchar(25) NOT NULL,
  `segundo_apellido` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`RUT`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `email`) VALUES
(8596487, 'Emanuel', 'Roberto', 'Jara', 'Otarola', 'EmaOta@gmail.com'),
(17474404, 'Diego', 'Emilio', 'Gonzalez', 'Sepulveda', 'diegoadmin@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `RUT` int(11) NOT NULL,
  `n_documento` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `primer_nombre` varchar(25) NOT NULL,
  `segundo_nombre` varchar(25) NOT NULL,
  `primer_apellido` varchar(25) NOT NULL,
  `segundo_apellido` varchar(25) NOT NULL,
  `nombre_afp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `afiliado`
--

INSERT INTO `afiliado` (`RUT`, `n_documento`, `email`, `pass`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `nombre_afp`) VALUES
(13240653, '245264487', 'f_andrea21@gmail.com', 'PwBjq79IoxVMEoNQ', 'Francisca', 'Andrea', 'Rojas', 'Rodriguez', 'ProVida'),
(14485513, '8798855445', 'isaaaac_10@gmail.com', '0jQSrtEqSzwQouqq', 'Manuel', 'Isaac', 'Galaz', 'Guajardo', 'PlanVital'),
(14643855, '5898745232', 'marisolalejandra_2_10@gmail.com', 's2dkmiCb0KeVvRyr', 'Marisol', 'Alejandra', 'Perez', 'Rojas', 'Uno'),
(20248596, '478596874', 'carlosr@gmail.com', 'carlos_r_M', 'Carlos', 'Roberto', 'Rojas', 'Melis', 'Cuprum'),
(20479539, '123123123', 'diego123@gmail.com', 'diego123', 'Diego', 'Andres', 'Espinoza', 'Apablaza', 'Capital'),
(21776309, '1111111111', 'andrestrujillo_j@gmail.com', 'pMf@CW@AxdP$', 'Andres', 'Alejandro', 'Trujillo', 'Jara', 'Modelo'),
(26065155, '87524214', 'fernando10_60', 'fjss60_87', 'Fernando', 'Juan', 'Salvado', 'Salgueiro', 'Habitat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afp`
--

CREATE TABLE `afp` (
  `nombre` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `dir_web` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `afp`
--

INSERT INTO `afp` (`nombre`, `email`, `direccion`, `dir_web`, `telefono`) VALUES
('Capital', 'afpcapital@gmail.cl', 'Errázuriz 793, local 108, Valparaíso', 'home.afpcapital.cl', '6006600900'),
('Cuprum', 'afpcuprum@gmaill.cl', 'Agustinas 1161, Santiago', 'www.cuprum.cl', '600 228 7786'),
('Habitat', 'afphabitat@gmail.cl', 'Esmeralda 945, Valparaíso', 'www.retiro10afphabitat.cl', '600 220 2000'),
('Modelo', 'afpmodelo@gmail.cl', ' Nueva Libertad 1410, Viña del Mar, Local 4', 'www.afpmodelo.cl/AFP/retiro/default.aspx', '600 828 7200'),
('PlanVital', 'afpplanvital@gmail.cl', 'Prat 719, Valparaíso', 'www.planvital.cl/afiliado/inicio', '800 072 072'),
('ProVida', 'afpprovida@gmail.cl', 'Valparaíso 175', 'www.provida.cl', '600 201 0150'),
('Uno', 'afpuno@gmail.cl', 'Huérfanos 713, piso 8, Santiago', 'www.uno.cl', '600 600 1101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `saldo`, `rut_afiliado`) VALUES
(1, 10000000, 26065155),
(2, 50000000, 20479539),
(3, 55000000, 13240653),
(4, 2000000, 20248596),
(5, 3700000, 21776309),
(6, 87000000, 14643855),
(7, 90000000, 14485513);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evalua`
--

CREATE TABLE `evalua` (
  `rut_admin` int(11) NOT NULL,
  `id_retiro_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evalua`
--

INSERT INTO `evalua` (`rut_admin`, `id_retiro_fk`) VALUES
(17474404, 1),
(17474404, 2),
(17474404, 3),
(17474404, 4),
(17474404, 5),
(17474404, 6),
(17474404, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_retiro`
--

CREATE TABLE `solicitud_retiro` (
  `id_retiro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `porcentaje` int(11) NOT NULL DEFAULT 0,
  `monto` int(11) NOT NULL DEFAULT 0,
  `estado` varchar(20) NOT NULL,
  `tipo_cuenta_retiro` varchar(20) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitud_retiro`
--

INSERT INTO `solicitud_retiro` (`id_retiro`, `fecha`, `porcentaje`, `monto`, `estado`, `tipo_cuenta_retiro`, `rut_afiliado`) VALUES
(1, '2021-11-12', 5, 500000, 'pendiente', 'Bancaria', 26065155),
(2, '2021-05-12', 10, 8000000, 'aceptada', 'Ahorro', 20479539),
(3, '2021-11-17', 7, 750000, 'pendiente', 'Ahorro', 13240653),
(4, '2021-11-24', 10, 1200000, 'pendiente', 'Bancaria', 20248596),
(5, '2021-11-03', 10, 3700000, 'pendiente', 'Ahorro', 21776309),
(6, '2021-08-04', 6, 500000, 'pendiente', 'Bancaria', 14643855),
(7, '2021-10-06', 10, 5000000, 'pendiente', 'Bancaria', 14485513);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `telefono_afiliado` varchar(25) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`telefono_afiliado`, `rut_afiliado`) VALUES
('78004598', 13240653),
('84963578', 14485513),
('45876985', 14643855),
('70458930', 20248596),
('95687452', 20479539),
('25047869', 21776309),
('85478965', 26065155);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`RUT`);

--
-- Indices de la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD PRIMARY KEY (`RUT`),
  ADD KEY `nombre_afp` (`nombre_afp`);

--
-- Indices de la tabla `afp`
--
ALTER TABLE `afp`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Indices de la tabla `evalua`
--
ALTER TABLE `evalua`
  ADD PRIMARY KEY (`rut_admin`,`id_retiro_fk`),
  ADD KEY `rut_admin` (`rut_admin`,`id_retiro_fk`),
  ADD KEY `id_retiro_fk` (`id_retiro_fk`);

--
-- Indices de la tabla `solicitud_retiro`
--
ALTER TABLE `solicitud_retiro`
  ADD PRIMARY KEY (`id_retiro`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`telefono_afiliado`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `solicitud_retiro`
--
ALTER TABLE `solicitud_retiro`
  MODIFY `id_retiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD CONSTRAINT `afiliado_ibfk_1` FOREIGN KEY (`nombre_afp`) REFERENCES `afp` (`nombre`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`RUT`);

--
-- Filtros para la tabla `evalua`
--
ALTER TABLE `evalua`
  ADD CONSTRAINT `evalua_ibfk_1` FOREIGN KEY (`rut_admin`) REFERENCES `administrador` (`RUT`),
  ADD CONSTRAINT `evalua_ibfk_2` FOREIGN KEY (`id_retiro_fk`) REFERENCES `solicitud_retiro` (`id_retiro`);

--
-- Filtros para la tabla `solicitud_retiro`
--
ALTER TABLE `solicitud_retiro`
  ADD CONSTRAINT `solicitud_retiro_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`RUT`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`RUT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
