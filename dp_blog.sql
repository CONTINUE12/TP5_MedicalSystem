/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : dp_blog

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 04/02/2021 01:08:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dp_admin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin`;
CREATE TABLE `dp_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '0是禁用，1是可用',
  `super` int(11) NOT NULL DEFAULT 0 COMMENT '0是普通管理员，1是超级管理员',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin
-- ----------------------------
INSERT INTO `dp_admin` VALUES (8, 'admin0', 'admin0', 'admin0', '468685628@qq.com', '1', 1, 1612250203, 1612250203, NULL);

-- ----------------------------
-- Table structure for dp_article
-- ----------------------------
DROP TABLE IF EXISTS `dp_article`;
CREATE TABLE `dp_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `atop` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0是不推荐，1是推荐',
  `cateid` int(11) NOT NULL,
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click` int(11) NOT NULL DEFAULT 0,
  `comment` int(11) NOT NULL DEFAULT 0,
  `tags` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_article
-- ----------------------------
INSERT INTO `dp_article` VALUES (17, 'image1', NULL, 11, 'admin0', 5, 0, 'image', 'OCR', '<p><img src=\"/ueditor/php/upload/image/20210203/1612362299511863.jpg\" title=\"1612362299511863.jpg\" alt=\"1.jpg\" width=\"420\" height=\"505\"/></p>', 1612362347, 1612362972, NULL);
INSERT INTO `dp_article` VALUES (18, 'image2', NULL, 11, 'admin0', 2, 0, 'image', 'OCR', '<p><img src=\"/ueditor/php/upload/image/20210203/1612362063104730.jpg\" title=\"1612362063104730.jpg\" alt=\"2.jpg\" width=\"415\" height=\"608\"/></p>', 1612362212, 1612362212, NULL);
INSERT INTO `dp_article` VALUES (19, 'image3', NULL, 11, 'admin0', 1, 0, 'image', 'OCR', '<p><img src=\"/ueditor/php/upload/image/20210203/1612362391653265.jpg\" title=\"1612362391653265.jpg\" alt=\"3.jpg\" width=\"378\" height=\"594\"/></p>', 1612362400, 1612362400, NULL);
INSERT INTO `dp_article` VALUES (20, 'image4', NULL, 11, 'admin0', 0, 0, 'image', 'OCR', '<p><img src=\"/ueditor/php/upload/image/20210203/1612362495115531.jpg\" title=\"1612362495115531.jpg\" alt=\"4.jpg\" width=\"383\" height=\"527\"/></p>', 1612362505, 1612362505, NULL);
INSERT INTO `dp_article` VALUES (21, 'image5', NULL, 11, 'admin0', 8, 0, 'image', 'OCR', '<p><img src=\"/ueditor/php/upload/image/20210203/1612362522650769.jpg\" title=\"1612362522650769.jpg\" alt=\"5.jpg\"/></p>', 1612362525, 1612362525, NULL);

-- ----------------------------
-- Table structure for dp_cate
-- ----------------------------
DROP TABLE IF EXISTS `dp_cate`;
CREATE TABLE `dp_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catename` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_cate
-- ----------------------------
INSERT INTO `dp_cate` VALUES (11, '医学OCR检测', 0, 1612360594, 1612360594, NULL);

-- ----------------------------
-- Table structure for dp_comment
-- ----------------------------
DROP TABLE IF EXISTS `dp_comment`;
CREATE TABLE `dp_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `articleid` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dp_member
-- ----------------------------
DROP TABLE IF EXISTS `dp_member`;
CREATE TABLE `dp_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '0是禁用，1是可用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_member
-- ----------------------------
INSERT INTO `dp_member` VALUES (2, 'member0', 'member0', '松香', '468685628@qq.com', '1', 1612250439, 1612250439, NULL);
INSERT INTO `dp_member` VALUES (3, 'member1', 'member1', 'member1', '468685628@qq.com', '1', 1612250738, 1612267375, NULL);

-- ----------------------------
-- Table structure for dp_system
-- ----------------------------
DROP TABLE IF EXISTS `dp_system`;
CREATE TABLE `dp_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `copyright` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_system
-- ----------------------------
INSERT INTO `dp_system` VALUES (1, '医疗大数据系统', '医疗大数据系统', '东大机器人学院', 1522936637, 1612251227, NULL);

SET FOREIGN_KEY_CHECKS = 1;
