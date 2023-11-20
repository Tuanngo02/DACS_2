CREATE TABLE `Role` (
  `id` int PRIMARY KEY,
  `name` varchar(20)
);

CREATE TABLE `Users` (
  `id` int PRIMARY KEY,
  `role_id` int,
  `username` varchar(100),
  `password` varchar(100),
  `fullname` varchar(50),
  `email` varchar(150),
  `phone` varchar(20),
  `address` varchar(200)
);

CREATE TABLE `Category` (
  `id` int PRIMARY KEY,
  `name` varchar(100)
);

CREATE TABLE `Products` (
  `id` int PRIMARY KEY,
  `category_id` int,
  `title` varchar(350),
  `price` int,
  `picture` varchar(500),
  `discount` int,
  `description` longtext,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `Galery` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `thumbnail` varchar(500)
);

CREATE TABLE `Comment` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `product_id` int,
  `note` varchar(500)
);

CREATE TABLE `Oders` (
  `id` int PRIMARY KEY,
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
  `id` int PRIMARY KEY,
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
