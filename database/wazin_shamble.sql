-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 05:56 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wazin_shamble`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `id` int(11) NOT NULL,
  `agency_name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `agency_admin_id` int(50) NOT NULL,
  `agency_type` varchar(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`id`, `agency_name`, `agency_admin_id`, `agency_type`, `user_id`, `date`) VALUES
(2, 'نمایندگی اول مندوی', 6, 'موقعیتی', 5, '2022-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `agencies_to_factory_reciepts`
--

CREATE TABLE `agencies_to_factory_reciepts` (
  `id` int(11) NOT NULL,
  `agency_id` int(20) NOT NULL,
  `amount` float NOT NULL,
  `user_id` int(20) NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agency_sale_major`
--

CREATE TABLE `agency_sale_major` (
  `id` int(11) NOT NULL,
  `customer_id` int(50) DEFAULT NULL,
  `customer_name` varchar(100) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `agency_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `reciept` float NOT NULL,
  `date` date NOT NULL,
  `remain_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `agency_sale_major`
--

INSERT INTO `agency_sale_major` (`id`, `customer_id`, `customer_name`, `agency_id`, `user_id`, `reciept`, `date`, `remain_date`) VALUES
(1, NULL, 'احمد منیر', 2, 6, 600, '2022-03-11', '0000-00-00'),
(3, 1, NULL, 2, 6, 1000, '2022-03-13', '0000-00-00'),
(4, 1, NULL, 2, 6, 0, '2022-03-13', '2022-03-13'),
(5, 1, NULL, 2, 6, 630, '2022-03-13', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `agency_sale_minor`
--

CREATE TABLE `agency_sale_minor` (
  `id` int(11) NOT NULL,
  `sale_major_id` int(50) NOT NULL,
  `item_id_stock_major` int(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_id` int(20) NOT NULL,
  `discount` float NOT NULL,
  `purchase_rate` float NOT NULL,
  `sale_rate` float NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `agency_sale_minor`
--

INSERT INTO `agency_sale_minor` (`id`, `sale_major_id`, `item_id_stock_major`, `amount`, `unit_id`, `discount`, `purchase_rate`, `sale_rate`, `details`) VALUES
(1, 1, 1, 1, 1, 0, 150, 200, ''),
(2, 1, 2, 1, 1, 0, 150, 200, '121e2'),
(3, 1, 3, 1, 1, 0, 150, 200, ''),
(4, 3, 1, 5, 1, 0, 150, 200, ''),
(5, 4, 1, 3, 1, 0, 150, 200, '--'),
(6, 5, 1, 3, 1, 0, 160, 210, '');

-- --------------------------------------------------------

--
-- Table structure for table `customers_major`
--

CREATE TABLE `customers_major` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `phone_number` varchar(13) COLLATE utf8mb4_persian_ci NOT NULL,
  `address` text COLLATE utf8mb4_persian_ci NOT NULL,
  `agency_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `customers_major`
--

INSERT INTO `customers_major` (`id`, `full_name`, `phone_number`, `address`, `agency_id`, `user_id`, `date`) VALUES
(1, 'احمد منیر', '0792212900', '----', 2, 6, '2022-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `customers_reciepts`
--

CREATE TABLE `customers_reciepts` (
  `id` int(11) NOT NULL,
  `cus_major_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `agency_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_categories`
--

CREATE TABLE `expenses_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `agency_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `expenses_categories`
--

INSERT INTO `expenses_categories` (`id`, `name`, `agency_id`) VALUES
(1, 'برق', 2);

-- --------------------------------------------------------

--
-- Table structure for table `expenses_major`
--

CREATE TABLE `expenses_major` (
  `id` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL,
  `ex_cat_id` int(20) NOT NULL,
  `amount` float NOT NULL,
  `agency_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `expenses_major`
--

INSERT INTO `expenses_major` (`id`, `details`, `ex_cat_id`, `amount`, `agency_id`, `user_id`, `date`) VALUES
(1, '---', 1, 100, 2, 6, '2022-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `minor_units`
--

CREATE TABLE `minor_units` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(100) COLLATE utf8mb4_persian_ci NOT NULL,
  `pack_quantity` float NOT NULL,
  `kg_factor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `minor_units`
--

INSERT INTO `minor_units` (`id`, `unit_name`, `pack_quantity`, `kg_factor`) VALUES
(1, 'کیلوگرام', 1, 1),
(2, 'کارتن 5 کیلو 5 بسته یی', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rates_tb`
--

CREATE TABLE `rates_tb` (
  `id` int(11) NOT NULL,
  `agency_id` int(20) NOT NULL,
  `item_stock_minor_id` int(20) NOT NULL,
  `purchase_rate` float NOT NULL,
  `sale_rate` float NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `rates_tb`
--

INSERT INTO `rates_tb` (`id`, `agency_id`, `item_stock_minor_id`, `purchase_rate`, `sale_rate`, `date`) VALUES
(2, 2, 2, 150, 200, '2022-03-11'),
(3, 2, 3, 150, 200, '2022-03-11'),
(4, 2, 2, 150, 200, '2022-03-11'),
(5, 2, 1, 160, 210, '2022-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_major`
--

CREATE TABLE `stock_major` (
  `id` int(11) NOT NULL,
  `item_id` int(20) NOT NULL,
  `agency_id` int(20) NOT NULL,
  `amount` float NOT NULL,
  `unit_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `stock_major`
--

INSERT INTO `stock_major` (`id`, `item_id`, `agency_id`, `amount`, `unit_id`) VALUES
(1, 1, 2, 85, 1),
(2, 2, 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_minor`
--

CREATE TABLE `stock_minor` (
  `id` int(11) NOT NULL,
  `item_name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `stock_minor`
--

INSERT INTO `stock_minor` (`id`, `item_name`) VALUES
(1, 'گردن مرغ'),
(2, 'ران مرغ'),
(3, 'سینه مرغ');

-- --------------------------------------------------------

--
-- Table structure for table `stuff`
--

CREATE TABLE `stuff` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `phone_number` varchar(13) COLLATE utf8mb4_persian_ci NOT NULL,
  `agency_id` int(20) DEFAULT NULL,
  `address` text COLLATE utf8mb4_persian_ci NOT NULL,
  `image` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `stuff`
--

INSERT INTO `stuff` (`id`, `full_name`, `phone_number`, `agency_id`, `address`, `image`, `user_id`, `date`) VALUES
(6, 'احمد منیر', '0792212900', 0, '--', 'adwso-main-logo.png', 5, '2022-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` int(11) NOT NULL,
  `agency_id` int(20) NOT NULL,
  `item_name` varchar(150) COLLATE utf8mb4_persian_ci NOT NULL,
  `quantity` int(20) NOT NULL,
  `feyat` float NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`id`, `agency_id`, `item_name`, `quantity`, `feyat`, `details`, `user_id`, `date`) VALUES
(1, 2, '---', 1, 100, '---   ', 6, '2022-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_fr_agency_to_agencies_major`
--

CREATE TABLE `transfer_fr_agency_to_agencies_major` (
  `id` int(11) NOT NULL,
  `from_agency_id` int(11) NOT NULL,
  `to_agency_id` int(11) NOT NULL,
  `sender_status` char(10) COLLATE utf8mb4_persian_ci NOT NULL,
  `receiver_status` char(10) COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `transfer_fr_agency_to_agencies_major`
--

INSERT INTO `transfer_fr_agency_to_agencies_major` (`id`, `from_agency_id`, `to_agency_id`, `sender_status`, `receiver_status`, `user_id`, `date`, `details`) VALUES
(6, 2, 2, '', '', 6, '2022-03-11', ''),
(7, 2, 2, '', '', 6, '2022-03-11', ''),
(8, 2, 2, '', '', 6, '2022-03-13', '');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_fr_agency_to_agencies_minor`
--

CREATE TABLE `transfer_fr_agency_to_agencies_minor` (
  `id` int(11) NOT NULL,
  `transfer_major_id` int(50) NOT NULL,
  `item_id_stock_major` int(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `transfer_fr_agency_to_agencies_minor`
--

INSERT INTO `transfer_fr_agency_to_agencies_minor` (`id`, `transfer_major_id`, `item_id_stock_major`, `amount`, `unit_id`, `details`) VALUES
(3, 6, 1, 1, 1, ''),
(4, 7, 1, 1, 1, ''),
(5, 8, 1, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_fr_factory_to_agencies_major`
--

CREATE TABLE `transfer_fr_factory_to_agencies_major` (
  `id` int(11) NOT NULL,
  `from_agency_id` int(20) NOT NULL,
  `to_agency_id` int(20) NOT NULL,
  `sender_status` char(10) COLLATE utf8mb4_persian_ci NOT NULL,
  `receiver_status` char(10) COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `transfer_fr_factory_to_agencies_major`
--

INSERT INTO `transfer_fr_factory_to_agencies_major` (`id`, `from_agency_id`, `to_agency_id`, `sender_status`, `receiver_status`, `user_id`, `date`, `details`) VALUES
(12, 2, 2, '', '', 6, '2022-03-11', '');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_fr_factory_to_agencies_minor`
--

CREATE TABLE `transfer_fr_factory_to_agencies_minor` (
  `id` int(11) NOT NULL,
  `transfer_major_id` int(50) NOT NULL,
  `item_id_stock_minor` int(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `transfer_fr_factory_to_agencies_minor`
--

INSERT INTO `transfer_fr_factory_to_agencies_minor` (`id`, `transfer_major_id`, `item_id_stock_minor`, `amount`, `unit_id`, `details`) VALUES
(1, 12, 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_persian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_persian_ci NOT NULL,
  `authority` char(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `employee_id`, `username`, `password`, `authority`, `user_id`) VALUES
(3, 3, '2', 'Mg==', 'SuperAdmin', 0),
(4, 3, '3', 'Mw==', 'SuperAdmin', 0),
(5, 3, 'ww', 'd3c=', '3', 0),
(6, 6, 'admin', 'YWRtaW4=', '2', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_emp_01` (`agency_admin_id`),
  ADD KEY `to_user_01` (`user_id`);

--
-- Indexes for table `agencies_to_factory_reciepts`
--
ALTER TABLE `agencies_to_factory_reciepts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_01` (`agency_id`),
  ADD KEY `to_user_02` (`user_id`);

--
-- Indexes for table `agency_sale_major`
--
ALTER TABLE `agency_sale_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_customer_01` (`customer_id`),
  ADD KEY `to_agency_02` (`agency_id`),
  ADD KEY `to_user_03` (`user_id`);

--
-- Indexes for table `agency_sale_minor`
--
ALTER TABLE `agency_sale_minor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_ag_sale_major` (`sale_major_id`),
  ADD KEY `to_stock_minor` (`item_id_stock_major`),
  ADD KEY `to_unit_01` (`unit_id`);

--
-- Indexes for table `customers_major`
--
ALTER TABLE `customers_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_03` (`agency_id`),
  ADD KEY `to_user_04` (`user_id`);

--
-- Indexes for table `customers_reciepts`
--
ALTER TABLE `customers_reciepts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id_03` (`cus_major_id`),
  ADD KEY `to_agency_05` (`agency_id`),
  ADD KEY `to_user_06` (`user_id`);

--
-- Indexes for table `expenses_categories`
--
ALTER TABLE `expenses_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_07` (`agency_id`);

--
-- Indexes for table `expenses_major`
--
ALTER TABLE `expenses_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_ex` (`ex_cat_id`),
  ADD KEY `to_agency_08` (`agency_id`),
  ADD KEY `to_user_09` (`user_id`);

--
-- Indexes for table `minor_units`
--
ALTER TABLE `minor_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates_tb`
--
ALTER TABLE `rates_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_10` (`agency_id`),
  ADD KEY `to_stock_minor_id_02` (`item_stock_minor_id`);

--
-- Indexes for table `stock_major`
--
ALTER TABLE `stock_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_stock_minor_03` (`item_id`),
  ADD KEY `to_agency_11` (`agency_id`),
  ADD KEY `to_unit_id_03` (`unit_id`);

--
-- Indexes for table `stock_minor`
--
ALTER TABLE `stock_minor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stuff`
--
ALTER TABLE `stuff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_user_id_12` (`user_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_13` (`agency_id`),
  ADD KEY `to_user_id_13` (`user_id`);

--
-- Indexes for table `transfer_fr_agency_to_agencies_major`
--
ALTER TABLE `transfer_fr_agency_to_agencies_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_user_id_14` (`user_id`),
  ADD KEY `to_agency_id_14` (`from_agency_id`),
  ADD KEY `to_agency_id_15` (`to_agency_id`);

--
-- Indexes for table `transfer_fr_agency_to_agencies_minor`
--
ALTER TABLE `transfer_fr_agency_to_agencies_minor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_major_id_01` (`transfer_major_id`),
  ADD KEY `to_item_stock_major_03` (`item_id_stock_major`),
  ADD KEY `to_unit_id_15` (`unit_id`);

--
-- Indexes for table `transfer_fr_factory_to_agencies_major`
--
ALTER TABLE `transfer_fr_factory_to_agencies_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_agency_id_16` (`from_agency_id`),
  ADD KEY `to_user_id_16` (`user_id`),
  ADD KEY `to_agency_id_17` (`to_agency_id`);

--
-- Indexes for table `transfer_fr_factory_to_agencies_minor`
--
ALTER TABLE `transfer_fr_factory_to_agencies_minor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_major_id_3x` (`transfer_major_id`),
  ADD KEY `to_item_stock_minor_id_3x` (`item_id_stock_minor`),
  ADD KEY `to_unit_id_3x` (`unit_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `agencies_to_factory_reciepts`
--
ALTER TABLE `agencies_to_factory_reciepts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agency_sale_major`
--
ALTER TABLE `agency_sale_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `agency_sale_minor`
--
ALTER TABLE `agency_sale_minor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customers_major`
--
ALTER TABLE `customers_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers_reciepts`
--
ALTER TABLE `customers_reciepts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses_categories`
--
ALTER TABLE `expenses_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `expenses_major`
--
ALTER TABLE `expenses_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `minor_units`
--
ALTER TABLE `minor_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rates_tb`
--
ALTER TABLE `rates_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stock_major`
--
ALTER TABLE `stock_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stock_minor`
--
ALTER TABLE `stock_minor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `stuff`
--
ALTER TABLE `stuff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transfer_fr_agency_to_agencies_major`
--
ALTER TABLE `transfer_fr_agency_to_agencies_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transfer_fr_agency_to_agencies_minor`
--
ALTER TABLE `transfer_fr_agency_to_agencies_minor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `transfer_fr_factory_to_agencies_major`
--
ALTER TABLE `transfer_fr_factory_to_agencies_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `transfer_fr_factory_to_agencies_minor`
--
ALTER TABLE `transfer_fr_factory_to_agencies_minor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `to_emp_01` FOREIGN KEY (`agency_admin_id`) REFERENCES `stuff` (`id`),
  ADD CONSTRAINT `to_user_01` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agencies_to_factory_reciepts`
--
ALTER TABLE `agencies_to_factory_reciepts`
  ADD CONSTRAINT `to_agency_01` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_02` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agency_sale_major`
--
ALTER TABLE `agency_sale_major`
  ADD CONSTRAINT `to_agency_02` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_customer_01` FOREIGN KEY (`customer_id`) REFERENCES `customers_major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_03` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agency_sale_minor`
--
ALTER TABLE `agency_sale_minor`
  ADD CONSTRAINT `to_ag_sale_major` FOREIGN KEY (`sale_major_id`) REFERENCES `agency_sale_major` (`id`),
  ADD CONSTRAINT `to_stock_minor` FOREIGN KEY (`item_id_stock_major`) REFERENCES `stock_minor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_unit_01` FOREIGN KEY (`unit_id`) REFERENCES `minor_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customers_major`
--
ALTER TABLE `customers_major`
  ADD CONSTRAINT `to_agency_03` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_04` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customers_reciepts`
--
ALTER TABLE `customers_reciepts`
  ADD CONSTRAINT `customer_id_03` FOREIGN KEY (`cus_major_id`) REFERENCES `customers_major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_agency_05` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_06` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`);

--
-- Constraints for table `expenses_categories`
--
ALTER TABLE `expenses_categories`
  ADD CONSTRAINT `to_agency_07` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_major`
--
ALTER TABLE `expenses_major`
  ADD CONSTRAINT `to_agency_08` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_ex` FOREIGN KEY (`ex_cat_id`) REFERENCES `expenses_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_user_09` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`);

--
-- Constraints for table `rates_tb`
--
ALTER TABLE `rates_tb`
  ADD CONSTRAINT `to_agency_10` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_stock_minor_id_02` FOREIGN KEY (`item_stock_minor_id`) REFERENCES `stock_minor` (`id`);

--
-- Constraints for table `stock_major`
--
ALTER TABLE `stock_major`
  ADD CONSTRAINT `to_agency_11` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_stock_minor_03` FOREIGN KEY (`item_id`) REFERENCES `stock_minor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_unit_id_03` FOREIGN KEY (`unit_id`) REFERENCES `minor_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stuff`
--
ALTER TABLE `stuff`
  ADD CONSTRAINT `to_user_id_12` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `to_agency_13` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_id_13` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transfer_fr_agency_to_agencies_major`
--
ALTER TABLE `transfer_fr_agency_to_agencies_major`
  ADD CONSTRAINT `to_agency_id_14` FOREIGN KEY (`from_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_agency_id_15` FOREIGN KEY (`to_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_id_14` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transfer_fr_agency_to_agencies_minor`
--
ALTER TABLE `transfer_fr_agency_to_agencies_minor`
  ADD CONSTRAINT `to_item_stock_major_03` FOREIGN KEY (`item_id_stock_major`) REFERENCES `stock_minor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_unit_id_15` FOREIGN KEY (`unit_id`) REFERENCES `minor_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transfer_major_id_01` FOREIGN KEY (`transfer_major_id`) REFERENCES `transfer_fr_agency_to_agencies_major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfer_fr_factory_to_agencies_major`
--
ALTER TABLE `transfer_fr_factory_to_agencies_major`
  ADD CONSTRAINT `to_agency_id_16` FOREIGN KEY (`from_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_agency_id_17` FOREIGN KEY (`to_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_user_id_16` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transfer_fr_factory_to_agencies_minor`
--
ALTER TABLE `transfer_fr_factory_to_agencies_minor`
  ADD CONSTRAINT `to_item_stock_minor_id_3x` FOREIGN KEY (`item_id_stock_minor`) REFERENCES `stock_minor` (`id`),
  ADD CONSTRAINT `to_unit_id_3x` FOREIGN KEY (`unit_id`) REFERENCES `minor_units` (`id`),
  ADD CONSTRAINT `transfer_major_id_3x` FOREIGN KEY (`transfer_major_id`) REFERENCES `transfer_fr_factory_to_agencies_major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
