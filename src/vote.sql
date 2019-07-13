/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 127.0.0.1:3306
 Source Schema         : vote

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 13/07/2019 17:48:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vote_item
-- ----------------------------
DROP TABLE IF EXISTS `vote_item`;
CREATE TABLE `vote_item`  (
  `VI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票取值标识',
  `VO_ID` int(11) NOT NULL COMMENT '投票选项标识',
  `VS_ID` int(11) NOT NULL COMMENT '投票内容标识',
  `VU_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户标识',
  PRIMARY KEY (`VI_ID`) USING BTREE,
  INDEX `vote_item_ibfk_3`(`VO_ID`) USING BTREE,
  INDEX `vote_item_ibfk_5`(`VU_USER_ID`) USING BTREE,
  INDEX `vote_item_ibfk_6`(`VS_ID`) USING BTREE,
  CONSTRAINT `vote_item_ibfk_3` FOREIGN KEY (`VO_ID`) REFERENCES `vote_option` (`VO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vote_item_ibfk_5` FOREIGN KEY (`VU_USER_ID`) REFERENCES `vote_user` (`VU_USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vote_item_ibfk_6` FOREIGN KEY (`VS_ID`) REFERENCES `vote_subject` (`VS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_item
-- ----------------------------
INSERT INTO `vote_item` VALUES (103, 91, 43, 'hdq123');
INSERT INTO `vote_item` VALUES (104, 105, 46, 'hdq123');
INSERT INTO `vote_item` VALUES (108, 94, 43, 'hdq1231');
INSERT INTO `vote_item` VALUES (109, 95, 44, 'hdq1231');
INSERT INTO `vote_item` VALUES (114, 94, 43, 'hdq12345');
INSERT INTO `vote_item` VALUES (115, 95, 44, 'hdq12345');
INSERT INTO `vote_item` VALUES (116, 96, 44, 'hdq12345');
INSERT INTO `vote_item` VALUES (117, 105, 46, 'hdq12345');
INSERT INTO `vote_item` VALUES (118, 121, 50, 'admin');
INSERT INTO `vote_item` VALUES (119, 122, 50, 'admin');
INSERT INTO `vote_item` VALUES (120, 124, 50, 'admin');
INSERT INTO `vote_item` VALUES (124, 144, 56, 'lss12345');
INSERT INTO `vote_item` VALUES (125, 145, 56, 'lss12345');
INSERT INTO `vote_item` VALUES (126, 146, 56, 'lss12345');

-- ----------------------------
-- Table structure for vote_option
-- ----------------------------
DROP TABLE IF EXISTS `vote_option`;
CREATE TABLE `vote_option`  (
  `VO_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票选项标识',
  `VO_OPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票选项名称',
  `VS_ID` int(11) NOT NULL COMMENT ' 投票内容标识',
  `VO_ORDER` int(11) NOT NULL COMMENT '投票排序',
  PRIMARY KEY (`VO_ID`) USING BTREE,
  INDEX `vote_option_ibfk_1`(`VS_ID`) USING BTREE,
  CONSTRAINT `vote_option_ibfk_1` FOREIGN KEY (`VS_ID`) REFERENCES `vote_subject` (`VS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_option
-- ----------------------------
INSERT INTO `vote_option` VALUES (91, '北京', 43, 1);
INSERT INTO `vote_option` VALUES (92, '上海', 43, 2);
INSERT INTO `vote_option` VALUES (93, '广州', 43, 3);
INSERT INTO `vote_option` VALUES (94, '成都', 43, 4);
INSERT INTO `vote_option` VALUES (95, '无问东西', 44, 1);
INSERT INTO `vote_option` VALUES (96, '海王', 44, 2);
INSERT INTO `vote_option` VALUES (97, '一条狗的使命', 44, 3);
INSERT INTO `vote_option` VALUES (98, '狮子王', 44, 4);
INSERT INTO `vote_option` VALUES (99, '热', 45, 1);
INSERT INTO `vote_option` VALUES (100, '不热', 45, 2);
INSERT INTO `vote_option` VALUES (103, '小米', 46, 1);
INSERT INTO `vote_option` VALUES (104, '苹果', 46, 2);
INSERT INTO `vote_option` VALUES (105, '华为', 46, 3);
INSERT INTO `vote_option` VALUES (106, '其他', 46, 4);
INSERT INTO `vote_option` VALUES (115, '22', 49, 1);
INSERT INTO `vote_option` VALUES (116, '23', 49, 2);
INSERT INTO `vote_option` VALUES (117, '00', 49, 3);
INSERT INTO `vote_option` VALUES (118, '01', 49, 4);
INSERT INTO `vote_option` VALUES (119, '02', 49, 5);
INSERT INTO `vote_option` VALUES (120, '03', 49, 6);
INSERT INTO `vote_option` VALUES (121, '王者荣耀', 50, 1);
INSERT INTO `vote_option` VALUES (122, '阴阳师', 50, 2);
INSERT INTO `vote_option` VALUES (123, '荒野行动', 50, 3);
INSERT INTO `vote_option` VALUES (124, '部落冲突', 50, 4);
INSERT INTO `vote_option` VALUES (125, '明日之后', 50, 5);
INSERT INTO `vote_option` VALUES (126, '北京', 51, 1);
INSERT INTO `vote_option` VALUES (127, '上海', 51, 2);
INSERT INTO `vote_option` VALUES (128, '广州', 51, 3);
INSERT INTO `vote_option` VALUES (130, '真的', 52, 1);
INSERT INTO `vote_option` VALUES (131, '不存在', 52, 2);
INSERT INTO `vote_option` VALUES (132, '抖音', 53, 1);
INSERT INTO `vote_option` VALUES (133, '爱奇艺', 53, 2);
INSERT INTO `vote_option` VALUES (134, '淘宝', 53, 3);
INSERT INTO `vote_option` VALUES (135, '拼夕夕', 53, 4);
INSERT INTO `vote_option` VALUES (136, '苹果', 54, 1);
INSERT INTO `vote_option` VALUES (137, '荔枝', 54, 2);
INSERT INTO `vote_option` VALUES (138, '火龙果', 54, 3);
INSERT INTO `vote_option` VALUES (139, '芒果', 54, 4);
INSERT INTO `vote_option` VALUES (140, '很美味', 55, 1);
INSERT INTO `vote_option` VALUES (141, '难吃', 55, 2);
INSERT INTO `vote_option` VALUES (142, '一般', 55, 3);
INSERT INTO `vote_option` VALUES (143, '春', 56, 1);
INSERT INTO `vote_option` VALUES (144, '夏', 56, 2);
INSERT INTO `vote_option` VALUES (145, '秋', 56, 3);
INSERT INTO `vote_option` VALUES (146, '东', 56, 4);

-- ----------------------------
-- Table structure for vote_subject
-- ----------------------------
DROP TABLE IF EXISTS `vote_subject`;
CREATE TABLE `vote_subject`  (
  `VS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VS_TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票标题',
  `VS_TYPE` int(11) NOT NULL DEFAULT 1 COMMENT '投票标题',
  `VU_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CHOSE_NUM` int(10) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`VS_ID`) USING BTREE,
  INDEX `VS_ID `(`VS_ID`) USING BTREE,
  INDEX `vote_subject_ibfk_1`(`VU_ID`) USING BTREE,
  CONSTRAINT `vote_subject_ibfk_1` FOREIGN KEY (`VU_ID`) REFERENCES `vote_user` (`VU_USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_subject
-- ----------------------------
INSERT INTO `vote_subject` VALUES (43, '你喜欢的城市', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (44, '你最喜欢的电影', 2, 'admin', 3);
INSERT INTO `vote_subject` VALUES (45, '中山热吗？', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (46, '你一般用什么品牌的手机', 1, 'hdq123', 1);
INSERT INTO `vote_subject` VALUES (49, '最晚几点睡觉', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (50, '你喜欢的手游', 2, 'admin', 3);
INSERT INTO `vote_subject` VALUES (51, '毕业后你想去哪工作？', 2, 'admin', 3);
INSERT INTO `vote_subject` VALUES (52, '听说程序猿掉头发比较严重', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (53, '你用的最多的软件', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (54, '你爱吃的水果', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (55, '榴莲怎么样？', 1, 'admin', 1);
INSERT INTO `vote_subject` VALUES (56, '最喜欢的季节', 2, 'lss12345', 3);

-- ----------------------------
-- Table structure for vote_user
-- ----------------------------
DROP TABLE IF EXISTS `vote_user`;
CREATE TABLE `vote_user`  (
  `VU_USER_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户标识',
  `VU_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称',
  `VU_PASSWORD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `VU_STATUS` int(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `VU_TYPE` int(11) NOT NULL DEFAULT 1 COMMENT '版本',
  `VU_SEX` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VU_AGE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VU_PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`VU_USER_ID`) USING BTREE,
  INDEX `VU_USER_ID `(`VU_USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vote_user
-- ----------------------------
INSERT INTO `vote_user` VALUES ('1234444', '11', '123', 1, 2, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('admin', '冬青', '123', 1, 9, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('hdq123', '冬青', '123', 0, 1, '1', '149', '15274436461');
INSERT INTO `vote_user` VALUES ('hdq1231', '哈哈', '123', 0, 1, '1', '', '');
INSERT INTO `vote_user` VALUES ('hdq12345', '11', '123', 1, 2, '1', '11', '15247512151');
INSERT INTO `vote_user` VALUES ('hdq1234567', 'hh', '123', 1, 2, '1', '12', '15274436411');
INSERT INTO `vote_user` VALUES ('jj1234', '隆傲天', '123', 1, 9, '1', '122', '');
INSERT INTO `vote_user` VALUES ('jj12341', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12342', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12343', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12344', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12345', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12346', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('jj12347', '11', '123', 1, 1, NULL, NULL, NULL);
INSERT INTO `vote_user` VALUES ('lss123', '哈哈', '123', 1, 1, '1', '', '');
INSERT INTO `vote_user` VALUES ('lss12345', '哈哈', '123', 1, 2, '1', '149', '15274436461');

-- ----------------------------
-- View structure for item_num
-- ----------------------------
DROP VIEW IF EXISTS `item_num`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `item_num` AS select `vote_item`.`VS_ID` AS `VS_ID`,count(0) AS `counts` from `vote_item` group by `vote_item`.`VS_ID`;

-- ----------------------------
-- View structure for option_num
-- ----------------------------
DROP VIEW IF EXISTS `option_num`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `option_num` AS select `vote_option`.`VS_ID` AS `VS_ID`,count(0) AS `counts` from `vote_option` group by `vote_option`.`VS_ID`;

SET FOREIGN_KEY_CHECKS = 1;
