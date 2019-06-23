/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : os

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-06-23 21:01:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pimg` varchar(30) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `count` double(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u1` (`pid`,`uid`) USING BTREE,
  KEY `fk_id` (`uid`),
  CONSTRAINT `fk_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fu_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('50', '77', '1', 'iphoneXR', '1001', '5099.00', '6', '30594.00');
INSERT INTO `cart` VALUES ('53', '77', '7', '罗技（G）G610机械键盘', '3001', '479.00', '6', '2874.00');
INSERT INTO `cart` VALUES ('55', '77', '4', '华为 P30', '1004', '3988.00', '1', '3988.00');
INSERT INTO `cart` VALUES ('56', '77', '5', '荣耀MagicBook 2019', '2001', '4299.00', '1', '4299.00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机');
INSERT INTO `category` VALUES ('2', '电脑');
INSERT INTO `category` VALUES ('3', '键盘');
INSERT INTO `category` VALUES ('4', '鼠标');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(64) NOT NULL,
  `uid` int(11) NOT NULL,
  `tcount` int(11) NOT NULL,
  `tprice` double(10,2) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `tel` varchar(32) NOT NULL,
  `ctime` datetime NOT NULL,
  `statu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ibfk_1` (`uid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for param
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `cyear` date NOT NULL,
  `weight` double(6,2) NOT NULL,
  `img1` varchar(30) DEFAULT NULL,
  `img2` varchar(30) DEFAULT NULL,
  `showtext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('1', 'Apple', ' iPhone XR (A2108)', '2018-10-01', '194.00', '1001a', null, null);
INSERT INTO `param` VALUES ('2', 'Apple', 'iPhone XS Max (A2103)', '2018-09-01', '208.00', '1002a', null, null);
INSERT INTO `param` VALUES ('3', 'HUAWEI', 'HUAWEI Mate 20', '2018-10-01', '188.00', '1003a', null, null);
INSERT INTO `param` VALUES ('4', 'HUAWEI', 'HUAWEI P30', '2019-04-01', '165.00', '1004a', null, null);
INSERT INTO `param` VALUES ('5', 'HONOR', '荣耀 MagicBook 2019(KPR-W19)', '2019-04-01', '1500.00', '2001a', '2001b', null);
INSERT INTO `param` VALUES ('6', 'Lenovo', '联想-拯救者Y7000p', '2019-01-01', '2500.00', '2002a', '2002b', null);
INSERT INTO `param` VALUES ('7', '罗技', 'G610红轴', '2019-01-01', '1230.00', '3001a', '3001b', null);
INSERT INTO `param` VALUES ('8', '雷柏（Rapoo）', 'V500PRO', '2019-01-01', '907.00', '3002a', '3002b', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `cid` int(11) NOT NULL,
  `image` varchar(20) NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `product_ibfk_1` (`infoid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`infoid`) REFERENCES `param` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '苹果iPhoneXR', '5099.00', '1', '1001', '1', '1');
INSERT INTO `product` VALUES ('2', '苹果iPhoneXS MAX', '7199.00', '1', '1002', '0', '2');
INSERT INTO `product` VALUES ('3', '华为 Mate20', '3499.00', '1', '1003', '0', '3');
INSERT INTO `product` VALUES ('4', '华为 P30', '3988.00', '1', '1004', '1', '4');
INSERT INTO `product` VALUES ('5', '荣耀MagicBook 2019', '4299.00', '2', '2001', '1', '5');
INSERT INTO `product` VALUES ('6', '联想(Lenovo)拯救者Y7000P', '9099.00', '2', '2002', '1', '6');
INSERT INTO `product` VALUES ('7', '罗技（G）G610机械键盘', '479.00', '3', '3001', '1', '7');
INSERT INTO `product` VALUES ('8', '雷柏（Rapoo） V500PRO', '169.00', '3', '3002', '0', '8');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('74', '123', '123');
INSERT INTO `user` VALUES ('75', '123', '123');
INSERT INTO `user` VALUES ('77', 'qssq', '123');
