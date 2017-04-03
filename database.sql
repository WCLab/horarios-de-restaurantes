/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yapp

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-02 22:38:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for restaurantes
-- ----------------------------
DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE `restaurantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horarios` text COLLATE utf8_unicode_ci,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of restaurantes
-- ----------------------------
INSERT INTO `restaurantes` VALUES ('21', 'Mariscos Iván', 'Enrique Segoviano #55', '55-55-55-5', 'a:7:{i:0;a:4:{s:2:\"id\";i:1;s:6:\"nombre\";s:5:\"Lunes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:1;a:4:{s:2:\"id\";i:2;s:6:\"nombre\";s:6:\"Martes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:2;a:4:{s:2:\"id\";i:3;s:6:\"nombre\";s:9:\"Miercoles\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"14:00\";s:6:\"cierre\";s:5:\"00:00\";}}}i:3;a:4:{s:2:\"id\";i:4;s:6:\"nombre\";s:6:\"Jueves\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"14:00\";s:6:\"cierre\";s:5:\"00:00\";}}}i:4;a:4:{s:2:\"id\";i:5;s:6:\"nombre\";s:7:\"Viernes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"14:00\";s:6:\"cierre\";s:5:\"00:00\";}}}i:5;a:4:{s:2:\"id\";i:6;s:6:\"nombre\";s:7:\"Sábado\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"14:00\";s:6:\"cierre\";s:5:\"00:00\";}}}i:6;a:4:{s:2:\"id\";i:7;s:6:\"nombre\";s:7:\"Domingo\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"14:00\";s:6:\"cierre\";s:5:\"00:00\";}}}}', '2017-04-02 23:59:51', '2017-04-02 23:35:21', null);
INSERT INTO `restaurantes` VALUES ('22', 'La abeja miope', 'Wenseslao San de La Barquera #13', '11-11-11-1', 'a:7:{i:0;a:4:{s:2:\"id\";i:1;s:6:\"nombre\";s:5:\"Lunes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:1;a:4:{s:2:\"id\";i:2;s:6:\"nombre\";s:6:\"Martes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:2:{i:0;a:2:{s:8:\"apertura\";s:5:\"09:00\";s:6:\"cierre\";s:5:\"13:00\";}i:1;a:2:{s:8:\"apertura\";s:5:\"15:00\";s:6:\"cierre\";s:5:\"18:00\";}}}i:2;a:4:{s:2:\"id\";i:3;s:6:\"nombre\";s:9:\"Miercoles\";s:7:\"checked\";b:1;s:8:\"horarios\";a:2:{i:0;a:2:{s:8:\"apertura\";s:5:\"09:00\";s:6:\"cierre\";s:5:\"13:00\";}i:1;a:2:{s:8:\"apertura\";s:5:\"15:00\";s:6:\"cierre\";s:5:\"18:00\";}}}i:3;a:4:{s:2:\"id\";i:4;s:6:\"nombre\";s:6:\"Jueves\";s:7:\"checked\";b:1;s:8:\"horarios\";a:2:{i:0;a:2:{s:8:\"apertura\";s:5:\"09:00\";s:6:\"cierre\";s:5:\"13:00\";}i:1;a:2:{s:8:\"apertura\";s:5:\"15:00\";s:6:\"cierre\";s:5:\"18:00\";}}}i:4;a:4:{s:2:\"id\";i:5;s:6:\"nombre\";s:7:\"Viernes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:2:{i:0;a:2:{s:8:\"apertura\";s:5:\"09:00\";s:6:\"cierre\";s:5:\"13:00\";}i:1;a:2:{s:8:\"apertura\";s:5:\"15:00\";s:6:\"cierre\";s:5:\"18:00\";}}}i:5;a:4:{s:2:\"id\";i:6;s:6:\"nombre\";s:7:\"Sábado\";s:7:\"checked\";b:1;s:8:\"horarios\";a:2:{i:0;a:2:{s:8:\"apertura\";s:5:\"09:00\";s:6:\"cierre\";s:5:\"13:00\";}i:1;a:2:{s:8:\"apertura\";s:5:\"15:00\";s:6:\"cierre\";s:5:\"18:00\";}}}i:6;a:4:{s:2:\"id\";i:7;s:6:\"nombre\";s:7:\"Domingo\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}}', '2017-04-02 22:08:37', '2017-04-03 00:07:54', null);
INSERT INTO `restaurantes` VALUES ('23', 'El Zancudo Loco', 'Prolongación Corregidora sur #48', '44-44-44-4', 'a:7:{i:0;a:4:{s:2:\"id\";i:1;s:6:\"nombre\";s:5:\"Lunes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:1;a:4:{s:2:\"id\";i:2;s:6:\"nombre\";s:6:\"Martes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:2;a:4:{s:2:\"id\";i:3;s:6:\"nombre\";s:9:\"Miercoles\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:3;a:4:{s:2:\"id\";i:4;s:6:\"nombre\";s:6:\"Jueves\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:4;a:4:{s:2:\"id\";i:5;s:6:\"nombre\";s:7:\"Viernes\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:5;a:4:{s:2:\"id\";i:6;s:6:\"nombre\";s:7:\"Sábado\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}i:6;a:4:{s:2:\"id\";i:7;s:6:\"nombre\";s:7:\"Domingo\";s:7:\"checked\";b:1;s:8:\"horarios\";a:1:{i:0;a:2:{s:8:\"apertura\";s:5:\"19:00\";s:6:\"cierre\";s:5:\"03:00\";}}}}', '2017-04-03 00:10:34', '2017-04-03 00:10:34', null);
INSERT INTO `restaurantes` VALUES ('24', 'soft', 'prueba', '1234567', 'a:7:{i:0;a:4:{s:2:\"id\";i:1;s:6:\"nombre\";s:5:\"Lunes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:1;a:4:{s:2:\"id\";i:2;s:6:\"nombre\";s:6:\"Martes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:2;a:4:{s:2:\"id\";i:3;s:6:\"nombre\";s:9:\"Miercoles\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:3;a:4:{s:2:\"id\";i:4;s:6:\"nombre\";s:6:\"Jueves\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:4;a:4:{s:2:\"id\";i:5;s:6:\"nombre\";s:7:\"Viernes\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:5;a:4:{s:2:\"id\";i:6;s:6:\"nombre\";s:7:\"Sábado\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}i:6;a:4:{s:2:\"id\";i:7;s:6:\"nombre\";s:7:\"Domingo\";s:7:\"checked\";b:0;s:8:\"horarios\";a:0:{}}}', '2017-04-02 22:13:40', '2017-04-02 22:11:29', '2017-04-02 22:13:40');
