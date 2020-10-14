/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : xzzp

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2020-09-13 21:29:41
*/

-- #设置客户端连接服务器端编码
SET NAMES UTF8;
-- #丢弃数据库，如果存在
DROP DATABASE IF EXISTS xzzp;
-- #创建数据库，设置存储的编码
CREATE DATABASE xzzp CHARSET=UTF8;
-- #进入数据库
USE xzzp;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'ad_1910081153437310775.jpg');
INSERT INTO `banner` VALUES ('2', 'ad_1807050824232204899.jpg');
INSERT INTO `banner` VALUES ('3', 'ad_1807050821332059530.jpg');
INSERT INTO `banner` VALUES ('4', 'ad_1807061038579285553.jpg');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格',
  `describe` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `color` varchar(255) DEFAULT NULL COMMENT '商品颜色',
  `inventory` int(10) DEFAULT NULL COMMENT '商品现有库存',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `servicePrice` decimal(10,2) DEFAULT NULL COMMENT '服务价格',
  `type` int(255) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜5头25W', '1986.00', '', '哑黑+铜5头25W', '9', 'ps_1806211717572850174.jpg', '45.00', '1');
INSERT INTO `commodity` VALUES ('2', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜6头30W', '2304.00', null, '哑黑+铜6头30W', '10', 'ps_1806211718014569191.jpg', '55.00', '1');
INSERT INTO `commodity` VALUES ('3', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜16头80W', '5490.00', null, '哑黑+铜16头80W', '10', 'ps_1806211718054413196.jpg', '115.00', '1');

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `index`;
CREATE TABLE `index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot
-- ----------------------------

INSERT INTO `index` VALUES ('1', 'ad_1807061038579285553.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `index` VALUES ('2', 'ad_1804111011421339880.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `index` VALUES ('3', 'ad_1801161618221100894.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `index` VALUES ('4', 'ad_1807050821332059530.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `index` VALUES ('5', 'ad_1807061641512400953.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `index` VALUES ('6', 'ad_1807050824232204899.jpg', '简约时尚吸顶灯洛影系列', '1347.00');



INSERT INTO `hot` VALUES ('1', 'ad_1806250951587032290.jpg', '简约时尚吸顶灯洛影系列', '1347.00');
INSERT INTO `hot` VALUES ('2', 'ad_1806250959040981406.jpg', '时尚卧室灯芳华系列', '1095.00');
INSERT INTO `hot` VALUES ('3', 'ad_1806251000446306774.jpg', '伯克丽现代简约时尚吊灯', '1726.00');
INSERT INTO `hot` VALUES ('4', 'ad_1806251002376008734.jpg', '简约时尚吊灯相望系列', '868.00');
INSERT INTO `hot` VALUES ('5', 'ad_1708161841596990922.jpg', '经典简约LED吸顶灯', '2301.00');
INSERT INTO `hot` VALUES ('6', 'ad_1711091742241820122.jpg', '时尚吸顶灯漫空系列', '697.00');

-- ----------------------------
-- Table structure for particulars
-- ----------------------------
DROP TABLE IF EXISTS `particulars`;
CREATE TABLE `particulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `particularsImg` varchar(255) NOT NULL COMMENT '图片',
  `commodityType` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of particulars
-- ----------------------------
INSERT INTO `particulars` VALUES ('1', 'pe_1806250857313073178.jpg', '1');
INSERT INTO `particulars` VALUES ('2', 'pe_1806250857337917087.jpg', '1');
INSERT INTO `particulars` VALUES ('3', 'pe_1806250857363386000.jpg', '1');
INSERT INTO `particulars` VALUES ('4', 'pe_1806250857392448686.jpg', '1');
INSERT INTO `particulars` VALUES ('5', 'pe_1806250857414948830.jpg', '1');
INSERT INTO `particulars` VALUES ('6', 'pe_1806250857460105369.jpg', '1');
INSERT INTO `particulars` VALUES ('7', 'pe_1806250857486199286.jpg', '1');
INSERT INTO `particulars` VALUES ('8', 'pe_1806250857512293203.jpg', '1');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL,
  `recommendImg` varchar(255) NOT NULL COMMENT '推荐商品图片',
  `path` varchar(255) DEFAULT NULL COMMENT '推荐商品链接',
  `commodityId` int(11) NOT NULL COMMENT '主页商品id',
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('1', 'ps_1901091132528128393.jpg', null, '1', '致东方新中式典雅客厅卧室全铜灯吊灯满庭芳系列', '7553.20');
INSERT INTO `recommend` VALUES ('2', 'ps_1901091207095940893.jpg', null, '1', '致东方新中式典雅客厅卧室铜灯吊灯湖光山色系列', '8013.00');
INSERT INTO `recommend` VALUES ('3', 'ps_1901091222317503393.jpg', null, '1', '致东方新中式典雅客厅卧室铜灯吊灯爱莲说系列', '17136.00');
INSERT INTO `recommend` VALUES ('4', 'ps_1901091503457815893.jpg', null, '1', '致东方新中式典雅客厅卧室铜灯吊灯松间明月系列', '7590.00');
INSERT INTO `recommend` VALUES ('5', 'ps_1901091521093909643.jpg', null, '1', '致东方新中式典雅客厅卧室铜灯吊灯花月令系列', '7806.00');
INSERT INTO `recommend` VALUES ('6', 'ps_1901091525177659643.jpg', null, '1', '利兹城堡美式匠心尊享客厅卧室全铜吊灯朝阳系列', '11160.00');

-- ----------------------------
-- Table structure for renqi
-- ----------------------------
DROP TABLE IF EXISTS `renqi`;
CREATE TABLE `renqi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of renqi
-- ----------------------------
INSERT INTO `renqi` VALUES ('1', 'ad_1807050824232204899.jpg');

-- ----------------------------
-- Table structure for taocan
-- ----------------------------
DROP TABLE IF EXISTS `taocan`;
CREATE TABLE `taocan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocan
-- ----------------------------
INSERT INTO `taocan` VALUES ('1', 'ad_1807050821332059530.jpg');

-- ----------------------------
-- Table structure for taocan1
-- ----------------------------
DROP TABLE IF EXISTS `taocan1`;
CREATE TABLE `taocan1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocan1
-- ----------------------------
INSERT INTO `taocan1` VALUES ('1', 'ad_1807061641512400953.jpg');

-- ----------------------------
-- Table structure for three
-- ----------------------------
DROP TABLE IF EXISTS `three`;
CREATE TABLE `three` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of three
-- ----------------------------
INSERT INTO `three` VALUES ('1', 'ad_1807061038579285553.jpg');

-- ----------------------------
-- Table structure for three1
-- ----------------------------
DROP TABLE IF EXISTS `three1`;
CREATE TABLE `three1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of three1
-- ----------------------------
INSERT INTO `three1` VALUES ('1', 'ad_1804111011421339880.jpg');
INSERT INTO `three1` VALUES ('2', 'ad_1801161618221100894.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名,唯一',
  `upassword` varchar(32) NOT NULL COMMENT '密码,MD5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', '12345678');
INSERT INTO `user` VALUES ('2', 'zhengping', '123456789');
INSERT INTO `user` VALUES ('3', 'zengbuding', '1234567890');
-- ----------------------------
-- Records of cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `price` varchar(32) DEFAULT NULL,
  `img` varchar(32) DEFAULT NULL,
  `servicePrice` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

