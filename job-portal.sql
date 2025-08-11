-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2025 at 08:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `generated_cv_data` text DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','reviewed','selected','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `employee_id`, `cv_path`, `generated_cv_data`, `cover_letter`, `applied_at`, `status`) VALUES
(7, 3, 5, '../uploads/cvs/cv_5_1754916140.pdf', NULL, '', '2025-08-11 12:42:20', 'selected');

-- --------------------------------------------------------

--
-- Table structure for table `cv_downloads`
--

CREATE TABLE `cv_downloads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `download_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `cv_type` enum('uploaded','generated') NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_cvs`
--

CREATE TABLE `employee_cvs` (
  `employee_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `projects` text DEFAULT NULL,
  `languages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_cvs`
--

INSERT INTO `employee_cvs` (`employee_id`, `full_name`, `profession`, `email`, `phone`, `address`, `profile_pic`, `about`, `education`, `experience`, `skills`, `projects`, `languages`) VALUES
(5, 'Shahmaruf Mugdho', 'ss', 'ssmugdho@hotmail.com', '01758551245', 'House 65, Yousuf Villa, 2 floor\r\nD block Road 04 Boro mosjid', '../uploads/cv_images/profile_5.jpg', 'ss', 'ss', 'ss', 'ss', 'ss', 'ss ss');

-- --------------------------------------------------------

--
-- Table structure for table `employee_profiles`
--

CREATE TABLE `employee_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `cv_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_profiles`
--

INSERT INTO `employee_profiles` (`id`, `user_id`, `first_name`, `last_name`, `phone`, `address`, `bio`, `skills`, `education`, `experience`, `cv_path`) VALUES
(1, 3, 'Faiaz', 'Islam', '0251252515', 'Basundhara R/A', 'Bsc Undergraduate', 'HTML,CSS,Javascript React, NodeJs', 'BSC in CSE', '2 Years', ''),
(2, 5, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '../uploads/cvs/cv_5_1754916140.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `employer_profiles`
--

CREATE TABLE `employer_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_description` text DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employer_profiles`
--

INSERT INTO `employer_profiles` (`id`, `user_id`, `company_name`, `company_description`, `company_website`, `contact_person`, `contact_phone`) VALUES
(2, 2, 'AquaPharma', 'Medicine', 'www.aquapharma.com', 'Abrar', '01471452485'),
(3, 4, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL,
  `location` varchar(100) NOT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `type` enum('Full-time','Part-time','Contract','Internship') NOT NULL,
  `category` varchar(50) NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deadline` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `employer_id`, `company_name`, `title`, `description`, `requirements`, `location`, `salary`, `type`, `category`, `posted_at`, `deadline`, `is_active`) VALUES
(1, 2, 'Aqua Pharma', 'Frontend Developer', 'Need 2 years of Experience', 'HTML,CSS,JAVASCRIPT', 'Dhanmondi', '25000', 'Full-time', 'Web development', '2025-08-05 12:15:07', '2025-08-30', 1),
(2, 2, 'Daraz', 'JAVA Developer', 'abc', 'abc', 'Dhaka, Bangladesh', '12', 'Full-time', '2', '2025-08-09 15:53:22', '2025-08-31', 1),
(3, 4, 'Robi', 'Python Developer', 'xyz', 'Django, Rest API, MongoDB', 'Dhaka, Bangladesh', '12000', 'Part-time', 'Web development', '2025-08-10 12:34:00', '2025-09-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','employer','employee') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'abc', 'abc@gmail.com', 'abc', 'admin', '2025-08-05 12:12:11', '2025-08-05 12:12:11'),
(2, 'Abrar', 'Abrar@gmail.com', 'abrar', 'employer', '2025-08-05 12:12:54', '2025-08-05 12:12:54'),
(3, 'Faiaz', 'faiaz@gmail.com', 'faiaz', 'employee', '2025-08-05 12:13:24', '2025-08-05 12:13:24'),
(4, 'shah', 'shahmarufsirajmugdho@gmail.com', 'halabrazil', 'employer', '2025-08-10 11:00:33', '2025-08-10 11:00:33'),
(5, 'mugdho', 'ss@gmail.com', 'halabrazil', 'employee', '2025-08-10 14:41:00', '2025-08-10 14:41:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_application` (`job_id`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `cv_downloads`
--
ALTER TABLE `cv_downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employee_cvs`
--
ALTER TABLE `employee_cvs`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employer_profiles`
--
ALTER TABLE `employer_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_id` (`employer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cv_downloads`
--
ALTER TABLE `cv_downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_profiles`
--
ALTER TABLE `employer_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cv_downloads`
--
ALTER TABLE `cv_downloads`
  ADD CONSTRAINT `cv_downloads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_cvs`
--
ALTER TABLE `employee_cvs`
  ADD CONSTRAINT `employee_cvs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_profiles` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD CONSTRAINT `employee_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employer_profiles`
--
ALTER TABLE `employer_profiles`
  ADD CONSTRAINT `employer_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
