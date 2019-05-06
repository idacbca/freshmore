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

 Date: 05/05/2019 15:38:04
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, '女装大佬', 27, 1, '1', '1', '', 1, 111, 1, 1, 1, 1, 1, 1, 1, '0', 0, '<p>www</p>');
INSERT INTO `goods` VALUES (10, 'lolita', 34, 27, '件', '1', '', 12, 1212, 1000, 900, 600, 20, 20, 0, 5, '0', 12, '<p>www</p>');
INSERT INTO `goods` VALUES (11, '康师傅', 34, 27, '件', '5', '', 8, 1212, 400, 400, 300, 100, 100, 0, 0, '1', 11, '<p>www</p>');
INSERT INTO `goods` VALUES (12, '凯夫拉一型', 32, 31, '件', '4', '', 23, 22323, 80000, 80000, 60000, 10, 10, 0, 10, '1', 23, '<p>wwwww</p>');

-- ----------------------------
-- Table structure for goods_files
-- ----------------------------
DROP TABLE IF EXISTS `goods_files`;
CREATE TABLE `goods_files`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_files
-- ----------------------------
INSERT INTO `goods_files` VALUES (1, '/public\\uploads20190429\\44b9363cc7d72314580d68ee7ae115e8.png');
INSERT INTO `goods_files` VALUES (2, '/public\\uploads20190429\\a7d001b2644fb79bfefd9fa8b7a3666f.png');
INSERT INTO `goods_files` VALUES (3, '/public\\uploads20190429\\07628c6e9beb9b3d3f0717c9b7bb8d2c.png');
INSERT INTO `goods_files` VALUES (4, '/public\\uploads20190429\\fdf0b90200c51d040cd5f22c10d640d6.png');
INSERT INTO `goods_files` VALUES (5, '/public\\uploads20190429\\88409bc9cbf2cd48248687d73a4b4f6c.png');
INSERT INTO `goods_files` VALUES (6, '/public\\uploads20190429\\91377e4d0f844f4f313a991918fbf2ff.png');
INSERT INTO `goods_files` VALUES (7, '/public\\uploads20190429\\ebe541c334c2e012e4756bf99c2c755a.png');

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (1, '服装', 1, '0,1', 1);
INSERT INTO `goods_type` VALUES (2, '西服', 1, '0,1,2', 2);
INSERT INTO `goods_type` VALUES (3, '鞋', 0, '0,3', 1);
INSERT INTO `goods_type` VALUES (27, '女装', 1, '0,1,27', 2);
INSERT INTO `goods_type` VALUES (31, '防弹衣', 0, '0,31', 1);
INSERT INTO `goods_type` VALUES (32, '凯夫拉', 31, '0,31,32', 2);
INSERT INTO `goods_type` VALUES (34, '小裙子', 27, '0,1,27,34', 3);
INSERT INTO `goods_type` VALUES (36, '小皮鞋', 3, '0,3,36', 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(6) NOT NULL COMMENT '商品编号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顾客',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运送地址',
  `orderstate` int(1) NOT NULL COMMENT '1 已签收 2已送达 3运送中',
  `payinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付信息',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (11, '张三', '北京', 1, '120');
INSERT INTO `orders` VALUES (12, '李四', '上海', 2, '280');
INSERT INTO `orders` VALUES (13, '王五', '天津', 3, '300');

-- ----------------------------
-- Table structure for ordersdetail
-- ----------------------------
DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE `ordersdetail`  (
  `id` int(6) NOT NULL COMMENT 'id编号',
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordersdetail
-- ----------------------------
INSERT INTO `ordersdetail` VALUES (1, 11, '面包', 2, '5');
INSERT INTO `ordersdetail` VALUES (2, 11, '洗发水', 2, '55');
INSERT INTO `ordersdetail` VALUES (3, 12, 'jeans', 1, '280');
INSERT INTO `ordersdetail` VALUES (4, 13, 'skirts', 2, '100');
INSERT INTO `ordersdetail` VALUES (5, 13, 'trouser', 2, '50');

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
INSERT INTO `user` VALUES (2, 'acbca', '4bb8de7c0b70dac91e49a76356cd73e2', '2019-04-19 15:36:46', '2019-04-26 14:32:48');

SET FOREIGN_KEY_CHECKS = 1;
