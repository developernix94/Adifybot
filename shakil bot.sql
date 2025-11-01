-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 03, 2025 at 03:40 PM
-- Server version: 10.11.11-MariaDB
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digital24_telegrambot`
--

-- --------------------------------------------------------

--
-- Table structure for table `shakil`
--

CREATE TABLE `shakil` (
  `id` int(11) NOT NULL,
  `first_name` int(11) NOT NULL,
  `last_name` int(11) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tg_tasks`
--

CREATE TABLE `tg_tasks` (
  `id` int(11) NOT NULL,
  `channel_username` varchar(255) NOT NULL,
  `reward_amount` decimal(10,2) NOT NULL,
  `join_link` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tg_tasks`
--

INSERT INTO `tg_tasks` (`id`, `channel_username`, `reward_amount`, `join_link`, `is_active`) VALUES
(1, '@psupdateLAB', 10.00, 'https://t.me/psupdateLAB', 1),
(2, '@psupdateLAB', 10.00, 'https://t.me/psupdateLAB', 1),
(3, '@psupdateLAB', 10.00, 'https://t.me/@psupdateLAB', 1),
(4, '@psupdateLAB', 40.00, 'https://t.me/psupdateLAB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `telegram_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `earnings` decimal(10,2) DEFAULT 0.00,
  `tasks` int(11) DEFAULT 0,
  `referral` decimal(10,2) DEFAULT 0.00,
  `checkin_day` int(11) DEFAULT 0,
  `last_checkin` date DEFAULT NULL,
  `referred_by` bigint(20) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `joined_at` timestamp NULL DEFAULT current_timestamp(),
  `last_claimed_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `telegram_id`, `first_name`, `username`, `balance`, `earnings`, `tasks`, `referral`, `checkin_day`, `last_checkin`, `referred_by`, `photo`, `joined_at`, `last_claimed_at`) VALUES
(5, 885537235, 'à¦¶à¦¾à¦•à¦¿à¦²', 'Survey1212', 0.00, 0.00, 0, 0.00, 0, NULL, 0, 'https://api.telegram.org/file/bot7937408258:AAG0SwVVa3JYEGKGOabuL8xE0v2uDtv-DT4/photos/file_0.jpg', '2025-08-03 09:22:04', NULL),
(6, 5445329168, 'ðˆ ð€ðŒ ð’ð‡ð€ðŠðˆð‹', 'DeveloperSHAKIL', 0.00, 0.00, 0, 0.00, 0, NULL, 885537235, 'https://api.telegram.org/file/bot7937408258:AAG0SwVVa3JYEGKGOabuL8xE0v2uDtv-DT4/photos/file_1.jpg', '2025-08-03 09:22:50', NULL),
(7, 2109646968, 'ê§à¼†â„›Õ â……â„°á‰â„°â„’âŒ¾â„™â„°â„› ðŸ«¥ ðŸ‡¦ðŸ‡ª', 'Rs_developer123', 0.00, 0.00, 0, 0.00, 0, NULL, 5445329168, 'https://api.telegram.org/file/bot7937408258:AAG0SwVVa3JYEGKGOabuL8xE0v2uDtv-DT4/photos/file_2.jpg', '2025-08-03 09:39:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_completed_tg_tasks`
--

CREATE TABLE `user_completed_tg_tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `completed_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `method` varchar(50) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `requested_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tg_tasks`
--
ALTER TABLE `tg_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_id` (`telegram_id`);

--
-- Indexes for table `user_completed_tg_tasks`
--
ALTER TABLE `user_completed_tg_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_task_unique` (`user_id`,`task_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tg_tasks`
--
ALTER TABLE `tg_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_completed_tg_tasks`
--
ALTER TABLE `user_completed_tg_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
