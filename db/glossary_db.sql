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
INSERT INTO `edges` VALUES ('e1-2', '1', '2', 1, 'включать');
INSERT INTO `edges` VALUES ('e1-18', '1', '18', 1, 'необходимость');
INSERT INTO `edges` VALUES ('e1-19', '1', '19', 1, 'необходимость');
INSERT INTO `edges` VALUES ('e1-20', '1', '20', 1, 'необходимость');
INSERT INTO `edges` VALUES ('e1-17', '1', '17', 1, 'необходимость');
INSERT INTO `edges` VALUES ('e3-2', '3', '2', 1, 'подключить');
INSERT INTO `edges` VALUES ('e4-2', '4', '2', 1, 'подключить');
INSERT INTO `edges` VALUES ('e2-6', '2', '6', 1, 'необходимость');
INSERT INTO `edges` VALUES ('e2-5', '2', '5', 1, 'зависимость');
INSERT INTO `edges` VALUES ('e2-11', '2', '11', 1, 'зависимость');
INSERT INTO `edges` VALUES ('e2-12', '2', '12', 1, 'зависимость');
INSERT INTO `edges` VALUES ('e4-3', '4', '3', 1, 'подключить');
INSERT INTO `edges` VALUES ('e3-10', '3', '10', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e3-16', '3', '16', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e3-7', '3', '7', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e3-8', '3', '8', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e3-9', '3', '9', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e4-13', '4', '13', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e4-14', '4', '14', 1, 'выполнять');
INSERT INTO `edges` VALUES ('e16-6', '16', '6', 1, 'зависимость');
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
INSERT INTO `nodes` VALUES ('1', 'default', 'Промышленные информационные системы', 'Это системы, используемые в промышленной среде для управления и контроля производственных и операционных действий на заводах или в промышленных местах. Они обычно включают в себя аппаратное и программное обеспечение для мониторинга, контроля и оптимизации промышленных процессов.', 400, 25);
INSERT INTO `nodes` VALUES ('10', 'default', 'Прогнозирование данных', 'Прогнозирование данных включает использование исторических данных и аналитических моделей для прогнозирования будущих тенденций или поведения. В промышленной среде это может использоваться для прогнозирования сбоев оборудования или оптимизации производственных процессов.', 250, 550);
INSERT INTO `nodes` VALUES ('11', 'default', 'Сетевой протокол', 'Это набор правил и стандартов, используемых при обмене данными в сети. Они гарантируют правильную передачу данных от одного устройства к другому.', 740, 310);
INSERT INTO `nodes` VALUES ('12', 'default', 'Сетевая безопасность', 'Сетевая безопасность включает в себя защиту сети и данных, доступных в сети, от несанкционированного доступа, разрушения или других угроз безопасности.', 760, 370);
INSERT INTO `nodes` VALUES ('5', 'default', 'Сетевая топология', 'Это способ расположения элементов сети, таких как узлы, соединения и т.д. В промышленной среде подходящая топология может обеспечить эффективную коммуникацию данных и стабильность сети.', 750, 250);
INSERT INTO `nodes` VALUES ('13', 'default', 'Представление данных', 'Это предоставление данных в удобном для восприятия формате (например, в виде диаграмм, графиков или отчетов) для использования пользователем.', 900, 420);
INSERT INTO `nodes` VALUES ('14', 'default', 'Команды пользователя', 'Это инструкции, отправляемые пользователем системе через интерфейс для выполнения определенных операций или задач. В промышленных информационных системах это может включать управление машинами, запрос данных и т. д.', 860, 550);
INSERT INTO `nodes` VALUES ('2', 'default', 'Промышленный интернет вещей', 'Это технология, которая предполагает интеграцию различных физических устройств, машин и датчиков с программным обеспечением и сетевым подключением для сбора и анализа данных.', 300, 250);
INSERT INTO `nodes` VALUES ('3', 'default', 'Серверная сторона', 'В компьютерных сетях серверная сторона относится к серверам, на которых размещаются услуги и приложения. Она обрабатывает запросы от клиентской стороны и возвращает необходимые данные или услуги.', 250, 390);
INSERT INTO `nodes` VALUES ('4', 'default', 'Клиентская сторона', 'Это часть системы, с которой пользователь взаимодействует непосредственно, например, персональные компьютеры, мобильные устройства или любые терминалы для доступа к услугам сервера.', 600, 450);
INSERT INTO `nodes` VALUES ('6', 'default', 'Датчики', 'Это устройства, обнаруживающие и реагирующие на физические входы, такие как тепло, свет, давление, влажность и так далее. В промышленных информационных системах они используются для сбора реальных данных о машинах и процессах.', 50, 135);
INSERT INTO `nodes` VALUES ('7', 'default', 'Хранение данных', 'Это процесс обеспечения целостности, доступности и защищенности данных.', 100, 290);
INSERT INTO `nodes` VALUES ('9', 'default', 'Анализ данных', 'Это использование статистических и вычислительных методов для проверки, очистки, преобразования и моделирования обработанных данных для выявления полезной информации, формулирования выводов и поддержки принятия решений.', 50, 550);
INSERT INTO `nodes` VALUES ('8', 'default', 'Обработка данных', 'Это процесс очистки, преобразования и организации собранных данных для дальнейшего анализа. Это может включать удаление шума, стандартизацию форматов данных или интеграцию данных из разных источников.', 20, 480);
INSERT INTO `nodes` VALUES ('16', 'default', 'Сбор данных', 'Это процесс сбора, измерения и записи физических или электрических данных. В промышленной среде сбор данных обычно включает использование датчиков и других устройств для сбора данных о машинах и процессах.', 25, 350);
INSERT INTO `nodes` VALUES ('17', 'default', 'Оценка рисков', 'Это процесс идентификации, анализа и оценки потенциальных рисков для определения того, как управлять этими рисками и принимать соответствующие меры предосторожности.', 100, 70);
INSERT INTO `nodes` VALUES ('18', 'default', 'Управление персоналом', 'Это процесс управления работой сотрудников в организации, включая найм, обучение, оценку и управление рабочими задачами.', 950, 60);
INSERT INTO `nodes` VALUES ('19', 'default', 'Управление материалами', 'Управление материалами включает планирование, организацию и контроль за процессом материалов от закупки до производства и распределения, обеспечивая эффективное и эффективное использование материалов.', 960, 120);
INSERT INTO `nodes` VALUES ('20', 'default', 'Управление складом', 'Это процесс организации и контроля за хранением и движением товаров на складе, обеспечивая безопасность, эффективность и организованное управление материалами.', 940, 180);

SET FOREIGN_KEY_CHECKS = 1;
