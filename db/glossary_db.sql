/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : glossary_db

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 14/01/2024 14:18:49
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
INSERT INTO `nodes` VALUES ('1', 'default', 'Term1', 'term1 note...', 250, 100);
INSERT INTO `nodes` VALUES ('10', 'default', 'Term10', 'term10 note...', 250, 900);
INSERT INTO `nodes` VALUES ('11', 'default', 'Term11', 'term11 note...', 250, 1000);
INSERT INTO `nodes` VALUES ('2', 'default', 'Term2', 'term2 note...', 100, 200);
INSERT INTO `nodes` VALUES ('3', 'default', 'Term3', 'term3 note...', 400, 200);
INSERT INTO `nodes` VALUES ('4', 'default', 'Term4', 'term4 note...', 250, 300);
INSERT INTO `nodes` VALUES ('5', 'default', 'Term5', 'term5 note...', 250, 400);
INSERT INTO `nodes` VALUES ('6', 'default', 'Term6', 'term6 note...', 250, 500);
INSERT INTO `nodes` VALUES ('7', 'default', 'Term7', 'term7 note...', 250, 600);
INSERT INTO `nodes` VALUES ('8', 'default', 'Term8', 'term8 note...', 250, 700);
INSERT INTO `nodes` VALUES ('9', 'default', 'Term9', 'term9 note...', 250, 800);

SET FOREIGN_KEY_CHECKS = 1;
