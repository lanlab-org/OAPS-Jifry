/*

.
Navicat MySQL Data Transfer

Source Server         : yun
Source Server Version : 50730
Source Host           : 47.115.56.157:3306
Source Database       : oo

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-11-04 12:59:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `highlight` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `abstracts` varchar(999) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `filename` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `hide` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for block_author
-- ----------------------------
DROP TABLE IF EXISTS `block_author`;
CREATE TABLE `block_author` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL,
  `blockuntil` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(20) DEFAULT NULL,
  `hide` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for love_article
-- ----------------------------
DROP TABLE IF EXISTS `love_article`;
CREATE TABLE `love_article` (
  `ip` varchar(20) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `prefer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for love_comment
-- ----------------------------
DROP TABLE IF EXISTS `love_comment`;
CREATE TABLE `love_comment` (
  `ip` varchar(20) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `prefer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parentsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
