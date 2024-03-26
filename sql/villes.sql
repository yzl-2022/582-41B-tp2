-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-03-25 23:34:19
-- 服务器版本： 8.0.31
-- PHP 版本： 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `laravel_tp`
--

-- --------------------------------------------------------

--
-- 表的结构 `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `villes`
--

INSERT INTO `villes` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Nikitaberg', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(2, 'North Caroleside', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(3, 'North Michaelafurt', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(4, 'North Patrick', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(5, 'Lake Meggieburgh', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(6, 'Port Mattmouth', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(7, 'Port Charliemouth', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(8, 'West Amaraport', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(9, 'Grimesside', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(10, 'Kamrenborough', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(11, 'West Sagemouth', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(12, 'Lake Eldon', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(13, 'Raymondshire', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(14, 'Port Aurelia', '2024-03-23 03:40:42', '2024-03-23 03:40:42'),
(15, 'North Elyse', '2024-03-23 03:40:42', '2024-03-23 03:40:42');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
