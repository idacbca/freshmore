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

 Date: 15/03/2019 16:49:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (1, '服装', 1, '0,1', 1);
INSERT INTO `goods_type` VALUES (2, '西服', 1, '0,1,2', 2);
INSERT INTO `goods_type` VALUES (3, '鞋', 0, '0,3', 1);
INSERT INTO `goods_type` VALUES (27, '女装', 1, '0,1,27', 2);
INSERT INTO `goods_type` VALUES (30, '小裙子', 27, '0,1,27,30', 3);
INSERT INTO `goods_type` VALUES (31, '防弹衣', 0, '0,31', 1);
INSERT INTO `goods_type` VALUES (32, '凯夫拉', 31, '0,31,32', 2);
INSERT INTO `goods_type` VALUES (33, '小皮鞋', 3, '0,3,33', 2);

SET FOREIGN_KEY_CHECKS = 1;
