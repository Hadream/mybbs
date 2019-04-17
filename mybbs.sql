/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mybbs

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-17 14:42:52
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_cate
-- ----------------------------
INSERT INTO `bbs_cate` VALUES ('40', '12', '杀破狼', '59');
INSERT INTO `bbs_cate` VALUES ('41', '9', '小角色', '56');
INSERT INTO `bbs_cate` VALUES ('42', '7', '小不点', '66');
INSERT INTO `bbs_cate` VALUES ('43', '10', 'lol', '59');
INSERT INTO `bbs_cate` VALUES ('45', '10', 'love', '56');
INSERT INTO `bbs_cate` VALUES ('46', '11', '我们结婚吧', '67');
INSERT INTO `bbs_cate` VALUES ('47', '7', '大大的', '56');
INSERT INTO `bbs_cate` VALUES ('48', '7', '中等', '56');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_post
-- ----------------------------
INSERT INTO `bbs_post` VALUES ('3', 'a', 'q11', '67', '43', '1', '0', '0', '1', '1', '1555070414', '1555070414');
INSERT INTO `bbs_post` VALUES ('10', '1', '1', '67', '45', '0', '1', '1', '1', '1', '1555075672', '1555075672');
INSERT INTO `bbs_post` VALUES ('13', '大大', '大', '66', '46', '1', '0', '1', '0', '1', '1555076050', '1555076050');
INSERT INTO `bbs_post` VALUES ('14', '盖伦', '1', '66', '43', '1', '0', '0', '0', '1', '1555076292', '1555076292');
INSERT INTO `bbs_post` VALUES ('15', '剑姬', '非常厉害', '67', '43', '0', '0', '1', '1', '1', '1555317644', '1555317644');
INSERT INTO `bbs_post` VALUES ('17', '2aaa', 'aaaaa', '66', '42', '1', '8', '0', '1', '1', '1555317834', '1555317834');
INSERT INTO `bbs_post` VALUES ('26', 'ads', 'a', '56', '42', '0', '2', '1', '1', '1', '1555471624', '1555471624');
INSERT INTO `bbs_post` VALUES ('27', '333333', '121', '56', '42', '0', '0', '0', '1', '1', '1555471629', '1555471629');
INSERT INTO `bbs_post` VALUES ('28', '444', '44', '56', '42', '1', '2', '1', '0', '1', '1555471633', '1555471633');
INSERT INTO `bbs_post` VALUES ('29', '555', '55', '56', '42', '0', '0', '0', '1', '0', '1555471638', '1555471638');
INSERT INTO `bbs_post` VALUES ('30', '33', '666', '56', '42', '0', '0', '0', '0', '1', '1555472042', '1555472042');
INSERT INTO `bbs_post` VALUES ('31', '2', '2', '56', '45', '0', '0', '0', '0', '1', '1555473621', '1555473621');

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
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid` (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_reply
-- ----------------------------
INSERT INTO `bbs_reply` VALUES ('44', '2', '67', '11', '1555394709');
INSERT INTO `bbs_reply` VALUES ('45', '1', '56', '11', '1555404924');
INSERT INTO `bbs_reply` VALUES ('46', '111', '56', '16', '1555406199');
INSERT INTO `bbs_reply` VALUES ('47', '22', '56', '16', '1555406213');
INSERT INTO `bbs_reply` VALUES ('50', '113', '90', '28', '1555480133');

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_user
-- ----------------------------
INSERT INTO `bbs_user` VALUES ('56', '小桔梗', '$2y$10$9HqO9fuuKeL8LZBiUM4VgOdd2kom4NUXOpRqUmV4/apYj8LjUYT/C', '2', 'Public/Uploads/20190416/5cb535323898d.jpg', 'w', '', '1554900589');
INSERT INTO `bbs_user` VALUES ('57', '杀生丸', '$2y$10$UnDloogrBeNhHYbL5uvWPOg89VoWJSUFGnDSOmsm0J918Qh48qD2y', '2', 'Public/Uploads/20190410/5cade6802c03b.jpeg', 'm', '', '1554900608');
INSERT INTO `bbs_user` VALUES ('58', '犬夜叉', '$2y$10$Vt1TiYz8wVw0viZyE0jqr.aDrzqPlqTtWwqETMKmMGTo2uzvaf0ue', '3', 'Public/Uploads/20190410/5cade695d77d5.jpg', 'm', '', '1554900629');
INSERT INTO `bbs_user` VALUES ('59', '神秘人物', '$2y$10$xv9hoTghOeQXU2uDDW5HeuPY2g/iJ/Shlm0PP.RnEKYxHqs8M27V.', '1', 'Public/Uploads/20190410/5cade6af3c497.jpeg', 'x', '', '1554900655');
INSERT INTO `bbs_user` VALUES ('60', '小兔', '$2y$10$iiqCZW.73qNf.OB.gVH0eu03VsTOhbnMnDf5NrBWcTsNAEG99qQfa', '3', 'Public/Uploads/20190410/5cade6c3980fb.jpg', 'm', '', '1554900675');
INSERT INTO `bbs_user` VALUES ('61', '风', '$2y$10$V3gUNS/l7JjKVoyZ9g0UhuhK8iEAKfXD.f5kgxEkgNYKFrDi3reJi', '3', 'Public/Uploads/20190410/5cade6d87c2e1.jpg', 'm', '', '1554900696');
INSERT INTO `bbs_user` VALUES ('62', '小酷', '$2y$10$aeB8y5DPefdxQpyUWDUUjujhlNpnTRpatIfkI3AYfsW4UvS6ea4qe', '3', 'Public/Uploads/20190410/5cadf26094186.jpg', 'm', '', '1554900709');
INSERT INTO `bbs_user` VALUES ('63', '桔梗', '$2y$10$.5897zGMRJR57mNjymfzjuUKnDq1WsI//Ab7pcfxCcuWSARsubECe', '1', 'Public/Uploads/20190411/5caea26d9945b.jpg', 'w', '', '1554948717');
INSERT INTO `bbs_user` VALUES ('64', 'aaa', '$2y$10$MUnPjahguHPlKZwHP1r5aevOv17hJFk3PAMVGo0ODxPdgWL4xm1TC', '1', 'Public/Uploads/20190411/5caea3823f5f6.jpg', 'w', '', '1554948994');
INSERT INTO `bbs_user` VALUES ('66', 'ccc', '123', '1', 'Public/Uploads/20190411/5caeed29d451b.jpg', 'w', '', '1554967849');
INSERT INTO `bbs_user` VALUES ('67', 'admin', '2', '1', 'Public/Uploads/20190416/5cb5712f2953d.jpeg', 'm', '1233413', '1554992252');
INSERT INTO `bbs_user` VALUES ('68', 'xx', '$2y$10$JcbQtLBgJiKBQHF4CY8YiO8z1TaervNcYIFEKd2xIVkeCoQwdEW/K', '3', null, 'w', '1', '1555056802');
INSERT INTO `bbs_user` VALUES ('69', 'yy', '$2y$10$0lXc6jfceEjthqw21osNue2kCtNNdT9BhbCj9WqO1DP3av.lgxHSe', '3', null, 'w', '1', '1555056986');
INSERT INTO `bbs_user` VALUES ('70', '1', '$2y$10$weGpVVkNMVydL2sTP7OqY.zrDmad7E/rhGsAC4F5OeV8XOwSmkDdq', '3', null, 'w', '1', '1555070312');
INSERT INTO `bbs_user` VALUES ('72', '', '$2y$10$p0J5.zxWQMYldgK5/o743O.mRHis8HZ/Im5gfAYY.wGTHCZ6EJ5P.', '3', null, 'w', '', '1555375142');
INSERT INTO `bbs_user` VALUES ('73', '', '$2y$10$of4dM3kjHv7DFWCXVASyEui4qFgrtu1vKpLpBjFO0VIYy.uOPcCw.', '3', 'Public/Uploads/20190416/5cb5427d5a1d3.jpg', 'w', '', '1555375171');
INSERT INTO `bbs_user` VALUES ('76', 'aaaaa', '', '3', 'Public/Uploads/20190416/5cb5496618cbd.jpg', 'm', '', '1555384677');
INSERT INTO `bbs_user` VALUES ('77', '', '', '3', null, 'w', '', '1555388029');
INSERT INTO `bbs_user` VALUES ('79', '小', '$2y$10$pu6nfgNV1iMBnAXcjGhubezSZpp68MW0cQ6JGjj/nAPfuYw4CrbEG', '1', 'Public/Uploads/20190416/5cb5955d115af.jpg', 'm', '', '1555404124');
INSERT INTO `bbs_user` VALUES ('80', '小', '$2y$10$bXx7qPBkUxe0MHWQ6nk2k.VCb4t3DEY7t33AB5vZ4DoBoD3unFk.2', '3', 'Public/Uploads/20190416/5cb59566c210d.jpg', 'w', '', '1555404134');
INSERT INTO `bbs_user` VALUES ('81', 'admin', '$2y$10$0S2VCxPelmbkNJAHxlSHc.3yZZkH0V.3zDTgAVvAQkIFDFAQ0wa7G', '1', 'Public/Uploads/20190416/5cb5d2090a82c.jpg', 'm', '', '1555419656');
INSERT INTO `bbs_user` VALUES ('82', 'admin', '$2y$10$XmFq6RajNt0KhK5Q9UATcOpmC1MNy.s.B/weBbaUvvJQG9Wk5OKb.', '3', null, 'w', '1', '1555432325');
INSERT INTO `bbs_user` VALUES ('83', 'root', '$2y$10$ItzzqWXZnnK7UR9oCoSp9eC2Okx.NVTLuiS.r4uRUtTSuY89xfPQ6', '3', null, 'w', '123', '1555432343');
INSERT INTO `bbs_user` VALUES ('85', 'sb', '$2y$10$JZOQyk1SkGqlPQq22rPNDuE4vIt.hVTAKXDw5Dq/Y03QFc980CaO6', '3', null, 'w', '22', '1555474916');
INSERT INTO `bbs_user` VALUES ('86', 'sd', '$2y$10$4Xw/h8UxdK6q05hMN8UfguutaXGqcJM2Np7sPcgpSLTCDtKkn1QJ2', '3', null, 'w', '111', '1555475075');
INSERT INTO `bbs_user` VALUES ('87', '1', '$2y$10$TXgrM9iSRUOmBRegJ8IJyOHIdMkOENlQBxiq1TGWIpBQAlBqw1o/G', '3', null, 'w', '1', '1555475500');
INSERT INTO `bbs_user` VALUES ('88', 'aasa', '$2y$10$VExsp9zQUoU5grQ4B2Cw7.USfiDmzpb0525JDYlu.zGV/cdpvW3lq', '3', null, 'w', '21', '1555475592');
INSERT INTO `bbs_user` VALUES ('89', '12', '$2y$10$Gk6iTTczTNX5lFWKcht9nO8C.J0gt3/uQI/G2VfI5MakRmY10fzyK', '3', null, 'w', '12', '1555475610');
INSERT INTO `bbs_user` VALUES ('90', '会员', '$2y$10$9Yqnm2wvu1p/70gmI72L7.MBbcXwrEA1LPxr.JYrdv6SdPTou4rji', '3', 'Public/Uploads/20190417/5cb6bde67289a.jpg', 'w', '123', '1555480018');
