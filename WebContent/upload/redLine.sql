-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 03 月 11 日 07:59
-- 伺服器版本: 5.7.16-enterprise-commercial-advanced
-- PHP 版本： 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `RedLine`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Detail`
--

CREATE TABLE `Detail` (
  `id` int(11) NOT NULL,
  `item` varchar(45) COLLATE utf8_bin NOT NULL,
  `prod_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `Detail` varchar(450) COLLATE utf8_bin NOT NULL,
  `Color` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `Size` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `Pics` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `ProdDesc` varchar(3000) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `Detail`
--

INSERT INTO `Detail` (`id`, `item`, `prod_id`, `Detail`, `Color`, `Size`, `Pics`, `Price`, `ProdDesc`) VALUES
(49, '上衣', '201703011', '吸排彈性休閒連帽外套-女（ 粉橙 -XL）', '粉橙', 'S', '3', 599, '					吸排彈性休閒連帽外套-女（ 粉橙 -XL）'),
(52, '上衣', '2017030101', '吸排彈性休閒連帽外套-女（ 粉紅 -XL）', '粉紅', 'S', '6', 699, '					吸排彈性休閒連帽外套-女（ 粉紅 -XL）\r\n					\r\n					\r\n					\r\n					\r\n					');

-- --------------------------------------------------------

--
-- 資料表結構 `DetailPics`
--

CREATE TABLE `DetailPics` (
  `id` int(11) NOT NULL,
  `Detail` varchar(450) COLLATE utf8_bin NOT NULL,
  `Pics` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `minorCategory`
--

CREATE TABLE `minorCategory` (
  `id` int(11) NOT NULL,
  `category` varchar(45) COLLATE utf8_bin NOT NULL,
  `item` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `minorCategory`
--

INSERT INTO `minorCategory` (`id`, `category`, `item`) VALUES
(15, '女裝', '上衣'),
(16, '女裝', '長裙'),
(17, '女裝', '短裙'),
(18, '女裝', '高跟鞋'),
(19, '男裝', '紳士'),
(20, '男裝', '西裝'),
(21, '男裝', '西裝褲'),
(22, '男裝', '襯衫'),
(23, '男裝', '休閒'),
(24, '童裝', '男童'),
(25, '童裝', '女童'),
(26, '運動', '外套'),
(27, '運動', '背心'),
(28, '運動', '短褲'),
(29, '運動', '球鞋'),
(30, '潮流', '超酷'),
(31, '潮流', '炫風'),
(32, '男裝', '七分褲'),
(33, '女裝', '淑女鞋'),
(35, '女裝', '女鞋'),
(36, '女裝', '女鞋');

-- --------------------------------------------------------

--
-- 資料表結構 `primaryCategory`
--

CREATE TABLE `primaryCategory` (
  `id` int(11) NOT NULL,
  `prod_name` varchar(256) COLLATE utf8_bin NOT NULL,
  `category` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `primaryCategory`
--

INSERT INTO `primaryCategory` (`id`, `prod_name`, `category`) VALUES
(1, 'RedLine', '女裝'),
(5, 'RedLine', '男裝'),
(6, 'RedLine', '童裝'),
(7, 'RedLine', '運動'),
(8, 'RedLine', '潮流');

-- --------------------------------------------------------

--
-- 資料表結構 `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `user_name` varchar(16) COLLATE utf8_bin NOT NULL,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `email` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `prod_name` varchar(256) COLLATE utf8_bin NOT NULL,
  `tel` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `style` int(1) DEFAULT NULL,
  `brand_desc` varchar(3000) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `User`
--

INSERT INTO `User` (`id`, `user_name`, `password`, `email`, `address`, `birthday`, `prod_name`, `tel`, `mobile`, `style`, `brand_desc`) VALUES
(1, 'redLine', '123456', '', '', NULL, 'RedLine', '', '', 1, ''),
(2, 'white', '123456', '', '', '2017-03-02', 'white', '', '', 1, '');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `Detail`
--
ALTER TABLE `Detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `detail_fk_idx` (`Detail`) USING BTREE,
  ADD KEY `item_fk_idx` (`item`) USING BTREE;

--
-- 資料表索引 `DetailPics`
--
ALTER TABLE `DetailPics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Detail` (`Detail`) USING BTREE;

--
-- 資料表索引 `minorCategory`
--
ALTER TABLE `minorCategory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `item_fk_idx` (`item`) USING BTREE,
  ADD KEY `category_fk` (`category`);

--
-- 資料表索引 `primaryCategory`
--
ALTER TABLE `primaryCategory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `category` (`category`),
  ADD KEY `prod_fk` (`prod_name`);

--
-- 資料表索引 `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `prod_name` (`prod_name`) USING BTREE;

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `Detail`
--
ALTER TABLE `Detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- 使用資料表 AUTO_INCREMENT `DetailPics`
--
ALTER TABLE `DetailPics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `minorCategory`
--
ALTER TABLE `minorCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- 使用資料表 AUTO_INCREMENT `primaryCategory`
--
ALTER TABLE `primaryCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `Detail`
--
ALTER TABLE `Detail`
  ADD CONSTRAINT `item_fk` FOREIGN KEY (`item`) REFERENCES `minorCategory` (`item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `DetailPics`
--
ALTER TABLE `DetailPics`
  ADD CONSTRAINT `Detail_fk` FOREIGN KEY (`Detail`) REFERENCES `Detail` (`Detail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `minorCategory`
--
ALTER TABLE `minorCategory`
  ADD CONSTRAINT `category_fk` FOREIGN KEY (`category`) REFERENCES `primaryCategory` (`category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `primaryCategory`
--
ALTER TABLE `primaryCategory`
  ADD CONSTRAINT `prod_fk` FOREIGN KEY (`prod_name`) REFERENCES `User` (`prod_name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
