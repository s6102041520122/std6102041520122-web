-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2019 at 07:50 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `std6102041520122`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `branch_no` varchar(10) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `client_no` varchar(10) NOT NULL,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `pref_type` varchar(50) DEFAULT NULL,
  `max_rent` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1555085758),
('m130524_201442_init', 1555085761),
('m190124_110200_add_verification_token_column_to_user_table', 1555085761),
('m190412_161616_create_branch_table', 1555087809),
('m190412_161625_create_staff_table', 1555088235),
('m190412_165926_create_private_owner_table', 1555088535),
('m190412_170317_create_property_for_rent_table', 1555089141),
('m190412_170329_create_client_table', 1555089141),
('m190412_170341_create_viewing_table', 1555089141),
('m190412_170353_create_registration_table', 1555089141);

-- --------------------------------------------------------

--
-- Table structure for table `private_owner`
--

CREATE TABLE `private_owner` (
  `id` int(11) NOT NULL,
  `owner_no` varchar(10) NOT NULL,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `property_for_rent`
--

CREATE TABLE `property_for_rent` (
  `id` int(11) NOT NULL,
  `property_no` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `rooms` int(5) DEFAULT NULL,
  `rent` decimal(7,2) DEFAULT NULL,
  `owner_id` varchar(10) NOT NULL,
  `staff_id` varchar(10) DEFAULT NULL,
  `branch_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `property_id` varchar(10) NOT NULL,
  `date_joined` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_no` varchar(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `position` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `branch_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', 'k38RLNMa9GPucDqtxM6t_DPU8_U1VDaj', '$2y$13$Dqg0Y7Yb0jjjfJ2gmW/gk.EYRzTMaokW1qaust7mE4LSqz.Ii19EC', NULL, 'rattawan.tr@gmail.com', 10, 1555089239, 1555089239, '3AOEnif4dJeKlXdTpH58NQ9zLua_OcnJ_1555089239');

-- --------------------------------------------------------

--
-- Table structure for table `viewing`
--

CREATE TABLE `viewing` (
  `id` int(11) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `property_id` varchar(10) NOT NULL,
  `view_date` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch_no` (`branch_no`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_no` (`client_no`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `private_owner`
--
ALTER TABLE `private_owner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owner_no` (`owner_no`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `property_for_rent`
--
ALTER TABLE `property_for_rent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_no` (`property_no`),
  ADD UNIQUE KEY `owner_id` (`owner_id`),
  ADD UNIQUE KEY `branch_id` (`branch_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD UNIQUE KEY `property_id` (`property_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_no` (`staff_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `viewing`
--
ALTER TABLE `viewing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD UNIQUE KEY `property_id` (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `private_owner`
--
ALTER TABLE `private_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_for_rent`
--
ALTER TABLE `property_for_rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewing`
--
ALTER TABLE `viewing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
