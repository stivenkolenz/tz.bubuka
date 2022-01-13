/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : tz

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 13/01/2022 13:25:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID города',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название города',
  `country` int(0) NOT NULL COMMENT 'ID страны',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `country_id`(`country`) USING BTREE,
  CONSTRAINT `country_id` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Токио', 1);
INSERT INTO `cities` VALUES (2, 'Джакарта', 2);
INSERT INTO `cities` VALUES (3, 'Дели', 3);
INSERT INTO `cities` VALUES (4, 'Манила', 4);
INSERT INTO `cities` VALUES (5, 'Шанхай', 5);
INSERT INTO `cities` VALUES (6, 'Мумбаи', 3);
INSERT INTO `cities` VALUES (7, 'Пекин', 5);
INSERT INTO `cities` VALUES (8, 'Осака', 1);
INSERT INTO `cities` VALUES (9, 'Нью-Йорк', 6);
INSERT INTO `cities` VALUES (10, 'Сан-Пауло', 7);
INSERT INTO `cities` VALUES (11, 'Мехико', 8);
INSERT INTO `cities` VALUES (12, 'Лос-Анджелес', 6);
INSERT INTO `cities` VALUES (13, 'Буэнос-Айрес', 9);
INSERT INTO `cities` VALUES (14, 'Лима', 10);
INSERT INTO `cities` VALUES (15, 'Чикаго', 6);
INSERT INTO `cities` VALUES (16, 'Даллас', 6);
INSERT INTO `cities` VALUES (17, 'Сан-Хосе', 6);
INSERT INTO `cities` VALUES (18, 'Каир', 11);
INSERT INTO `cities` VALUES (19, 'Лагос', 12);
INSERT INTO `cities` VALUES (20, 'Киншаса', 13);
INSERT INTO `cities` VALUES (21, 'Йоханнесбург', 14);
INSERT INTO `cities` VALUES (22, 'Луанда', 15);
INSERT INTO `cities` VALUES (23, 'Найроби', 16);
INSERT INTO `cities` VALUES (24, 'Дар-эс-Салам', 17);
INSERT INTO `cities` VALUES (25, 'Александрия', 11);
INSERT INTO `cities` VALUES (26, 'Гиза ', 11);
INSERT INTO `cities` VALUES (27, 'Гиза ', 11);
INSERT INTO `cities` VALUES (28, 'Москва ', 18);
INSERT INTO `cities` VALUES (29, 'Стамбул', 19);
INSERT INTO `cities` VALUES (30, 'Париж', 20);
INSERT INTO `cities` VALUES (31, 'Лондон', 21);
INSERT INTO `cities` VALUES (32, 'Мадрид', 22);
INSERT INTO `cities` VALUES (33, 'Милан', 23);
INSERT INTO `cities` VALUES (34, 'Санкт-Петербург', 18);
INSERT INTO `cities` VALUES (35, 'Анкара', 19);
INSERT INTO `cities` VALUES (36, 'Барселона', 22);
INSERT INTO `cities` VALUES (38, 'Гуанчжоу', 5);

-- ----------------------------
-- Table structure for continents
-- ----------------------------
DROP TABLE IF EXISTS `continents`;
CREATE TABLE `continents`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID континента',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название континента',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of continents
-- ----------------------------
INSERT INTO `continents` VALUES (1, 'Азия');
INSERT INTO `continents` VALUES (2, 'Америка');
INSERT INTO `continents` VALUES (3, 'Африка');
INSERT INTO `continents` VALUES (4, 'Европа');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID страны',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название страны',
  `continent` int(0) NOT NULL COMMENT 'ID континента',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `continent_id`(`continent`) USING BTREE,
  UNIQUE INDEX `unic_name_country`(`name`) USING BTREE,
  CONSTRAINT `continent_id` FOREIGN KEY (`continent`) REFERENCES `continents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'Япония', 1);
INSERT INTO `countries` VALUES (2, 'Индонезия', 1);
INSERT INTO `countries` VALUES (3, 'Индия', 1);
INSERT INTO `countries` VALUES (4, 'Филиппины', 1);
INSERT INTO `countries` VALUES (5, 'Китай', 1);
INSERT INTO `countries` VALUES (6, 'США', 2);
INSERT INTO `countries` VALUES (7, 'Бразилия', 2);
INSERT INTO `countries` VALUES (8, 'Мексика', 2);
INSERT INTO `countries` VALUES (9, 'Аргентина', 2);
INSERT INTO `countries` VALUES (10, 'Перу', 2);
INSERT INTO `countries` VALUES (11, 'Египет', 3);
INSERT INTO `countries` VALUES (12, 'Нигерия', 3);
INSERT INTO `countries` VALUES (13, 'Конго', 3);
INSERT INTO `countries` VALUES (14, 'ЮАР', 3);
INSERT INTO `countries` VALUES (15, 'Ангола', 3);
INSERT INTO `countries` VALUES (16, 'Кения', 3);
INSERT INTO `countries` VALUES (17, 'Танзания', 3);
INSERT INTO `countries` VALUES (18, 'Россия', 4);
INSERT INTO `countries` VALUES (19, 'Турция', 4);
INSERT INTO `countries` VALUES (20, 'Франция', 4);
INSERT INTO `countries` VALUES (21, 'Великобритания', 4);
INSERT INTO `countries` VALUES (22, 'Испания', 4);
INSERT INTO `countries` VALUES (23, 'Италия', 4);

-- ----------------------------
-- Table structure for population
-- ----------------------------
DROP TABLE IF EXISTS `population`;
CREATE TABLE `population`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID записи численности',
  `city` int(0) NOT NULL COMMENT 'ID города',
  `count` int(0) NOT NULL COMMENT 'Число населения (т.ч.)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city`) USING BTREE,
  CONSTRAINT `city_id` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of population
-- ----------------------------
INSERT INTO `population` VALUES (1, 1, 38500);
INSERT INTO `population` VALUES (2, 2, 32275);
INSERT INTO `population` VALUES (3, 3, 27280);
INSERT INTO `population` VALUES (4, 4, 24650);
INSERT INTO `population` VALUES (5, 5, 24115);
INSERT INTO `population` VALUES (6, 6, 23265);
INSERT INTO `population` VALUES (7, 7, 21200);
INSERT INTO `population` VALUES (8, 38, 20060);
INSERT INTO `population` VALUES (9, 8, 17165);
INSERT INTO `population` VALUES (10, 9, 21757);
INSERT INTO `population` VALUES (11, 10, 21100);
INSERT INTO `population` VALUES (12, 11, 20500);
INSERT INTO `population` VALUES (13, 12, 15620);
INSERT INTO `population` VALUES (14, 13, 15520);
INSERT INTO `population` VALUES (15, 14, 11300);
INSERT INTO `population` VALUES (16, 15, 9100);
INSERT INTO `population` VALUES (17, 16, 6600);
INSERT INTO `population` VALUES (18, 17, 6500);
INSERT INTO `population` VALUES (19, 18, 16545);
INSERT INTO `population` VALUES (20, 19, 13900);
INSERT INTO `population` VALUES (21, 20, 12500);
INSERT INTO `population` VALUES (22, 21, 9115);
INSERT INTO `population` VALUES (23, 22, 7560);
INSERT INTO `population` VALUES (24, 23, 5700);
INSERT INTO `population` VALUES (25, 24, 4980);
INSERT INTO `population` VALUES (26, 25, 4960);
INSERT INTO `population` VALUES (27, 26, 3300);
INSERT INTO `population` VALUES (28, 28, 16855);
INSERT INTO `population` VALUES (29, 29, 13995);
INSERT INTO `population` VALUES (30, 30, 10900);
INSERT INTO `population` VALUES (31, 31, 10500);
INSERT INTO `population` VALUES (32, 32, 6385);
INSERT INTO `population` VALUES (33, 33, 5200);
INSERT INTO `population` VALUES (34, 34, 5175);
INSERT INTO `population` VALUES (35, 35, 4850);
INSERT INTO `population` VALUES (36, 36, 4840);
INSERT INTO `population` VALUES (37, 36, 4840);

SET FOREIGN_KEY_CHECKS = 1;
