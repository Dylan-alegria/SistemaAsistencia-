-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2022 a las 02:47:42
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_asistencia`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Asistencia` (IN `cedula` INT(11))  SELECT DISTINCT a.cedulaEstudiante as 'cedula', e.nombre  as 'Estudiante', e.apellidos as 'Apellido Estudiante', c.nombre as 'curso', p.nombre as 'Profesor',p.apellido as 'Apellido Profesor', a.estado from tbl_profesor p, tbl_asistencia a, tbl_estudiante e, tbl_curso c
where e.cedulaEstudiante=a.cedulaEstudiante and c.id_Curso=a.id_Curso and p.Id_curso=c.id_Curso and a.cedulaEstudiante=cedula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AsistenciaC` (IN `nombre` VARCHAR(50))  SELECT DISTINCT e.nombre  as 'Estudiante', e.apellidos as 'Apellido', c.nombre as 'Curso', a.estado from tbl_profesor p, tbl_asistencia a, tbl_estudiante e, tbl_curso c
where e.cedulaEstudiante=a.cedulaEstudiante and c.id_Curso=a.id_Curso and p.Id_curso=c.id_Curso AND
c.nombre=nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AsistenciaG` ()  SELECT DISTINCT e.nombre  as 'Estudiante', e.apellidos as 'Apellido', c.nombre as 'Curso', a.estado from tbl_profesor p, tbl_asistencia a, tbl_estudiante e, tbl_curso c
where e.cedulaEstudiante=a.cedulaEstudiante and c.id_Curso=a.id_Curso and p.Id_curso=c.id_Curso$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AsistenciaT` ()  SELECT DISTINCT e.cedulaEstudiante as 'cedula', e.nombre  as 'Estudiante', e.apellidos as 'Apellido Estudiante', c.nombre as 'curso', p.nombre as 'Profesor',p.apellido as 'Apellido Profesor', a.estado from tbl_profesor p, tbl_asistencia a, tbl_estudiante e, tbl_curso c
where e.cedulaEstudiante=a.cedulaEstudiante and c.id_Curso=a.id_Curso and p.Id_curso=c.id_Curso$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Usuarios` ()  Select distinct r.cedula_persona, r.nombre, r.cod_Cargo, c.nombre as 'cargo' from tbl_registro r, tbl_cargo c
where c.cod_Cargo=r.cod_Cargo$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asistencia`
--

CREATE TABLE `tbl_asistencia` (
  `id_Asistencia` int(4) NOT NULL,
  `cedulaEstudiante` int(10) NOT NULL,
  `nombreEstudiante` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `id_Curso` int(5) NOT NULL,
  `fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_asistencia`
--

INSERT INTO `tbl_asistencia` (`id_Asistencia`, `cedulaEstudiante`, `nombreEstudiante`, `estado`, `id_Curso`, `fecha`) VALUES
(1, 115141415, 'Camila', 'P', 1, '2021-08-18 15:08:15'),
(3, 555, 'Fabiola', 'T', 1, '2021-08-21 16:07:26'),
(4, 222, 'Marco', 'T', 2, '2021-08-21 20:11:49'),
(11, 123, 'Francisca', 'P', 2, '25/08/2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cargo`
--

CREATE TABLE `tbl_cargo` (
  `cod_Cargo` int(5) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_cargo`
--

INSERT INTO `tbl_cargo` (`cod_Cargo`, `nombre`) VALUES
(1, 'Profesor'),
(2, 'Secretaria'),
(3, 'Administrador'),
(4, 'Director');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_curso`
--

CREATE TABLE `tbl_curso` (
  `id_Curso` int(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `horario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_curso`
--

INSERT INTO `tbl_curso` (`id_Curso`, `nombre`, `horario`) VALUES
(1, 'Español', 'Diurno'),
(2, 'Matematica', 'Diurno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudiante`
--

CREATE TABLE `tbl_estudiante` (
  `cedulaEstudiante` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `cod_Instituto` int(8) NOT NULL,
  `id_curso` int(5) NOT NULL,
  `materia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`cedulaEstudiante`, `nombre`, `apellidos`, `direccion`, `telefono`, `cod_Instituto`, `id_curso`, `materia`) VALUES
(1, 'Francisco', 'navarro', 'San Pedro', '888888', 1, 1, 'Matemática '),
(123, 'Francisca', 'navarro', 'asfjaireifhaoe', '888888', 1, 2, 'Matemática '),
(222, 'Marco', 'Solis', 'Heredia', '88888888', 1, 2, 'matematica'),
(555, 'Fabiola', 'Herrera', 'Alajuela', '25251414', 1, 1, 'Español'),
(115141415, 'Camila', 'Mendoza', 'Hatillo', '74585850', 1, 1, 'Español'),
(123455789, 'Francisca', 'navarro', 'asfjaireifhaoe', '1010-2020', 1, 1, 'Español'),
(302540652, 'Lucas', 'navarro', 'San Pedro', '88888888', 1, 2, 'Matemática ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_informe`
--

CREATE TABLE `tbl_informe` (
  `id_Informe` int(5) NOT NULL,
  `cedulaEstudiante` int(10) NOT NULL,
  `cedula_profesor` int(10) NOT NULL,
  `id_Curso` int(5) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_instituto`
--

CREATE TABLE `tbl_instituto` (
  `cod_Instituto` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_instituto`
--

INSERT INTO `tbl_instituto` (`cod_Instituto`, `nombre`, `ciudad`) VALUES
(1, 'Liceo Roberto Brenes Mesen', 'San Jose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_jornada`
--

CREATE TABLE `tbl_jornada` (
  `id_jornada` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personal`
--

CREATE TABLE `tbl_personal` (
  `id` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cod_Instituto` int(8) NOT NULL,
  `cedula_persona` int(10) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `cod_Cargo` int(5) NOT NULL,
  `id_jornada` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profesor`
--

CREATE TABLE `tbl_profesor` (
  `cedula_profesor` int(10) NOT NULL,
  `Id_curso` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `materia` varchar(50) NOT NULL,
  `cod_Instituto` int(5) NOT NULL,
  `horario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_profesor`
--

INSERT INTO `tbl_profesor` (`cedula_profesor`, `Id_curso`, `nombre`, `apellido`, `materia`, `cod_Instituto`, `horario`) VALUES
(1, 2, 'Francisco', 'Navarro', 'Español', 1, 'Nocturno'),
(111111111, 1, 'Miranda ', 'Navarro', 'Matemática ', 1, 'Diurno'),
(117730178, 1, 'Patricia', 'Gamboa', 'Español', 1, 'Diurno'),
(205240632, 2, 'Sofia', 'Navarro', 'Matemática ', 1, 'Nocturno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_registro`
--

CREATE TABLE `tbl_registro` (
  `idlogin` int(5) NOT NULL,
  `telefono` int(10) NOT NULL,
  `cedula_persona` varchar(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `cod_Cargo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_registro`
--

INSERT INTO `tbl_registro` (`idlogin`, `telefono`, `cedula_persona`, `clave`, `nombre`, `direccion`, `cod_Cargo`) VALUES
(2, 87881535, '117730174', '123', 'Miranda Torre', 'San Pedro', 1),
(3, 66666666, '117730176', '2', 'Camila Mendoza', 'San Pedro', 2),
(10, 0, '555555', '1', 'Paola', '', 2),
(11, 0, '117730175', '1', 'Cristopher Toledo', '', 4),
(12, 70479417, '117730178', '1', 'Patricia', 'Alajuela', 1),
(13, 0, '123', '1', 'luis', '', 3),
(14, 888888, '5254527', '123', 'Nuria', 'San Pedro', 3),
(15, 25252225, '33363636', '1', 'francisca', 'San Pedro', 4),
(16, 7047, '1177300175', '123', 'Camila Mendoza', 'San Pedro', 2),
(17, 0, '123456789', 'Kmila2013', 'Camila Mendoza', '', 2),
(18, 0, '117730178', 'Kmila2230', 'Cindy', '', 3),
(23, 0, '111111111', 'Alegria123', 'Dylan ', '', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  ADD PRIMARY KEY (`id_Asistencia`),
  ADD KEY `cedulaEstudiante` (`cedulaEstudiante`,`id_Curso`),
  ADD KEY `id_Curso` (`id_Curso`);

--
-- Indices de la tabla `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  ADD PRIMARY KEY (`cod_Cargo`);

--
-- Indices de la tabla `tbl_curso`
--
ALTER TABLE `tbl_curso`
  ADD PRIMARY KEY (`id_Curso`);

--
-- Indices de la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD PRIMARY KEY (`cedulaEstudiante`),
  ADD KEY `cod_Instituto` (`cod_Instituto`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `tbl_informe`
--
ALTER TABLE `tbl_informe`
  ADD PRIMARY KEY (`id_Informe`),
  ADD KEY `cedulaEstudiante` (`cedulaEstudiante`,`cedula_profesor`,`id_Curso`),
  ADD KEY `cedula_profesor` (`cedula_profesor`);

--
-- Indices de la tabla `tbl_instituto`
--
ALTER TABLE `tbl_instituto`
  ADD PRIMARY KEY (`cod_Instituto`);

--
-- Indices de la tabla `tbl_jornada`
--
ALTER TABLE `tbl_jornada`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indices de la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_Instituto` (`cod_Instituto`,`cod_Cargo`,`id_jornada`),
  ADD KEY `cedula_persona` (`cedula_persona`),
  ADD KEY `cod_Cargo` (`cod_Cargo`),
  ADD KEY `id_jornada` (`id_jornada`);

--
-- Indices de la tabla `tbl_profesor`
--
ALTER TABLE `tbl_profesor`
  ADD PRIMARY KEY (`cedula_profesor`),
  ADD KEY `Id_curso` (`Id_curso`,`cod_Instituto`),
  ADD KEY `cod_Instituto` (`cod_Instituto`);

--
-- Indices de la tabla `tbl_registro`
--
ALTER TABLE `tbl_registro`
  ADD PRIMARY KEY (`idlogin`),
  ADD KEY `cedula_persona` (`cedula_persona`),
  ADD KEY `idx_codCargo` (`cod_Cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  MODIFY `id_Asistencia` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_registro`
--
ALTER TABLE `tbl_registro`
  MODIFY `idlogin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  ADD CONSTRAINT `tbl_asistencia_ibfk_1` FOREIGN KEY (`id_Curso`) REFERENCES `tbl_curso` (`id_Curso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_asistencia_ibfk_2` FOREIGN KEY (`cedulaEstudiante`) REFERENCES `tbl_estudiante` (`cedulaEstudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD CONSTRAINT `tbl_estudiante_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tbl_curso` (`id_Curso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_estudiante_ibfk_2` FOREIGN KEY (`cod_Instituto`) REFERENCES `tbl_instituto` (`cod_Instituto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_informe`
--
ALTER TABLE `tbl_informe`
  ADD CONSTRAINT `tbl_informe_ibfk_1` FOREIGN KEY (`cedula_profesor`) REFERENCES `tbl_profesor` (`cedula_profesor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_informe_ibfk_2` FOREIGN KEY (`cedulaEstudiante`) REFERENCES `tbl_estudiante` (`cedulaEstudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD CONSTRAINT `tbl_personal_ibfk_1` FOREIGN KEY (`cod_Cargo`) REFERENCES `tbl_cargo` (`cod_Cargo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_personal_ibfk_3` FOREIGN KEY (`id_jornada`) REFERENCES `tbl_jornada` (`id_jornada`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_personal_ibfk_4` FOREIGN KEY (`cod_Instituto`) REFERENCES `tbl_instituto` (`cod_Instituto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_profesor`
--
ALTER TABLE `tbl_profesor`
  ADD CONSTRAINT `tbl_profesor_ibfk_1` FOREIGN KEY (`Id_curso`) REFERENCES `tbl_curso` (`id_Curso`),
  ADD CONSTRAINT `tbl_profesor_ibfk_2` FOREIGN KEY (`cod_Instituto`) REFERENCES `tbl_instituto` (`cod_Instituto`);

--
-- Filtros para la tabla `tbl_registro`
--
ALTER TABLE `tbl_registro`
  ADD CONSTRAINT `tbl_registro_ibfk_1` FOREIGN KEY (`cod_Cargo`) REFERENCES `tbl_cargo` (`cod_Cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
