-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2018 at 04:27 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt_crms`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `Admin_ID` decimal(6,0) NOT NULL,
  `Admin_NID` decimal(8,0) DEFAULT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Rank` varchar(20) DEFAULT NULL,
  `Office_Address` varchar(35) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Job_Joining_Date` date DEFAULT NULL,
  `Job_Termination_Date` date DEFAULT NULL,
  `Job_Status` varchar(15) DEFAULT NULL,
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `Current_Address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_contact_number`
--

DROP TABLE IF EXISTS `admin_contact_number`;
CREATE TABLE `admin_contact_number` (
  `Admin_Contact_Numb` int(11) NOT NULL,
  `Admin_ID` decimal(6,0) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_credential`
--

DROP TABLE IF EXISTS `admin_login_credential`;
CREATE TABLE `admin_login_credential` (
  `Admin_username` varchar(35) NOT NULL,
  `Admin_ID` decimal(6,0) DEFAULT NULL,
  `Admin_password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_oc_supervision_records`
--

DROP TABLE IF EXISTS `admin_oc_supervision_records`;
CREATE TABLE `admin_oc_supervision_records` (
  `AD_OC_SuR_Code` int(11) NOT NULL,
  `Admin_ID` decimal(6,0) DEFAULT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL,
  `Supervision_Start_Date` date DEFAULT NULL,
  `Supervision_Finish_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `Area_Code` int(11) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `District` varchar(25) DEFAULT NULL,
  `Division` varchar(25) DEFAULT NULL,
  `Station_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `convict`
--

DROP TABLE IF EXISTS `convict`;
CREATE TABLE `convict` (
  `Convict_NID` decimal(8,0) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Designation` varchar(20) DEFAULT NULL,
  `Office_Address` varchar(35) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `convict_contact_number`
--

DROP TABLE IF EXISTS `convict_contact_number`;
CREATE TABLE `convict_contact_number` (
  `Convict_Contact_Numb` int(11) NOT NULL,
  `Convict_NID` decimal(8,6) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `convict_temporary_address`
--

DROP TABLE IF EXISTS `convict_temporary_address`;
CREATE TABLE `convict_temporary_address` (
  `Con_Tmp_Add_Code` int(11) NOT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `convict_temp_address_records`
--

DROP TABLE IF EXISTS `convict_temp_address_records`;
CREATE TABLE `convict_temp_address_records` (
  `Con_Tmp_AddRec_Code` int(11) NOT NULL,
  `Convict_NID` decimal(8,6) DEFAULT NULL,
  `Con_Tmp_Add_Code` int(11) DEFAULT NULL,
  `Living_Start` date DEFAULT NULL,
  `Living_End` date DEFAULT NULL,
  `Area_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fir`
--

DROP TABLE IF EXISTS `fir`;
CREATE TABLE `fir` (
  `FIR_Code` int(11) NOT NULL,
  `FIR_date` date DEFAULT NULL,
  `Details` varchar(500) DEFAULT NULL,
  `Crimes` varchar(200) DEFAULT NULL,
  `Station_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fir`
--

INSERT INTO `fir` (`FIR_Code`, `FIR_date`, `Details`, `Crimes`, `Station_Code`) VALUES
(1, '2018-05-17', 'Code', NULL, 105),
(2, '2018-05-17', 'Road', NULL, 105),
(3, '2018-05-17', 'Topple', NULL, 105),
(4, '2018-05-17', 'RadioHead', NULL, 105),
(5, '2018-05-17', 'Caught', NULL, 105);

-- --------------------------------------------------------

--
-- Table structure for table `fir_convict_records`
--

DROP TABLE IF EXISTS `fir_convict_records`;
CREATE TABLE `fir_convict_records` (
  `FIR_ConR_Code` int(11) NOT NULL,
  `Convict_NID` decimal(8,0) DEFAULT NULL,
  `FIR_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fir_oc_io_assignment_records`
--

DROP TABLE IF EXISTS `fir_oc_io_assignment_records`;
CREATE TABLE `fir_oc_io_assignment_records` (
  `FIR_IO_AssR_Code` int(11) NOT NULL,
  `FIR_Code` int(11) DEFAULT NULL,
  `IO_ID` decimal(6,0) DEFAULT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fir_suspect_records`
--

DROP TABLE IF EXISTS `fir_suspect_records`;
CREATE TABLE `fir_suspect_records` (
  `FIR_SusR_Code` int(11) NOT NULL,
  `Suspect_NID` decimal(8,6) DEFAULT NULL,
  `FIR_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fir_victim_records`
--

DROP TABLE IF EXISTS `fir_victim_records`;
CREATE TABLE `fir_victim_records` (
  `FIR_ViR_Code` int(11) NOT NULL,
  `Victim_NID` decimal(8,0) DEFAULT NULL,
  `FIR_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fir_victim_records`
--

INSERT INTO `fir_victim_records` (`FIR_ViR_Code`, `Victim_NID`, `FIR_Code`) VALUES
(1, '1236', 1),
(2, '1236', 2),
(3, '1234', 3),
(4, '1234', 4),
(5, '1234', 5);

-- --------------------------------------------------------

--
-- Table structure for table `investigaton_officer`
--

DROP TABLE IF EXISTS `investigaton_officer`;
CREATE TABLE `investigaton_officer` (
  `IO_ID` decimal(6,0) NOT NULL,
  `IO_NID` decimal(8,0) DEFAULT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Rank` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Job_Joining_Date` date DEFAULT NULL,
  `Job_termination_Date` date DEFAULT NULL,
  `Job_Status` varchar(15) DEFAULT NULL,
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `Current_Address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `io_contact_number`
--

DROP TABLE IF EXISTS `io_contact_number`;
CREATE TABLE `io_contact_number` (
  `IO_Contact_Numb` int(11) NOT NULL,
  `IO_ID` decimal(6,0) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `io_login_credential`
--

DROP TABLE IF EXISTS `io_login_credential`;
CREATE TABLE `io_login_credential` (
  `IO_username` varchar(35) NOT NULL,
  `IO_ID` decimal(6,0) DEFAULT NULL,
  `IO_password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oc_contact_number`
--

DROP TABLE IF EXISTS `oc_contact_number`;
CREATE TABLE `oc_contact_number` (
  `OC_Contact_Numb` int(11) NOT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oc_io_supervision_records`
--

DROP TABLE IF EXISTS `oc_io_supervision_records`;
CREATE TABLE `oc_io_supervision_records` (
  `OC_IO_SuR_Code` int(11) NOT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL,
  `IO_ID` decimal(6,0) DEFAULT NULL,
  `Supervision_Start_Date` date DEFAULT NULL,
  `Supervision_Finish_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oc_login_credential`
--

DROP TABLE IF EXISTS `oc_login_credential`;
CREATE TABLE `oc_login_credential` (
  `OC_username` varchar(35) NOT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL,
  `OC_password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `officer_in_charge`
--

DROP TABLE IF EXISTS `officer_in_charge`;
CREATE TABLE `officer_in_charge` (
  `OC_ID` decimal(6,0) NOT NULL,
  `OC_NID` decimal(8,0) DEFAULT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Rank` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Job_Joining_Date` date DEFAULT NULL,
  `Job_termination_Date` date DEFAULT NULL,
  `Job_Status` varchar(15) DEFAULT NULL,
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `Current_Address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `police_station`
--

DROP TABLE IF EXISTS `police_station`;
CREATE TABLE `police_station` (
  `Station_Code` int(11) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Employee_Number` int(11) DEFAULT NULL,
  `Address` varchar(35) DEFAULT NULL,
  `Cell_Capacity` int(11) DEFAULT NULL,
  `Current_Status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `police_station`
--

INSERT INTO `police_station` (`Station_Code`, `Name`, `Employee_Number`, `Address`, `Cell_Capacity`, `Current_Status`) VALUES
(101, 'Dhanmondi Police Station', 25, '52, Dhanmondi', 25, 'Active'),
(105, 'Kafrul', 35, '66, Kafrul', 19, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `station_admin_io_assignment_records`
--

DROP TABLE IF EXISTS `station_admin_io_assignment_records`;
CREATE TABLE `station_admin_io_assignment_records` (
  `St_AD_IO_AssR_Code` int(11) NOT NULL,
  `Admin_ID` decimal(6,0) DEFAULT NULL,
  `IO_ID` decimal(6,0) DEFAULT NULL,
  `Station_Code` int(11) DEFAULT NULL,
  `Assignment_Start_Date` date DEFAULT NULL,
  `Assignment_Finish_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station_admin_oc_assignment_records`
--

DROP TABLE IF EXISTS `station_admin_oc_assignment_records`;
CREATE TABLE `station_admin_oc_assignment_records` (
  `St_AD_OC_AssR_Code` int(11) NOT NULL,
  `Admin_ID` decimal(6,0) DEFAULT NULL,
  `OC_ID` decimal(6,0) DEFAULT NULL,
  `Station_Code` int(11) DEFAULT NULL,
  `Assignment_Start_Date` date DEFAULT NULL,
  `Assignment_Finish_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspect`
--

DROP TABLE IF EXISTS `suspect`;
CREATE TABLE `suspect` (
  `Suspect_NID` decimal(8,0) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Designation` varchar(20) DEFAULT NULL,
  `Office_Address` varchar(35) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspect_contact_number`
--

DROP TABLE IF EXISTS `suspect_contact_number`;
CREATE TABLE `suspect_contact_number` (
  `Suspect_Contact_Numb` int(11) NOT NULL,
  `Suspect_NID` decimal(8,6) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspect_temporary_address`
--

DROP TABLE IF EXISTS `suspect_temporary_address`;
CREATE TABLE `suspect_temporary_address` (
  `Sus_Tmp_Add_Code` int(11) NOT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suspect_temp_address_records`
--

DROP TABLE IF EXISTS `suspect_temp_address_records`;
CREATE TABLE `suspect_temp_address_records` (
  `Sus_Tmp_AddRec_Code` int(11) NOT NULL,
  `Suspect_NID` decimal(8,6) DEFAULT NULL,
  `Sus_Tmp_Add_Code` int(11) DEFAULT NULL,
  `Living_Start` date DEFAULT NULL,
  `Living_End` date DEFAULT NULL,
  `Area_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

DROP TABLE IF EXISTS `victim`;
CREATE TABLE `victim` (
  `Victim_NID` decimal(8,0) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Occupation` varchar(20) DEFAULT 'Police',
  `Designation` varchar(20) DEFAULT NULL,
  `Office_Address` varchar(35) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'Male',
  `Permanent_Address` varchar(35) DEFAULT NULL,
  `current_Address` varchar(50) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `victim`
--

INSERT INTO `victim` (`Victim_NID`, `Name`, `Occupation`, `Designation`, `Office_Address`, `email`, `Birth_Date`, `sex`, `Permanent_Address`, `current_Address`, `Comments`) VALUES
('1234', 'Kamran Shorif', 'Student', '', 'Malibagh', 'himelmazumder@outloo', '1995-05-14', 'Male', 'Barishal', 'Maniknagar', NULL),
('1235', 'Rohit Sharma', 'Journalist', 'Staff Reporter', 'Paltan', 'himelmazumder@gmail.', '1990-05-09', 'Male', 'Khulna', 'Malibagh', NULL),
('1236', 'Kader Alom', '', '', '', 'himelmazumder01@gmai', '1985-05-03', 'Male', 'Rajshahi', 'Natun Bazar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `victim_contact_number`
--

DROP TABLE IF EXISTS `victim_contact_number`;
CREATE TABLE `victim_contact_number` (
  `Victim_Contact_Numb` int(11) NOT NULL,
  `Victim_NID` decimal(8,0) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `victim_contact_number`
--

INSERT INTO `victim_contact_number` (`Victim_Contact_Numb`, `Victim_NID`, `Type`) VALUES
(256314, '1234', 'home'),
(321456, '1235', 'home'),
(789654, '1235', 'home'),
(956874, '1236', 'office');

-- --------------------------------------------------------

--
-- Table structure for table `victim_login_credential`
--

DROP TABLE IF EXISTS `victim_login_credential`;
CREATE TABLE `victim_login_credential` (
  `victim_username` varchar(35) NOT NULL,
  `victim_NID` decimal(8,0) DEFAULT NULL,
  `victim_password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `victim_login_credential`
--

INSERT INTO `victim_login_credential` (`victim_username`, `victim_NID`, `victim_password`) VALUES
('KAlom', '1236', '6253'),
('ksharif', '1234', '1234'),
('RSharma', '1235', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `victim_temporary_address`
--

DROP TABLE IF EXISTS `victim_temporary_address`;
CREATE TABLE `victim_temporary_address` (
  `Vi_Tmp_Add_Code` int(11) NOT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `victim_temp_address_records`
--

DROP TABLE IF EXISTS `victim_temp_address_records`;
CREATE TABLE `victim_temp_address_records` (
  `Vi_Tmp_AddRec_Code` int(11) NOT NULL,
  `Victim_NID` decimal(8,0) DEFAULT NULL,
  `Vi_Tmp_Add_Code` int(11) DEFAULT NULL,
  `Living_Start` date DEFAULT NULL,
  `Living_End` date DEFAULT NULL,
  `Area_Code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `admin_contact_number`
--
ALTER TABLE `admin_contact_number`
  ADD PRIMARY KEY (`Admin_Contact_Numb`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `admin_login_credential`
--
ALTER TABLE `admin_login_credential`
  ADD PRIMARY KEY (`Admin_username`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `admin_oc_supervision_records`
--
ALTER TABLE `admin_oc_supervision_records`
  ADD PRIMARY KEY (`AD_OC_SuR_Code`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `OC_ID` (`OC_ID`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`Area_Code`),
  ADD KEY `Station_Code` (`Station_Code`);

--
-- Indexes for table `convict`
--
ALTER TABLE `convict`
  ADD PRIMARY KEY (`Convict_NID`);

--
-- Indexes for table `convict_contact_number`
--
ALTER TABLE `convict_contact_number`
  ADD PRIMARY KEY (`Convict_Contact_Numb`),
  ADD KEY `Convict_NID` (`Convict_NID`);

--
-- Indexes for table `convict_temporary_address`
--
ALTER TABLE `convict_temporary_address`
  ADD PRIMARY KEY (`Con_Tmp_Add_Code`);

--
-- Indexes for table `convict_temp_address_records`
--
ALTER TABLE `convict_temp_address_records`
  ADD PRIMARY KEY (`Con_Tmp_AddRec_Code`),
  ADD KEY `Convict_NID` (`Convict_NID`),
  ADD KEY `Con_Tmp_Add_Code` (`Con_Tmp_Add_Code`),
  ADD KEY `Area_Code` (`Area_Code`);

--
-- Indexes for table `fir`
--
ALTER TABLE `fir`
  ADD PRIMARY KEY (`FIR_Code`),
  ADD KEY `Station_Code` (`Station_Code`);

--
-- Indexes for table `fir_convict_records`
--
ALTER TABLE `fir_convict_records`
  ADD PRIMARY KEY (`FIR_ConR_Code`),
  ADD KEY `FIR_Code` (`FIR_Code`),
  ADD KEY `Convict_NID` (`Convict_NID`);

--
-- Indexes for table `fir_oc_io_assignment_records`
--
ALTER TABLE `fir_oc_io_assignment_records`
  ADD PRIMARY KEY (`FIR_IO_AssR_Code`),
  ADD KEY `FIR_Code` (`FIR_Code`),
  ADD KEY `IO_ID` (`IO_ID`),
  ADD KEY `OC_ID` (`OC_ID`);

--
-- Indexes for table `fir_suspect_records`
--
ALTER TABLE `fir_suspect_records`
  ADD PRIMARY KEY (`FIR_SusR_Code`),
  ADD KEY `FIR_Code` (`FIR_Code`),
  ADD KEY `Suspect_NID` (`Suspect_NID`);

--
-- Indexes for table `fir_victim_records`
--
ALTER TABLE `fir_victim_records`
  ADD PRIMARY KEY (`FIR_ViR_Code`),
  ADD KEY `FIR_Code` (`FIR_Code`),
  ADD KEY `Victim_NID` (`Victim_NID`);

--
-- Indexes for table `investigaton_officer`
--
ALTER TABLE `investigaton_officer`
  ADD PRIMARY KEY (`IO_ID`);

--
-- Indexes for table `io_contact_number`
--
ALTER TABLE `io_contact_number`
  ADD PRIMARY KEY (`IO_Contact_Numb`),
  ADD KEY `IO_ID` (`IO_ID`);

--
-- Indexes for table `io_login_credential`
--
ALTER TABLE `io_login_credential`
  ADD PRIMARY KEY (`IO_username`),
  ADD KEY `IO_ID` (`IO_ID`);

--
-- Indexes for table `oc_contact_number`
--
ALTER TABLE `oc_contact_number`
  ADD PRIMARY KEY (`OC_Contact_Numb`),
  ADD KEY `OC_ID` (`OC_ID`);

--
-- Indexes for table `oc_io_supervision_records`
--
ALTER TABLE `oc_io_supervision_records`
  ADD PRIMARY KEY (`OC_IO_SuR_Code`),
  ADD KEY `OC_ID` (`OC_ID`),
  ADD KEY `IO_ID` (`IO_ID`);

--
-- Indexes for table `oc_login_credential`
--
ALTER TABLE `oc_login_credential`
  ADD PRIMARY KEY (`OC_username`),
  ADD KEY `OC_ID` (`OC_ID`);

--
-- Indexes for table `officer_in_charge`
--
ALTER TABLE `officer_in_charge`
  ADD PRIMARY KEY (`OC_ID`);

--
-- Indexes for table `police_station`
--
ALTER TABLE `police_station`
  ADD PRIMARY KEY (`Station_Code`);

--
-- Indexes for table `station_admin_io_assignment_records`
--
ALTER TABLE `station_admin_io_assignment_records`
  ADD PRIMARY KEY (`St_AD_IO_AssR_Code`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `IO_ID` (`IO_ID`),
  ADD KEY `Station_Code` (`Station_Code`);

--
-- Indexes for table `station_admin_oc_assignment_records`
--
ALTER TABLE `station_admin_oc_assignment_records`
  ADD PRIMARY KEY (`St_AD_OC_AssR_Code`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `OC_ID` (`OC_ID`),
  ADD KEY `Station_Code` (`Station_Code`);

--
-- Indexes for table `suspect`
--
ALTER TABLE `suspect`
  ADD PRIMARY KEY (`Suspect_NID`);

--
-- Indexes for table `suspect_contact_number`
--
ALTER TABLE `suspect_contact_number`
  ADD PRIMARY KEY (`Suspect_Contact_Numb`),
  ADD KEY `Suspect_NID` (`Suspect_NID`);

--
-- Indexes for table `suspect_temporary_address`
--
ALTER TABLE `suspect_temporary_address`
  ADD PRIMARY KEY (`Sus_Tmp_Add_Code`);

--
-- Indexes for table `suspect_temp_address_records`
--
ALTER TABLE `suspect_temp_address_records`
  ADD PRIMARY KEY (`Sus_Tmp_AddRec_Code`),
  ADD KEY `Suspect_NID` (`Suspect_NID`),
  ADD KEY `Sus_Tmp_Add_Code` (`Sus_Tmp_Add_Code`),
  ADD KEY `Area_Code` (`Area_Code`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`Victim_NID`),
  ADD UNIQUE KEY `Victim_NID` (`Victim_NID`);

--
-- Indexes for table `victim_contact_number`
--
ALTER TABLE `victim_contact_number`
  ADD PRIMARY KEY (`Victim_Contact_Numb`),
  ADD UNIQUE KEY `Victim_Contact_Numb` (`Victim_Contact_Numb`),
  ADD KEY `Victim_NID` (`Victim_NID`);

--
-- Indexes for table `victim_login_credential`
--
ALTER TABLE `victim_login_credential`
  ADD PRIMARY KEY (`victim_username`),
  ADD UNIQUE KEY `victim_username` (`victim_username`),
  ADD KEY `victim_NID` (`victim_NID`);

--
-- Indexes for table `victim_temporary_address`
--
ALTER TABLE `victim_temporary_address`
  ADD PRIMARY KEY (`Vi_Tmp_Add_Code`);

--
-- Indexes for table `victim_temp_address_records`
--
ALTER TABLE `victim_temp_address_records`
  ADD PRIMARY KEY (`Vi_Tmp_AddRec_Code`),
  ADD KEY `Victim_NID` (`Victim_NID`),
  ADD KEY `Vi_Tmp_Add_Code` (`Vi_Tmp_Add_Code`),
  ADD KEY `Area_Code` (`Area_Code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_oc_supervision_records`
--
ALTER TABLE `admin_oc_supervision_records`
  MODIFY `AD_OC_SuR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `convict_temporary_address`
--
ALTER TABLE `convict_temporary_address`
  MODIFY `Con_Tmp_Add_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `convict_temp_address_records`
--
ALTER TABLE `convict_temp_address_records`
  MODIFY `Con_Tmp_AddRec_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fir_convict_records`
--
ALTER TABLE `fir_convict_records`
  MODIFY `FIR_ConR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fir_oc_io_assignment_records`
--
ALTER TABLE `fir_oc_io_assignment_records`
  MODIFY `FIR_IO_AssR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fir_suspect_records`
--
ALTER TABLE `fir_suspect_records`
  MODIFY `FIR_SusR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fir_victim_records`
--
ALTER TABLE `fir_victim_records`
  MODIFY `FIR_ViR_Code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_io_supervision_records`
--
ALTER TABLE `oc_io_supervision_records`
  MODIFY `OC_IO_SuR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station_admin_io_assignment_records`
--
ALTER TABLE `station_admin_io_assignment_records`
  MODIFY `St_AD_IO_AssR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station_admin_oc_assignment_records`
--
ALTER TABLE `station_admin_oc_assignment_records`
  MODIFY `St_AD_OC_AssR_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suspect_temporary_address`
--
ALTER TABLE `suspect_temporary_address`
  MODIFY `Sus_Tmp_Add_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suspect_temp_address_records`
--
ALTER TABLE `suspect_temp_address_records`
  MODIFY `Sus_Tmp_AddRec_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `victim_temporary_address`
--
ALTER TABLE `victim_temporary_address`
  MODIFY `Vi_Tmp_Add_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `victim_temp_address_records`
--
ALTER TABLE `victim_temp_address_records`
  MODIFY `Vi_Tmp_AddRec_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_contact_number`
--
ALTER TABLE `admin_contact_number`
  ADD CONSTRAINT `admin_contact_number_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`) ON DELETE CASCADE;

--
-- Constraints for table `admin_login_credential`
--
ALTER TABLE `admin_login_credential`
  ADD CONSTRAINT `admin_login_credential_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`) ON DELETE CASCADE;

--
-- Constraints for table `admin_oc_supervision_records`
--
ALTER TABLE `admin_oc_supervision_records`
  ADD CONSTRAINT `admin_oc_supervision_records_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_oc_supervision_records_ibfk_2` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE;

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`Station_Code`) REFERENCES `police_station` (`Station_Code`) ON DELETE SET NULL;

--
-- Constraints for table `convict_contact_number`
--
ALTER TABLE `convict_contact_number`
  ADD CONSTRAINT `convict_contact_number_ibfk_1` FOREIGN KEY (`Convict_NID`) REFERENCES `convict` (`Convict_NID`) ON DELETE CASCADE;

--
-- Constraints for table `convict_temp_address_records`
--
ALTER TABLE `convict_temp_address_records`
  ADD CONSTRAINT `convict_temp_address_records_ibfk_1` FOREIGN KEY (`Convict_NID`) REFERENCES `convict` (`Convict_NID`) ON DELETE CASCADE,
  ADD CONSTRAINT `convict_temp_address_records_ibfk_2` FOREIGN KEY (`Con_Tmp_Add_Code`) REFERENCES `convict_temporary_address` (`Con_Tmp_Add_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `convict_temp_address_records_ibfk_3` FOREIGN KEY (`Area_Code`) REFERENCES `area` (`Area_Code`);

--
-- Constraints for table `fir`
--
ALTER TABLE `fir`
  ADD CONSTRAINT `fir_ibfk_1` FOREIGN KEY (`Station_Code`) REFERENCES `police_station` (`Station_Code`) ON DELETE CASCADE;

--
-- Constraints for table `fir_convict_records`
--
ALTER TABLE `fir_convict_records`
  ADD CONSTRAINT `fir_convict_records_ibfk_1` FOREIGN KEY (`FIR_Code`) REFERENCES `fir` (`FIR_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `fir_convict_records_ibfk_2` FOREIGN KEY (`Convict_NID`) REFERENCES `convict` (`Convict_NID`);

--
-- Constraints for table `fir_oc_io_assignment_records`
--
ALTER TABLE `fir_oc_io_assignment_records`
  ADD CONSTRAINT `fir_oc_io_assignment_records_ibfk_1` FOREIGN KEY (`FIR_Code`) REFERENCES `fir` (`FIR_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `fir_oc_io_assignment_records_ibfk_2` FOREIGN KEY (`IO_ID`) REFERENCES `investigaton_officer` (`IO_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fir_oc_io_assignment_records_ibfk_3` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE;

--
-- Constraints for table `fir_suspect_records`
--
ALTER TABLE `fir_suspect_records`
  ADD CONSTRAINT `fir_suspect_records_ibfk_1` FOREIGN KEY (`FIR_Code`) REFERENCES `fir` (`FIR_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `fir_suspect_records_ibfk_2` FOREIGN KEY (`Suspect_NID`) REFERENCES `suspect` (`Suspect_NID`);

--
-- Constraints for table `fir_victim_records`
--
ALTER TABLE `fir_victim_records`
  ADD CONSTRAINT `fir_victim_records_ibfk_1` FOREIGN KEY (`FIR_Code`) REFERENCES `fir` (`FIR_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `fir_victim_records_ibfk_2` FOREIGN KEY (`Victim_NID`) REFERENCES `victim` (`Victim_NID`) ON DELETE CASCADE;

--
-- Constraints for table `io_contact_number`
--
ALTER TABLE `io_contact_number`
  ADD CONSTRAINT `io_contact_number_ibfk_1` FOREIGN KEY (`IO_ID`) REFERENCES `investigaton_officer` (`IO_ID`) ON DELETE CASCADE;

--
-- Constraints for table `io_login_credential`
--
ALTER TABLE `io_login_credential`
  ADD CONSTRAINT `io_login_credential_ibfk_1` FOREIGN KEY (`IO_ID`) REFERENCES `investigaton_officer` (`IO_ID`) ON DELETE CASCADE;

--
-- Constraints for table `oc_contact_number`
--
ALTER TABLE `oc_contact_number`
  ADD CONSTRAINT `oc_contact_number_ibfk_1` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE;

--
-- Constraints for table `oc_io_supervision_records`
--
ALTER TABLE `oc_io_supervision_records`
  ADD CONSTRAINT `oc_io_supervision_records_ibfk_1` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `oc_io_supervision_records_ibfk_2` FOREIGN KEY (`IO_ID`) REFERENCES `investigaton_officer` (`IO_ID`) ON DELETE CASCADE;

--
-- Constraints for table `oc_login_credential`
--
ALTER TABLE `oc_login_credential`
  ADD CONSTRAINT `oc_login_credential_ibfk_1` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE;

--
-- Constraints for table `station_admin_io_assignment_records`
--
ALTER TABLE `station_admin_io_assignment_records`
  ADD CONSTRAINT `station_admin_io_assignment_records_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `station_admin_io_assignment_records_ibfk_2` FOREIGN KEY (`IO_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `station_admin_io_assignment_records_ibfk_3` FOREIGN KEY (`Station_Code`) REFERENCES `police_station` (`Station_Code`);

--
-- Constraints for table `station_admin_oc_assignment_records`
--
ALTER TABLE `station_admin_oc_assignment_records`
  ADD CONSTRAINT `station_admin_oc_assignment_records_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `station_admin_oc_assignment_records_ibfk_2` FOREIGN KEY (`OC_ID`) REFERENCES `officer_in_charge` (`OC_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `station_admin_oc_assignment_records_ibfk_3` FOREIGN KEY (`Station_Code`) REFERENCES `police_station` (`Station_Code`);

--
-- Constraints for table `suspect_contact_number`
--
ALTER TABLE `suspect_contact_number`
  ADD CONSTRAINT `suspect_contact_number_ibfk_1` FOREIGN KEY (`Suspect_NID`) REFERENCES `suspect` (`Suspect_NID`) ON DELETE CASCADE;

--
-- Constraints for table `suspect_temp_address_records`
--
ALTER TABLE `suspect_temp_address_records`
  ADD CONSTRAINT `suspect_temp_address_records_ibfk_1` FOREIGN KEY (`Suspect_NID`) REFERENCES `suspect` (`Suspect_NID`) ON DELETE SET NULL,
  ADD CONSTRAINT `suspect_temp_address_records_ibfk_2` FOREIGN KEY (`Sus_Tmp_Add_Code`) REFERENCES `suspect_temporary_address` (`Sus_Tmp_Add_Code`),
  ADD CONSTRAINT `suspect_temp_address_records_ibfk_3` FOREIGN KEY (`Area_Code`) REFERENCES `area` (`Area_Code`);

--
-- Constraints for table `victim_contact_number`
--
ALTER TABLE `victim_contact_number`
  ADD CONSTRAINT `victim_contact_number_ibfk_1` FOREIGN KEY (`Victim_NID`) REFERENCES `victim` (`Victim_NID`) ON DELETE CASCADE;

--
-- Constraints for table `victim_login_credential`
--
ALTER TABLE `victim_login_credential`
  ADD CONSTRAINT `victim_login_credential_ibfk_1` FOREIGN KEY (`victim_NID`) REFERENCES `victim` (`Victim_NID`) ON DELETE CASCADE;

--
-- Constraints for table `victim_temp_address_records`
--
ALTER TABLE `victim_temp_address_records`
  ADD CONSTRAINT `victim_temp_address_records_ibfk_1` FOREIGN KEY (`Victim_NID`) REFERENCES `victim` (`Victim_NID`) ON DELETE CASCADE,
  ADD CONSTRAINT `victim_temp_address_records_ibfk_2` FOREIGN KEY (`Vi_Tmp_Add_Code`) REFERENCES `victim_temporary_address` (`Vi_Tmp_Add_Code`),
  ADD CONSTRAINT `victim_temp_address_records_ibfk_3` FOREIGN KEY (`Area_Code`) REFERENCES `area` (`Area_Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
