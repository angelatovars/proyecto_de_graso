-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2024 a las 03:36:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_didactica_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `nombre_actividad` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `nivel_dificultad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id_juego` int(11) NOT NULL,
  `nombre_juego` varchar(100) NOT NULL,
  `tipo_juego` varchar(50) DEFAULT NULL,
  `nivel_dificultad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `notificaciones` tinyint(1) DEFAULT 1,
  `tema_preferido` varchar(100) DEFAULT NULL,
  `nivel_preferido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `id_usuario`, `notificaciones`, `tema_preferido`, `nivel_preferido`) VALUES
(1, 12, 1, 'default', 1),
(2, 13, 1, 'default', 1),
(3, 23, 1, 'default', 1),
(4, 24, 1, 'default', 1),
(5, 25, 1, 'default', 1),
(6, 26, 1, 'default', 1),
(7, 27, 1, 'default', 1),
(8, 28, 1, 'default', 1),
(9, 29, 1, 'default', 1),
(10, 30, NULL, '', 0),
(11, 31, 1, 'default', 1),
(12, 32, 1, 'default', 1),
(13, 35, 1, 'default', 1),
(14, 40, 1, 'default', 1),
(15, 41, 1, 'default', 1),
(16, 42, 1, 'default', 1),
(17, 43, 1, 'default', 1),
(18, 47, 1, 'default', 1),
(19, 48, 1, 'default', 1),
(20, 49, 1, 'default', 1),
(21, 51, 1, 'default', 1),
(22, 52, 1, 'default', 1),
(23, 53, 1, 'Tecnología', 0),
(24, 54, 1, 'default', 1),
(25, 55, 1, 'default', 1),
(26, 56, 1, 'default', 1),
(27, 57, 1, 'default', 1),
(28, 58, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `id_ranking` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntaje_total` int(11) DEFAULT NULL,
  `ranking_posicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ranking`
--

INSERT INTO `ranking` (`id_ranking`, `id_usuario`, `puntaje_total`, `ranking_posicion`) VALUES
(1, 26, 120, NULL),
(2, 26, 1200, NULL),
(3, 26, 0, NULL),
(4, 30, 31, NULL),
(5, 35, 500, NULL),
(6, 35, 600, NULL),
(7, 35, 700, NULL),
(8, 35, 800, NULL),
(9, 35, 900, NULL),
(10, 35, 1000, NULL),
(11, 35, 1100, NULL),
(12, 53, 39, NULL),
(13, 53, 420, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id_resultado` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_juego` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `tiempo_juego` time DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revokedtokens`
--

CREATE TABLE `revokedtokens` (
  `id` int(11) NOT NULL,
  `jti` varchar(255) NOT NULL,
  `fecha_revocacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revokedtokens`
--

INSERT INTO `revokedtokens` (`id`, `jti`, `fecha_revocacion`) VALUES
(1, '1b3a9797-78ca-4327-8c46-e49aeb2fb87a', '2024-10-21 13:17:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `contraseña`, `edad`, `fecha_registro`) VALUES
(1, 'Test User', 'testuser@example.com', '$2b$12$7A1KIGBBuv0f5eVwgN8qReuhjN/pIZUC6ZxAvJ5usC4BZcePs7e8m', 25, '2024-10-21 05:03:47'),
(2, 'Test User', 'testuser1@example.com', '$2b$12$zU68wRYY5SG/kRI31wPgw.xhnkWirs./9OdcrAlGt3vuSyOtRfBJ6', 5, '2024-10-21 05:27:29'),
(4, 'Test User', 'testuser2@example.com', '$2b$12$bzZU8RwjNcIc50RW/O47leiA8F.jCE5ihuVZGJa1hv7/tzcNN9Q1S', 5, '2024-10-21 05:33:09'),
(6, 'Test User', 'testuser3@example.com', '$2b$12$NXwa6jdcZoEvRAleAQ8CNOKYysRTURc16oMZkChQseNk9golrBKGi', 5, '2024-10-21 12:25:53'),
(7, 'Test User', 'testuser4@example.com', '$2b$12$WN8JU.EJwATanApOw2wOD.Y9mcd8z4Ufypq0CxrGwikvFjkj1lgQq', 5, '2024-10-21 13:17:05'),
(9, 'Test User', 'testuser5@example.com', '$2b$12$PIjbYs.oFqxGsAbVxvChyuNwN2IWRlX0cibhhbsupZOJUbcpro.v.', 5, '2024-10-21 13:20:56'),
(10, 'Test User', 'testuser6@example.com', '$2b$12$p6dbHpCns96jqa.MqQfbD.YMtn/h7MlLV12rp7YTHqGzn0UkbTCEa', 5, '2024-10-21 13:25:14'),
(11, 'Test User', 'testuser7@example.com', '$2b$12$t.SQHWM4lLbx4DQYiqBeg.qFqSnocVU5U0d7zRsli5plRJR4GMjni', 5, '2024-10-21 13:46:33'),
(12, 'Test User', 'testuser8@example.com', '$2b$12$/B56HXVx3Yk6bB9mRtroxOjDlbl13xemxJG/sNwFLFvfyyApmRHIm', 5, '2024-10-21 14:00:43'),
(13, 'Gerardo Fabian', 'gerardogonzalezm1403@gmail.com', '$2b$12$zBnAaLFCOfK6AL1n.AVaCelNeStn0IQ.jhhRk3YFbSm7gXUsehhpe', 21, '2024-10-22 01:32:05'),
(23, 'UserPrueba', 'user@gmail.com', '$2b$12$3tmLWH/ABr/wpJ4yW604O.OJ0wxN2uuPuGoLY/z.s4e.QcaZjbHAK', 20, '2024-10-22 01:37:50'),
(24, 'test', 'test@test.com', '$2b$12$4uYOZes7nmbS6h6S.eXfjuxYhty.VesgqdrpPB9lm/uavZBRVAE9a', 20, '2024-10-22 01:44:25'),
(25, 'admin', 'admin@us.com', '$2b$12$Z6pfvWPTq1sAiuB2yNL44.WCufZxv1HL/dsJmv.bZMRsVoXI4BXfS', 1, '2024-10-22 02:07:24'),
(26, 'Test User', 'testuser9@example.com', '$2b$12$EVT4SJPKtJ5EF1ayJDz3WuIr47MfVTpsifcpcIZU/SiDmjOxmLvfW', 5, '2024-10-22 04:06:39'),
(27, 'Gerardo', 'test1@test.com', '$2b$12$EvRS48XR6/x3Ajxgboiz9uDFNvv4gNtD3Ri6I3ZjVbUA/t0BczhUS', 20, '2024-10-22 15:01:56'),
(28, 'Angie', 'angie@gmail.com', '$2b$12$3pyaiPjpRamdwUjsof/s3uNI0AnygDSKNmF7q2drfzA3bm5TK4Tp2', 23, '2024-10-22 20:32:02'),
(29, 'Gerardo Fabian', 'gerardo@gmail.com', '$2b$12$X0JFZ0p/mKmANgMc0yd/0.JvNNApzIlUZs4nWAxDIEtzgqgwjIW7C', 12, '2024-10-23 23:51:32'),
(30, 'Angela 2', 'angela19961020@gmail.com', '$2b$12$2VRHNoF2fdIFC.LDG9acM.EcQP55.S5VWQ9plpTJWK9h5QCj3BN3G', 20, '2024-10-23 23:54:38'),
(31, 'Deisyre Hernandez', 'deysireh2014@gmail.com', '$2b$12$FbZHbNOR.YxzbIuu3z0WSuvXtfC3V9eEYppJumPQysF4NnHtN01Z2', 23, '2024-10-25 20:11:02'),
(32, 'Angela', 'daniel.ruizr@uniagustiniana.edu.co', '$2b$12$5dAM/dDsY7W8F5uRqahGkO.4O4341UBd5jUcmX1Cu5xoo7/tumglC', 25, '2024-10-25 20:19:14'),
(35, 'Samuel David', 'samuel.buendia@gmail.com', '$2b$12$2h5CCSwH8N/lpRBwBHCBJ.oH//yXrhxLrOHKwwe6IzJZtwFdXDPX6', 20, '2024-10-25 20:37:25'),
(40, 'nicol', 'nicol.velandia@gmail.com', '$2b$12$DHadK5vD.jpKtf7nFlag2uQM6FAgcH4wr.Yu4NVB0mLLBAVfewVly', 19, '2024-10-25 20:55:53'),
(41, 'fernando perez', 'fernandoperez2107@gmail.com', '$2b$12$kVQONQ43QyBZP7ZLh2ECU.jJoftBxFuqe1pwL36d6.UVhWE/MgpVS', 20, '2024-10-25 21:05:43'),
(42, 'Juan', 'jaun.usechea@uniagustiniana.edu.co', '$2b$12$mmzUw1V8mXZFqAVcFQK9R.1p208az5qkbL0EauNsOXLXk1dcWoVi.', 23, '2024-10-25 21:13:41'),
(43, 'juan', 'juan.usechea@uniagustiniana.edu.co', '$2b$12$W3YKD7Rpt.d4n3N1lti8duTL87WljakTvirnz.1bJOVrqMDBH.l8u', 23, '2024-10-25 21:14:45'),
(47, 'fgh', 'ghg@ho.com', '$2b$12$ws1gW1G2Bh4Ke8nXoEz3XunwQFGVN7/uYwbjAGUR0EJAiEz112WfS', 22, '2024-10-25 21:25:32'),
(48, 'carlos ', 'carlossaefasefeas@isaubiuaesbf', '$2b$12$X1cIQvUBZIoxsUHfWmz7xOVLO2npF2A4cank3geAnN6VzIsfvGt1i', -49, '2024-10-25 21:41:31'),
(49, 'Michell', 'ingrid.povedab@uanigustiniana.edu.co', '$2b$12$t2wSK6hyQwlwRL6LW/Dw3.lqTA57g6cftYoAHP/1Y8S5QGiHOXxZO', 19, '2024-11-01 17:59:44'),
(51, 'bryam', 'dsfsdfs@cdvs', '$2b$12$PQ9Biq9stCKzAGii5.Mb..Fv6I.q.rvr5NvJ6HtFMxyIzbkGI7sRu', 34, '2024-11-01 18:16:12'),
(52, 'bryam', 'bryam@gmail.com', '$2b$12$bt6n6dmWO0mjog4.ElFxhu1brlWigE3UeXcLTSz6ZLaWgLGOakEUG', 34, '2024-11-01 18:16:49'),
(53, 'Angela', 'angela.tovars@hotmail.com', '$2b$12$Zr8XsziFkxCRWEDCvGrfMODz5LMbRGfMkOF7sFx9Et2aSJRr01LgK', 17, '2024-11-04 00:06:17'),
(54, 'lorem', 'angela.tovars1@hotmail.com', '$2b$12$/R.ERnRCgjMoI2OJveMJ3O1rdXC/ObZ5WCI7GB6EndzTI//fG7ihm', 25, '2024-11-04 02:15:17'),
(55, 'Angela', 'angela.tovarso28@gmail.com', '$2b$12$bxwG1iMv9PyOuJE..x1fSOOcZoZ.I1SpLtMs30MH3mTMpxDM5swm6', 7, '2024-11-05 01:42:11'),
(56, 'Angela', 'angela.tovars@gmail.com', '$2b$12$8HYnm7662RWJeXRYPdxGHe1cVpVB5eZCEIKJ99kKKWPe2fMB4NrzS', 7, '2024-11-05 01:42:55'),
(57, 'Paula', 'paula.29@gmail.com', '$2b$12$.EVcjJAQhROpJh.Sm2Vzruh2zfsnybTVi5sEtjsSZ07bOmV9ZEiIy', 27, '2024-11-05 01:58:49'),
(58, 'Lura', 'lau34@gmail.com', '$2b$12$6yiSgXlnBIG2eDKCmZFNVO9AHoIYoCFrn4MdYrtjSNV4Qs/HVzR1W', 20, '2024-11-05 02:00:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id_juego`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id_ranking`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_juego` (`id_juego`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `revokedtokens`
--
ALTER TABLE `revokedtokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id_ranking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revokedtokens`
--
ALTER TABLE `revokedtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`),
  ADD CONSTRAINT `resultados_ibfk_3` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id_actividad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
