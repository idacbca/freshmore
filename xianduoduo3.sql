/*
 Navicat Premium Data Transfer

 Source Server         : duoduo
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : xianduoduo

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 22/05/2019 11:56:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, '1234', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `admin_user` VALUES (4, 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `admin_user` VALUES (5, '1111', 'b59c67bf196a4758191e42f76670ceba');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (17, '超级管理员', 1, '4,8,9,7,10,11,12,20,21,22,23,14,15,16,17,5,13,18,19', '拥有至高无上的权限');
INSERT INTO `auth_group` VALUES (15, '商品管理员', 1, '4,8,9,7,10,11,12', '拥有商品分类管理及商品管理权限');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES (1, 17);
INSERT INTO `auth_group_access` VALUES (4, 17);
INSERT INTO `auth_group_access` VALUES (5, 15);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES (7, 'Goods/product_list', '商品管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (5, 'Users/admin_list', '管理员管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (4, 'Goods/product_category', '分类管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (8, 'Goods/goods_type_add', '分类添加', 1, 1, '');
INSERT INTO `auth_rule` VALUES (9, 'Goods/product_category_del', '分类删除', 1, 1, '');
INSERT INTO `auth_rule` VALUES (10, 'Goods/product_add', '商品添加', 1, 1, '');
INSERT INTO `auth_rule` VALUES (11, 'Goods/product_edit', '商品编辑', 1, 1, '');
INSERT INTO `auth_rule` VALUES (12, 'Goods/product_del_ajax', '商品删除', 1, 1, '');
INSERT INTO `auth_rule` VALUES (13, 'Users/admin_add', '管理员添加', 1, 1, '');
INSERT INTO `auth_rule` VALUES (14, 'Users/admin_permission', '权限管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (15, 'Users/admin_permission_add', '权限节点添加', 1, 1, '');
INSERT INTO `auth_rule` VALUES (16, 'Users/admin_permission_edit', '权限节点编辑', 1, 1, '');
INSERT INTO `auth_rule` VALUES (17, 'Users/admin_permission_del', '权限节点删除（未实现）', 1, 1, '');
INSERT INTO `auth_rule` VALUES (18, 'Users/admin_edit', '管理员编辑（未实现）', 1, 1, '');
INSERT INTO `auth_rule` VALUES (19, 'Users/admin_del', '管理员删除（未实现）', 1, 1, '');
INSERT INTO `auth_rule` VALUES (20, 'Users/admin_role', '角色管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (21, 'Users/admin_role_add', '角色添加', 1, 1, '');
INSERT INTO `auth_rule` VALUES (22, 'Users/admin_role_edit', '角色编辑', 1, 1, '');
INSERT INTO `auth_rule` VALUES (23, 'Users/admin_del_ajax', '角色删除', 1, 1, '');

-- ----------------------------
-- Table structure for cartdetail
-- ----------------------------
DROP TABLE IF EXISTS `cartdetail`;
CREATE TABLE `cartdetail`  (
  `id` int(6) NULL DEFAULT NULL COMMENT '用户id',
  `goodsid` int(6) NOT NULL COMMENT '商品id',
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `unitprice` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单价',
  `totalprice` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总价',
  `quantity` int(6) NOT NULL COMMENT '商品数量',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `selfid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`selfid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartdetail
-- ----------------------------
INSERT INTO `cartdetail` VALUES (4, 33, '新西兰苹果', '15', '150', 10, '2019-05-21 21:58:57', '2019-05-21 21:58:57', 37);
INSERT INTO `cartdetail` VALUES (4, 32, '埃及橙子', '10', '100', 10, '2019-05-21 21:59:14', '2019-05-21 21:59:14', 38);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品自增id',
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的名字',
  `tid` int(11) NULL DEFAULT NULL COMMENT '分类id',
  `tpid` int(255) NULL DEFAULT NULL COMMENT '分类路径',
  `unit` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的单位',
  `attributes` enum('7','6','5','4','3','2','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的属性,1、推荐 2、新上 3、热卖 4、促销 5、包邮 6、限时卖 7、不参与会员折扣',
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片id',
  `number` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `barcode` int(255) NULL DEFAULT NULL COMMENT '条形码',
  `curprice` int(11) NULL DEFAULT NULL COMMENT '现价',
  `oriprice` int(11) NULL DEFAULT NULL COMMENT '市场价',
  `cosprice` int(11) NULL DEFAULT NULL COMMENT '成本价',
  `inventory` int(255) NULL DEFAULT NULL COMMENT '库存量',
  `restrict` int(255) NULL DEFAULT NULL COMMENT '限制购买量',
  `already` int(255) NULL DEFAULT NULL COMMENT '已经购买量',
  `freight` int(255) NULL DEFAULT NULL COMMENT '运费',
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否上架,0为上架,1为下架,默认0上架',
  `reorder` int(255) NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (14, '西红柿', 45, 43, '斤', '1', NULL, 1, NULL, 9, NULL, 6, 30, NULL, NULL, 12, '0', NULL, '<p>123</p>', NULL, '2019-05-20 13:13:56');
INSERT INTO `goods` VALUES (17, '草鱼', 48, 47, '斤', '1', NULL, 24, NULL, 10, NULL, 8, 10, NULL, NULL, 20, '0', NULL, '<p>1555</p>', NULL, NULL);
INSERT INTO `goods` VALUES (19, '土豆', 54, 43, '斤', '1', '28,2', 1333, NULL, 3, NULL, 1, 25, NULL, NULL, 5, '0', NULL, '<p>144</p>', '2019-05-10 16:37:59', '2019-05-20 13:14:08');
INSERT INTO `goods` VALUES (25, '荔浦芋头', 58, 43, '斤', '1', '8', 12, NULL, 9, NULL, 6, 22, NULL, NULL, 10, '0', NULL, '<p>芋头</p>', '2019-05-10 16:52:45', '2019-05-10 16:52:45');
INSERT INTO `goods` VALUES (26, '圣女果', 73, 52, '盒', '1', '27,9', 31001, NULL, 4, NULL, 2, 444, NULL, NULL, 3, '0', NULL, '<p>圣女果新鲜</p>', '2019-05-17 09:41:12', '2019-05-20 13:13:30');
INSERT INTO `goods` VALUES (27, '国产柠檬', 75, 53, '个', '3', '25,10', 31011, NULL, 6, NULL, 4, 545, NULL, NULL, 2, '0', NULL, '<p>可口</p>', '2019-05-17 09:42:55', '2019-05-20 13:12:55');
INSERT INTO `goods` VALUES (28, '青提', 71, 53, '份', '1', '29,24,11', 31002, NULL, 8, NULL, 5, 235, NULL, NULL, 1, '0', NULL, '<p>甜</p>', '2019-05-17 09:44:14', '2019-05-20 14:24:51');
INSERT INTO `goods` VALUES (29, '红富士苹果', 69, 53, '份', '1', '26,12', 31003, NULL, 12, NULL, 9, 5455, NULL, NULL, 4, '0', NULL, '<p>烟台红富士<br/></p>', '2019-05-17 09:46:09', '2019-05-20 13:13:11');
INSERT INTO `goods` VALUES (30, '山东小土豆', 79, 43, '盒', '1', '20,13', 10011, NULL, 4, NULL, 3, 5453, NULL, NULL, 1, '0', NULL, '<p>新鲜上市！</p>', '2019-05-17 09:58:17', '2019-05-20 13:11:36');
INSERT INTO `goods` VALUES (31, '吉林黑糯玉米', 63, 43, '根', '1', '23,14', 31004, NULL, 7, NULL, 2, 222, NULL, NULL, 1, '0', NULL, '<p>软糯</p>', '2019-05-17 10:00:02', '2019-05-20 13:12:31');
INSERT INTO `goods` VALUES (32, '埃及橙子', 77, 52, '个', '2', '22,15', 31006, NULL, 10, NULL, 7, 34, NULL, NULL, 1, '0', NULL, '<p>好吃</p>', '2019-05-17 10:07:15', '2019-05-20 13:12:17');
INSERT INTO `goods` VALUES (33, '新西兰苹果', 78, 52, '盒', '2', '21,16', 31010, NULL, 15, NULL, 10, 29, NULL, NULL, 7, '0', NULL, '<p>新上架</p>', '2019-05-17 10:11:02', '2019-05-20 13:12:04');
INSERT INTO `goods` VALUES (34, '芦笋', 44, 42, '把', '3', '17', 10003, NULL, 3, NULL, 2, 67, NULL, NULL, 0, '0', NULL, '<p>鲜</p>', '2019-05-17 16:00:43', '2019-05-17 16:00:43');
INSERT INTO `goods` VALUES (35, '洋芋', 57, 42, '个', '2', '18', 10012, NULL, 8, NULL, 7, 32, NULL, NULL, 2, '0', NULL, '<p>糯</p>', '2019-05-17 16:02:03', '2019-05-17 16:02:03');
INSERT INTO `goods` VALUES (36, '荷兰豆', 60, 42, '0', '1', '19', 10014, NULL, 4, NULL, 3, 23, NULL, NULL, 1, '0', NULL, '<p>脆</p>', '2019-05-17 16:02:54', '2019-05-17 16:02:54');

-- ----------------------------
-- Table structure for goods_files
-- ----------------------------
DROP TABLE IF EXISTS `goods_files`;
CREATE TABLE `goods_files`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_files
-- ----------------------------
INSERT INTO `goods_files` VALUES (20, '/uploads/20190520/081e97b740f947ee422b4070d2a6ac1b.jpg');
INSERT INTO `goods_files` VALUES (21, '/uploads/20190520/1193628977aad24fb845f0ea80c23344.jpg');
INSERT INTO `goods_files` VALUES (22, '/uploads/20190520/923e3b192ec5c093127b95bc2212ff4c.jpg');
INSERT INTO `goods_files` VALUES (23, '/uploads/20190520/0605a2355873c7d2e3e55bb5d727feac.jpg');
INSERT INTO `goods_files` VALUES (24, '/uploads/20190520/200706a59469a49df3284a95224d98f9.jpg');
INSERT INTO `goods_files` VALUES (25, '/uploads/20190520/5cf7c9ba45d42989d61b2ac41a26f287.jpg');
INSERT INTO `goods_files` VALUES (26, '/uploads/20190520/258f596ac3e36a89504cebb4b801f3c9.jpg');
INSERT INTO `goods_files` VALUES (27, '/uploads/20190520/90ec87423feb62890b79b26a73faa07d.jpg');
INSERT INTO `goods_files` VALUES (28, '/uploads/20190520/53b8f32473b2e41717bdb981d53af3c4.jpg');
INSERT INTO `goods_files` VALUES (29, '/uploads/20190520/dea041ec534871cfdc3325e281b7de6c.jpg');

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (41, '蔬菜', 0, '0,41', 1);
INSERT INTO `goods_type` VALUES (42, '进口蔬菜', 41, '0,41,42', 2);
INSERT INTO `goods_type` VALUES (43, '国产蔬菜', 41, '0,41,43', 2);
INSERT INTO `goods_type` VALUES (44, '芦笋', 42, '0,41,42,44', 3);
INSERT INTO `goods_type` VALUES (45, '西红柿', 43, '0,41,43,45', 3);
INSERT INTO `goods_type` VALUES (46, '水产', 0, '0,46', 1);
INSERT INTO `goods_type` VALUES (47, '鱼', 46, '0,46,47', 2);
INSERT INTO `goods_type` VALUES (48, '草鱼', 47, '0,46,47,48', 3);
INSERT INTO `goods_type` VALUES (51, '水果', 0, '0,51', 1);
INSERT INTO `goods_type` VALUES (52, '进口水果', 51, '0,51,52', 2);
INSERT INTO `goods_type` VALUES (53, '国产水果', 51, '0,51,53', 2);
INSERT INTO `goods_type` VALUES (54, '土豆', 43, '0,41,43,54', 3);
INSERT INTO `goods_type` VALUES (57, '洋芋', 42, '0,41,42,57', 3);
INSERT INTO `goods_type` VALUES (58, '荔浦芋头', 43, '0,41,43,58', 3);
INSERT INTO `goods_type` VALUES (60, '荷兰豆', 42, '0,41,42,60', 3);
INSERT INTO `goods_type` VALUES (63, '玉米', 43, '0,41,43,63', 3);
INSERT INTO `goods_type` VALUES (69, '红富士', 53, '0,51,53,69', 3);
INSERT INTO `goods_type` VALUES (71, '青提', 53, '0,51,53,71', 3);
INSERT INTO `goods_type` VALUES (73, '圣女果', 52, '0,51,52,73', 3);
INSERT INTO `goods_type` VALUES (75, '国产柠檬', 53, '0,51,53,75', 3);
INSERT INTO `goods_type` VALUES (77, '埃及橙子', 52, '0,51,52,77', 3);
INSERT INTO `goods_type` VALUES (78, '新西兰苹果', 52, '0,51,52,78', 3);
INSERT INTO `goods_type` VALUES (79, '小土豆', 43, '0,41,43,79', 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(6) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `id` int(255) NOT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顾客',
  `orderstate` int(1) NOT NULL COMMENT '0已发货 1 未发货',
  `freight` int(255) NOT NULL COMMENT '订单运费',
  `payinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付信息',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (80, 3, '16110120', 1, 5, '8406', '2019-05-20 15:52:39', '2019-05-20 15:52:39', NULL, NULL);
INSERT INTO `orders` VALUES (82, 3, '16110120', 1, 5, '4205', '2019-05-20 16:01:30', '2019-05-20 16:01:30', NULL, NULL);
INSERT INTO `orders` VALUES (83, 3, 'winnie', 1, 12, '150', '2019-05-20 19:11:55', '2019-05-20 19:11:55', NULL, NULL);

-- ----------------------------
-- Table structure for ordersdetail
-- ----------------------------
DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE `ordersdetail`  (
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单价',
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `商品编号`(`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordersdetail
-- ----------------------------
INSERT INTO `ordersdetail` VALUES (82, '康师傅', 3, '400', 49);
INSERT INTO `ordersdetail` VALUES (82, 'lolita', 3, '1000', 48);
INSERT INTO `ordersdetail` VALUES (80, '康师傅', 11, '400', 46);
INSERT INTO `ordersdetail` VALUES (80, 'lolita', 4, '1000', 47);
INSERT INTO `ordersdetail` VALUES (80, '女装大佬', 1, '1', 45);
INSERT INTO `ordersdetail` VALUES (83, '西红柿', 3, '9', 50);
INSERT INTO `ordersdetail` VALUES (83, '新西兰苹果', 4, '15', 51);
INSERT INTO `ordersdetail` VALUES (83, '土豆', 5, '3', 52);
INSERT INTO `ordersdetail` VALUES (83, '荔浦芋头', 4, '9', 53);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'acbca', '972cca37a2e97b54154560196d7440f4', '2019-04-19 15:36:46', '2019-04-19 15:36:46');
INSERT INTO `user` VALUES (3, 'winnie', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-11 09:44:15', '2019-05-11 09:44:15');
INSERT INTO `user` VALUES (4, '16110120', '94d39231f2f1d3711e9011570063ac2b', '2019-05-20 19:37:43', '2019-05-20 19:37:43');

SET FOREIGN_KEY_CHECKS = 1;