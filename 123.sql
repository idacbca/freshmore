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
  `admin_password` varchar(50) DEFAULT NULL,
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
  `goodsname` varchar(255) NOT NULL DEFAULT 'goods' COMMENT '商品的名字',
  `tid` int(11) DEFAULT NULL COMMENT '分类id',
  `tpid` int(255) DEFAULT NULL COMMENT '分类路径',
  `unit` char(255) DEFAULT NULL COMMENT '商品的单位',
  `attributes` enum('7','6','5','4','3','2','1') DEFAULT NULL COMMENT '商品的属性,1、推荐 2、新上 3、热卖 4、促销 5、包邮 6、限时卖 7、不参与会员折扣',
  `imagepath` varchar(255) DEFAULT NULL COMMENT '商品图片id',
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
  `text` text COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '商品被创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '商品被修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods 的数据：~5 rows (大约)
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `goodsname`, `tid`, `tpid`, `unit`, `attributes`, `imagepath`, `number`, `barcode`, `curprice`, `oriprice`, `cosprice`, `inventory`, `restrict`, `already`, `freight`, `status`, `reorder`, `text`, `create_time`, `update_time`) VALUES
	(13, '芦笋', 44, 42, '盒', '1', NULL, 1, NULL, 40, NULL, 30, 2, NULL, NULL, 10, '0', NULL, '<p>111</p>', NULL, NULL),
	(14, '西红柿', 45, 43, '斤', '1', NULL, 1, NULL, 9, NULL, 6, 40, NULL, NULL, 12, '0', NULL, '<p>123</p>', NULL, NULL),
	(15, '香椿', 50, 43, '把', '1', NULL, 1, NULL, 5, NULL, 3, 10, NULL, NULL, 7, '0', NULL, '<p>12222</p>', NULL, NULL),
	(16, '菠菜', 49, 43, '把', '1', NULL, 34, NULL, 10, NULL, 8, 10, NULL, NULL, 10, '0', NULL, '<p>11111111111111</p>', NULL, NULL),
	(17, '草鱼', 48, 47, '斤', '1', NULL, 24, NULL, 10, NULL, 8, 10, NULL, NULL, 20, '0', NULL, '<p>1555</p>', NULL, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods_type 结构
CREATE TABLE IF NOT EXISTS `goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods_type 的数据：~11 rows (大约)
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
	(50, '香椿', 43, '0,41,43,50', 3);
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
