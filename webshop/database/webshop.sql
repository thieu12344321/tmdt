-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 03:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Thieu', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Tour Du Lịch', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'Tour Trong Nước', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Tour Nước Ngoài', '', 1, 2, '2017-04-22 05:37:36'),
(10, 'Tour Hà Nội', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'Tour TP.Hồ Chí Minh', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'Tour Hội An', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'Tour Ninh Bình', '', 7, 4, '2017-04-22 09:09:14'),
(14, 'Tour Huế', '', 7, 5, '2017-04-22 09:09:31'),
(15, 'Tour Hawaii', '', 8, 1, '2017-04-22 09:09:46'),
(16, 'Tour Thụy Sĩ', '', 8, 2, '2017-04-22 09:10:10'),
(17, 'Tour Trung Quốc', '', 8, 3, '2017-04-22 09:23:39'),
(18, 'Tour Đan Mạch', '', 8, 4, '2017-04-22 09:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(12, 9, 4, 1, '200000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 16, 'Du lịch Châu Âu Hè - Tour Du lịch Pháp - Thụy Sĩ - Ý - Vatican từ Hà Nội 2024', 'Thời gian: 10 ngày 9 đêm <br>\r\nKhởi hành: 16/09/2024  <br>\r\nVận Chuyển: Xe du lịch, Máy bay  <br>\r\nXuất phát: Từ Hà Nội  ', '179000000.00', 20000, 'ts3.jpg', '[\"ts3-2.jpg\"]', 25, 1, 14, 3, 1493983674),
(2, 16, 'Du lịch Châu Âu mùa Thu - Tour Pháp - Bỉ - Hà Lan - Đức - Thụy Sĩ từ Hà Nội 2024', 'Thời gian: 9 ngày 8 đêm <br>\r\nKhởi hành: 19/09; 13/10/2024  <br>\r\nVận Chuyển: Xe du lịch, Máy bay  <br>\r\nXuất phát: Từ Hà Nội  <br>', '255000000.00', 51000, 'ts2.jpg', '[\"ts2-2.jpg\"]', 3, 1, 4, 1, 1493983674),
(3, 16, 'Du lịch Châu Âu mùa Thu - Tour Pháp - Thụy Sĩ - Ý - Áo - Đức từ Hà Nội 2024', 'Thời gian: 11 ngày 10 đêm <br>\r\nKhởi hành: 09,13/07; 20/10/2024 <br>\r\nVận Chuyển: Xe du lịch, Máy bay  <br>\r\nXuất phát: Từ Hà Nội  ', '156000000.00', 150000, 'ts1.jpg', '[\"ts1-2.jpg\"]', 43, 4, 11, 3, 1493983674),
(4, 18, 'Du lịch Châu Âu mùa Thu - Tour Bắc Âu - Đan Mạch - Na Uy - Thụy Điển - Phần Lan từ Hà Nội 2024', 'Thời gian: 10 ngày 9 đêm <br>\r\nKhởi hành: 26/09/2024  <br>\r\nVận Chuyển: Xe du lịch, Máy bay  <br>\r\nXuất phát: Từ Hà Nội  ', '93000000.00', 80000, 'dm2.jpg', '[\"dm2-2.jpg\"]', 16, 7, 18, 4, 1493983674),
(12, 17, 'DU LỊCH TRUNG QUỐC - TÂY TẠNG [LHASA - SHIGATSE - EVEREST]\r\n', 'THỜI GIAN:8 ngày 7 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không China Southern Airlines - CZ <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Trung Quốc', '54000000.00', 360000, 'tq4.jpg', '[\"tq4-2.jpg\"]', 27, 3, 9, 2, 0),
(13, 17, 'DU LỊCH TRUNG QUỐC [TÂY AN - LẠC DƯƠNG - ĐĂNG PHONG - KHAI PHONG - TRỊNH CHÂU]\r\n', 'THỜI GIAN:6 ngày 5 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không China Southern Airlines <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Trung Quốc', '48000000.00', 0, 'tq3.jpg', '[\"tq3-2.jpg\"]', 5, 1, 4, 1, 1493983674),
(6, 18, 'Du lịch Châu Âu Hè - Tour Bắc Âu - Đan Mạch - Thụy Điển - Phần Lan từ Hà Nội 2024', 'Thời gian: 9 ngày 8 đêm <br>\r\nKhởi hành: 11/07; 05,09/08/2024  <br>\r\nVận Chuyển: Xe du lịch, Máy bay  <br>\r\nXuất phát: Từ Hà Nội ', '89000000.00', 100000, 'dm1.jpg', '[\"dm1-2.png\"]', 2, 1, 4, 1, 1493983674),
(9, 15, 'HONOLULU – WAIKIKI BEACH – MINI CIRCLE ISLAND – HNL AIRPORT', 'Thời gian: 6 NGÀY 5 ĐÊM\r\n\r\nĐiểm khởi hành: HCM, Hà Nội\r\n\r\nHành Trình: Hawaii', '180000000.00', 100000, 'hw3.jpg', '[\"hw3-2.jpg\"]', 3, 1, 4, 1, 1493983674),
(11, 15, 'Du Lịch Mỹ [Hawaii - Honolulu]', 'THỜI GIAN:6 ngày 5 đêm <br>\r\nPHƯƠNG TIỆN:Hàng Không All Nippon Airways <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Mỹ', '124000000.00', 10000, 'hw1.jpg', '[\"hw1-2.jpg\"]', 36, 3, 5, 1, 1493983674),
(10, 15, 'HAWAII – HONOLULU – POLYNESIAN CULTURAL CENTER – NORTH SHORE', 'Thời gian: 6 NGÀY 5 ĐÊM <br>\r\nĐiểm khởi hành: HCM, Hà Nội <br>\r\nHành Trình: Hawaii', '129000000.00', 60000, 'hw2.jpg', '[\"hw2-2.jpg\"]', 8, 2, 4, 1, 1493983674),
(14, 17, 'DU LỊCH TRUNG QUỐC [TRƯƠNG GIA GIỚI - CÁT THỦ - THIÊN TỬ SƠN - THIÊN MÔN SƠN - PHƯỢNG HOÀNG CỔ TRẤN]', 'THỜI GIAN:6 ngày 5 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không VietJet <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Trung Quốc', '39000000.00', 50000, 'tq2.jpg', '[\"tq2-2.jpg\"]', 4, 2, 4, 1, 1493983674),
(15, 17, 'DU LỊCH TRUNG QUỐC [THƯỢNG HẢI - HÀNG CHÂU - TÔ CHÂU - BẮC KINH]\r\n', 'THỜI GIAN:7 ngày 6 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không quốc gia Việt Nam <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Trung Quốc ', '46000000.00', 180000, 'tq1.jpg', '[\"tq1-2.jpg\"]', 4, 1, 4, 1, 1493983674),
(24, 11, 'DU LỊCH TP. HỒ CHÍ MINH [SÀI GÒN HOÀI CỔ]\r\n', 'THỜI GIAN:Tour 01 ngày <br>\r\nPHƯƠNG TIỆN:Đi về bằng xe <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:TP. Hồ Chí Minh', '23000000.00', 0, 'sg2.jpg', '[\"sg2-2.jpeg\"]', 37, 1, 9, 2, 1493983674),
(25, 11, 'Du Lịch TP. Hồ Chí Minh [Jog - Sup And Spa Saigon]', '<ul>\r\n	<li><strong><em>THỜI GIAN:06 tiếng (06:30 - 12:30)</em> </strong>ĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh</li>\r\n	<li>PHƯƠNG TIỆN:Xe ô tô</li>\r\n	<strong></strong> Lịch khởi hành tháng 06: 16/06, 23/06, 30/06</li>\r\n</ul>\r\n', '45000000.00', 150000, 'sg1-2.jpg', '[\"sg1.jpg\"]', 3, 1, 9, 2, 1493983674),
(26, 14, 'DU LỊCH HUẾ - ĐÀ NẴNG - HỘI AN - KHU DU LỊCH BÀ NÀ - CẦU VÀNG - BẢO TÀNG TRANH 3D', 'THỜI GIAN:4 ngày 3 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không Vietnam Airlines <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Huế - Hội An - Đà Nẵng\r\n', '16500000.00', 0, 'h2.jpg', '[\"h2-2.jpg\"]', 6, 1, 9, 2, 1493983674),
(27, 14, 'DU LỊCH HUẾ - THIỀN VIỆN TRÚC LÂM BẠCH MÃ\r\n', 'THỜI GIAN:4 ngày 3 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không Vietnam Airlines <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Huế - Đà Nẵng\r\n', '21300000.00', 40000, 'h1.jpg', '[\"h1-2.jpg\"]', 2, 1, 4, 1, 1493983674),
(28, 13, 'DU LỊCH HÀ NỘI - NINH BÌNH - TRÀNG AN - HẠ LONG - SAPA - LÀO CAI - PHÚ THỌ\r\n', 'THỜI GIAN:6 ngày 5 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không Vietnam Airlines <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Hà Nội - Hạ Long - Ninh Bình - Sapa', '17802355.00', 0, 'nb2.jpg', '[\"nb2-2.jpg\"]', 17, 1, 18, 4, 1493983674),
(29, 13, 'DU LỊCH HÀ NỘI - NINH BÌNH - TAM CỐC - HẠ LONG - FANSIPAN - LÀO CAI - PHÚ THỌ\r\n', 'THỜI GIAN:6 ngày 5 đêm <br>\r\nPHƯƠNG TIỆN:Hàng không Vietnam Airlines <br>\r\nĐIỂM XUẤT PHÁT:TP. Hồ Chí Minh <br>\r\nĐIỂM ĐẾN:Hà Nội - Hạ Long - Ninh Bình - Sapa\r\n', '30000000.00', 120000, 'nb1.jpg', '[\"nb1-2.jpg\"]', 24, 1, 4, 1, 1493983674);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'slide1.jpg', 'http://localhost/webshop/phoi-ren-p4', 1, '2017-04-25 15:24:43'),
(4, '2', 'sl33.jpg', 'http://localhost/webshop', 4, '2017-04-25 15:36:41'),
(5, '3', 'sl3.jpg', 'http://localhost/webshop/', 3, '2017-04-25 15:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(6, 'Xuan Hoai', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(5, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(7, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
