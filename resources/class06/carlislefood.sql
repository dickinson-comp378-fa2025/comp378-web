-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2022 at 04:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carlislefood`
--

-- --------------------------------------------------------

--
-- Table structure for table `allinfo`
--

CREATE TABLE `allinfo` (
  `item_code` varchar(9) NOT NULL,
  `item_name` varchar(18) DEFAULT NULL,
  `restaurant_code` varchar(15) NOT NULL,
  `restaurant_name` varchar(15) DEFAULT NULL,
  `restaurant_address` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `allinfo`
--

INSERT INTO `allinfo` (`item_code`, `item_name`, `restaurant_code`, `restaurant_name`, `restaurant_address`) VALUES
('18', 'pad thai', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
('18', 'ebi tempura', 'MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013'),
('18V', 'vegetable pad thai', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
('23', 'temaki dinner', 'MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013'),
('6', 'miso ramen', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
('8', 'tantan ramen', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
('D4', 'mabo tofu', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_code` varchar(9) NOT NULL,
  `item_name` varchar(18) DEFAULT NULL,
  `restaurant_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_code`, `item_name`, `restaurant_code`) VALUES
('18', 'pad thai', 'IC'),
('18', 'ebi tempura', 'MF'),
('18V', 'vegetable pad thai', 'IC'),
('23', 'temaki dinner', 'MF'),
('6', 'miso ramen', 'IC'),
('8', 'tantan ramen', 'IC'),
('D4', 'mabo tofu', 'IC');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_code` varchar(15) NOT NULL,
  `restaurant_name` varchar(15) DEFAULT NULL,
  `restaurant_address` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_code`, `restaurant_name`, `restaurant_address`) VALUES
('IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
('MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allinfo`
--
ALTER TABLE `allinfo`
  ADD PRIMARY KEY (`item_code`,`restaurant_code`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_code`,`restaurant_code`),
  ADD KEY `restaurant_FK` (`restaurant_code`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `restaurant_FK` FOREIGN KEY (`restaurant_code`) REFERENCES `restaurants` (`restaurant_code`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
