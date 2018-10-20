-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2018 at 11:55 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_tnp_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_details`
--

CREATE TABLE `academic_details` (
  `id` varchar(100) NOT NULL,
  `s_bname` varchar(100) NOT NULL,
  `s_year` varchar(10) NOT NULL,
  `s_marks` int(11) NOT NULL,
  `s_outof` int(11) NOT NULL,
  `s_per` float NOT NULL,
  `h_bname` varchar(100) DEFAULT NULL,
  `h_year` varchar(100) DEFAULT NULL,
  `h_marks` int(11) DEFAULT NULL,
  `h_outof` int(11) DEFAULT NULL,
  `h_per` float DEFAULT NULL,
  `d_bname` varchar(100) DEFAULT NULL,
  `d_year` varchar(10) DEFAULT NULL,
  `d_marks` int(11) DEFAULT NULL,
  `d_outof` int(11) DEFAULT NULL,
  `d_per` float DEFAULT NULL,
  `cap` varchar(3) NOT NULL,
  `d_holder` varchar(3) NOT NULL,
  `CET` int(11) DEFAULT NULL,
  `pcm` int(11) DEFAULT NULL,
  `d_branch` varchar(50) DEFAULT NULL,
  `d_college` varchar(100) DEFAULT NULL,
  `gap` int(11) DEFAULT NULL,
  `e_branch` varchar(15) NOT NULL,
  `e_year` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `engineering_be_details`
--

CREATE TABLE `engineering_be_details` (
  `id` varchar(100) NOT NULL,
  `admitted_year` varchar(10) DEFAULT NULL,
  `passed_year` varchar(10) DEFAULT NULL,
  `sem1` float DEFAULT NULL,
  `sem2` float DEFAULT NULL,
  `cgpa` float DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `engineering_fe_details`
--

CREATE TABLE `engineering_fe_details` (
  `id` varchar(100) NOT NULL,
  `admitted_year` varchar(10) DEFAULT NULL,
  `passed_year` varchar(10) DEFAULT NULL,
  `sem1` varchar(6) DEFAULT NULL,
  `sem2` varchar(6) DEFAULT NULL,
  `cgpa` varchar(6) DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `engineering_se_details`
--

CREATE TABLE `engineering_se_details` (
  `id` varchar(100) NOT NULL,
  `admitted_year` varchar(10) DEFAULT NULL,
  `passed_year` varchar(10) DEFAULT NULL,
  `sem1` varchar(6) DEFAULT NULL,
  `sem2` varchar(6) DEFAULT NULL,
  `cgpa` varchar(6) DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `engineering_te_details`
--

CREATE TABLE `engineering_te_details` (
  `id` varchar(100) NOT NULL,
  `admitted_year` varchar(10) DEFAULT NULL,
  `passed_year` varchar(10) DEFAULT NULL,
  `sem1` varchar(6) DEFAULT NULL,
  `sem2` varchar(6) DEFAULT NULL,
  `cgpa` varchar(6) DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_details`
--

CREATE TABLE `personal_details` (
  `id` varchar(100) NOT NULL,
  `s_first_name` varchar(50) NOT NULL,
  `s_middle_name` varchar(50) NOT NULL,
  `s_last_name` varchar(50) NOT NULL,
  `f_first_name` varchar(50) NOT NULL,
  `f_middle_name` varchar(50) NOT NULL,
  `f_last_name` varchar(50) NOT NULL,
  `dob` varchar(25) NOT NULL,
  `line1` varchar(500) NOT NULL,
  `line2` varchar(500) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `taluka` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL,
  `s_mobile` varchar(15) NOT NULL,
  `p_mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement_records`
--

CREATE TABLE `placement_records` (
  `c_name` varchar(150) NOT NULL,
  `comp` int(11) NOT NULL,
  `it` int(11) NOT NULL,
  `mech` int(11) NOT NULL,
  `civil` int(11) NOT NULL,
  `elec` int(11) NOT NULL,
  `etc` int(11) NOT NULL,
  `total_selected` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `v_date` varchar(25) DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  `placement_year` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recent_news`
--

CREATE TABLE `recent_news` (
  `news_id` varchar(10) NOT NULL,
  `news_title` varchar(500) NOT NULL,
  `news_descr` varchar(4000) DEFAULT NULL,
  `news_link` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `credential` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `credential`) VALUES
('rcpAdmin', '123', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_details`
--
ALTER TABLE `academic_details`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `engineering_be_details`
--
ALTER TABLE `engineering_be_details`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `engineering_fe_details`
--
ALTER TABLE `engineering_fe_details`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `engineering_se_details`
--
ALTER TABLE `engineering_se_details`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `engineering_te_details`
--
ALTER TABLE `engineering_te_details`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_news`
--
ALTER TABLE `recent_news`
  ADD UNIQUE KEY `news_id` (`news_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
