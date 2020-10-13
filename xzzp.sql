/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : xzzp

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2020-10-11 21:42:45
*/

#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库如果存在
DROP DATABASE IF EXISTS xzzp;
#创建数据库，设置存储的编码
CREATE DATABASE xzzp CHARSET=UTF8;
#进入数据库
USE xzzp;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'ad_1910081153437310775.jpg');
INSERT INTO `banner` VALUES ('2', 'ad_1807050824232204899.jpg');
INSERT INTO `banner` VALUES ('3', 'ad_1807050821332059530.jpg');
INSERT INTO `banner` VALUES ('4', 'ad_1807061038579285553.jpg');

-- ----------------------------
-- Table structure for cart
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
-- INSERT INTO `cart` VALUES ('1','1',Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑 铜5头25W', '哑黑 铜5头25W', '1986', 'ps_1806211717572850174.jpg', '45');


-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodityId` smallint(10) NOT NULL COMMENT '首页跳转商品id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格',
  `describe` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `color` varchar(255) NOT NULL COMMENT '商品颜色',
  `num` varchar(255) DEFAULT NULL COMMENT '商品数量',
  `inventory` int(10) DEFAULT NULL COMMENT '商品现有库存',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `servicePrice` decimal(10,2) DEFAULT NULL COMMENT '服务价格',
  `type` int(255) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='商品详情信息';

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '1', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜5头25W', '1986.00', '', '哑黑+铜5头25W', null, '9', 'ps_1806211717572850174.jpg', '45.00', '1');
INSERT INTO `commodity` VALUES ('2', '1', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜6头30W', '2304.00', null, '哑黑+铜6头30W', null, '10', 'ps_1806211718014569191.jpg', '55.00', '1');
INSERT INTO `commodity` VALUES ('3', '1', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜16头80W', '5490.00', null, '哑黑+铜16头80W', null, '10', 'ps_1806211718054413196.jpg', '115.00', '1');
INSERT INTO `commodity` VALUES ('4', '2', '美颜化妆镜', '299.00', null, '银白灰', null, '5', '046ef0116faf5847 (1).jpg', '45.00', '2');
INSERT INTO `commodity` VALUES ('5', '3', '商照导轨射灯', '128.00', null, '黑色', null, '20', '1415fb81b8638900 (1).jpg', '20.00', '3');
INSERT INTO `commodity` VALUES ('6', '4', '套餐爆款', '1599.00', null, '简约', null, '30','1d9633860b966a8f (1).jpg', '95.00', '4');
INSERT INTO `commodity` VALUES ('7', '5', '致东方', '3888.00', null, '简约大方', null, '15','3-1ZR1144H62S.jpg', '150.00', '5');
INSERT INTO `commodity` VALUES ('8', '6', '复古风', '2930.00', null, '中国风', null, '10', '71d34707ddb288b4 (1).png', '200.00', '6');
INSERT INTO `commodity` VALUES ('9', '7', '伯利克', '4599.00', null, '简约时尚吸顶灯洛影系列', null, '5', '3-1Z626115212S9.jpg', '240.00', '7');
INSERT INTO `commodity` VALUES ('10', '8', '利兹城堡', '6399.00', null, '时尚卧室灯芳华系列', null, '6', '3-1ZR1133T1561.jpg', '200.00', '8');
INSERT INTO `commodity` VALUES ('11', '9', '水晶系列', '2399.00', null, '伯克丽现代简约时尚吊灯', null, '4', '3-1ZR1140J0R0.jpg', '180.00', '9');
INSERT INTO `commodity` VALUES ('12', '10', '吸顶灯', '4399.00', null, '简约时尚吊灯相望系列', null, '10','3-1Z6251I2260-L.jpg', '230.00', '10');
INSERT INTO `commodity` VALUES ('13', '11', '节能灯', '199.00', null, '经典简约LED节能灯', null, '5', '1d860fac45463a1a.jpg', '220.00', '11');
INSERT INTO `commodity` VALUES ('14', '12', '护眼灯', '299.00', null, '实惠好用护眼灯', null, '10', '3-1Z32G02A3Z4.jpg', '10.00', '12');

-- ----------------------------
-- Table structure for detalts
-- ----------------------------
DROP TABLE IF EXISTS `detalts`;
CREATE TABLE `detalts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(50) NOT NULL,
  `img_id` int(10) NOT NULL COMMENT '详情页左上',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalts
-- ----------------------------
INSERT INTO `detalts` VALUES ('1', 'ps_1806211717572850174.jpg', '1');
INSERT INTO `detalts` VALUES ('2', 'ps_1806211718014569191.jpg', '1');
INSERT INTO `detalts` VALUES ('3', 'ps_1806211718054413196.jpg', '1');
INSERT INTO `detalts` VALUES ('4', 'ps_1806211718097694723.jpg', '1');
INSERT INTO `detalts` VALUES ('5', 'ps_1806211718144257521.jpg', '1');
INSERT INTO `detalts` VALUES ('6', '046ef0116faf5847 (1).jpg', '2');
INSERT INTO `detalts` VALUES ('7', '306ae822806d6dc5 (1).jpg', '2');
INSERT INTO `detalts` VALUES ('8', '938295eae5d96ea5 (1).jpg', '2');
INSERT INTO `detalts` VALUES ('9', 'c704e9287d842089 (1).jpg', '2');
INSERT INTO `detalts` VALUES ('10', 'de48565e6df7d391 (1).jpg', '2');
INSERT INTO `detalts` VALUES ('11', '1415fb81b8638900 (1).jpg', '3');
INSERT INTO `detalts` VALUES ('12', '6850c559be814788 (1).jpg', '3');
INSERT INTO `detalts` VALUES ('13', 'a3592499771b615c (1).jpg', '3');
INSERT INTO `detalts` VALUES ('14', 'b712467e29ebf671 (1).jpg', '3');
INSERT INTO `detalts` VALUES ('15', 'fb0ebae4e6e75762 (1).jpg', '3');
INSERT INTO `detalts` VALUES ('16', '1d9633860b966a8f (1).jpg', '4');
INSERT INTO `detalts` VALUES ('17', '05c25b7e2ecf5165 (1).jpg', '4');
INSERT INTO `detalts` VALUES ('18', '7c9a29c33f43e67d (1).jpg', '4');
INSERT INTO `detalts` VALUES ('19', '9b26860180c751ad (1).jpg', '4');
INSERT INTO `detalts` VALUES ('20', 'a879823b1be2a7e9 (1).jpg', '4');
INSERT INTO `detalts` VALUES ('21', '3-1ZR1144H62S.jpg', '5');
INSERT INTO `detalts` VALUES ('22', '3-1ZR1154Z3252.jpg', '5');
INSERT INTO `detalts` VALUES ('23', '3-1ZR1154122A0.jpg', '5');
INSERT INTO `detalts` VALUES ('24', '3-1ZR1154525R2.jpg', '5');
INSERT INTO `detalts` VALUES ('25', '3-1ZR11504080-L.jpg', '5');
INSERT INTO `detalts` VALUES ('26', '71d34707ddb288b4 (1).png', '6');
INSERT INTO `detalts` VALUES ('27', '281528ba626a5319 (1).jpg', '6');
INSERT INTO `detalts` VALUES ('28', 'bd49cb5d0e0406e0 (1).jpg', '6');
INSERT INTO `detalts` VALUES ('29', 'c12945ff5a389596 (1).jpg', '6');
INSERT INTO `detalts` VALUES ('30', 'dd1786e414458b21 (1).jpg', '6');
INSERT INTO `detalts` VALUES ('31', '3-1Z626115212S9.jpg', '7');
INSERT INTO `detalts` VALUES ('32', '3-1Z626115914E3.jpg', '7');
INSERT INTO `detalts` VALUES ('33', '3-1Z626115511432.jpg', '7');
INSERT INTO `detalts` VALUES ('34', '3-1ZR111511U39.jpg', '7');
INSERT INTO `detalts` VALUES ('35', '3-1ZR1115556304.jpg', '7');
INSERT INTO `detalts` VALUES ('36', '3-1ZR1133T1561.jpg', '8');
INSERT INTO `detalts` VALUES ('37', '3-1ZR1134T1649.jpg', '8');
INSERT INTO `detalts` VALUES ('38', '3-1ZR11354093b.jpg', '8');
INSERT INTO `detalts` VALUES ('39', '3-1ZR11359553X.jpg', '8');
INSERT INTO `detalts` VALUES ('40', '3-1ZR1134334443.jpg', '8');
INSERT INTO `detalts` VALUES ('41', '3-1ZR1140J0R0.jpg', '9');
INSERT INTO `detalts` VALUES ('42', '3-1ZR1141111205.jpg', '9');
INSERT INTO `detalts` VALUES ('43', '3-1ZR1141531554.jpg', '9');
INSERT INTO `detalts` VALUES ('44', '3-1ZR1141951118.jpg', '9');
INSERT INTO `detalts` VALUES ('45', '3-1ZR1142240435.jpg', '9');
INSERT INTO `detalts` VALUES ('46', '3-1Z6251I2260-L.jpg', '10');
INSERT INTO `detalts` VALUES ('47', '3-1Z6251I3580-L.jpg', '10');
INSERT INTO `detalts` VALUES ('48', '3-1Z6251I5260-L.jpg', '10');
INSERT INTO `detalts` VALUES ('49', '3-1Z6251IS20-L.jpg', '10');
INSERT INTO `detalts` VALUES ('50', '3-1Z6251J102309.jpg', '10');
INSERT INTO `detalts` VALUES ('51', '1d860fac45463a1a.jpg', '11');
INSERT INTO `detalts` VALUES ('52', '3-1Z32Q15435162(-1).jpg', '11');
INSERT INTO `detalts` VALUES ('53', '123a706d44366d84.jpg', '11');
INSERT INTO `detalts` VALUES ('54', '6616641830071ea1.jpg', '11');
INSERT INTO `detalts` VALUES ('55', 'aa9801377bba22ea.jpg', '11');
INSERT INTO `detalts` VALUES ('56', '3-1Z32G02A3Z4.jpg', '12');
INSERT INTO `detalts` VALUES ('57', '4a076174db169901.jpg', '12');
INSERT INTO `detalts` VALUES ('58', '3-1Z32G02TC20(1).jpg', '12');
INSERT INTO `detalts` VALUES ('61', '541621f4d341a49f.jpg', '12');
INSERT INTO `detalts` VALUES ('62', 'e41e1a2322879254.jpg', '12');

-- ----------------------------
-- Table structure for mainpage
-- ----------------------------
DROP TABLE IF EXISTS `mainpage`;
CREATE TABLE `mainpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL COMMENT '首页图片',
  `title` varchar(255) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL COMMENT '   首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='首页';

-- ----------------------------
-- Records of mainpage
-- ----------------------------
INSERT INTO `mainpage` VALUES ('1', 'ad_1807061038579285553.jpg', 'Berkeley伯克丽现代吊灯卧室餐厅灯铁艺灯追影系列 哑黑+铜5头25W', '1955.00');
INSERT INTO `mainpage` VALUES ('2', '938295eae5d96ea5 (1).jpg', '美颜化妆镜', '299.00');
INSERT INTO `mainpage` VALUES ('3', 'ad_1801161618221100894.jpg', '商照导航射灯', '128.00');
INSERT INTO `mainpage` VALUES ('4', 'ad_1807050821332059530.jpg', ' 套餐爆款', '1599.00');
INSERT INTO `mainpage` VALUES ('5', '3-1ZR1144H62S.jpg', '致东方', '3888.00');
INSERT INTO `mainpage` VALUES ('6', 'ad_1807050824232204899.jpg', '复古风', '2930.00');
INSERT INTO `mainpage` VALUES ('7', '3-1Z626115212S9.jpg', '简约时尚吸顶灯洛影系列', '4599.00');
INSERT INTO `mainpage` VALUES ('8', '3-1ZR1133T1561.jpg', '时尚卧室灯芳华系列', '6399.00');
INSERT INTO `mainpage` VALUES ('9', '3-1ZR1140J0R0.jpg', '伯克丽现代简约时尚吊灯', '2399.00');
INSERT INTO `mainpage` VALUES ('10', '3-1Z6251I2260-L.jpg', '简约时尚吊灯相望系列', '4399.00');
INSERT INTO `mainpage` VALUES ('11', '3-1Z32Q15435162(-1).jpg', '经典简约LED节能灯', '199.00');
INSERT INTO `mainpage` VALUES ('12', '3-1Z32G02A3Z4.jpg', '实惠好用护眼灯', '299.00');

-- ----------------------------
-- Table structure for particulars
-- ----------------------------
DROP TABLE IF EXISTS `particulars`;
CREATE TABLE `particulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `particularsImg` varchar(255) NOT NULL COMMENT '图片',
  `commodityType` int(11) NOT NULL COMMENT '商品id',
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='详情主页图片';

-- ----------------------------
-- Records of particulars
-- ----------------------------
INSERT INTO `particulars` VALUES ('1', 'pe_1806250857313073178.jpg', '1', null);
INSERT INTO `particulars` VALUES ('2', 'pe_1806250857337917087.jpg', '1', null);
INSERT INTO `particulars` VALUES ('3', 'pe_1806250857363386000.jpg', '1', null);
INSERT INTO `particulars` VALUES ('4', 'pe_1806250857392448686.jpg', '1', null);
INSERT INTO `particulars` VALUES ('5', 'pe_1806250857414948830.jpg', '1', null);
INSERT INTO `particulars` VALUES ('6', 'pe_1806250857460105369.jpg', '1', null);
INSERT INTO `particulars` VALUES ('7', 'pe_1806250857486199286.jpg', '1', null);
INSERT INTO `particulars` VALUES ('8', 'pe_1806250857512293203.jpg', '1', null);
INSERT INTO `particulars` VALUES ('9', '20201005091717(2).png', '3', null);
INSERT INTO `particulars` VALUES ('10', '20201005091821(2).png', '3', null);
INSERT INTO `particulars` VALUES ('11', '20201005091836(2).png', '3', null);
INSERT INTO `particulars` VALUES ('12', '20201005091854(2).png', '3', null);
INSERT INTO `particulars` VALUES ('13', '20201005092132(2).png', '3', null);
INSERT INTO `particulars` VALUES ('14', '20201005092151(2).png', '3', null);
INSERT INTO `particulars` VALUES ('15', '20201005092209(2).png', '3', null);
INSERT INTO `particulars` VALUES ('16', '20201005092303(2).png', '3', null);
INSERT INTO `particulars` VALUES ('17', 'wx_20201008223803.png', '2', null);
INSERT INTO `particulars` VALUES ('18', 'wx_20201008223817.png', '2', null);
INSERT INTO `particulars` VALUES ('19', 'wx_20201008223828.png', '2', null);
INSERT INTO `particulars` VALUES ('20', 'wx_20201008223952.png', '2', null);
INSERT INTO `particulars` VALUES ('21', 'wx_20201008224014.png', '2', null);
INSERT INTO `particulars` VALUES ('22', 'wx_20201008224033.png', '2', null);
INSERT INTO `particulars` VALUES ('23', 'wx_20201008224041.png', '2', null);
INSERT INTO `particulars` VALUES ('24', 'wx_20201009125547.png', '4', null);
INSERT INTO `particulars` VALUES ('25', 'wx_20201009125611.png', '4', null);
INSERT INTO `particulars` VALUES ('26', 'wx_20201009125621.png', '4', null);
INSERT INTO `particulars` VALUES ('27', 'wx_20201009125628.png', '4', null);
INSERT INTO `particulars` VALUES ('28', 'wx_20201009125636.png', '4', null);
INSERT INTO `particulars` VALUES ('29', 'wx_20201009125644.png', '4', null);
INSERT INTO `particulars` VALUES ('30', 'wx_20201009125653.png', '4', null);
INSERT INTO `particulars` VALUES ('31', 'wx_20201009125700.png', '4', null);
INSERT INTO `particulars` VALUES ('32', 'wx_20201009125707.png', '4', null);
INSERT INTO `particulars` VALUES ('33', '3-1ZR1144H62S(1).jpg', '5', null);
INSERT INTO `particulars` VALUES ('34', '0df73a65b74adb97(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('35', '2c2cd075ca42f58e(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('36', '3a1f618dfed57893(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('37', '8f104f50f435ead0(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('38', '335b5f67e4f4e8af(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('39', '442dc282d3daad5d(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('40', '509cdf7f8fb5f5b0(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('41', 'db17a6949c0cedcf(0).jpg', '6', null);
INSERT INTO `particulars` VALUES ('42', '3-1Z626115212S9(1).jpg', '7', null);
INSERT INTO `particulars` VALUES ('43', '3-1ZR1133T1561(1).jpg', '8', null);
INSERT INTO `particulars` VALUES ('44', '3-1ZR1140J0R0(1).jpg', '9', null);
INSERT INTO `particulars` VALUES ('45', '3-1Z6251I2260-L(1).jpg', '10', null);
INSERT INTO `particulars` VALUES ('46', '3-1Z32Q202063Q(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('47', '3-1Z32Q20033N3(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('48', '3-1Z32Q20046439(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('49', '3-1Z32Q2010E07(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('50', '3-1Z32Q20120600(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('51', '3-1Z32Q201353J(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('52', '3-1Z32Q2014Y57(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('53', '3-1Z32Q202063Q(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('54', '3-1Z32Q03Z3305(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('55', '3-1Z32Q2023X05(1).jpg', '11', null);
INSERT INTO `particulars` VALUES ('56', '3-1Z32G02A3Z4(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('57', '3-1Z32G02TC20(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('58', '3-1Z32G0300AQ(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('59', '3-1Z32G03025U5(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('60', '3-1Z32G029193E(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('61', '3-1Z32G02949530(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('62', '3-1Z32G03043205(1).jpg', '12', null);
INSERT INTO `particulars` VALUES ('63', '3-1Z32G03100236(1).jpg', '12', null);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL,
  `recommendImg` varchar(255) NOT NULL COMMENT '推荐商品图片',
  `path` varchar(255) DEFAULT NULL COMMENT '推荐商品链接',
  `commodityId` int(11) NOT NULL COMMENT '主页商品id',
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐表';

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
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名,唯一',
  `upassword` varchar(32) NOT NULL COMMENT '密码,MD5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', '12345678');
INSERT INTO `user` VALUES ('2', 'zhengping', '123456789');
INSERT INTO `user` VALUES ('3', 'zengbuding', '1234567890');
INSERT INTO `user` VALUES ('4', '15983282763', '25d55ad283aa400af464c76d713c07ad');
