/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : qa_flask

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 17/06/2021 20:42:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts_login_history
-- ----------------------------
DROP TABLE IF EXISTS `accounts_login_history`;
CREATE TABLE `accounts_login_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_from` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logined_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_login_history
-- ----------------------------
INSERT INTO `accounts_login_history` VALUES (1, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 22:40:21');
INSERT INTO `accounts_login_history` VALUES (2, 3, '13000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 22:42:01');
INSERT INTO `accounts_login_history` VALUES (3, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 22:47:23');
INSERT INTO `accounts_login_history` VALUES (4, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 22:47:40');
INSERT INTO `accounts_login_history` VALUES (5, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 22:51:37');
INSERT INTO `accounts_login_history` VALUES (6, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 08:29:33');
INSERT INTO `accounts_login_history` VALUES (7, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 08:46:24');
INSERT INTO `accounts_login_history` VALUES (8, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:01:54');
INSERT INTO `accounts_login_history` VALUES (9, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:02:09');
INSERT INTO `accounts_login_history` VALUES (10, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:17:08');
INSERT INTO `accounts_login_history` VALUES (11, 3, '13000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:24:49');
INSERT INTO `accounts_login_history` VALUES (12, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:32:41');
INSERT INTO `accounts_login_history` VALUES (13, 3, '13000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 11:09:23');
INSERT INTO `accounts_login_history` VALUES (14, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 11:15:48');
INSERT INTO `accounts_login_history` VALUES (15, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 11:16:06');
INSERT INTO `accounts_login_history` VALUES (16, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 11:27:59');
INSERT INTO `accounts_login_history` VALUES (17, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 11:28:07');
INSERT INTO `accounts_login_history` VALUES (18, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 12:52:00');
INSERT INTO `accounts_login_history` VALUES (19, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:47:35');
INSERT INTO `accounts_login_history` VALUES (20, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:47:40');
INSERT INTO `accounts_login_history` VALUES (21, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:47:48');
INSERT INTO `accounts_login_history` VALUES (22, 3, '13000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:47:57');
INSERT INTO `accounts_login_history` VALUES (23, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 15:20:32');
INSERT INTO `accounts_login_history` VALUES (24, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 15:05:07');
INSERT INTO `accounts_login_history` VALUES (25, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 15:12:55');
INSERT INTO `accounts_login_history` VALUES (26, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 15:31:00');
INSERT INTO `accounts_login_history` VALUES (27, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:22:35');
INSERT INTO `accounts_login_history` VALUES (28, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 18:30:35');
INSERT INTO `accounts_login_history` VALUES (29, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 20:26:39');
INSERT INTO `accounts_login_history` VALUES (30, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 20:54:09');
INSERT INTO `accounts_login_history` VALUES (31, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 09:47:53');
INSERT INTO `accounts_login_history` VALUES (32, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 10:03:57');
INSERT INTO `accounts_login_history` VALUES (33, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 10:06:20');
INSERT INTO `accounts_login_history` VALUES (34, 4, '13000000003', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 10:21:31');
INSERT INTO `accounts_login_history` VALUES (35, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 13:31:52');
INSERT INTO `accounts_login_history` VALUES (36, 1, '13000000000', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 17:27:11');
INSERT INTO `accounts_login_history` VALUES (37, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 19:19:43');
INSERT INTO `accounts_login_history` VALUES (38, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 22:46:26');
INSERT INTO `accounts_login_history` VALUES (39, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-16 16:58:55');
INSERT INTO `accounts_login_history` VALUES (40, 2, '13000000001', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-16 17:01:02');
INSERT INTO `accounts_login_history` VALUES (41, 3, '13000000002', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-16 17:26:22');

-- ----------------------------
-- Table structure for accounts_third
-- ----------------------------
DROP TABLE IF EXISTS `accounts_third`;
CREATE TABLE `accounts_third`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `logined_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_third_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_third
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_user
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user`;
CREATE TABLE `accounts_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint NULL DEFAULT NULL,
  `is_super` smallint NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user
-- ----------------------------
INSERT INTO `accounts_user` VALUES (1, '13000000000', '40f03c818e5b94f77d0d7e74c603147146990bf607f085b2e7bf253d920be49f', '钢蛋儿', 'a.jpg', 1, 0, '2021-06-09 22:40:16', '2021-06-09 22:40:16');
INSERT INTO `accounts_user` VALUES (2, '13000000001', '40f03c818e5b94f77d0d7e74c603147146990bf607f085b2e7bf253d920be49f', '李到晛哥哥', 'b.jpg', 1, 0, '2021-06-09 22:41:38', '2021-06-13 19:24:29');
INSERT INTO `accounts_user` VALUES (3, '13000000002', '40f03c818e5b94f77d0d7e74c603147146990bf607f085b2e7bf253d920be49f', '张大炮', 'c.jpg', 1, 0, '2021-06-09 22:41:50', '2021-06-09 22:41:50');
INSERT INTO `accounts_user` VALUES (4, '13000000003', '40f03c818e5b94f77d0d7e74c603147146990bf607f085b2e7bf253d920be49f', '草莓冰淇淋', 'd.jpg', 1, 0, '2021-06-09 22:51:28', '2021-06-09 22:51:28');

-- ----------------------------
-- Table structure for accounts_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_profile`;
CREATE TABLE `accounts_user_profile`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maxim` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `follow` int NULL DEFAULT NULL,
  `fans` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `accounts_user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_profile
-- ----------------------------
INSERT INTO `accounts_user_profile` VALUES (1, 1, '13000000000', '王强', NULL, '', NULL, 21, 142, '2021-06-09 22:40:16', '2021-06-13 17:27:55');
INSERT INTO `accounts_user_profile` VALUES (2, 2, '13000000001', '李到晛', '男', '', NULL, 23, 1235, '2021-06-09 22:41:38', '2021-06-13 19:25:26');
INSERT INTO `accounts_user_profile` VALUES (3, 3, '13000000002', NULL, NULL, NULL, NULL, 42, 155, '2021-06-09 22:41:50', '2021-06-09 22:41:50');
INSERT INTO `accounts_user_profile` VALUES (4, 4, '13000000003', NULL, NULL, NULL, NULL, 21, 4, '2021-06-09 22:51:28', '2021-06-09 22:51:28');

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('b2fc53103882');

-- ----------------------------
-- Table structure for qa_answer
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer`;
CREATE TABLE `qa_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `answered_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer
-- ----------------------------
INSERT INTO `qa_answer` VALUES (1, 3, 1, '<p>上面的女生太慫了，勇敢點沒事的，我就200%支持女性平權，亞裔平權，lgbt平權。</p>\r\n\r\n<p>不要害怕自己不合群，合群從來都不是一項好的品質！！</p>\r\n', 1, '2021-06-09 22:46:13', '2021-06-09 22:46:13');
INSERT INTO `qa_answer` VALUES (3, 1, 3, '<p>这件事辟不辟谣不重要，&quot;要开牙套证明&quot;这件事在很多城市是每年都发生。</p>\r\n\r\n<p>其实问题的核心并不在于戴牙套很常见而需不需要开证明，而是<strong>医生能证明什么？</strong></p>\r\n\r\n<p>只能证明牙套是牙套啊，但是，牙套是牙套需要证明吗？</p>\r\n\r\n<p>需要的话眼镜厂家就得证明眼镜是眼镜，衣服厂家需要证明拉链扣是拉链扣，皮带厂家要证明皮带扣是皮带扣&hellip;&hellip;</p>\r\n\r\n<p>监考防的是什么？防的是牙套里<strong>藏作弊器</strong>，防的是眼镜里<strong>藏作弊器</strong>&hellip;</p>\r\n\r\n<p>但是，医生没法证明其他东西啊，我想通过把作弊器塞在牙套里来作弊，那我就去医院戴个牙套，（牙套是货真价实的，肯定也能开到证明），然后呢，高考前在牙套缝里塞个作弊器，医院证明有用吗？医院要连带责任吗？那我在衣服兜里揣个作弊小抄，衣服厂家是不也要背锅？<strong>所以，牙套是牙套，不需要证明；牙套里有没有其他东西，无法证明。</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, '2021-06-10 09:18:24', '2021-06-10 09:18:24');
INSERT INTO `qa_answer` VALUES (5, 1, 4, '<p>谢邀。感情问题，一定不要只顾对方而丢掉自己的生活。</p>\r\n\r\n<p>大多数男生都是这样，一开始热情主动地来找你说话，但过了几个月，就不理你了。这里面，有可能是他新鲜感过了，不想理你，有可能是真忙，但不管怎么样，男生都希望有自己的空间。</p>\r\n\r\n<p>作为女生，能做的就是转变思想，努力提升自己，想他了也不要等他主动，想他就给他发消息，表示你的想法，但是不要太频繁了，一天三四条就行了，因为你也有你的事情干，也不要要求他秒回你，因为人家可能的确有事。他打游戏也就让他打去吧，不要总是说，说一次两次就行了，都那么大的人了</p>\r\n\r\n<p>我之前也因为男朋友不理我作死，和他吵架，吵了一个月，差一点分了，这几天才醒悟过来，脑袋里再也不想他了，而是以自己的发展为主，多想一想自己的事业，以后要去哪里旅游，要去哪里玩，我还想考研究生&hellip;&hellip;这样，我便不那么想他了。</p>\r\n\r\n<p>一般我想他了就发了个我想你了，发完我就看书了，晚上他主动给我发消息，说他在玩游戏，我也说，玩吧，放松一下也挺好，然后他没说话，我也没在意了，真的，把重心移到自己生活上，自然而然就不会那么在意他了。</p>\r\n\r\n<p>中午我又给男朋友分享了两个搞笑视频，发完同样没管，当然他也没回我，晚上我又想他了，就问他下班没，吃饭没，这回他主动给我发视频了。</p>\r\n\r\n<p>之后的事情就慢慢顺利了，三天过头，他就会主动给我发消息，问我在干啥之类的，我有时候也会给他主动发，都是不想着他会回复我那种，只想把搞笑的东西分享给他，甚至还故意调戏他，土味情话，小小的黄暴段子什么的，把他撩的挺开心，之后关系明显亲密了。当男生觉得和你在一起很轻松愉快时，他们一般就会愿意联系你了。</p>\r\n', 1, '2021-06-10 09:21:25', '2021-06-10 09:21:25');
INSERT INTO `qa_answer` VALUES (6, 3, 6, '<p>哈哈哈哈哈哈哈哈这个我知道。</p>\r\n\r\n<p>吃完辣的东西拉肚子其实是因为辣椒素是不消化的，肛门粘膜恰恰又非常柔嫩，所以通过的时候当然会刺痛刺痛感觉辣辣的。理论上来说好像没什么办法可以不疼的哦。</p>\r\n\r\n<p><strong>多吃香蕉尽早把这些辣椒素排掉是最好的了。</strong></p>\r\n', 1, '2021-06-10 09:25:20', '2021-06-10 09:25:20');
INSERT INTO `qa_answer` VALUES (10, 2, 8, '<p>回答巴拉拉拉拉拉拉</p>\r\n', 1, '2021-06-16 17:06:21', '2021-06-16 17:06:21');

-- ----------------------------
-- Table structure for qa_answer_collect
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_collect`;
CREATE TABLE `qa_answer_collect`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `collected_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `qa_answer_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_collect_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_collect_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_collect
-- ----------------------------
INSERT INTO `qa_answer_collect` VALUES (14, 2, 1, 1, 1, '2021-06-13 14:22:01');
INSERT INTO `qa_answer_collect` VALUES (15, 2, 5, 4, 1, '2021-06-13 14:22:26');
INSERT INTO `qa_answer_collect` VALUES (16, 2, 6, 6, 1, '2021-06-13 14:22:39');
INSERT INTO `qa_answer_collect` VALUES (17, 2, 10, 8, 1, '2021-06-16 17:12:28');

-- ----------------------------
-- Table structure for qa_answer_dislove
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_dislove`;
CREATE TABLE `qa_answer_dislove`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `dislove_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `qa_answer_dislove_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_dislove_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_dislove_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_dislove
-- ----------------------------
INSERT INTO `qa_answer_dislove` VALUES (1, 2, 5, 4, '2021-06-13 14:00:56');
INSERT INTO `qa_answer_dislove` VALUES (2, 2, 5, 4, '2021-06-13 14:00:59');
INSERT INTO `qa_answer_dislove` VALUES (3, 2, 3, 3, '2021-06-13 14:01:19');
INSERT INTO `qa_answer_dislove` VALUES (4, 2, 3, 3, '2021-06-13 14:03:24');
INSERT INTO `qa_answer_dislove` VALUES (5, 2, 1, 1, '2021-06-13 14:03:54');
INSERT INTO `qa_answer_dislove` VALUES (6, 2, 10, 8, '2021-06-16 17:06:59');

-- ----------------------------
-- Table structure for qa_answer_love
-- ----------------------------
DROP TABLE IF EXISTS `qa_answer_love`;
CREATE TABLE `qa_answer_love`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `loved_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `qa_answer_love_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_love_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_answer_love_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_answer_love
-- ----------------------------
INSERT INTO `qa_answer_love` VALUES (32, 2, 3, 3, '2021-06-13 14:02:57');
INSERT INTO `qa_answer_love` VALUES (33, 2, 5, 4, '2021-06-13 14:03:50');
INSERT INTO `qa_answer_love` VALUES (34, 2, 1, 1, '2021-06-13 14:03:56');
INSERT INTO `qa_answer_love` VALUES (35, 2, 1, 1, '2021-06-13 14:03:59');
INSERT INTO `qa_answer_love` VALUES (36, 2, 1, 1, '2021-06-13 14:04:01');
INSERT INTO `qa_answer_love` VALUES (37, 2, 1, 1, '2021-06-13 14:25:20');
INSERT INTO `qa_answer_love` VALUES (38, 2, 10, 8, '2021-06-16 17:06:57');
INSERT INTO `qa_answer_love` VALUES (39, 2, 10, 8, '2021-06-16 17:07:01');
INSERT INTO `qa_answer_love` VALUES (40, 2, 1, 1, '2021-06-16 17:11:35');
INSERT INTO `qa_answer_love` VALUES (41, 2, 1, 1, '2021-06-16 17:16:38');
INSERT INTO `qa_answer_love` VALUES (42, 2, 3, 3, '2021-06-16 17:16:43');
INSERT INTO `qa_answer_love` VALUES (43, 2, 6, 6, '2021-06-16 17:18:59');

-- ----------------------------
-- Table structure for qa_comment
-- ----------------------------
DROP TABLE IF EXISTS `qa_comment`;
CREATE TABLE `qa_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `reply_id` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `love_count` int NULL DEFAULT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `is_public` smallint NULL DEFAULT NULL,
  `commented_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `reply_id`(`reply_id`) USING BTREE,
  CONSTRAINT `qa_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_comment_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `qa_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_comment_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_comment_ibfk_4` FOREIGN KEY (`reply_id`) REFERENCES `qa_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_comment
-- ----------------------------
INSERT INTO `qa_comment` VALUES (1, 1, 1, 1, NULL, '眼睁睁看着一片好文却着急忙慌想不出骚话蹭评论的我…', 3, 1, 1, '2021-06-09 22:47:27', '2021-06-10 10:35:42');
INSERT INTO `qa_comment` VALUES (2, 2, 1, 1, 1, '哈哈哈哈哈哈', 1, 1, 1, '2021-06-09 22:47:51', '2021-06-10 10:35:59');
INSERT INTO `qa_comment` VALUES (3, 2, 1, 1, NULL, '他们要的不是平权，是特权。这个无关性别，而是人性打着性别的幌子', 5, 1, 1, '2021-06-09 22:50:39', '2021-06-13 13:32:25');
INSERT INTO `qa_comment` VALUES (4, 4, 1, 1, 3, '不要以偏概全，我也是女孩子，我觉得平权非常好啊。', 2, 1, 1, '2021-06-09 22:52:05', '2021-06-13 14:25:23');
INSERT INTO `qa_comment` VALUES (5, 4, 1, 1, NULL, '实话说，中低层男性本来就是女权的中流砥柱，中低层女性也是', 1, 1, 1, '2021-06-09 22:52:39', '2021-06-12 20:27:15');
INSERT INTO `qa_comment` VALUES (7, 1, 1, 1, NULL, '男女生理结构不同，决定了二者不可能平等。本来男女搭配，干活不累，挺好的，非把男女对立，何必呢。女性一旦独立，就没男人什么事了；而生活中，大部分女性做不到，她们想靠嫁人获得安全感，但是他们嫁人的条件，绝大部分适龄男性做不到，然后呢，就互喷了。一个适龄男性，要在二十几岁，买房，买车，彩礼，女性家庭不好，还得“扶弟”，不靠父母，极少能做到，绝大多数女性不容易，男性容易吗？新婚姻法，男女婚前财产属于个人，网上评论男同胞表示很好，女同胞表示离婚分不到，亏了，不公平。拜托，女性的婚前财产也属于个人，男的也分不到。这不很公平吗？没有歧视女性，给了女权。那为啥女性觉得不公平呢？因为她们潜意识房子财产都是男的赚的，这种情况下要平等，可能吗？而且，随意物质水平的提高，人活的越来越自私，越来越多人觉得该为自己而活，都想享受生活，让另一半付出，这才是主因！时代发展的必然，没有谁对谁错！', 0, 1, 1, '2021-06-09 22:53:30', '2021-06-09 22:53:30');
INSERT INTO `qa_comment` VALUES (8, 4, 6, 6, NULL, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', 0, 1, 1, '2021-06-12 21:41:07', '2021-06-12 21:41:07');
INSERT INTO `qa_comment` VALUES (10, 2, 10, 8, NULL, '评论', 2, 1, 1, '2021-06-16 17:10:35', '2021-06-16 17:10:39');
INSERT INTO `qa_comment` VALUES (11, 2, 10, 8, 10, '回复', 1, 1, 1, '2021-06-16 17:10:47', '2021-06-16 17:10:50');

-- ----------------------------
-- Table structure for qa_question
-- ----------------------------
DROP TABLE IF EXISTS `qa_question`;
CREATE TABLE `qa_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reorder` int NULL DEFAULT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `view_count` int NULL DEFAULT NULL,
  `questioned_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `qa_question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question
-- ----------------------------
INSERT INTO `qa_question` VALUES (1, 3, '现在的反女权风气是否过于兴盛了？', '现在的网友对女权主义的看法与微博网友大致相反，其中原因为何？对女权主义的批判是否合理？有无矫枉过正的成分在里面？希望看到更多理性解答，提出该问题仅出', '', '<p>现在的网友对女权主义的看法与微博网友大致相反，其中原因为何？对女权主义的批判是否合理？有无矫枉过正的成分在里面？希望看到更多理性解答，提出该问题仅出自<strong>好奇</strong>，<strong>非引战</strong>。</p>\r\n', 0, 1, 4234, '2021-06-09 22:45:13', '2021-06-09 22:45:13');
INSERT INTO `qa_question` VALUES (3, 4, '河北考生因戴金属牙套不让进考场，官方通报称「实际和报道不吻合」，哪些问题值得关注？类似规定是否合理？', '最新进展： 河北沧州市教育考试院通报「考生戴金属牙套无法过安检」一事：实情与网络报道的情况不吻合 据河北沧州教育局网站6月8日消息，沧州市教育考试院当', '', '<p>最新进展： 河北沧州市教育考试院通报「考生戴金属牙套无法过安检」一事：实情与网络报道的情况不吻合 据河北沧州教育局网站6月8日消息，沧州市教育考试院当天发布《情况通报》称，6月8日网络上出现《一考生戴金属牙套无法通过安检，交警快速带她到医院开好证明》的报道后，沧州市教育考试院<strong>立即</strong>组织相关人员到十四中考点进行了认真调查核实。</p>\r\n', 0, 1, 864, '2021-06-09 23:02:17', '2021-06-09 23:02:17');
INSERT INTO `qa_question` VALUES (4, 4, '男朋友不理人，怎么处理？', '我跟男朋友才谈恋爱两个月，但是他就是我不理他，他也不常主动理我，一般都是我找他，我说一句他回一句，我要是不找他他就会一天不理我，我们前面在学校也是，现在暑假', '', '<p>我跟男朋友才谈恋爱两个月，但是他就是我不理他，他也不常主动理我，一般都是我找他，我说一句他回一句，我要是不找他他就会一天不理我，我们前面在学校也是，现在暑假异地也是这样，不知道怎么改变这种状况</p>\r\n', 0, 1, 534, '2021-06-09 23:09:05', '2021-06-09 23:09:05');
INSERT INTO `qa_question` VALUES (6, 1, '吃完辣的东西并拉肚子时，如何减轻菊花的灼烧感？', '这个，不用我详细说明了吧？注意审题，我不想知道为什么，我想知道这损害结果已经发生之后如何解决。另', '', '<p>这个，不用我详细说明了吧？注意审题，我不想知道为什么，我想知道这损害结果已经发生之后如何解决。另外，不准笑。</p>\r\n', 0, 1, 0, '2021-06-10 09:24:17', '2021-06-10 09:24:17');
INSERT INTO `qa_question` VALUES (8, 2, '河北考生因戴金属牙套不让进考场，官方通报称「实际和报道不吻合」，哪些问题值得关注？类似规定是否合理？', '这几日，关于高考的相关话题持续霸屏热搜榜，而一则考生因戴牙套不让进考场的新闻也成为大家关注的热', '', '<p>这几日，关于高考的相关话题持续霸屏热搜榜，而一则考生因戴牙套不让进考场的新闻也成为大家关注的热点。6月7日河北一名考生来到考点，在过安检的时候，因为佩戴着牙套，导致安检金属警报响起。女生情急之下，求助交警叔叔去医院补盖公章，才得以顺利进入考场。</p>\r\n', 0, 1, 0, '2021-06-16 17:03:59', '2021-06-16 17:03:59');
INSERT INTO `qa_question` VALUES (9, 2, 'Python有哪些高级用法？', '如题，我是一名转行做python开发的小白，目前刚刚入门python，感觉没啥用', '', '<p>如题，我是一名转行做python开发的小白，目前刚刚入门python，感觉没啥用。请问各位大佬python有什么用？有什么其他的高级用法吗？</p>\r\n', 0, 1, 0, '2021-06-16 17:18:47', '2021-06-16 17:18:47');

-- ----------------------------
-- Table structure for qa_question_follow
-- ----------------------------
DROP TABLE IF EXISTS `qa_question_follow`;
CREATE TABLE `qa_question_follow`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `q_id` int NULL DEFAULT NULL,
  `is_valid` smallint NULL DEFAULT NULL COMMENT '逻辑删除',
  `followed_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `qa_question_follow_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qa_question_follow_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question_follow
-- ----------------------------
INSERT INTO `qa_question_follow` VALUES (2, 2, 6, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (3, 2, 4, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (4, 2, 1, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (5, 2, 3, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (7, 2, 8, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (8, 3, 1, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (9, 3, 4, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (10, 3, 6, 1, NULL);
INSERT INTO `qa_question_follow` VALUES (13, 3, 9, 1, NULL);

-- ----------------------------
-- Table structure for qa_question_tags
-- ----------------------------
DROP TABLE IF EXISTS `qa_question_tags`;
CREATE TABLE `qa_question_tags`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `q_id` int NULL DEFAULT NULL,
  `tag_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_valid` smallint NULL DEFAULT NULL,
  `added_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  CONSTRAINT `qa_question_tags_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `qa_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qa_question_tags
-- ----------------------------
INSERT INTO `qa_question_tags` VALUES (1, 1, '女性主义', 1, '2021-06-09 22:45:13');
INSERT INTO `qa_question_tags` VALUES (2, 1, '性别平等', 1, '2021-06-09 22:45:13');
INSERT INTO `qa_question_tags` VALUES (3, 1, '反女权主义', 1, '2021-06-09 22:45:13');
INSERT INTO `qa_question_tags` VALUES (4, 3, '教育', 1, '2021-06-09 23:02:17');
INSERT INTO `qa_question_tags` VALUES (5, 3, '高考', 1, '2021-06-09 23:02:17');
INSERT INTO `qa_question_tags` VALUES (6, 3, '学生', 1, '2021-06-09 23:02:17');
INSERT INTO `qa_question_tags` VALUES (7, 3, '牙套', 1, '2021-06-09 23:02:17');
INSERT INTO `qa_question_tags` VALUES (8, 3, '河北省', 1, '2021-06-09 23:02:17');
INSERT INTO `qa_question_tags` VALUES (9, 4, '恋爱', 1, '2021-06-09 23:09:05');
INSERT INTO `qa_question_tags` VALUES (10, 4, '男朋友', 1, '2021-06-09 23:09:05');
INSERT INTO `qa_question_tags` VALUES (11, 4, '情感', 1, '2021-06-09 23:09:05');
INSERT INTO `qa_question_tags` VALUES (15, 6, '健康', 1, '2021-06-10 09:24:17');
INSERT INTO `qa_question_tags` VALUES (16, 6, '生活', 1, '2021-06-10 09:24:17');
INSERT INTO `qa_question_tags` VALUES (17, 6, '饮食', 1, '2021-06-10 09:24:17');
INSERT INTO `qa_question_tags` VALUES (18, 6, '生理知识', 1, '2021-06-10 09:24:17');
INSERT INTO `qa_question_tags` VALUES (19, 8, '教育', 1, '2021-06-16 17:03:59');
INSERT INTO `qa_question_tags` VALUES (20, 8, '高考', 1, '2021-06-16 17:03:59');
INSERT INTO `qa_question_tags` VALUES (21, 8, '学生', 1, '2021-06-16 17:03:59');
INSERT INTO `qa_question_tags` VALUES (22, 8, '牙套', 1, '2021-06-16 17:03:59');
INSERT INTO `qa_question_tags` VALUES (23, 8, '河北省', 1, '2021-06-16 17:03:59');
INSERT INTO `qa_question_tags` VALUES (24, 9, 'python', 1, '2021-06-16 17:18:47');
INSERT INTO `qa_question_tags` VALUES (25, 9, '数据分析', 1, '2021-06-16 17:18:47');
INSERT INTO `qa_question_tags` VALUES (26, 9, '高级编程', 1, '2021-06-16 17:18:47');
INSERT INTO `qa_question_tags` VALUES (27, 9, 'web开发', 1, '2021-06-16 17:18:47');

SET FOREIGN_KEY_CHECKS = 1;
