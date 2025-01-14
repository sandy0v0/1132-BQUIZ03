-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-01-14 03:37:20
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `db14-3`
--

-- --------------------------------------------------------

--
-- 資料表結構 `movies`
--

CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `level` int(1) UNSIGNED NOT NULL,
  `length` int(3) UNSIGNED NOT NULL,
  `ondate` date NOT NULL,
  `publish` text NOT NULL,
  `director` text NOT NULL,
  `trailer` text NOT NULL,
  `poster` text NOT NULL,
  `intro` text NOT NULL,
  `sh` int(1) UNSIGNED NOT NULL,
  `rank` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `movies`
--

INSERT INTO `movies` (`id`, `name`, `level`, `length`, `ondate`, `publish`, `director`, `trailer`, `poster`, `intro`, `sh`, `rank`) VALUES
(1, '院線片１', 1, 90, '2025-01-12', '院線片１發行商', '院線片１導演', '03B01v.mp4', '03B01.png', '院線片1劇情簡介，院線片1劇情簡介，院線片1劇情簡介，院線片1劇情簡介，院線片1劇情簡介', 1, 1),
(2, '院線片２', 2, 180, '2025-01-12', '院線片２發行商', '院線片２導演', '03B02v.mp4', '03B02.png', '院線片2劇情簡介，院線片2劇情簡介，院線片2劇情簡介，院線片2劇情簡介，院線片2劇情簡介', 1, 2),
(3, '院線片３', 3, 90, '2025-01-12', '院線片３發行商', '院線片３導演', '03B03v.mp4', '03B03.png', '院線片3劇情簡介，院線片3劇情簡介，院線片3劇情簡介，院線片3劇情簡介，院線片3劇情簡介', 1, 3),
(4, '院線片４', 4, 180, '2025-01-12', '院線片４發行商', '院線片４導演', '03B04v.mp4', '03B04.png', '院線片4劇情簡介，院線片4劇情簡介，院線片4劇情簡介，院線片4劇情簡介，院線片4劇情簡介', 1, 4),
(5, '院線片５', 1, 270, '2025-01-13', '院線片５發行商', '院線片５導演', '03B05v.mp4', '03B05.png', '院線片5劇情簡介，院線片5劇情簡介，院線片5劇情簡介，院線片5劇情簡介，院線片5劇情簡介', 1, 5),
(6, '院線片６', 2, 360, '2025-01-13', '院線片６發行商', '院線片６導演', '03B06v.mp4', '03B06.png', '院線片6劇情簡介，院線片6劇情簡介，院線片6劇情簡介，院線片6劇情簡介，院線片6劇情簡介', 1, 6),
(7, '院線片７', 3, 180, '2025-01-14', '院線片７發行商', '院線片７導演', '03B07v.mp4', '03B07.png', '院線片7劇情簡介，院線片7劇情簡介，院線片7劇情簡介，院線片7劇情簡介，院線片7劇情簡介', 1, 7);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `no` text NOT NULL,
  `movie` text NOT NULL,
  `date` date NOT NULL,
  `session` text NOT NULL,
  `qt` int(10) UNSIGNED NOT NULL,
  `seats` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `posters`
--

CREATE TABLE `posters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `img` text NOT NULL,
  `sh` int(1) UNSIGNED NOT NULL,
  `rank` int(10) UNSIGNED NOT NULL,
  `ani` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `posters`
--

INSERT INTO `posters` (`id`, `name`, `img`, `sh`, `rank`, `ani`) VALUES
(1, '預告片1', '03A01.jpg', 1, 1, 1),
(2, '預告片2', '03A02.jpg', 1, 2, 2),
(3, '預告片3', '03A03.jpg', 1, 3, 3),
(4, '預告片4', '03A04.jpg', 1, 4, 2),
(5, '預告片5', '03A05.jpg', 1, 5, 1),
(6, '預告片6', '03A06.jpg', 1, 6, 3),
(7, '預告片7', '03A07.jpg', 1, 7, 3),
(8, '預告片8', '03A08.jpg', 1, 8, 2),
(9, '預告片9', '03A09.jpg', 1, 9, 2);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `posters`
--
ALTER TABLE `posters`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `posters`
--
ALTER TABLE `posters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
