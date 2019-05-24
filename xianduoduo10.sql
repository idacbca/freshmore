/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : xianduoduo

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 24/05/2019 10:05:56
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
INSERT INTO `auth_group` VALUES (17, '超级管理员', 1, '4,8,9,7,10,11,12,26,27,28,29,30,31,20,21,22,23,14,15,16,17,5,13,18,19,24,25', '拥有至高无上的权限');
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
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

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
INSERT INTO `auth_rule` VALUES (24, 'Users/user_list', '用户管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (25, 'Users/change_password', '用户密码修改', 1, 1, '');
INSERT INTO `auth_rule` VALUES (26, 'Orders/orders', '订单管理页', 1, 1, '');
INSERT INTO `auth_rule` VALUES (27, 'Orders/orders_del_ajax', '订单删除', 1, 1, '');
INSERT INTO `auth_rule` VALUES (28, 'Orders/ordersdetail', '订单详情查看', 1, 1, '');
INSERT INTO `auth_rule` VALUES (29, 'Orders/ordersdetail_del_ajax', '订单详情删除', 1, 1, '');
INSERT INTO `auth_rule` VALUES (30, 'Orders/orders_start_ajax', '订单发货', 1, 1, '');
INSERT INTO `auth_rule` VALUES (31, 'Orders/orders_stop_ajax', '订单设置未发货', 1, 1, '');

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
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`selfid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartdetail
-- ----------------------------
INSERT INTO `cartdetail` VALUES (7, 26, '圣女果', '4', '16', 4, '2019-05-23 00:45:53', '2019-05-23 00:45:53', 45, '0');
INSERT INTO `cartdetail` VALUES (7, 17, '草鱼', '10', '20', 2, '2019-05-23 00:47:17', '2019-05-23 00:47:17', 47, '0');
INSERT INTO `cartdetail` VALUES (7, 31, '吉林黑糯玉米', '7', '21', 3, '2019-05-23 00:47:37', '2019-05-23 00:47:37', 48, '0');
INSERT INTO `cartdetail` VALUES (7, 19, '土豆', '3', '21', 7, '2019-05-23 00:50:54', '2019-05-23 00:50:54', 50, '0');
INSERT INTO `cartdetail` VALUES (7, 14, '西红柿', '9', '72', 8, '2019-05-23 00:51:19', '2019-05-23 00:51:19', 51, '0');
INSERT INTO `cartdetail` VALUES (NULL, 0, '', '', '', 0, '2019-05-23 10:47:53', '2019-05-23 10:47:53', 63, '0');
INSERT INTO `cartdetail` VALUES (NULL, 0, '', '', '', 0, '2019-05-23 10:49:05', '2019-05-23 10:49:05', 64, '0');
INSERT INTO `cartdetail` VALUES (8, 26, '圣女果', '4', '20', 5, '2019-05-23 17:04:01', '2019-05-23 17:04:01', 65, '0');
INSERT INTO `cartdetail` VALUES (4, 14, '西红柿', '9', '27', 3, '2019-05-23 20:34:19', '2019-05-23 20:34:19', 70, '0');
INSERT INTO `cartdetail` VALUES (3, 34, '芦笋', '3', '3', 1, '2019-05-23 21:42:57', '2019-05-23 21:42:57', 71, '/uploads/20190521/bd546323dcd473ca72001d055c6ee245.jpg');
INSERT INTO `cartdetail` VALUES (4, 17, '草鱼', '10', '10', 1, '2019-05-23 21:49:27', '2019-05-23 21:49:27', 72, '/uploads/20190521/a5714b3013531169f0b3ffcdc435d54f.jpg');

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
INSERT INTO `goods` VALUES (14, '西红柿', 45, 43, '斤', '1', '43,42', 1, NULL, 9, NULL, 6, 0, NULL, NULL, 12, '0', NULL, '<p>特红</p>', NULL, '2019-05-22 18:03:01');
INSERT INTO `goods` VALUES (17, '草鱼', 48, 47, '斤', '1', '34,33', 24, NULL, 10, NULL, 8, 1, NULL, NULL, 20, '0', NULL, '<p>肉嫩</p>', NULL, '2019-05-21 12:17:35');
INSERT INTO `goods` VALUES (19, '土豆', 54, 43, '斤', '1', '28', 1333, NULL, 3, NULL, 1, 23, NULL, NULL, 5, '0', NULL, '<p>高淀粉</p>', '2019-05-10 16:37:59', '2019-05-20 13:14:08');
INSERT INTO `goods` VALUES (25, '荔浦芋头', 58, 43, '斤', '1', '36,35', 12, NULL, 9, NULL, 6, 30, NULL, NULL, 10, '0', NULL, '<p>芋头</p>', '2019-05-10 16:52:45', '2019-05-21 12:18:46');
INSERT INTO `goods` VALUES (26, '圣女果', 73, 52, '盒', '1', '37,27', 31001, NULL, 4, NULL, 2, 401, NULL, NULL, 3, '0', NULL, '<p>圣女果新鲜</p>', '2019-05-17 09:41:12', '2019-05-21 12:19:29');
INSERT INTO `goods` VALUES (27, '国产柠檬', 75, 53, '个', '3', '25', 31011, NULL, 6, NULL, 4, 525, NULL, NULL, 2, '0', NULL, '<p>可口</p>', '2019-05-17 09:42:55', '2019-05-20 13:12:55');
INSERT INTO `goods` VALUES (28, '青提', 71, 53, '份', '1', '29,24', 31002, NULL, 8, NULL, 5, 225, NULL, NULL, 1, '0', NULL, '<p>甜</p>', '2019-05-17 09:44:14', '2019-05-20 14:24:51');
INSERT INTO `goods` VALUES (29, '红富士苹果', 69, 53, '份', '1', '26', 31003, NULL, 12, NULL, 9, 5444, NULL, NULL, 4, '0', NULL, '<p>烟台红富士<br/></p>', '2019-05-17 09:46:09', '2019-05-20 13:13:11');
INSERT INTO `goods` VALUES (30, '山东小土豆', 79, 43, '盒', '1', '20', 10011, NULL, 4, NULL, 3, 5393, NULL, NULL, 1, '0', NULL, '<p>新鲜上市！</p>', '2019-05-17 09:58:17', '2019-05-20 13:11:36');
INSERT INTO `goods` VALUES (31, '吉林黑糯玉米', 63, 43, '根', '1', '23', 31004, NULL, 7, NULL, 2, 219, NULL, NULL, 1, '0', NULL, '<p>软糯</p>', '2019-05-17 10:00:02', '2019-05-20 13:12:31');
INSERT INTO `goods` VALUES (32, '埃及橙子', 77, 52, '个', '2', '22', 31006, NULL, 10, NULL, 7, 39, NULL, NULL, 1, '0', NULL, '<p>好吃</p>', '2019-05-17 10:07:15', '2019-05-20 13:12:17');
INSERT INTO `goods` VALUES (33, '新西兰苹果', 78, 52, '盒', '2', '21', 31010, NULL, 15, NULL, 10, 43, NULL, NULL, 7, '0', NULL, '<p>新上架</p>', '2019-05-17 10:11:02', '2019-05-20 13:12:04');
INSERT INTO `goods` VALUES (34, '芦笋', 44, 42, '把', '3', '32,31,30', 10003, NULL, 3, NULL, 2, 48, NULL, NULL, 0, '0', NULL, '<p>鲜</p>', '2019-05-17 16:00:43', '2019-05-21 12:16:42');
INSERT INTO `goods` VALUES (35, '洋芋', 57, 42, '个', '2', '41,40', 10012, NULL, 8, NULL, 7, 32, NULL, NULL, 2, '0', NULL, '<p>糯</p>', '2019-05-17 16:02:03', '2019-05-21 12:21:19');
INSERT INTO `goods` VALUES (36, '荷兰豆', 60, 42, '0', '1', '39,38', 10014, NULL, 4, NULL, 3, 23, NULL, NULL, 1, '0', NULL, '<p>脆</p>', '2019-05-17 16:02:54', '2019-05-21 12:20:26');

-- ----------------------------
-- Table structure for goods_files
-- ----------------------------
DROP TABLE IF EXISTS `goods_files`;
CREATE TABLE `goods_files`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `goods_files` VALUES (30, '/uploads/20190521/7e49c82fa8b1fdc82ba4b28a44b3fc27.jpg');
INSERT INTO `goods_files` VALUES (31, '/uploads/20190521/43364ff7d5f600d767c04e7ca3cec345.jpg');
INSERT INTO `goods_files` VALUES (32, '/uploads/20190521/bd546323dcd473ca72001d055c6ee245.jpg');
INSERT INTO `goods_files` VALUES (33, '/uploads/20190521/6944992d6789921f5cff1265b2e25f41.jpg');
INSERT INTO `goods_files` VALUES (34, '/uploads/20190521/a5714b3013531169f0b3ffcdc435d54f.jpg');
INSERT INTO `goods_files` VALUES (35, '/uploads/20190521/cf516b4a196b1b7204c176275a33da2f.jpg');
INSERT INTO `goods_files` VALUES (36, '/uploads/20190521/9241a5f85243c1e84237882a8e0ac4af.jpg');
INSERT INTO `goods_files` VALUES (37, '/uploads/20190521/0c92f97261ffd1c379dca7903a5014ef.jpg');
INSERT INTO `goods_files` VALUES (38, '/uploads/20190521/8af34eff49db234a7f90517931d22a93.jpg');
INSERT INTO `goods_files` VALUES (39, '/uploads/20190521/9b63206f21e68a03c8cb1b5fc84999bc.jpg');
INSERT INTO `goods_files` VALUES (40, '/uploads/20190521/85db6ef1ef0b7f866a6e49c7bc4fe2e7.jpg');
INSERT INTO `goods_files` VALUES (41, '/uploads/20190521/7990726993d01eff271680528c2b4158.jpg');
INSERT INTO `goods_files` VALUES (42, '/uploads/20190522/3dcfba8715c4c5dbb854227b6c4554b8.jpg');
INSERT INTO `goods_files` VALUES (43, '/uploads/20190522/80742d3f9093f8bea7f33cb7ed5bf568.jpg');

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
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '收货状态，0已收货，1未收货',
  `orderstate` int(1) NOT NULL COMMENT '0已发货 1 未发货',
  `freight` int(255) NOT NULL COMMENT '订单运费',
  `payinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付信息',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `paystatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付状态 0已支付，1未支付',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (90, 8, 'happy', '1', 1, 4, '106', '2019-05-23 09:38:31', '2019-05-23 09:38:31', '123', '17801118602', '0');
INSERT INTO `orders` VALUES (89, 4, '16110120', '1', 1, 20, '2460', '2019-05-23 09:33:13', '2019-05-23 09:33:13', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (84, 6, 'admin1', '1', 1, 12, '81', '2019-05-23 00:01:50', '2019-05-23 00:01:50', '1111', '1111', '0');
INSERT INTO `orders` VALUES (85, 6, 'admin1', '1', 1, 12, '48', '2019-05-23 00:28:05', '2019-05-23 00:28:05', '111', '111', '0');
INSERT INTO `orders` VALUES (86, 7, '16110106', '1', 1, 3, '23', '2019-05-23 00:29:53', '2019-05-23 00:29:53', '111', '1111', '0');
INSERT INTO `orders` VALUES (87, 7, '16110106', '1', 1, 3, '23', '2019-05-23 00:35:49', '2019-05-23 00:35:49', '1111', '1111', '0');
INSERT INTO `orders` VALUES (88, 7, '16110106', '1', 1, 0, '18', '2019-05-23 00:37:58', '2019-05-23 00:37:58', '1111', '1111', '0');
INSERT INTO `orders` VALUES (91, 8, 'happy', '1', 1, 2, '120', '2019-05-23 09:48:13', '2019-05-23 09:48:13', '1234444', '188888888', '0');
INSERT INTO `orders` VALUES (92, 8, 'happy', '1', 1, 1, '131', '2019-05-23 09:50:04', '2019-05-23 09:50:04', 'babababbabaab', '122345690609', '0');
INSERT INTO `orders` VALUES (93, 4, '16110120', '1', 1, 12, '96', '2019-05-23 11:54:23', '2019-05-23 11:54:23', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (98, 4, '16110120', '0', 1, 1, '29', '2019-05-23 17:17:32', '2019-05-23 17:17:32', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (99, 4, '16110120', '0', 1, 1, '81', '2019-05-23 19:55:39', '2019-05-23 19:55:39', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (100, 4, '16110120', '1', 1, 3, '23', '2019-05-23 20:02:49', '2019-05-23 20:02:49', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (101, 4, '16110120', '1', 1, 1, '81', '2019-05-23 20:31:21', '2019-05-23 20:31:21', '北工大平乐园100号', '12334444', '1');
INSERT INTO `orders` VALUES (102, 2, 'acbca', '1', 1, 4, '100', '2019-05-24 09:28:09', '2019-05-24 09:28:09', '11111', '1111', '0');

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
) ENGINE = MyISAM AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordersdetail
-- ----------------------------
INSERT INTO `ordersdetail` VALUES (89, '圣女果', 5, '4', 61);
INSERT INTO `ordersdetail` VALUES (89, '康师傅', 6, '400', 60);
INSERT INTO `ordersdetail` VALUES (90, '国产柠檬', 5, '6', 63);
INSERT INTO `ordersdetail` VALUES (89, '草鱼', 2, '10', 62);
INSERT INTO `ordersdetail` VALUES (84, '芦笋', 5, '3', 54);
INSERT INTO `ordersdetail` VALUES (84, '西红柿', 6, '9', 55);
INSERT INTO `ordersdetail` VALUES (85, '西红柿', 4, '9', 56);
INSERT INTO `ordersdetail` VALUES (86, '圣女果', 5, '4', 57);
INSERT INTO `ordersdetail` VALUES (87, '圣女果', 5, '4', 58);
INSERT INTO `ordersdetail` VALUES (88, '芦笋', 6, '3', 59);
INSERT INTO `ordersdetail` VALUES (90, '红富士苹果', 6, '12', 64);
INSERT INTO `ordersdetail` VALUES (91, '国产柠檬', 15, '6', 65);
INSERT INTO `ordersdetail` VALUES (91, '山东小土豆', 7, '4', 66);
INSERT INTO `ordersdetail` VALUES (92, '青提', 10, '8', 67);
INSERT INTO `ordersdetail` VALUES (92, '埃及橙子', 5, '10', 68);
INSERT INTO `ordersdetail` VALUES (93, '西红柿', 5, '9', 69);
INSERT INTO `ordersdetail` VALUES (93, '山东小土豆', 6, '4', 70);
INSERT INTO `ordersdetail` VALUES (93, '芦笋', 5, '3', 71);
INSERT INTO `ordersdetail` VALUES (98, '山东小土豆', 7, '4', 72);
INSERT INTO `ordersdetail` VALUES (99, '山东小土豆', 20, '4', 73);
INSERT INTO `ordersdetail` VALUES (100, '圣女果', 5, '4', 74);
INSERT INTO `ordersdetail` VALUES (101, '山东小土豆', 20, '4', 75);
INSERT INTO `ordersdetail` VALUES (102, '圣女果', 9, '4', 76);
INSERT INTO `ordersdetail` VALUES (102, '红富士苹果', 5, '12', 77);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '充值的钱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('郭德纲', 2, 'acbca', '972cca37a2e97b54154560196d7440f4', '2019-04-19 15:36:46', '2019-05-24 09:30:10', '北京市西城区前门大栅栏街39号', '13800000000', '9900');
INSERT INTO `user` VALUES (NULL, 3, 'winnie', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-11 09:44:15', '2019-05-11 09:44:15', '1111', '111', '0');
INSERT INTO `user` VALUES ('', 4, '16110120', '94d39231f2f1d3711e9011570063ac2b', '2019-05-20 19:37:43', '2019-05-23 18:23:03', '北工大平乐园100号', '12334444', '5379');
INSERT INTO `user` VALUES ('12333', 6, 'admin1', '81dc9bdb52d04dc20036dbd8313ed055', '2019-05-22 22:56:13', '2019-05-22 23:17:27', '11111', '1234567', '0');
INSERT INTO `user` VALUES ('12345', 7, '16110106', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-23 00:29:19', '2019-05-23 00:35:43', '1111', '1111', '0');
INSERT INTO `user` VALUES ('happy', 8, 'happy', '56ab24c15b72a457069c5ea42fcfc640', '2019-05-23 09:36:27', '2019-05-23 09:49:22', 'babababbabaab', '122345690609', '0');

SET FOREIGN_KEY_CHECKS = 1;
