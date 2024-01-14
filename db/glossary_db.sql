/*
 Navicat Premium Data Transfer

 Source Server         : my-mysql
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : glossary_db

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 14/01/2024 20:25:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edges
-- ----------------------------
DROP TABLE IF EXISTS `edges`;
CREATE TABLE `edges`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `animated` tinyint(1) NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source`(`source` ASC) USING BTREE,
  INDEX `target`(`target` ASC) USING BTREE,
  CONSTRAINT `edges_ibfk_1` FOREIGN KEY (`source`) REFERENCES `nodes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `edges_ibfk_2` FOREIGN KEY (`target`) REFERENCES `nodes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edges
-- ----------------------------
INSERT INTO `edges` VALUES ('e1-2', '1', '2', 1, 'next');
INSERT INTO `edges` VALUES ('e2-3', '2', '3', 1, 'next');
INSERT INTO `edges` VALUES ('e2-4', '2', '4', 1, 'next');
INSERT INTO `edges` VALUES ('e3-4', '3', '4', 1, 'next');

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `position_x` int NULL DEFAULT NULL,
  `position_y` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nodes
-- ----------------------------
INSERT INTO `nodes` VALUES ('1', 'default', '工业信息系统', 'term1 note...', 400, 100);
INSERT INTO `nodes` VALUES ('10', 'default', '数据预测', NULL, 90, 650);
INSERT INTO `nodes` VALUES ('11', 'default', '网络协议', NULL, 580, 210);
INSERT INTO `nodes` VALUES ('12', 'default', '网络安全', NULL, 560, 270);
INSERT INTO `nodes` VALUES ('13', 'default', '数据展示', NULL, 720, 350);
INSERT INTO `nodes` VALUES ('14', 'default', '用户指令', NULL, 740, 450);
INSERT INTO `nodes` VALUES ('15', 'default', '危险预警', NULL, 720, 550);
INSERT INTO `nodes` VALUES ('2', 'default', '工业物联网', 'term2 note...', 300, 250);
INSERT INTO `nodes` VALUES ('3', 'default', '服务器端', 'term3 note...', 200, 450);
INSERT INTO `nodes` VALUES ('4', 'default', '用户端', 'term4 note...', 600, 450);
INSERT INTO `nodes` VALUES ('5', 'default', '网络拓扑', 'term5 note...', 560, 150);
INSERT INTO `nodes` VALUES ('6', 'default', '传感器', 'term6 note...', 100, 180);
INSERT INTO `nodes` VALUES ('7', 'default', '数据存储', 'term7 note...', 50, 350);
INSERT INTO `nodes` VALUES ('9', 'default', '数据分析', 'term9 note...', 50, 550);
INSERT INTO `nodes` VALUES ('8', 'default', '数据处理', 'term8 note...', 30, 450);
INSERT INTO `nodes` VALUES ('16', 'default', '数据采集', 'term9 note...', 80, 250);

SET FOREIGN_KEY_CHECKS = 1;
