CREATE TABLE `Role` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `name` varchar(20)
);
use camping;
CREATE TABLE `Users` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` int,
  `username` varchar(100),
  `password` varchar(100),
  `fullname` varchar(50),
  `email` varchar(150),
  `phone` varchar(20),
  `address` varchar(200),
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
);
INSERT INTO `Users` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'admin', '123', 1553185530, 1553185530, 1553185530),
(3, 'writer', 'Tuấn', '123', 1553185530, 1553185530, 1553185530);

CREATE TABLE `Category` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `name` varchar(100)
);
CREATE TABLE `image_library` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
);
CREATE TABLE `Products` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `category_id` int,
  `name` varchar(350),
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
);
INSERT INTO `Products` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(2, 'GiÃ y bÃ³ng Ä‘Ã¡ 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 'GiÃ y bÃ³ng Ä‘Ã¡ 1 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987);
CREATE TABLE `Galery` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `product_id` int,
  `thumbnail` varchar(500)
);

CREATE TABLE `Comment` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int,
  `product_id` int,
  `note` varchar(500)
);

CREATE TABLE `Oders` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `user_id` int,
  `fullname` varchar(50),
  `email` varchar(150),
  `phone` varchar(20),
  `address` varchar(200),
  `note` varchar(500),
  `order_date` datetime,
  `status` int
);

CREATE TABLE `Oder_details` (
  `id` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `order_id` int,
  `product_id` int,
  `price` int,
  `num` int,
  `total_money` int
);

ALTER TABLE `Users` ADD FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Products` ADD FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);

ALTER TABLE `Oder_details` ADD FOREIGN KEY (`order_id`) REFERENCES `Oders` (`id`);

ALTER TABLE `Galery` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Oder_details` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Oders` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);
