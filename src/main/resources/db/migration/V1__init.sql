SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for approve
-- ----------------------------
DROP TABLE IF EXISTS `approve`;
CREATE TABLE `approve`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `enrollId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请ID',
  `status` bit(1) NULL DEFAULT NULL COMMENT '审核状态 通过不通过',
  `createUser` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for constant
-- ----------------------------
DROP TABLE IF EXISTS `constant`;
CREATE TABLE `constant`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一标识',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `parentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级主键',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 'classificationType', '社群', 2);
INSERT INTO `dictionary` VALUES ('10', 'classificationType', '学术', 12);
INSERT INTO `dictionary` VALUES ('11', 'classificationType', '资讯', 13);
INSERT INTO `dictionary` VALUES ('12', 'classificationType', 'NSFW', 14);
INSERT INTO `dictionary` VALUES ('13', 'classificationType', '政治经济', 15);
INSERT INTO `dictionary` VALUES ('14', 'classificationType', '加密货币', 16);
INSERT INTO `dictionary` VALUES ('15', 'classificationType', '科学上网', 17);
INSERT INTO `dictionary` VALUES ('16', 'classificationType', 'Linux', 18);
INSERT INTO `dictionary` VALUES ('17', 'classificationType', 'Telegram', 19);
INSERT INTO `dictionary` VALUES ('18', 'classificationType', 'Other', 20);
INSERT INTO `dictionary` VALUES ('19', 'classificationType', '博客', 21);
INSERT INTO `dictionary` VALUES ('2', 'classificationType', '同城', 3);
INSERT INTO `dictionary` VALUES ('3', 'classificationType', '闲聊', 5);
INSERT INTO `dictionary` VALUES ('4', 'classificationType', '硬件', 6);
INSERT INTO `dictionary` VALUES ('5', 'classificationType', '软件', 7);
INSERT INTO `dictionary` VALUES ('6', 'classificationType', '编程', 8);
INSERT INTO `dictionary` VALUES ('7', 'classificationType', '游戏', 9);
INSERT INTO `dictionary` VALUES ('8', 'classificationType', '影音', 10);
INSERT INTO `dictionary` VALUES ('9', 'classificationType', 'ACG', 11);
INSERT INTO `dictionary` VALUES ('bot', 'recordType', '机器人', 104);
INSERT INTO `dictionary` VALUES ('channel', 'recordType', '频道', 102);
INSERT INTO `dictionary` VALUES ('classificationType', NULL, '收录分类', 1);
INSERT INTO `dictionary` VALUES ('group', 'recordType', '群组', 103);
INSERT INTO `dictionary` VALUES ('recordType', NULL, '收录类型', 101);

-- ----------------------------
-- Table structure for enroll
-- ----------------------------
DROP TABLE IF EXISTS `enroll`;
CREATE TABLE `enroll`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `recordId` bigint(20) NULL DEFAULT NULL COMMENT '频道/群组/bot  ID',
  `status` bit(1) NULL DEFAULT NULL COMMENT '是否提交',
  `createUser` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` bigint(20) NOT NULL COMMENT '频道\\群组\\机器人 ID',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道\\群组\\机器人 username',
  `inviteLink` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '私有链接',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `memberNumber` bigint(20) NULL DEFAULT NULL COMMENT '成员数量',
  `tag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收录类型 字典-recordType   频道\\群组\\机器人',
  `classification` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `placardId` bigint(20) NULL DEFAULT NULL COMMENT '公告ID',
  `status` bit(1) NULL DEFAULT NULL COMMENT '是否展示',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createUser` bigint(20) NULL DEFAULT NULL COMMENT '提交收录申请用户',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updateUser` datetime(0) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名',
  `lastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓',
  `isBot` bit(1) NULL DEFAULT NULL COMMENT '是否为机器人',
  `languageCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言代码',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '最后一次操作的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for v_enroll
-- ----------------------------
DROP VIEW IF EXISTS `v_enroll`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_enroll` AS select `e`.`id` AS `id`,`e`.`recordId` AS `recordId`,`r`.`username` AS `username`,`r`.`inviteLink` AS `inviteLink`,`r`.`title` AS `title`,`r`.`remark` AS `remark`,`r`.`memberNumber` AS `memberNumber`,`r`.`tag` AS `tag`,`r`.`type` AS `type`,`r`.`classification` AS `classification`,`r`.`placardId` AS `placardId`,`r`.`status` AS `recordStatus`,`e`.`status` AS `status`,`e`.`createUser` AS `createUser`,`e`.`createTime` AS `createTime` from (`enroll` `e` left join `record` `r` on((`e`.`recordId` = `r`.`id`)));

-- ----------------------------
-- View structure for v_record
-- ----------------------------
DROP VIEW IF EXISTS `v_record`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_record` AS select `r`.`id` AS `id`,`r`.`username` AS `username`,`r`.`inviteLink` AS `inviteLink`,`r`.`title` AS `title`,`r`.`remark` AS `remark`,`r`.`memberNumber` AS `memberNumber`,`r`.`tag` AS `tag`,`r`.`type` AS `type`,(select `dictionary`.`label` from `dictionary` where (`dictionary`.`id` = `r`.`type`)) AS `typeName`,`r`.`classification` AS `classification`,(select `dictionary`.`label` from `dictionary` where (`dictionary`.`id` = `r`.`classification`)) AS `classificationName`,`r`.`placardId` AS `placardId`,`r`.`status` AS `status`,`r`.`createTime` AS `createTime`,`r`.`createUser` AS `createUser`,`r`.`updateTime` AS `updateTime`,`r`.`updateUser` AS `updateUser` from `record` `r`;

-- ----------------------------
-- Table structure for ecology
-- ----------------------------
DROP TABLE IF EXISTS `ecology`;
CREATE TABLE `ecology`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chatId` bigint(20) NULL DEFAULT NULL COMMENT '群组/频道 ID',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群组/频道 用户名',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ecology
-- ----------------------------
INSERT INTO `ecology` VALUES ('approve', NULL, NULL, 'a group to approve the enroll request');
INSERT INTO `ecology` VALUES ('bulletin', NULL, NULL, 'after the enroll is passed, the announcement will be posted to the channel');

SET FOREIGN_KEY_CHECKS = 1;