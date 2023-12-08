-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 02:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_time` int(11) NULL,
  `last_updated` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(7, 'Lều'),
(8, 'Vật dụng'),
(9, 'Thức ăn'),
(10, 'Đồ uống'),
(11, 'Nội thất');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_time` int(11) NULL,
  `last_updated` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_library`
--

CREATE TABLE `image_library` (
  `id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `thumbails` varchar(255) DEFAULT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image_library`
--

INSERT INTO `image_library` (`id`, `path`, `product_id`, `thumbails`, `created_time`, `last_updated`) VALUES
(15, 'uploads/23-11-2023/4-1(1).png', 5, NULL, 1700795143, 1700795143),
(16, 'uploads/23-11-2023/3-1(1).png', 5, NULL, 1700795143, 1700795143),
(17, 'uploads/23-11-2023/1-1(1).png', 5, NULL, 1700795143, 1700795143),
(18, 'uploads/29-11-2023/Leu-2-nguoi-5-1.jpg', 6, NULL, 1701279248, 1701279248),
(19, 'uploads/29-11-2023/Leu-2-nguoi-3-1.jpg', 6, NULL, 1701279248, 1701279248),
(20, 'uploads/29-11-2023/Leu-2-nguoi-1-1.jpg', 6, NULL, 1701279248, 1701279248);

-- --------------------------------------------------------

--
-- Table structure for table `oders`
--

CREATE TABLE `oders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `order_date` varchar(200) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oders`
--

INSERT INTO `oders` (`id`, `user_id`, `fullname`, `email`, `phone`, `address`, `note`, `order_date`, `status`) VALUES
(1, 4, 'Lê Long Thiên', 'longthienl80@gmail.com', '0787626825', 'Hòa Vang', '', '2023-12-01 00:38:58', 'Đã thanh toán'),
(2, 5, 'Lê Long Thiên', 'quynh11112004@gmail.com', '0787626825', 'Việt Nam', 'noteeee', '2023-12-01 00:41:41', 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `oder_details`
--

CREATE TABLE `oder_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `day_rent` int(11) NOT NULL,
  `total_money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oder_details`
--

INSERT INTO `oder_details` (`id`, `order_id`, `product_id`, `price`, `num`, `day_rent`, `total_money`) VALUES
(1, 1, 6, 40000, 3, 4, 480000),
(2, 2, 5, 800000, 3, 2, 4800000),
(3, 2, 6, 40000, 6, 3, 720000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(350) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `image_path`, `price`, `content`, `created_time`, `last_updated`) VALUES
(5, 7, 'Lều Mông Cổ Glamping', 'uploads/23-11-2023/Leucamtrai-3(1).png', NULL, 800000, '<ul>\r\n	<li>Tổng trọng lượng lều : 23kg</li>\r\n	<li>K&iacute;ch thước: DxRxC: 4mx4mx2,5m, ph&ugrave; hợp cho 6-8 người sử dụng</li>\r\n	<li>Lều được thiết kế hiện đại, gọn nhẹ,&nbsp;dễ d&agrave;ng lắp đặt v&agrave; thu gọn rất tiện &iacute;ch.</li>\r\n	<li>Khung lều l&agrave;m bằng th&eacute;p hợp kim cao cấp bền bỉ</li>\r\n	<li><strong>Chất liệu vải :</strong>&nbsp;200g TC cao cấp chống tia cực&nbsp; t&iacute;m, tuổi thọ cao, đường chỉ may được &eacute;p keo gi&uacute;p chống nước tuyệt đối,&nbsp;độ bền cực cao</li>\r\n	<li>Vải đ&aacute;y&nbsp;lều 420g PVC chống m&agrave;i m&ograve;n, chống hơi ẩm từ b&ecirc;n dưới</li>\r\n	<li>Kh&oacute;a k&eacute;o loại xịn, k&eacute;o rất nhẹ nh&agrave;ng, v&agrave; bền đẹp</li>\r\n	<li>Lều c&oacute; 1 cửa ch&iacute;nh rộng v&agrave; nhiều cửa sổ xung quanh rất tho&aacute;ng</li>\r\n</ul>\r\n', 1700795142, 1700795142),
(6, 7, 'Cho Thuê Lều Cắm Trại 2 Người Salida', 'uploads/29-11-2023/Them-tieu-de-4.png', NULL, 40000, '<ul>\r\n	<li>Chất Liệu: vải 190t PU 2000 .Lưới Lỗ 68.</li>\r\n	<li>K&iacute;ch Thước: D&agrave;i 2.0m, Rộng 1.4 m, Cao 1.3m.</li>\r\n	<li>C&acirc;n nặng: 2.0Kg, đựng trong t&uacute;i 60cmx20xm20cm</li>\r\n	<li>Khung Lều: Khung sợi thủy tinh 8.5mm .veron inox , cọc th&eacute;p 5.5mm 4 c&acirc;y.</li>\r\n	<li>M&ocirc; Tả: Lớp trong lưới 68 ,lều c&oacute; 1 cửa ch&iacute;nh,cửa c&oacute; 2 lớp .Lớp Vải Ngo&agrave;i 190t chống thấm tuyệt đối, c&oacute; tăng đưa tăng giảm .</li>\r\n</ul>\r\n', 1701279248, 1701279248);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'custom');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birthday` int(11) NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `fullname`, `email`, `phone`, `address`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 1, 'admin', '123', 'admin', 'admin@gmail.com', '0123456789', 'Da Nang', 2004, 20112023, 20112023),
(4, 2, 'longthien', '123', 'Lê Long Thiên', 'longthienl80@gmail.com', '0787626825', 'Hòa Vang', 0, 0, 0),
(5, 2, 'longthien_17', '123', 'Lê Long Thiên', 'quynh11112004@gmail.com', '048204221', 'Việt Nam', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oders`
--
ALTER TABLE `oders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oder_details`
--
ALTER TABLE `oder_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oders`
--
ALTER TABLE `oders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oder_details`
--
ALTER TABLE `oder_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oders`
--
ALTER TABLE `oders`
  ADD CONSTRAINT `oders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `oder_details`
--
ALTER TABLE `oder_details`
  ADD CONSTRAINT `oder_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `oders` (`id`),
  ADD CONSTRAINT `oder_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* Thêm sản phẩm */
INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `image_path`, `price`, `content`, `created_time`, `last_updated`, `quantity`) VALUES
(5, 7, 'Lều Mông Cổ Glamping', 'uploads/23-11-2023/Leucamtrai-3(1).png', NULL, 800000, '<ul>\r\n	<li>Tổng trọng lượng lều : 23kg</li>\r\n	<li>K&iacute;ch thước: DxRxC: 4mx4mx2,5m, ph&ugrave; hợp cho 6-8 người sử dụng</li>\r\n	<li>Lều được thiết kế hiện đại, gọn nhẹ,&nbsp;dễ d&agrave;ng lắp đặt v&agrave; thu gọn rất tiện &iacute;ch.</li>\r\n	<li>Khung lều l&agrave;m bằng th&eacute;p hợp kim cao cấp bền bỉ</li>\r\n	<li><strong>Chất liệu vải :</strong>&nbsp;200g TC cao cấp chống tia cực&nbsp; t&iacute;m, tuổi thọ cao, đường chỉ may được &eacute;p keo gi&uacute;p chống nước tuyệt đối,&nbsp;độ bền cực cao</li>\r\n	<li>Vải đ&aacute;y&nbsp;lều 420g PVC chống m&agrave;i m&ograve;n, chống hơi ẩm từ b&ecirc;n dưới</li>\r\n	<li>Kh&oacute;a k&eacute;o loại xịn, k&eacute;o rất nhẹ nh&agrave;ng, v&agrave; bền đẹp</li>\r\n	<li>Lều c&oacute; 1 cửa ch&iacute;nh rộng v&agrave; nhiều cửa sổ xung quanh rất tho&aacute;ng</li>\r\n</ul>\r\n', 1700795142, 1700795142, NULL),
(6, 7, 'Cho Thuê Lều Cắm Trại 2 Người Salida', 'uploads/29-11-2023/Them-tieu-de-4.png', NULL, 40000, '<ul>\r\n	<li>Chất Liệu: vải 190t PU 2000 .Lưới Lỗ 68.</li>\r\n	<li>K&iacute;ch Thước: D&agrave;i 2.0m, Rộng 1.4 m, Cao 1.3m.</li>\r\n	<li>C&acirc;n nặng: 2.0Kg, đựng trong t&uacute;i 60cmx20xm20cm</li>\r\n	<li>Khung Lều: Khung sợi thủy tinh 8.5mm .veron inox , cọc th&eacute;p 5.5mm 4 c&acirc;y.</li>\r\n	<li>M&ocirc; Tả: Lớp trong lưới 68 ,lều c&oacute; 1 cửa ch&iacute;nh,cửa c&oacute; 2 lớp .Lớp Vải Ngo&agrave;i 190t chống thấm tuyệt đối, c&oacute; tăng đưa tăng giảm .</li>\r\n</ul>\r\n', 1701279248, 1701279248, NULL),
(7, 10, 'Pepsi-lon cao 320ml', 'uploads/08-12-2023/pepsi.jpg', NULL, 10000, '<p><strong>Pepsi</strong><span style=\"color:rgb(75, 75, 75); font-family:arial,sans-serif; font-size:14px\">&nbsp;l&agrave; nh&atilde;n hiệu nước giải kh&aacute;t hương Cola c&oacute; gas nổi tiếng to&agrave;n cầu, được kế thừa nhiều gi&aacute; trị lịch sử l&acirc;u đời. Tại Việt Nam, tự h&agrave;o l&agrave; một nh&atilde;n h&agrave;ng đại diện cho tiếng n&oacute;i của giới trẻ c&ugrave;ng với th&ocirc;ng điệp &ldquo;CỨ TRẺ, CỨ CHẤT, CỨ PEPSI&rdquo;, ch&uacute;ng t&ocirc;i lu&ocirc;n t&igrave;m c&aacute;ch mang đến lại những trải nghiệm sảng kho&aacute;i tột đỉnh, khuyến kh&iacute;ch người trẻ nắm bắt v&agrave; tận hưởng từng khoảnh khắc th&uacute; vị của cuộc sống.</span></p>\r\n\r\n<p><span style=\"color:rgb(75, 75, 75); font-family:arial,sans-serif; font-size:14px\">Lon cao 320 ml</span></p>\r\n', 1701520241, 1702060826, 0),
(9, 9, 'Mỳ tôm Thanh Long Caty', 'uploads/08-12-2023/mytom(1).jpg', NULL, 12000, '<p><span style=\"color:rgb(34, 34, 34); font-family:arial; font-size:17px\">M&igrave; t&ocirc;m thanh long Caty c&oacute; nhiều loại vị kh&aacute;c nhau như m&igrave; hải sản chua cay Caty, m&igrave; t&ocirc;m v&agrave; thịt g&agrave; Caty, m&igrave; thịt heo bằm Caty, m&igrave; trộn Spaghetti Caty... Đặc điểm chung của c&aacute;c vị n&agrave;y đều l&agrave; sợi m&igrave; được l&agrave;m từ nguy&ecirc;n liệu v&ocirc; c&ugrave;ng đặc biệt - tr&aacute;i thanh long đỏ.&nbsp;</span></p>\r\n\r\n<p><span style=\"color:rgb(34, 34, 34); font-family:arial; font-size:17px\">Loại m&igrave; n&agrave;y được l&agrave;m từ bột m&igrave; v&agrave; thanh long đỏ, kh&ocirc;ng chất phẩm m&agrave;u n&ecirc;n kh&ocirc;ng g&acirc;y hại cho sức khỏe. M&igrave;nh thấy rất th&iacute;ch hợp để sử dụng h&agrave;ng ng&agrave;y&quot;.&nbsp;</span></p>\r\n', 1701888820, 1702060806, 40),
(10, 11, 'Ghế xếp du lịch', 'uploads/08-12-2023/ghedulich3.jpg', NULL, 30000, '<ul>\r\n	<li dir=\"auto\">Chất liệu: Vải Oxford 600D d&agrave;y dặn chống m&agrave;i m&ograve;n + Lưới tho&aacute;ng kh&iacute; + khung th&eacute;p cứng c&aacute;p chịu lực tốt</li>\r\n	<li dir=\"auto\">K&iacute;ch thước: rộng 54cm, cao từ s&agrave;n tới bệ ngồi 35cm, cao tựa lưng 68cm</li>\r\n	<li dir=\"auto\">Đ&oacute;ng g&oacute;i: 35 x 10 x 8 (c&oacute; t&uacute;i đựng đi k&egrave;m)</li>\r\n	<li dir=\"auto\">Trọng lượng: 1,35kg</li>\r\n	<li dir=\"auto\">Chịu lực: 80-90kg</li>\r\n</ul>\r\n', 1702003826, 1702060796, 40),
(11, 8, 'Đèn led treo lều', 'uploads/08-12-2023/Anh-san-pham.jpg', NULL, 30000, '<ul>\r\n	<li>Được thi&ecirc;́t k&ecirc;́ nhỏ gọn với 3 ch&ecirc;́&nbsp;đ&ocirc;̣ chi&ecirc;́u sáng:\r\n	<ul>\r\n		<li>Sáng mạnh</li>\r\n		<li>Sáng y&ecirc;́u</li>\r\n		<li>Chế độ khẩn cấp&nbsp;SOS.</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sản ph&acirc;̉m r&acirc;́t phù hợp mang theo trong các chuy&ecirc;́n&nbsp;đi cắm trại, dã ngoại qua&nbsp;đ&ecirc;m.</li>\r\n	<li>Thời gian chiếu s&aacute;ng: 3-4h</li>\r\n</ul>\r\n', 1702059719, 1702059719, 40),
(12, 7, 'Lều 2 Người Vintage Mẫu 2023', 'uploads/08-12-2023/Them-tieu-de-5.png', NULL, 100000, '<ul>\r\n	<li dir=\"auto\">LỀU VINTAGE HOME 2- 3P</li>\r\n	<li dir=\"auto\">2m10 x 1m60 x cao 140 .</li>\r\n	<li dir=\"auto\">T&ugrave;y biến. 2 Cửa. 2 Lớp.</li>\r\n	<li dir=\"auto\">Vải ch&iacute;nh: TC 65/35 .COTTON. CANVAS. RA/BEIGE .</li>\r\n	<li dir=\"auto\">Vải đ&aacute;y: P/O 210DPU3000M/MWRFR.</li>\r\n	<li dir=\"auto\">Đựng trong t&uacute;i x&aacute;ch 60 x 20 .</li>\r\n	<li dir=\"auto\">Trọng lượng trọn bộ: 5kg</li>\r\n</ul>\r\n', 1702059828, 1702059828, 10),
(13, 7, 'Lều Cắm Trại 10 Người Outwell', 'uploads/08-12-2023/Leucamtrai10nguoi.png', NULL, 150000, '<ul>\r\n	<li>Chất Liệu&nbsp;:&nbsp;Vải190t PU&nbsp;3000mm.</li>\r\n	<li>Khung Lều: Khung cabon 13mm,khung veron nh&ocirc;m</li>\r\n	<li>M&ocirc; tả:Lều 2 lớp 2 cửa đối xứng</li>\r\n	<li>K&iacute;ch Thước&nbsp;:D&agrave;i 3,5m. Rộng 3,5m . Cao 2m.</li>\r\n	<li>D&agrave;nh cho: 8 &ndash; 12 Người</li>\r\n</ul>\r\n', 1702059929, 1702059929, 15),
(14, 11, 'Bàn Nhôm Vân Gỗ', 'uploads/08-12-2023/bannhomvintage.png', NULL, 50000, '<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; K&iacute;ch thước sử dụng: D:80cm*R:59cm*C:45cm</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; K&iacute;ch thước gấp gọn: 65cmx20cm</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; Chất liệu: Khung th&eacute;p cao cấp sơn giả gỗ</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; Chịu trọng tải: 30kg</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; M&agrave;u sắc: N&acirc;u</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">&ndash; C&acirc;n nặng: 4.4kg</div>\r\n\r\n<div dir=\"auto\" style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(64, 78, 101); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">Bộ sản phẩm gồm: B&agrave;n v&agrave; t&uacute;i đựng Oxford</div>\r\n', 1702060032, 1702060032, 50),
(15, 11, 'Ghế Xếp Vintage', 'uploads/08-12-2023/Ghexepvintage.png', NULL, 50000, '<ul>\r\n	<li dir=\"auto\">Chất liệu: Vải Oxford 600D, tay cầm gỗ sồi, khung th&eacute;p d&agrave;y</li>\r\n	<li dir=\"auto\">K&iacute;ch thước: rộng 55cm, cao từ s&agrave;n tới bệ ngồi 24cm, cao tựa lưng 62cm</li>\r\n	<li dir=\"auto\">Đ&oacute;ng g&oacute;i: 55x56cm</li>\r\n	<li dir=\"auto\">Trọng lượng: 2.7kg</li>\r\n	<li dir=\"auto\">Chịu lực: 80-90kg</li>\r\n	<li dir=\"auto\">M&agrave;u sắc: Trắng be v&agrave; đen</li>\r\n</ul>\r\n', 1702060141, 1702060141, 60),
(16, 8, 'Quạt Dã Ngoại', 'uploads/08-12-2023/Quat-Da-Ngoai.png', NULL, 60000, '<p>&ndash; Quạt t&iacute;ch hợp đ&egrave;n chống ồn đa năng</p>\r\n\r\n<p>&ndash; Quạt đ&egrave;n c&oacute; thể xoay 270&nbsp;độ</p>\r\n\r\n<p>&ndash; C&oacute; chỉ b&aacute;o dung lượng pin được sạc đầy: 25%, 50%, 75%, 100% khi sạc</p>\r\n\r\n<p>&ndash; Trọng lượng: 660g</p>\r\n\r\n<p>&ndash; Thời gian sử dụng: 5-25h</p>\r\n\r\n<p>&ndash; Dung lượng pin: 7800mAh</p>\r\n\r\n<p>&ndash; Quạt sử dụng động cơ kh&ocirc;ng chổi than &ecirc;m &aacute;i khi hoạt động. C&aacute;nh quạt nhựa PC si&ecirc;u nhẹ v&agrave; tốc độ gi&oacute; khỏe.</p>\r\n', 1702060229, 1702060229, 25),
(17, 8, 'Dây Đèn Led', 'uploads/08-12-2023/daydenled.jpg', NULL, 30000, '<p><span style=\"color:rgb(64, 78, 101); font-family:open sans,sans-serif; font-size:15px\">G&oacute;p phần gi&uacute;p kh&ocirc;ng gian th&ecirc;m lung linh sắc m&agrave;u v&agrave; xinh đẹp trong c&aacute;c chuyến d&atilde; ngoại, cắm trại rất cần những b&oacute;ng đ&egrave;n m&agrave;u sắc hoặc m&agrave;u v&agrave;ng ấm &aacute;p. Điều n&agrave;y gi&uacute;p tạo cảm gi&aacute;c ngọt ng&agrave;o b&ecirc;n cạnh người th&acirc;n y&ecirc;u.</span></p>\r\n', 1702060338, 1702060338, 40),
(18, 12, 'Thuyền SUP Chuyên Nghiệp', 'uploads/08-12-2023/thuyen-sup.jpg', NULL, 300000, '<ul>\r\n	<li>H&igrave;nh d&aacute;ng thiết kế sắc xảo, tinh tế đến từng chi tiết. M&agrave;u sắc tươi mới, trẻ trung, hiện đại.</li>\r\n	<li><strong>V&aacute;n ch&egrave;o Sup&nbsp;</strong>tại cửa h&agrave;ng LeuTrai.vn đa số l&agrave; v&aacute;n ch&egrave;o bơm hơi, gọn nhẹ, dễ di chuyển, dễ sử dụng.</li>\r\n	<li>K&iacute;ch thước: độ d&agrave;i 3.5 &ndash; 4m v&agrave; sức chứa l&ecirc;n đến 200kg trọng lượng.</li>\r\n</ul>\r\n', 1702060530, 1702060530, 12),
(19, 12, 'Thuyền Hơi 2 Người', 'uploads/08-12-2023/thuyen-hoi-2-nguoik.jpg', NULL, 200000, '<ul>\r\n	<li>K&iacute;ch thước hộp: 41.28 cm x 58.74 cm x 21.59 cm. Trọng lượng hộp: 9 kg</li>\r\n	<li>K&iacute;ch thước sau bơm: &plusmn; 236*114*41 (cm) (xấp xỉ).</li>\r\n	<li>Độ dầy th&agrave;nh thuyền:&nbsp;&nbsp;0.50mm</li>\r\n	<li>Tải trọng tối đa: 200kg</li>\r\n	<li>Gồm 2 ch&egrave;o v&agrave; 2 &aacute;o phao</li>\r\n</ul>\r\n', 1702060601, 1702060601, 12);
