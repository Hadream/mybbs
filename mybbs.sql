/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mybbs

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-15 20:49:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cate
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cate`;
CREATE TABLE `bbs_cate` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '版块ID',
  `pid` int(10) unsigned NOT NULL COMMENT '所属分区的ID',
  `cname` varchar(255) NOT NULL COMMENT '版块的名称',
  `uid` int(10) unsigned NOT NULL COMMENT '版主的用户ID',
  PRIMARY KEY (`cid`),
  KEY `cname` (`cname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_cate
-- ----------------------------
INSERT INTO `bbs_cate` VALUES ('40', '12', '杀破狼', '59');
INSERT INTO `bbs_cate` VALUES ('41', '9', '小角色', '56');
INSERT INTO `bbs_cate` VALUES ('42', '7', '小不点', '66');
INSERT INTO `bbs_cate` VALUES ('43', '10', 'lol', '59');
INSERT INTO `bbs_cate` VALUES ('44', '6', '王牌', '67');
INSERT INTO `bbs_cate` VALUES ('45', '10', 'love', '56');
INSERT INTO `bbs_cate` VALUES ('46', '11', '我们结婚吧', '67');

-- ----------------------------
-- Table structure for bbs_part
-- ----------------------------
DROP TABLE IF EXISTS `bbs_part`;
CREATE TABLE `bbs_part` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分区ID',
  `pname` varchar(255) NOT NULL COMMENT '分区名称',
  PRIMARY KEY (`pid`),
  KEY `pname` (`pname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_part
-- ----------------------------
INSERT INTO `bbs_part` VALUES ('7', '体育');
INSERT INTO `bbs_part` VALUES ('12', '动漫');
INSERT INTO `bbs_part` VALUES ('10', '游戏');
INSERT INTO `bbs_part` VALUES ('9', '电影');
INSERT INTO `bbs_part` VALUES ('11', '综艺');
INSERT INTO `bbs_part` VALUES ('6', '音乐');

-- ----------------------------
-- Table structure for bbs_post
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post`;
CREATE TABLE `bbs_post` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `uid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `rep_cnt` int(10) unsigned NOT NULL DEFAULT '0',
  `view_cnt` int(10) unsigned NOT NULL DEFAULT '0',
  `is_jing` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` int(10) unsigned DEFAULT '0',
  `updated_at` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_post
-- ----------------------------
INSERT INTO `bbs_post` VALUES ('1', '', '', '67', '42', '1', '0', '0', '0', '1', '1555070356', '1555070356');
INSERT INTO `bbs_post` VALUES ('2', 'a', 'q', '67', '41', '1', '0', '0', '0', '1', '1555070360', '1555070360');
INSERT INTO `bbs_post` VALUES ('3', 'a', 'q', '67', '46', '1', '0', '0', '0', '1', '1555070414', '1555070414');
INSERT INTO `bbs_post` VALUES ('4', '1', '1', '67', '44', '1', '0', '0', '0', '1', '1555070438', '1555070438');
INSERT INTO `bbs_post` VALUES ('5', '1', '1', '67', '44', '1', '0', '0', '0', '1', '1555070469', '1555070469');
INSERT INTO `bbs_post` VALUES ('6', '1', '1', '67', '44', '1', '0', '0', '0', '1', '1555070546', '1555070546');
INSERT INTO `bbs_post` VALUES ('7', '111', '111', '67', '44', '1', '0', '0', '0', '1', '1555071209', '1555071209');
INSERT INTO `bbs_post` VALUES ('8', 'aaa', 'aaa', '67', '45', '1', '11', '0', '0', '1', '1555071248', '1555071248');
INSERT INTO `bbs_post` VALUES ('9', '剑圣', '五杀 ', '67', '43', '1', '1', '0', '0', '1', '1555072065', '1555072065');
INSERT INTO `bbs_post` VALUES ('10', '1', '1', '67', '45', '0', '0', '0', '0', '1', '1555075672', '1555075672');
INSERT INTO `bbs_post` VALUES ('11', '小小小', '哈哈哈哈', '66', '42', '1', '0', '0', '0', '1', '1555075981', '1555075981');
INSERT INTO `bbs_post` VALUES ('12', '', '', '66', '43', '1', '0', '0', '0', '1', '1555075991', '1555075991');
INSERT INTO `bbs_post` VALUES ('13', '大大', '大', '66', '46', '1', '0', '0', '0', '1', '1555076050', '1555076050');
INSERT INTO `bbs_post` VALUES ('14', '盖伦', '1', '66', '43', '1', '0', '0', '0', '1', '1555076292', '1555076292');
INSERT INTO `bbs_post` VALUES ('15', '剑姬', '非常厉害', '67', '43', '0', '0', '0', '0', '1', '1555317644', '1555317644');
INSERT INTO `bbs_post` VALUES ('16', '1aaa', 'aaaaaaa', '66', '42', '0', '0', '0', '0', '1', '1555317824', '1555317824');
INSERT INTO `bbs_post` VALUES ('17', '2aaa', 'aaaaa', '66', '42', '0', '0', '0', '0', '1', '1555317834', '1555317834');
INSERT INTO `bbs_post` VALUES ('18', '3aaa', 'aaaaaa', '66', '42', '0', '0', '0', '0', '1', '1555317842', '1555317842');
INSERT INTO `bbs_post` VALUES ('19', '4aaa', '死死死你', '66', '42', '5', '21', '0', '0', '1', '1555317852', '1555332178');

-- ----------------------------
-- Table structure for bbs_reply
-- ----------------------------
DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rcontent` text NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_reply
-- ----------------------------
INSERT INTO `bbs_reply` VALUES ('6', '第一回复', '66', '19', '1555318537');
INSERT INTO `bbs_reply` VALUES ('7', '第2回复', '66', '19', '1555318545');
INSERT INTO `bbs_reply` VALUES ('8', '第三回复', '66', '19', '1555318551');
INSERT INTO `bbs_reply` VALUES ('9', '第4回复', '66', '19', '1555318560');
INSERT INTO `bbs_reply` VALUES ('10', '什么', '66', '19', '1555330889');
INSERT INTO `bbs_reply` VALUES ('11', '五', '66', '19', '1555331054');
INSERT INTO `bbs_reply` VALUES ('12', '五', '66', '19', '1555331070');
INSERT INTO `bbs_reply` VALUES ('13', '666', '66', '19', '1555331785');
INSERT INTO `bbs_reply` VALUES ('14', '666', '66', '19', '1555331937');
INSERT INTO `bbs_reply` VALUES ('15', '777', '66', '19', '1555331948');
INSERT INTO `bbs_reply` VALUES ('16', '11', '66', '19', '1555332129');
INSERT INTO `bbs_reply` VALUES ('17', '11', '66', '19', '1555332178');

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user`;
CREATE TABLE `bbs_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(255) NOT NULL COMMENT '用户名称',
  `upwd` char(80) NOT NULL,
  `auth` int(10) unsigned NOT NULL DEFAULT '3' COMMENT '用户权限  1 超级管理员   2 管理员    3普通会员',
  `uface` varchar(255) DEFAULT NULL,
  `sex` enum('x','m','w') DEFAULT 'w',
  `tel` varchar(20) DEFAULT '' COMMENT '手机号码',
  `created_at` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_user
-- ----------------------------
INSERT INTO `bbs_user` VALUES ('56', '小桔梗', '$2y$10$bahMIlpHgwT4aj0L3H6KNOTvZiVPlwJhKMwBbY3vzmun4jvkMIbQS', '2', 'Public/Uploads/20190410/5cade66d849ba.jpg', 'w', '', '1554900589');
INSERT INTO `bbs_user` VALUES ('57', '杀生丸', '$2y$10$UnDloogrBeNhHYbL5uvWPOg89VoWJSUFGnDSOmsm0J918Qh48qD2y', '2', 'Public/Uploads/20190410/5cade6802c03b.jpeg', 'm', '', '1554900608');
INSERT INTO `bbs_user` VALUES ('58', '犬夜叉', '$2y$10$Vt1TiYz8wVw0viZyE0jqr.aDrzqPlqTtWwqETMKmMGTo2uzvaf0ue', '3', 'Public/Uploads/20190410/5cade695d77d5.jpg', 'm', '', '1554900629');
INSERT INTO `bbs_user` VALUES ('59', '神秘人物', '$2y$10$xv9hoTghOeQXU2uDDW5HeuPY2g/iJ/Shlm0PP.RnEKYxHqs8M27V.', '1', 'Public/Uploads/20190410/5cade6af3c497.jpeg', 'x', '', '1554900655');
INSERT INTO `bbs_user` VALUES ('60', '小兔', '$2y$10$iiqCZW.73qNf.OB.gVH0eu03VsTOhbnMnDf5NrBWcTsNAEG99qQfa', '3', 'Public/Uploads/20190410/5cade6c3980fb.jpg', 'm', '', '1554900675');
INSERT INTO `bbs_user` VALUES ('61', '风', '$2y$10$V3gUNS/l7JjKVoyZ9g0UhuhK8iEAKfXD.f5kgxEkgNYKFrDi3reJi', '3', 'Public/Uploads/20190410/5cade6d87c2e1.jpg', 'm', '', '1554900696');
INSERT INTO `bbs_user` VALUES ('62', '小酷', '$2y$10$aeB8y5DPefdxQpyUWDUUjujhlNpnTRpatIfkI3AYfsW4UvS6ea4qe', '3', 'Public/Uploads/20190410/5cadf26094186.jpg', 'm', '', '1554900709');
INSERT INTO `bbs_user` VALUES ('63', '桔梗', '$2y$10$.5897zGMRJR57mNjymfzjuUKnDq1WsI//Ab7pcfxCcuWSARsubECe', '1', 'Public/Uploads/20190411/5caea26d9945b.jpg', 'w', '', '1554948717');
INSERT INTO `bbs_user` VALUES ('64', 'aaa', '$2y$10$MUnPjahguHPlKZwHP1r5aevOv17hJFk3PAMVGo0ODxPdgWL4xm1TC', '1', 'Public/Uploads/20190411/5caea3823f5f6.jpg', 'w', '', '1554948994');
INSERT INTO `bbs_user` VALUES ('66', 'ccc', '$2y$10$bwh82be0hthq49ckqGFovuXLaA9QMvOqtXdYOBGejtliCs7c7n9Mi', '1', 'Public/Uploads/20190411/5caeed29d451b.jpg', 'w', '', '1554967849');
INSERT INTO `bbs_user` VALUES ('67', 'admin', '$2y$10$WYXg5p9/v6AJFS9QAaVHoexX3dmOCyQQ5jgQHyV8au9n.Cvgjvola', '1', 'Public/Uploads/20190411/5caf4c7c23299.jpeg', 'm', '', '1554992252');
INSERT INTO `bbs_user` VALUES ('68', 'xx', '$2y$10$JcbQtLBgJiKBQHF4CY8YiO8z1TaervNcYIFEKd2xIVkeCoQwdEW/K', '3', null, 'w', '1', '1555056802');
INSERT INTO `bbs_user` VALUES ('69', 'yy', '$2y$10$0lXc6jfceEjthqw21osNue2kCtNNdT9BhbCj9WqO1DP3av.lgxHSe', '3', null, 'w', '1', '1555056986');
INSERT INTO `bbs_user` VALUES ('70', '1', '$2y$10$weGpVVkNMVydL2sTP7OqY.zrDmad7E/rhGsAC4F5OeV8XOwSmkDdq', '3', null, 'w', '1', '1555070312');
