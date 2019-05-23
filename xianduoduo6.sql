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

-- 导出  表 xianduoduo.cartdetail 结构
CREATE TABLE IF NOT EXISTS `cartdetail` (
  `id` int(6) NOT NULL COMMENT '用户id',
  `goodsid` int(6) NOT NULL COMMENT '商品id',
  `goodsname` varchar(255) NOT NULL COMMENT '商品名称',
  `unitprice` char(6) NOT NULL COMMENT '单价',
  `totalprice` varchar(6) NOT NULL COMMENT '总价',
  `quantity` int(6) NOT NULL COMMENT '商品数量',
  `create_time` varchar(255) NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) NOT NULL COMMENT '更新时间',
  `selfid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`selfid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.cartdetail 的数据：~2 rows (大约)
DELETE FROM `cartdetail`;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
INSERT INTO `cartdetail` (`id`, `goodsid`, `goodsname`, `unitprice`, `totalprice`, `quantity`, `create_time`, `update_time`, `selfid`) VALUES
	(4, 11, '康师傅', '400', '2400', 6, '2019-05-18 21:12:53', '2019-05-18 21:12:53', 17),
	(0, 0, '', '', '', 0, '2019-05-19 21:16:53', '2019-05-19 21:16:53', 27);
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods 的数据：~15 rows (大约)
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `goodsname`, `tid`, `tpid`, `unit`, `attributes`, `filepath`, `number`, `barcode`, `curprice`, `oriprice`, `cosprice`, `inventory`, `restrict`, `already`, `freight`, `status`, `reorder`, `text`, `create_time`, `update_time`) VALUES
	(14, '西红柿', 45, 43, '斤', '1', '43,42', 1, NULL, 9, NULL, 6, 26, NULL, NULL, 12, '0', NULL, '<p>123</p>', NULL, '2019-05-22 18:03:01'),
	(17, '草鱼', 48, 47, '斤', '1', '34,33', 24, NULL, 10, NULL, 8, 6, NULL, NULL, 20, '0', NULL, '<p>1555</p>', NULL, '2019-05-21 12:17:35'),
	(19, '土豆', 54, 43, '斤', '1', '28', 1333, NULL, 3, NULL, 1, 30, NULL, NULL, 5, '0', NULL, '<p>144</p>', '2019-05-10 16:37:59', '2019-05-20 13:14:08'),
	(25, '荔浦芋头', 58, 43, '斤', '1', '36,35', 12, NULL, 9, NULL, 6, 30, NULL, NULL, 10, '0', NULL, '<p>芋头</p>', '2019-05-10 16:52:45', '2019-05-21 12:18:46'),
	(26, '圣女果', 73, 52, '盒', '1', '37,27', 31001, NULL, 4, NULL, 2, 439, NULL, NULL, 3, '0', NULL, '<p>圣女果新鲜</p>', '2019-05-17 09:41:12', '2019-05-21 12:19:29'),
	(27, '国产柠檬', 75, 53, '个', '3', '25', 31011, NULL, 6, NULL, 4, 545, NULL, NULL, 2, '0', NULL, '<p>可口</p>', '2019-05-17 09:42:55', '2019-05-20 13:12:55'),
	(28, '青提', 71, 53, '份', '1', '29,24', 31002, NULL, 8, NULL, 5, 235, NULL, NULL, 1, '0', NULL, '<p>甜</p>', '2019-05-17 09:44:14', '2019-05-20 14:24:51'),
	(29, '红富士苹果', 69, 53, '份', '1', '26', 31003, NULL, 12, NULL, 9, 5455, NULL, NULL, 4, '0', NULL, '<p>烟台红富士<br/></p>', '2019-05-17 09:46:09', '2019-05-20 13:13:11'),
	(30, '山东小土豆', 79, 43, '盒', '1', '20', 10011, NULL, 4, NULL, 3, 5453, NULL, NULL, 1, '0', NULL, '<p>新鲜上市！</p>', '2019-05-17 09:58:17', '2019-05-20 13:11:36'),
	(31, '吉林黑糯玉米', 63, 43, '根', '1', '23', 31004, NULL, 7, NULL, 2, 222, NULL, NULL, 1, '0', NULL, '<p>软糯</p>', '2019-05-17 10:00:02', '2019-05-20 13:12:31'),
	(32, '埃及橙子', 77, 52, '个', '2', '22', 31006, NULL, 10, NULL, 7, 44, NULL, NULL, 1, '0', NULL, '<p>好吃</p>', '2019-05-17 10:07:15', '2019-05-20 13:12:17'),
	(33, '新西兰苹果', 78, 52, '盒', '2', '21', 31010, NULL, 15, NULL, 10, 43, NULL, NULL, 7, '0', NULL, '<p>新上架</p>', '2019-05-17 10:11:02', '2019-05-20 13:12:04'),
	(34, '芦笋', 44, 42, '把', '3', '32,31,30', 10003, NULL, 3, NULL, 2, 65, NULL, NULL, 0, '0', NULL, '<p>鲜</p>', '2019-05-17 16:00:43', '2019-05-21 12:16:42'),
	(35, '洋芋', 57, 42, '个', '2', '41,40', 10012, NULL, 8, NULL, 7, 32, NULL, NULL, 2, '0', NULL, '<p>糯</p>', '2019-05-17 16:02:03', '2019-05-21 12:21:19'),
	(36, '荷兰豆', 60, 42, '0', '1', '39,38', 10014, NULL, 4, NULL, 3, 23, NULL, NULL, 1, '0', NULL, '<p>脆</p>', '2019-05-17 16:02:54', '2019-05-21 12:20:26');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods_files 结构
CREATE TABLE IF NOT EXISTS `goods_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods_files 的数据：~21 rows (大约)
DELETE FROM `goods_files`;
/*!40000 ALTER TABLE `goods_files` DISABLE KEYS */;
INSERT INTO `goods_files` (`id`, `filepath`) VALUES
	(20, '/uploads/20190520/081e97b740f947ee422b4070d2a6ac1b.jpg'),
	(21, '/uploads/20190520/1193628977aad24fb845f0ea80c23344.jpg'),
	(22, '/uploads/20190520/923e3b192ec5c093127b95bc2212ff4c.jpg'),
	(23, '/uploads/20190520/0605a2355873c7d2e3e55bb5d727feac.jpg'),
	(24, '/uploads/20190520/200706a59469a49df3284a95224d98f9.jpg'),
	(25, '/uploads/20190520/5cf7c9ba45d42989d61b2ac41a26f287.jpg'),
	(26, '/uploads/20190520/258f596ac3e36a89504cebb4b801f3c9.jpg'),
	(27, '/uploads/20190520/90ec87423feb62890b79b26a73faa07d.jpg'),
	(28, '/uploads/20190520/53b8f32473b2e41717bdb981d53af3c4.jpg'),
	(29, '/uploads/20190520/dea041ec534871cfdc3325e281b7de6c.jpg'),
	(30, '/uploads/20190521/7e49c82fa8b1fdc82ba4b28a44b3fc27.jpg'),
	(31, '/uploads/20190521/43364ff7d5f600d767c04e7ca3cec345.jpg'),
	(32, '/uploads/20190521/bd546323dcd473ca72001d055c6ee245.jpg'),
	(33, '/uploads/20190521/6944992d6789921f5cff1265b2e25f41.jpg'),
	(34, '/uploads/20190521/a5714b3013531169f0b3ffcdc435d54f.jpg'),
	(35, '/uploads/20190521/cf516b4a196b1b7204c176275a33da2f.jpg'),
	(36, '/uploads/20190521/9241a5f85243c1e84237882a8e0ac4af.jpg'),
	(37, '/uploads/20190521/0c92f97261ffd1c379dca7903a5014ef.jpg'),
	(38, '/uploads/20190521/8af34eff49db234a7f90517931d22a93.jpg'),
	(39, '/uploads/20190521/9b63206f21e68a03c8cb1b5fc84999bc.jpg'),
	(40, '/uploads/20190521/85db6ef1ef0b7f866a6e49c7bc4fe2e7.jpg'),
	(41, '/uploads/20190521/7990726993d01eff271680528c2b4158.jpg'),
	(42, '/uploads/20190522/3dcfba8715c4c5dbb854227b6c4554b8.jpg'),
	(43, '/uploads/20190522/80742d3f9093f8bea7f33cb7ed5bf568.jpg');
/*!40000 ALTER TABLE `goods_files` ENABLE KEYS */;

-- 导出  表 xianduoduo.goods_type 结构
CREATE TABLE IF NOT EXISTS `goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.goods_type 的数据：~26 rows (大约)
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
	(51, '水果', 0, '0,51', 1),
	(52, '进口水果', 51, '0,51,52', 2),
	(53, '国产水果', 51, '0,51,53', 2),
	(54, '土豆', 43, '0,41,43,54', 3),
	(57, '洋芋', 42, '0,41,42,57', 3),
	(58, '荔浦芋头', 43, '0,41,43,58', 3),
	(60, '荷兰豆', 42, '0,41,42,60', 3),
	(63, '玉米', 43, '0,41,43,63', 3),
	(69, '红富士', 53, '0,51,53,69', 3),
	(71, '青提', 53, '0,51,53,71', 3),
	(73, '圣女果', 52, '0,51,52,73', 3),
	(75, '国产柠檬', 53, '0,51,53,75', 3),
	(77, '埃及橙子', 52, '0,51,52,77', 3),
	(78, '新西兰苹果', 52, '0,51,52,78', 3),
	(79, '小土豆', 43, '0,41,43,79', 3);
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;

-- 导出  表 xianduoduo.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(6) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `id` int(255) NOT NULL COMMENT '用户id',
  `username` varchar(255) NOT NULL COMMENT '顾客',
  `orderstate` int(1) NOT NULL COMMENT '0已发货 1 未发货',
  `freight` int(255) NOT NULL COMMENT '订单运费',
  `payinfo` varchar(255) NOT NULL COMMENT '支付信息',
  `create_time` varchar(255) NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.orders 的数据：2 rows
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderid`, `id`, `username`, `orderstate`, `freight`, `payinfo`, `create_time`, `update_time`) VALUES
	(80, 3, '16110120', 1, 5, '8406', '2019-05-20 15:52:39', '2019-05-20 15:52:39'),
	(82, 3, '16110120', 1, 5, '4205', '2019-05-20 16:01:30', '2019-05-20 16:01:30');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 导出  表 xianduoduo.ordersdetail 结构
CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) NOT NULL COMMENT '单价',
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `商品编号` (`orderid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  xianduoduo.ordersdetail 的数据：5 rows
DELETE FROM `ordersdetail`;
/*!40000 ALTER TABLE `ordersdetail` DISABLE KEYS */;
INSERT INTO `ordersdetail` (`orderid`, `goods`, `quantity`, `unitprice`, `id`) VALUES
	(82, '康师傅', 3, '400', 49),
	(82, 'lolita', 3, '1000', 48),
	(80, '康师傅', 11, '400', 46),
	(80, 'lolita', 4, '1000', 47),
	(80, '女装大佬', 1, '1', 45);
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
