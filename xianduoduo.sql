-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.25 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5284
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 xianduoduo 的数据库结构
CREATE DATABASE IF NOT EXISTS `xianduoduo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `xianduoduo`;

-- 导出  表 xianduoduo.admin_user 结构
CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.admin_user 的数据：~3 rows (大约)
DELETE FROM `admin_user`;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` (`id`, `admin_name`, `admin_password`) VALUES
	(1, '1234', '81dc9bdb52d04dc20036dbd8313ed055'),
	(4, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
	(5, '1111', 'b59c67bf196a4758191e42f76670ceba');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;

-- 导出  表 xianduoduo.auth_group 结构
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.auth_group 的数据：2 rows
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`, `title`, `status`, `rules`, `description`) VALUES
	(17, '超级管理员', 1, '4,8,9,7,10,11,12,20,21,22,23,14,15,16,17,5,13,18,19', '拥有至高无上的权限'),
	(15, '商品管理员', 1, '4,8,9,7,10,11,12', '拥有商品分类管理及商品管理权限');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- 导出  表 xianduoduo.auth_group_access 结构
CREATE TABLE IF NOT EXISTS `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- 正在导出表  xianduoduo.auth_group_access 的数据：3 rows
DELETE FROM `auth_group_access`;
/*!40000 ALTER TABLE `auth_group_access` DISABLE KEYS */;
INSERT INTO `auth_group_access` (`uid`, `group_id`) VALUES
	(1, 17),
	(4, 17),
	(5, 15);
/*!40000 ALTER TABLE `auth_group_access` ENABLE KEYS */;

-- 导出  表 xianduoduo.auth_rule 结构
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- 正在导出表  xianduoduo.auth_rule 的数据：19 rows
DELETE FROM `auth_rule`;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`) VALUES
	(7, 'Goods/product_list', '商品管理页', 1, 1, ''),
	(5, 'Users/admin_list', '管理员管理页', 1, 1, ''),
	(4, 'Goods/product_category', '分类管理页', 1, 1, ''),
	(8, 'Goods/goods_type_add', '分类添加', 1, 1, ''),
	(9, 'Goods/product_category_del', '分类删除', 1, 1, ''),
	(10, 'Goods/product_add', '商品添加', 1, 1, ''),
	(11, 'Goods/product_edit', '商品编辑', 1, 1, ''),
	(12, 'Goods/product_del_ajax', '商品删除', 1, 1, ''),
	(13, 'Users/admin_add', '管理员添加', 1, 1, ''),
	(14, 'Users/admin_permission', '权限管理页', 1, 1, ''),
	(15, 'Users/admin_permission_add', '权限节点添加', 1, 1, ''),
	(16, 'Users/admin_permission_edit', '权限节点编辑', 1, 1, ''),
	(17, 'Users/admin_permission_del', '权限节点删除（未实现）', 1, 1, ''),
	(18, 'Users/admin_edit', '管理员编辑（未实现）', 1, 1, ''),
	(19, 'Users/admin_del', '管理员删除（未实现）', 1, 1, ''),
	(20, 'Users/admin_role', '角色管理页', 1, 1, ''),
	(21, 'Users/admin_role_add', '角色添加', 1, 1, ''),
	(22, 'Users/admin_role_edit', '角色编辑', 1, 1, ''),
	(23, 'Users/admin_del_ajax', '角色删除', 1, 1, '');
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods 结构
CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品自增id',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '商品的名字',
  `tid` int(11) DEFAULT NULL COMMENT '分类id',
  `tpid` int(255) DEFAULT NULL COMMENT '分类路径',
  `unit` char(255) DEFAULT NULL COMMENT '商品的单位',
  `attributes` enum('7','6','5','4','3','2','1') DEFAULT NULL COMMENT '商品的属性,1、推荐 2、新上 3、热卖 4、促销 5、包邮 6、限时卖 7、不参与会员折扣',
  `filepath` varchar(255) DEFAULT NULL COMMENT '商品图片id',
  `number` int(11) DEFAULT NULL COMMENT '商品编号',
  `barcode` int(255) DEFAULT NULL COMMENT '条形码',
  `curprice` int(11) DEFAULT NULL COMMENT '现价',
  `oriprice` int(11) DEFAULT NULL COMMENT '市场价',
  `cosprice` int(11) DEFAULT NULL COMMENT '成本价',
  `inventory` int(255) DEFAULT NULL COMMENT '库存量',
  `restrict` int(255) DEFAULT NULL COMMENT '限制购买量',
  `already` int(255) DEFAULT NULL COMMENT '已经购买量',
  `freight` int(255) DEFAULT NULL COMMENT '运费',
  `status` enum('1','0') DEFAULT NULL COMMENT '是否上架,0为上架,1为下架,默认0上架',
  `reorder` int(255) DEFAULT NULL,
  `text` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods 的数据：~13 rows (大约)
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `goodsname`, `tid`, `tpid`, `unit`, `attributes`, `filepath`, `number`, `barcode`, `curprice`, `oriprice`, `cosprice`, `inventory`, `restrict`, `already`, `freight`, `status`, `reorder`, `text`, `create_time`, `update_time`) VALUES
	(13, '芦笋', 44, 42, '盒', '1', NULL, 1, NULL, 40, NULL, 30, 2, NULL, NULL, 10, '0', NULL, '<p>111</p>', NULL, NULL),
	(14, '西红柿', 45, 43, '斤', '1', NULL, 1, NULL, 9, NULL, 6, 40, NULL, NULL, 12, '0', NULL, '<p>123</p>', NULL, NULL),
	(15, '香椿', 50, 43, '把', '1', NULL, 1, NULL, 5, NULL, 3, 10, NULL, NULL, 7, '0', NULL, '<p>12222</p>', NULL, NULL),
	(16, '菠菜', 49, 43, '把', '1', NULL, 34, NULL, 10, NULL, 8, 10, NULL, NULL, 10, '0', NULL, '<p>11111111111111</p>', NULL, NULL),
	(17, '草鱼', 48, 47, '斤', '1', NULL, 24, NULL, 10, NULL, 8, 10, NULL, NULL, 20, '0', NULL, '<p>1555</p>', NULL, NULL),
	(18, '菜花', 56, 43, '个', '1', '1', 11111, NULL, 6, NULL, 4, 100, NULL, NULL, 10, '0', NULL, '<p>1212</p>', '2019-05-10 16:37:08', '2019-05-10 16:37:08'),
	(19, '土豆', 54, 43, '斤', '1', '2', 1333, NULL, 3, NULL, 1, 30, NULL, NULL, 5, '0', NULL, '<p>144</p>', '2019-05-10 16:37:59', '2019-05-10 16:37:59'),
	(20, '长茄子', 67, 43, '斤', '1', '3', 3333, NULL, 7, NULL, 5, 11, NULL, NULL, 4, '0', NULL, '<p>15623</p>', '2019-05-10 16:38:48', '2019-05-10 16:38:48'),
	(21, '胡萝卜', 66, 43, '斤', '1', '4', 43333, NULL, 7, NULL, 4, 30, NULL, NULL, 5, '0', NULL, '<p>333333</p>', '2019-05-10 16:39:52', '2019-05-10 16:39:52'),
	(22, '油菜', 61, 43, '斤', '1', '5', 12111, NULL, 6, NULL, 4, 2, NULL, NULL, 5, '0', NULL, '<p>油菜</p>', '2019-05-10 16:42:03', '2019-05-10 16:42:03'),
	(23, '玉米', 63, 43, '个', '1', '6', 1444, NULL, 3, NULL, 2, 11, NULL, NULL, 10, '0', NULL, '<p>玉米</p>', '2019-05-10 16:46:44', '2019-05-10 16:46:44'),
	(24, '荷兰豆', 60, 42, '斤', '1', '7', 544, NULL, 10, NULL, 8, 10, NULL, NULL, 5, '0', NULL, '<p>荷兰豆</p>', '2019-05-10 16:51:41', '2019-05-10 16:51:41'),
	(25, '荔浦芋头', 58, 43, '斤', '1', '8', 12, NULL, 9, NULL, 6, 30, NULL, NULL, 10, '0', NULL, '<p>芋头</p>', '2019-05-10 16:52:45', '2019-05-10 16:52:45');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods_files 结构
CREATE TABLE IF NOT EXISTS `goods_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods_files 的数据：~8 rows (大约)
DELETE FROM `goods_files`;
/*!40000 ALTER TABLE `goods_files` DISABLE KEYS */;
INSERT INTO `goods_files` (`id`, `filepath`) VALUES
	(1, '/public/uploads20190510/766621933dba0d4d476f4deb7566b2e4.jpg'),
	(2, '/public/uploads20190510/32148bf8e7c431ad80d0934255ae3550.jpg'),
	(3, '/public/uploads20190510/3e4896bd336db6a549adeb22cfe14e1e.jpg'),
	(4, '/public/uploads20190510/34cc0d5b93e18d6ce072a2321e903152.jpg'),
	(5, '/public/uploads20190510/d3fcfe02ec0b74a00bea58ca5f884bec.jpg'),
	(6, '/public/uploads20190510/723c7b6ffd101d1e98fccc07aabfcd61.jpg'),
	(7, '/public/uploads20190510/7df044c1f623fc8d8cde890b863df75a.jpg'),
	(8, '/public/uploads20190510/5bed417c10a1a8c7b1d7c48af3300024.jpg');
/*!40000 ALTER TABLE `goods_files` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods_type 结构
CREATE TABLE IF NOT EXISTS `goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods_type 的数据：~28 rows (大约)
DELETE FROM `goods_type`;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` (`id`, `name`, `pid`, `path`, `level`) VALUES
	(41, '蔬菜', 0, '0,41', 1),
	(42, '进口蔬菜', 41, '0,41,42', 2),
	(43, '国产蔬菜', 41, '0,41,43', 2),
	(44, '芦笋', 42, '0,41,42,44', 3),
	(45, '西红柿', 43, '0,41,43,45', 3),
	(46, '水产', 0, '0,46', 1),
	(47, '鱼', 46, '0,46,47', 2),
	(48, '草鱼', 47, '0,46,47,48', 3),
	(49, '菠菜', 43, '0,41,43,49', 3),
	(50, '香椿', 43, '0,41,43,50', 3),
	(51, '水果', 0, '0,51', 1),
	(52, '进口水果', 51, '0,51,52', 2),
	(53, '国产水果', 51, '0,51,53', 2),
	(54, '土豆', 43, '0,41,43,54', 3),
	(55, '白菜', 43, '0,41,43,55', 3),
	(56, '菜花', 43, '0,41,43,56', 3),
	(57, '洋芋', 42, '0,41,42,57', 3),
	(58, '荔浦芋头', 43, '0,41,43,58', 3),
	(59, '秋葵', 43, '0,41,43,59', 3),
	(60, '荷兰豆', 42, '0,41,42,60', 3),
	(61, '油菜', 43, '0,41,43,61', 3),
	(62, '圆白菜', 43, '0,41,43,62', 3),
	(63, '玉米', 43, '0,41,43,63', 3),
	(64, '苦菊', 43, '0,41,43,64', 3),
	(65, '大葱', 43, '0,41,43,65', 3),
	(66, '胡萝卜', 43, '0,41,43,66', 3),
	(67, '长茄子', 43, '0,41,43,67', 3),
	(68, '紫甘蓝', 43, '0,41,43,68', 3);
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;

-- 导出  表 xianduoduo.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(6) NOT NULL COMMENT '商品编号',
  `username` varchar(255) NOT NULL COMMENT '顾客',
  `address` varchar(255) NOT NULL COMMENT '运送地址',
  `orderstate` int(1) NOT NULL COMMENT '1 已签收 2已送达 3运送中',
  `payinfo` varchar(255) NOT NULL COMMENT '支付信息',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.orders 的数据：3 rows
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderid`, `username`, `address`, `orderstate`, `payinfo`) VALUES
	(11, '张三', '北京', 1, '120'),
	(12, '李四', '上海', 2, '280'),
	(13, '王五', '天津', 3, '300');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 导出  表 xianduoduo.ordersdetail 结构
CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `id` int(6) NOT NULL COMMENT 'id编号',
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.ordersdetail 的数据：5 rows
DELETE FROM `ordersdetail`;
/*!40000 ALTER TABLE `ordersdetail` DISABLE KEYS */;
INSERT INTO `ordersdetail` (`id`, `orderid`, `goods`, `quantity`, `unitprice`) VALUES
	(1, 11, '面包', 2, '5'),
	(2, 11, '洗发水', 2, '55'),
	(3, 12, 'jeans', 1, '280'),
	(4, 13, 'skirts', 2, '100'),
	(5, 13, 'trouser', 2, '50');
/*!40000 ALTER TABLE `ordersdetail` ENABLE KEYS */;

-- 导出  表 xianduoduo.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.user 的数据：~2 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `user_name`, `user_password`, `create_time`, `update_time`) VALUES
	(2, 'acbca', '972cca37a2e97b54154560196d7440f4', '2019-04-19 15:36:46', '2019-04-19 15:36:46'),
	(3, 'winnie', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-11 09:44:15', '2019-05-11 09:44:15');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
