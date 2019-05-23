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

 Date: 19/04/2019 16:03:40
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
  `imagepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片id',
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (13, '芦笋', 44, 42, '盒', '1', NULL, 1, NULL, 40, NULL, 30, 2, NULL, NULL, 10, '0', NULL, '<p>111</p>', NULL, NULL);
INSERT INTO `goods` VALUES (14, '西红柿', 45, 43, '斤', '1', NULL, 1, NULL, 9, NULL, 6, 40, NULL, NULL, 12, '0', NULL, '<p>123</p>', NULL, NULL);
INSERT INTO `goods` VALUES (15, '香椿', 50, 43, '把', '1', NULL, 1, NULL, 5, NULL, 3, 10, NULL, NULL, 7, '0', NULL, '<p>12222</p>', NULL, NULL);
INSERT INTO `goods` VALUES (16, '菠菜', 49, 43, '把', '1', NULL, 34, NULL, 10, NULL, 8, 10, NULL, NULL, 10, '0', NULL, '<p>11111111111111</p>', NULL, NULL);
INSERT INTO `goods` VALUES (17, '草鱼', 48, 47, '斤', '1', NULL, 24, NULL, 10, NULL, 8, 10, NULL, NULL, 20, '0', NULL, '<p>1555</p>', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `goods_type` VALUES (49, '菠菜', 43, '0,41,43,49', 3);
INSERT INTO `goods_type` VALUES (50, '香椿', 43, '0,41,43,50', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'acbca', '972cca37a2e97b54154560196d7440f4', '2019-04-19 15:36:46', '2019-04-19 15:36:46');

SET FOREIGN_KEY_CHECKS = 1;
