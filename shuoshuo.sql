/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : shuoshuowall

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-03-14 21:55:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shuoshuo
-- ----------------------------
DROP TABLE IF EXISTS `shuoshuo`;
CREATE TABLE `shuoshuo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` longtext COMMENT '说说内容',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` int(1) DEFAULT NULL COMMENT '是否删除 0未删除 1删除',
  `img_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shuoshuo
-- ----------------------------
INSERT INTO `shuoshuo` VALUES ('2', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('3', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('25', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('26', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('27', '背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片背景图片', '0:0:0:0:0:0:0:1', '2016-03-14 18:45:55', '0', 'upload/bg.jpg');
INSERT INTO `shuoshuo` VALUES ('28', '士大夫士大夫大师傅', '0:0:0:0:0:0:0:1', '2016-03-14 18:46:35', '0', 'upload/head3.jpg');
INSERT INTO `shuoshuo` VALUES ('29', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('30', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('31', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('32', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('33', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('34', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('35', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('36', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('37', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('38', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('39', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('40', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('41', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('42', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('43', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('44', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('45', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('46', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('47', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('48', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('49', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('50', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('51', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('52', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('53', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('54', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('55', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('56', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('57', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('58', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('59', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('60', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('61', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('62', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('63', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('64', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('65', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('66', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('67', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('68', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('69', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('70', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('71', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('72', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('73', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('74', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('75', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('76', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('77', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('78', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('79', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('80', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('81', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('82', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('83', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('84', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('85', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('86', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('87', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('88', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('89', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('90', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('91', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('92', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('93', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('94', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('95', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('96', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('97', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('98', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('99', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('100', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('101', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('102', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('103', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('104', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('105', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('106', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('107', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('108', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('109', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('110', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('111', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('112', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('113', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('114', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('115', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('116', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('117', 'aaa', '', '2016-03-14 15:13:55', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('118', 'bbb', '', '2016-03-14 15:13:55', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('119', '谢谢谢谢', '0:0:0:0:0:0:0:1', '2016-03-14 17:38:31', '0', 'upload/head4.jpg');
INSERT INTO `shuoshuo` VALUES ('120', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 18:04:58', '0', 'upload/head2.jpg');
INSERT INTO `shuoshuo` VALUES ('121', '啊啊', '0:0:0:0:0:0:0:1', '2016-03-14 19:31:40', '0', 'upload/205f614a-a0f0-4997-a2a9-e5096cf13c0f.jpg');
INSERT INTO `shuoshuo` VALUES ('122', '十分士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 19:33:06', '0', 'upload/fbe8ddc7-b62e-4332-a1a9-0ea4a81f5e66.jpg');
INSERT INTO `shuoshuo` VALUES ('123', '发士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 19:33:51', '0', 'upload/4522a64e-0b40-408b-a58a-19e6cd78d108.jpg');
INSERT INTO `shuoshuo` VALUES ('124', '似的发射点', '0:0:0:0:0:0:0:1', '2016-03-14 19:39:02', '0', 'upload/6ace49b3-18fa-4c13-9ef5-38eedfcd2aae.jpg');
INSERT INTO `shuoshuo` VALUES ('125', '似的发射点', '0:0:0:0:0:0:0:1', '2016-03-14 19:39:06', '0', 'upload/6ace49b3-18fa-4c13-9ef5-38eedfcd2aae.jpg');
INSERT INTO `shuoshuo` VALUES ('126', '似的发射点', '0:0:0:0:0:0:0:1', '2016-03-14 19:39:07', '0', 'upload/6ace49b3-18fa-4c13-9ef5-38eedfcd2aae.jpg');
INSERT INTO `shuoshuo` VALUES ('127', '士大夫士大夫', '0:0:0:0:0:0:0:1', '2016-03-14 19:39:34', '0', 'upload/95963ccb-73e6-41a6-bff3-5b563f1d344e.jpg');
INSERT INTO `shuoshuo` VALUES ('128', '棒棒哒', '0:0:0:0:0:0:0:1', '2016-03-14 21:48:47', '0', 'upload/da07b197-2a2a-4997-898d-9bcc44540b69.jpg');
