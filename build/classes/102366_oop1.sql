-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 11, 2018 at 07:00 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `102366_oop1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `CaseID` int(11) NOT NULL,
  `CaseDetails` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CaseNo` int(11) NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CaseStatemnt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IncidentStatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `officers`
--

CREATE TABLE `officers` (
  `OfficerID` int(11) NOT NULL,
  `OfficerPassword` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `officers`
--

INSERT INTO `officers` (`OfficerID`, `OfficerPassword`) VALUES
(0, 'Mshamba2#'),
(0, 'Mshamba2#');

-- --------------------------------------------------------

--
-- Table structure for table `officerwindow`
--

CREATE TABLE `officerwindow` (
  `OfficerID` int(11) NOT NULL,
  `CASEID` int(11) NOT NULL,
  `CaseDetails` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CaseComments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supervisorswindow`
--

CREATE TABLE `supervisorswindow` (
  `CASEID` int(11) NOT NULL,
  `FirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CaseComments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddOfficer` int(11) DEFAULT NULL,
  `TerminateOfficer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(255) NOT NULL,
  `BadgeID` int(255) NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Division` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `BadgeID`, `Password`, `Division`) VALUES
(1, 0, 'mshamba', 'Police(O.C)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`CaseID`),
  ADD KEY `CaseID` (`CaseNo`);

--
-- Indexes for table `officerwindow`
--
ALTER TABLE `officerwindow`
  ADD UNIQUE KEY `OfficerID` (`OfficerID`),
  ADD KEY `CASEID` (`CASEID`);

--
-- Indexes for table `supervisorswindow`
--
ALTER TABLE `supervisorswindow`
  ADD KEY `CASEID` (`CASEID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`BadgeID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `CaseID` FOREIGN KEY (`CaseNo`) REFERENCES `cases` (`CaseID`) ON UPDATE CASCADE;

--
-- Constraints for table `supervisorswindow`
--
ALTER TABLE `supervisorswindow`
  ADD CONSTRAINT `TerminateOfficer` FOREIGN KEY (`CASEID`) REFERENCES `officerwindow` (`OfficerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
