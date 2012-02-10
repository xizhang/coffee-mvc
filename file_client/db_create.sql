-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2012 at 09:04 AM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `mvc_example`
--
CREATE DATABASE `mvc_example` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mvc_example`;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` VALUES(1, 'node.js', 'nodejs.org', '2012-02-06 17:47:30');
INSERT INTO `projects` VALUES(2, 'coffeekup', 'http://coffeekup.org', '2012-02-08 15:25:32');
INSERT INTO `projects` VALUES(22, 'WordPress', 'http://wordpress.org', '2012-02-10 08:39:50');
INSERT INTO `projects` VALUES(23, 'coffee-mvc', 'https://github.com/xizhang/coffee-mvc', '2012-02-10 09:03:40');
