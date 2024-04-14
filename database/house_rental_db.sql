-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2020 at 07:07 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Duplex'),
(2, 'Single-Family Home'),
(3, 'Multi-Family Home');



CREATE TABLE `houses` (
  `id` int(30) NOT NULL,
  `house_no` varchar(50) NOT NULL,
  `category_id` int(30) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `houses` (`id`, `house_no`, `category_id`, `description`, `price`) VALUES
(1, '623', 4, 'Sample', 2500);



CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `tenant_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `payments` (`id`, `tenant_id`, `amount`, `invoice`, `date_created`) VALUES
(1, 2, 2500, '123456', '2020-10-26 11:29:35'),
(2, 2, 7500, '136654', '2020-10-26 11:30:21');



CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'House Rental Management System', 'info@sample.comm', '+6948 8542 623', '1603344720_1602738120_pngtree-purple-hd-business-banner-image_5493.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');


CREATE TABLE `tenants` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `house_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0= inactive',
  `date_in` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `tenants` (`id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `house_id`, `status`, `date_in`) VALUES
(2, 'John', 'C', 'Smith', 'jsmith@sample.com', '+18456-5455-55', 1, 1, '2020-07-02');



CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `houses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tenants`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

DELIMITER //

CREATE TRIGGER set_payment_status
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
    DECLARE current_month INT;
    DECLARE payment_month INT;
    SET current_month = MONTH(NOW());
    SET payment_month = MONTH(NEW.date_created);
    IF current_month = payment_month THEN
        SET NEW.status = 'completed';
    ELSE
        SET NEW.status = 'pending';
    END IF;
END;

DELIMITER ;



COMMIT;



INSERT INTO deleted_tenants 
VALUES(old.id,old.firstname,old.middlename,old.lastname,old.email,
old.contact,old.house_id,old.status,old.date_in)