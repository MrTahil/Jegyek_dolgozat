-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 14. 09:34
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `jegyek`
--
CREATE DATABASE IF NOT EXISTS `jegyek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `jegyek`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztalyzatok`
--

CREATE TABLE `osztalyzatok` (
  `Azon` int(11) DEFAULT NULL,
  `Jegy` int(11) DEFAULT NULL,
  `Leiras` varchar(50) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Letrehozas` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `osztalyzatok`
--

INSERT INTO `osztalyzatok` (`Azon`, `Jegy`, `Leiras`, `Letrehozas`) VALUES
(1, 1, 'NYSE', '2024-01-04'),
(2, 4, 'NYSE', '2024-09-04'),
(3, 3, 'NASDAQ', '2024-09-09'),
(4, 2, 'NASDAQ', '2024-08-05'),
(5, 1, 'NYSE', '2023-12-04'),
(6, 4, 'NASDAQ', '2023-12-30'),
(7, 3, 'NASDAQ', '2024-06-17'),
(8, 5, 'NYSE', '2023-10-18'),
(9, 2, 'NASDAQ', '2023-11-01'),
(10, 1, 'NASDAQ', '2023-11-26'),
(11, 4, 'NYSE', '2024-05-06'),
(12, 1, 'NASDAQ', '2024-08-31'),
(13, 4, 'NYSE', '2024-08-29'),
(14, 5, 'NYSE', '2024-09-20'),
(15, 2, 'NYSE', '2024-03-08'),
(16, 3, 'NASDAQ', '2024-02-20'),
(17, 2, 'NYSE', '2024-05-14'),
(18, 4, 'NASDAQ', '2024-04-12'),
(19, 2, 'NYSE', '2024-04-17'),
(20, 3, 'NYSE', '2024-04-27'),
(21, 5, 'NYSE', '2024-04-02'),
(22, 1, 'NASDAQ', '2024-06-16'),
(23, 4, 'NASDAQ', '2023-10-16'),
(24, 5, 'NYSE', '2024-09-23'),
(25, 3, 'NASDAQ', '2024-01-31'),
(26, 4, 'NYSE', '2024-05-31'),
(27, 3, 'NASDAQ', '2024-10-10'),
(28, 2, 'NASDAQ', '2024-09-04'),
(29, 5, 'NASDAQ', '2024-06-26'),
(30, 2, 'NASDAQ', '2024-04-07'),
(31, 1, 'NYSE', '2023-10-20'),
(32, 3, 'NYSE', '2024-09-28'),
(33, 2, 'NYSE', '2024-02-15'),
(34, 5, 'NYSE', '2024-02-21'),
(35, 4, 'NASDAQ', '2024-08-25'),
(36, 1, 'NASDAQ', '2024-04-07'),
(37, 5, 'NASDAQ', '2024-07-12'),
(38, 1, 'NYSE', '2023-11-26'),
(39, 1, 'NYSE', '2024-05-02'),
(40, 4, 'NASDAQ', '2024-01-14'),
(41, 2, 'NASDAQ', '2024-05-11'),
(42, 5, 'NASDAQ', '2024-01-22'),
(43, 3, 'NASDAQ', '2023-12-09'),
(44, 3, 'NYSE', '2024-04-25'),
(45, 2, 'NYSE', '2024-04-29'),
(46, 3, 'NYSE', '2024-04-11'),
(47, 2, 'NYSE', '2024-07-16'),
(48, 3, 'NASDAQ', '2024-07-10'),
(49, 4, 'NYSE', '2024-02-15'),
(50, 5, 'NASDAQ', '2024-03-10'),
(51, 4, 'NYSE', '2023-12-06'),
(52, 1, 'NYSE', '2023-10-26'),
(53, 1, 'NASDAQ', '2024-09-19'),
(54, 5, 'NYSE', '2024-05-13'),
(55, 4, 'NYSE', '2024-02-08'),
(56, 5, 'NASDAQ', '2024-09-24'),
(57, 2, 'NASDAQ', '2023-10-23'),
(58, 2, 'NASDAQ', '2024-03-28'),
(59, 1, 'NYSE', '2024-08-29'),
(60, 1, 'NASDAQ', '2023-11-07'),
(61, 1, 'NASDAQ', '2023-11-07'),
(62, 3, 'NYSE', '2023-11-06'),
(63, 5, 'NASDAQ', '2024-03-24'),
(64, 5, 'NASDAQ', '2023-11-07'),
(65, 3, 'NASDAQ', '2024-05-02'),
(66, 5, 'NYSE', '2023-11-23'),
(67, 1, 'NYSE', '2023-11-26'),
(68, 1, 'NASDAQ', '2024-03-12'),
(69, 4, 'NASDAQ', '2023-10-22'),
(70, 1, 'NASDAQ', '2024-04-26'),
(71, 2, 'NASDAQ', '2024-05-25'),
(72, 2, 'NASDAQ', '2024-02-18'),
(73, 3, 'NASDAQ', '2024-04-18'),
(74, 5, 'NASDAQ', '2024-02-25'),
(75, 2, 'NASDAQ', '2024-03-08'),
(76, 1, 'NYSE', '2023-11-15'),
(77, 5, 'NYSE', '2024-04-10'),
(78, 3, 'NASDAQ', '2024-09-30'),
(79, 3, 'NASDAQ', '2024-05-27'),
(80, 3, 'NASDAQ', '2024-08-02'),
(81, 3, 'NYSE', '2024-06-03'),
(82, 1, 'NASDAQ', '2024-03-02'),
(83, 3, 'NASDAQ', '2023-11-08'),
(84, 3, 'NYSE', '2024-02-24'),
(85, 1, 'NYSE', '2024-07-30'),
(86, 3, 'NASDAQ', '2023-11-24'),
(87, 5, 'NASDAQ', '2024-03-21'),
(88, 5, 'NYSE', '2024-01-13'),
(89, 3, 'NYSE', '2024-04-17'),
(90, 4, 'NASDAQ', '2023-10-14'),
(91, 1, 'NYSE', '2024-10-13'),
(92, 4, 'NYSE', '2024-08-18'),
(93, 5, 'NASDAQ', '2024-04-22'),
(94, 1, 'NASDAQ', '2024-04-04'),
(95, 1, 'NASDAQ', '2024-03-23'),
(96, 3, 'NYSE', '2023-11-18'),
(97, 3, 'NASDAQ', '2024-09-17'),
(98, 5, 'NYSE', '2023-11-10'),
(99, 1, 'NASDAQ', '2024-02-25'),
(100, 2, 'NYSE', '2024-09-27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
