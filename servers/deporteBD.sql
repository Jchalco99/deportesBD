-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para deportebd
CREATE DATABASE IF NOT EXISTS `deportebd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `deportebd`;

-- Volcando estructura para tabla deportebd.apuesta
CREATE TABLE IF NOT EXISTS `apuesta` (
  `id` int(11) NOT NULL,
  `idLocal` int(11) NOT NULL,
  `idVisitante` int(11) NOT NULL,
  `resultado` varchar(20) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idUsuario_apuesta` (`idUsuario`),
  CONSTRAINT `fk_idUsuario_apuesta` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.apuesta: ~0 rows (aproximadamente)

-- Volcando estructura para tabla deportebd.clasificacion
CREATE TABLE IF NOT EXISTS `clasificacion` (
  `posicion` int(11) NOT NULL,
  `idEquipo` varchar(3) DEFAULT NULL,
  `puntos` int(11) NOT NULL,
  `pjugados` int(11) NOT NULL,
  `pganados` int(11) NOT NULL,
  `pempatados` int(11) NOT NULL,
  `pperdidos` int(11) NOT NULL,
  `gfavor` int(11) NOT NULL,
  `gcontra` int(11) NOT NULL,
  `diferencia` varchar(11) NOT NULL,
  PRIMARY KEY (`posicion`),
  KEY `fk_idEquipo_clasificacion` (`idEquipo`),
  CONSTRAINT `fk_idEquipo_clasificacion` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.clasificacion: ~20 rows (aproximadamente)
INSERT INTO `clasificacion` (`posicion`, `idEquipo`, `puntos`, `pjugados`, `pganados`, `pempatados`, `pperdidos`, `gfavor`, `gcontra`, `diferencia`) VALUES
	(1, 'RMA', 38, 15, 12, 2, 1, 33, 9, '+24'),
	(2, 'GIR', 38, 15, 12, 2, 1, 34, 18, '+16'),
	(3, 'BAR', 34, 15, 10, 4, 1, 28, 14, '+14'),
	(4, 'ATM', 31, 14, 10, 1, 3, 30, 13, '+17'),
	(5, 'ATH', 28, 15, 8, 4, 3, 30, 18, '+12'),
	(6, 'RSO', 26, 15, 7, 5, 3, 26, 18, '+8'),
	(7, 'BET', 25, 15, 6, 7, 2, 18, 16, '+2'),
	(8, 'LPA', 21, 15, 6, 3, 6, 13, 13, '0'),
	(9, 'VAL', 19, 15, 5, 4, 6, 17, 20, '-3'),
	(10, 'GET', 19, 15, 4, 7, 4, 17, 20, '-3'),
	(11, 'RVA', 19, 15, 4, 7, 4, 16, 22, '-6'),
	(12, 'VIL', 16, 15, 4, 4, 7, 22, 26, '-4'),
	(13, 'ALA', 16, 15, 4, 4, 7, 14, 19, '-5'),
	(14, 'OSN', 15, 15, 4, 3, 8, 17, 25, '-8'),
	(15, 'SEV', 13, 14, 2, 7, 5, 20, 20, '0'),
	(16, 'MAL', 11, 15, 1, 8, 6, 13, 20, '-7'),
	(17, 'CAD', 11, 14, 2, 5, 7, 11, 21, '-10'),
	(18, 'CEL', 8, 14, 1, 5, 8, 14, 24, '-10'),
	(19, 'GRA', 7, 15, 1, 4, 10, 19, 35, '-16'),
	(20, 'ALM', 4, 15, 0, 4, 11, 16, 37, '-21');

-- Volcando estructura para tabla deportebd.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` varchar(3) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idEstadio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idEstadio_equipo` (`idEstadio`),
  CONSTRAINT `fk_idEstadio_equipo` FOREIGN KEY (`idEstadio`) REFERENCES `estadio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.equipo: ~20 rows (aproximadamente)
INSERT INTO `equipo` (`id`, `nombre`, `idEstadio`) VALUES
	('ALA', 'Deportivo Alavés', 13),
	('ALM', 'Almería', 20),
	('ATH', 'Athletic Club', 5),
	('ATM', 'Atlético de Madrid', 4),
	('BAR', 'FC Barcelona', 3),
	('BET', 'Real Betis', 7),
	('CAD', 'Cádiz', 16),
	('CEL', 'Celta de Vigo', 18),
	('GET', 'Getafe', 10),
	('GIR', 'Girona', 2),
	('GRA', 'Granada CF', 19),
	('LPA', 'Las Palmas', 8),
	('MAL', 'Mallorca', 17),
	('OSN', 'Osasuna', 14),
	('RMA', 'Real Madrid', 1),
	('RSO', 'Real Sociedad', 6),
	('RVA', 'Rayo Vallecano', 11),
	('SEV', 'Sevilla', 15),
	('VAL', 'Valencia CF', 9),
	('VIL', 'Villarreal', 12);

-- Volcando estructura para tabla deportebd.estadio
CREATE TABLE IF NOT EXISTS `estadio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.estadio: ~20 rows (aproximadamente)
INSERT INTO `estadio` (`id`, `nombre`, `ciudad`) VALUES
	(1, 'Estadio Santiago Bernabéu', 'Madrid'),
	(2, 'Estadio Municipal de Montilivi', 'Girona'),
	(3, 'Estadio Wanda Metropolitano', 'Madrid'),
	(4, 'Camp Nou', 'Barcelona'),
	(5, 'Estadio San Mamés', 'Bilbao'),
	(6, 'Estadio de la Real Sociedad', 'San Sebastián'),
	(7, 'Estadio Benito Villamar', 'Sevilla'),
	(8, 'Estadio Gran Canaria', 'Las Palmas'),
	(9, 'Estadio Mestalla', 'Valencia'),
	(10, 'Estadio Coliseum', 'Getafe'),
	(11, 'Estadio de Vallecas', 'Vallecas'),
	(12, 'Estadio El Madrigal', 'Villarreal'),
	(13, 'Estadio Mendizorra', 'Vitoria'),
	(14, 'Estadio El Sadar', 'Pamplona'),
	(15, 'Estadio Ramón Sánchez Pizjuán', 'Sevilla'),
	(16, 'Estadio de la Nova Cartuja', 'Cádiz'),
	(17, 'Estadio de Son Moix', 'Palma'),
	(18, 'Estadio de Balaídos', 'Vigo'),
	(19, 'Estadio Nuevo Los Cármenes', 'Granada'),
	(20, 'Estadio de los Juegos del Mediterráneo', 'Almería');

-- Volcando estructura para tabla deportebd.jugador
CREATE TABLE IF NOT EXISTS `jugador` (
  `id` int(11) NOT NULL,
  `posicion` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  `idEquipo` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idEquipo_jugador` (`idEquipo`),
  CONSTRAINT `fk_idEquipo_jugador` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.jugador: ~65 rows (aproximadamente)
INSERT INTO `jugador` (`id`, `posicion`, `apellido`, `nombre`, `nacionalidad`, `idEquipo`) VALUES
	(10, 'Portero', 'Sivera', 'Antonio', 'ESP', 'ALA'),
	(20, 'Defensa', 'Sedlar', 'Álex', 'ESP', 'ALA'),
	(30, 'Defensa', 'Abqar', 'Álex', 'ESP', 'ALA'),
	(40, 'Defensa', 'Tenaglia', 'N.', 'ESP', 'ALA'),
	(50, 'Defensa', 'Marín', 'Rafa', 'ESP', 'ALA'),
	(60, 'Centrocampista', 'Blanco', 'Antonio', 'ESP', 'ALA'),
	(70, 'Centrocampista', 'Hagi', 'I.', 'RUM', 'ALA'),
	(80, 'Centrocampista', 'Rioja', 'Luis', 'ESP', 'ALA'),
	(90, 'Centrocampista', 'Alkain', 'Xeber', 'ESP', 'ALA'),
	(100, 'Delantero', 'Sobrido', 'Ruben', 'ESP', 'ALA'),
	(110, 'Delantero', 'Sola', 'Álex', 'ESP', 'ALA'),
	(120, 'Delantero', 'Karrikaburu', 'Jon', 'ESP', 'ALA'),
	(130, 'Delantero', 'García', 'Kike', 'ESP', 'ALA'),
	(140, 'Portero', 'Mariño', 'Diego', 'ESP', 'ALM'),
	(150, 'Defensa', 'Solà', 'Arnau', 'ESP', 'ALM'),
	(160, 'Defensa', 'Martos', 'Iván', 'ESP', 'ALM'),
	(170, 'Defensa', 'Kaiky', 'Kaiky', 'ESP', 'ALM'),
	(180, 'Defensa', 'González', 'Edgar', 'ESP', 'ALM'),
	(190, 'Centrocampista', 'Ibáñez', 'Iddrisu', 'ESP', 'ALM'),
	(200, 'Centrocampista', 'Baba', 'Mediapunta', 'ESP', 'ALM'),
	(210, 'Centrocampista', 'Lopy', 'Dion', 'ESP', 'ALM'),
	(220, 'Centrocampista', 'Melero', 'Melero', 'ESP', 'ALM'),
	(230, 'Delantero', 'Ramazani', 'Largie', 'MAR', 'ALM'),
	(240, 'Delantero', 'Suárez', 'Luis', 'ESP', 'ALM'),
	(250, 'Delantero', 'Embarba', 'Adri', 'ESP', 'ALM'),
	(260, 'Delantero', 'Baptistão', 'Léo', 'POR', 'ALM'),
	(270, 'Portero', 'Simón', 'Álex', 'ESP', 'ATH'),
	(280, 'Defensa', 'De la Bella', 'Dani', 'ESP', 'ATH'),
	(290, 'Defensa', 'López', 'Aitor', 'ESP', 'ATH'),
	(300, 'Defensa', 'Martínez', 'Álvaro', 'ESP', 'ATH'),
	(310, 'Defensa', 'Victoriano', 'Unai', 'ESP', 'ATH'),
	(320, 'Centrocampista', 'Garcia', 'Jon', 'ESP', 'ATH'),
	(330, 'Centrocampista', 'Sánchez', 'Óscar', 'ESP', 'ATH'),
	(340, 'Centrocampista', 'Lobete', 'Jon', 'ESP', 'ATH'),
	(350, 'Centrocampista', 'Vencedor', 'Sergio', 'ESP', 'ATH'),
	(360, 'Delantero', 'Aduriz', 'Álvaro', 'ESP', 'ATH'),
	(370, 'Delantero', 'Muniain', 'Iker', 'ESP', 'ATH'),
	(380, 'Delantero', 'Williams', 'Álvaro', 'ESP', 'ATH'),
	(390, 'Delantero', 'Fernández', 'Álex', 'ESP', 'ATH'),
	(400, 'Portero', 'Oblak', 'Jan', 'SVN', 'ATM'),
	(410, 'Defensa', 'Giménez', 'José María', 'URY', 'ATM'),
	(420, 'Defensa', 'Azpilicueta', 'César', 'ESP', 'ATM'),
	(430, 'Defensa', 'Soyüncü', 'Caglar', 'TUR', 'ATM'),
	(440, 'Defensa', 'Savic', 'Stefan', 'MNE', 'ATM'),
	(450, 'Centrocampista', 'Koke', 'Jorge', 'ESP', 'ATM'),
	(460, 'Centrocampista', 'Saúl', 'Saúl', 'ESP', 'ATM'),
	(470, 'Centrocampista', 'Lemar', 'Thomas', 'FRA', 'ATM'),
	(480, 'Centrocampista', 'Llorente', 'Marcos', 'ESP', 'ATM'),
	(490, 'Delantero', 'Griezmann', 'Antoine', 'FRA', 'ATM'),
	(500, 'Delantero', 'Memphis', 'Memphis', 'NED', 'ATM'),
	(510, 'Delantero', 'Correa', 'Ángel', 'ARG', 'ATM'),
	(520, 'Delantero', 'Morata', 'Álvaro', 'ESP', 'ATM'),
	(530, 'Portero', 'Ter Stegen', 'Marc-André', 'GER', 'BAR'),
	(540, 'Defensa', 'Cancelo', 'João', 'POR', 'BAR'),
	(550, 'Defensa', 'Balde', 'Alejandro', 'ESP', 'BAR'),
	(560, 'Defensa', 'Araujo', 'Ronald', 'URU', 'BAR'),
	(570, 'Defensa', 'Martínez', 'Íñigo', 'ESP', 'BAR'),
	(580, 'Centrocampista', 'Pedri', 'Gonzalez', 'ESP', 'BAR'),
	(590, 'Centrocampista', 'Roberto', 'Sergi', 'ESP', 'BAR'),
	(600, 'Centrocampista', 'de Jong', 'Frenkie', 'NED', 'BAR'),
	(610, 'Centrocampista', 'Gündogan', 'Ilkay', 'GER', 'BAR'),
	(620, 'Delantero', 'Torres', 'Ferran', 'ESP', 'BAR'),
	(630, 'Delantero', 'Lewandowski', 'Robert', 'POL', 'BAR'),
	(640, 'Delantero', 'Raphinha', '-', 'BRA', 'BAR'),
	(650, 'Delantero', 'Félix', 'João', 'POR', 'BAR');

-- Volcando estructura para tabla deportebd.partido
CREATE TABLE IF NOT EXISTS `partido` (
  `id` int(11) NOT NULL,
  `idLocal` varchar(11) DEFAULT NULL,
  `idVisitante` varchar(11) DEFAULT NULL,
  `resultado` varchar(20) DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idLocal_partido` (`idLocal`),
  KEY `fk_idVisitante_partido` (`idVisitante`),
  CONSTRAINT `fk_idLocal_partido` FOREIGN KEY (`idLocal`) REFERENCES `equipo` (`id`),
  CONSTRAINT `fk_idVisitante_partido` FOREIGN KEY (`idVisitante`) REFERENCES `equipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.partido: ~8 rows (aproximadamente)
INSERT INTO `partido` (`id`, `idLocal`, `idVisitante`, `resultado`, `fecha`) VALUES
	(1001, 'BAR', 'RMA', '3-1', '2023-04-15'),
	(1002, 'SEV', 'BET', '1-2', '2023-04-25'),
	(1003, 'VIL', 'VAL', NULL, '2023-05-07'),
	(1004, 'RSO', 'RVA', NULL, '2023-05-07'),
	(1005, 'CAD', 'CEL', NULL, '2023-05-07'),
	(1006, 'ATM', 'BET', NULL, '2023-05-08'),
	(1007, 'RMA', 'BAR', NULL, '2023-05-08'),
	(1008, 'GET', 'GIR', NULL, '2023-05-08');

-- Volcando estructura para tabla deportebd.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla deportebd.usuario: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
