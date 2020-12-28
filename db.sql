/*
Navicat MySQL Data Transfer

Source Server         : ZXY
Source Server Version : 50649
Source Host           : 47.115.56.157:3306
Source Database       : oo

Target Server Type    : MYSQL
Target Server Version : 50649
File Encoding         : 65001

Date: 2020-12-27 00:18:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('455@51', '45551');
INSERT INTO `administrator` VALUES ('lanhui@zjnu.edu.cn', 'l0ve1t');
INSERT INTO `administrator` VALUES ('lanhui@zjnu.edu.cn', 'admin');
INSERT INTO `administrator` VALUES ('lanhui@zjnu.edu.cn', 'lanhui');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `title` varchar(999) CHARACTER SET utf8 DEFAULT NULL,
  `highlight` varchar(999) CHARACTER SET utf8 DEFAULT NULL,
  `abstracts` varchar(999) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `filename` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `hide` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `authorName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('8', '8', '量子力学！', '量子力学和经典力学！', '物理学细小分支！', '455@51', '2020-11-15 16:38:57', 'kong.pdf', 'resources/kong.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('10', '15', 'Naive Bayes ', 'A practical guide with a great example on how to classify Sports and Non-sports', 'Naive Bayes is a family of probabilistic algorithms that take advantage of probability theory and Bayes’ Theorem to predict the tag of a text (like a piece of news or a customer review). They are probabilistic, which means that they calculate the probability of each tag for a given text, and then output the tag with the highest one. The way they get these probabilities is by using Bayes’ Theorem, which describes the probability of a feature, based on prior knowledge of conditions that might be related to that feature.', '1348141770@qq.com', '2020-12-02 09:59:52', 'A practical explanation of a Naive Bayes classifier.pdf', 'resources/A practical explanation of a Naive Bayes classifier.pdf', 'No', '47.115.56', 'Mr.Lan');
INSERT INTO `article` VALUES ('11', '10', '保护环境', '人与自然', '环境科学', '455@51', '2020-12-02 22:34:50', 'kong.pdf', 'resources\\kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('12', '14', '基因工程', '转基因技术', '基因学', '455@51', '2020-12-02 22:43:48', 'kong.pdf', 'resources\\kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('13', '13', '细胞', '细胞的构造', '细胞生物学', '455@51', '2020-12-02 22:52:23', 'kong.pdf', 'resources\\kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('14', '9', '毒气', '731部队', '化学', '455@51', '2020-12-03 01:12:06', 'kong.pdf', 'resources\\kong.pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('15', '8', '经典力学', '牛顿定律', '经典力学', '455@51', '2020-12-03 01:25:43', 'kong.pdf', 'resources/kong.pdf', 'Yes', '124.160.213.56', '吴钟富');
INSERT INTO `article` VALUES ('16', '15', 'Naive Bayes for Machine Learning', 'Naive Bayes is a simple but surprisingly powerful algorithm for predictive modeling.', 'Naive Bayes is a classification algorithm for binary (two-class) and multi-class classification problems. The technique is easiest to understand when described using binary or categorical input values.', 'lanhui@zjnu.edu.cn', '2020-12-07 16:07:11', 'nb.pdf', 'resources/nb.pdf', 'No', '124.160.213.41', '吴钟富, lanhui');
INSERT INTO `article` VALUES ('18', '14', '转基因技术', '转基因技术原理', '生物工程学', '455@51', '2020-12-14 09:35:08', 'kong.pdf', 'resources/kong.pdf', 'No', '223.95.63.179', '吴钟富');
INSERT INTO `article` VALUES ('20', '9', '生化', '生物化学，顾名思义是研究生物体中的化学进程的一门学科，常常被简称为生化。', '它主要用于研究细胞内各组分，如蛋白质、糖类、脂类、核酸等生物大分子的结构和功能。而对于化学生物学来说，则着重于利用化学合成中的方法来解答生物化学所发现的相关问题', '455@51', '2020-12-15 18:46:38', 'kong.pdf', 'resources\\kong.pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('23', '10', 'biological environments.', 'It encompasses environmental chemistry, soil science, ecology, climatology, ', 'biological environments.', '455@51', '2020-12-23 14:47:22', 'kong.pdf', 'resources/kong.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('24', '13', '细胞器', '细胞器是细胞质中具有特定形态结构和功能的微器官', '细胞器（organelle）一般认为是散布在细胞质内具有一定形态和功能的微结构或微器官。但对于“细胞器”这一名词的范围，还存在着某些不同意见', '455@51', '2020-12-23 14:52:56', 'nb.pdf', 'resources/nb.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('25', '13', '细胞核', '细胞核(nucleus)是真核细胞内最大、最重要的细胞结构', '它主要由核膜（nuclear membrane）、染色质（chromatin）、核仁(nucleolus)、核基质（nuclear matrix） 等组成。', '455@51', '2020-12-23 14:54:49', 'A practical explanation of a Naive Bayes classifier.pdf', 'resources/A practical explanation of a Naive Bayes classifier.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('26', '8', '牛顿运动定律', '理想实验法', '经典力学', '455@51', '2020-12-23 15:34:04', 'nb.pdf', 'resources/nb.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('27', '8', '杠杆原理', '以柔克刚！', '一根杠杆能撬动地球！', '455@51', '2020-12-24 18:03:13', 'nb.pdf', 'resources/nb.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('32', '8', 'AAA', 'dsad', '发多少', '455@51', '2020-12-24 20:30:33', 'kong.pdf', 'resources/kong.pdf', 'No', '223.95.63.120', '吴钟富');

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of author
-- ----------------------------

-- ----------------------------
-- Table structure for block_author
-- ----------------------------
DROP TABLE IF EXISTS `block_author`;
CREATE TABLE `block_author` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL,
  `blockuntil` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of block_author
-- ----------------------------
INSERT INTO `block_author` VALUES ('1', '1614518467@qq.com', '192.168.70.128', '2020-11-15 14:36:03');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `comment` varchar(10000) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(200) DEFAULT NULL,
  `hide` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('42', 'Naive Bayes', 'This is a nice essay. -Hui', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('43', 'Naive Bayes', 'This article helps me understand ...', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('44', '量子力学！', 'This is a nice essay for understanding naive bayes. Better than any textbook', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('45', '量子力学！', '666666666666666', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('46', 'Naive Bayes ', 'This is a nice essay for understanding naive bayes. Better than any textbook.', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('48', '保护环境', 'environment protection.', '2020-12-15 18:02:50', '', null, null, '11');
INSERT INTO `comments` VALUES ('49', 'Naive Bayes ', 'test comment', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('51', '经典力学', '666', '2020-12-15 18:02:50', '', null, null, '15');
INSERT INTO `comments` VALUES ('52', '量子力学！', ' 量子力学（Quantum Mechanics），为物理学理论，是研究物质世界微观粒子运动规律的物理学分支，主要研究原子、分子、凝聚态物质，以及原子核和基本粒子的结构、性质的基础理论。它与相对论一起构成现代物理学的理论基础。量子力学不仅是现代物理学的基础理论之一，而且在化学等学科和许多近代技术中得到广泛应用。 19世纪末，人们发现旧有的经典理论无法解释微观系统，于是经由物理学家的努力，在20世纪初创立量子力学，解释了这些现象。量子力学从根本上改变人类对物质结构及其相互作用的理解。除了广义相对论描写的引力以外，迄今所有基本相互作用均可以在量子力学的框架内描述（量子场论）。', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('53', '量子力学！', 'This is a nice essay for understanding naive bayes. Better than any textbook', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('54', '量子力学！', 'This is a nice essay for understanding naive bayes. Better than any textbook', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('55', '量子力学！', '6!', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('56', '经典力学', '力学在量子力学出现前的总称，研究宏观物体的运动规律，包括以牛顿运动定律为基础的经典理论和狭义相对论。I．牛顿在1687年出版的《自然哲学的数学原理》一书中提出的运动三定律和万有引力定律为经典力学奠定了基础。L．欧拉，J．-L．拉格朗日、W．R．哈密顿等继牛顿之后，发展了不同的体系，推广了力学在自然科学和工程技术中的应用。 学者们根据经典力学的定律和万有引力定律曾经精确地预言彗星和小行星等的运动，并且得到了验证；还根据这些定律预言并发现了新的行星。经典力学应用的成功以及麦克斯韦的电磁学理论预测电磁波的成功曾使19世纪末一些物理学家以为物理学在原则上已是完善的。 以牛顿定律为基础的力学理论是有它的局限性的。当物体的运动速度可与光速比拟时，对运动的分析要求放弃绝对空间和时间的概念，A．爱因斯坦于1905年建立的狭义相对论对此作了彻底的改革。在狭义相对论中，给出了长度收缩效应和时间膨胀效应，从而得出质点的质量是速度的函数，当质点速度接近光速时，质量趋于无限大。在物体的速度比光速小得多的条件下，牛顿定律成为相对论的特殊情况。在相对论动力学中也可应用拉格朗日和哈密顿的方法，但此时的拉格朗日函数和啥密顿函数不同于非相对论力学中的相应函数。 20世纪20年代，L．-V．德布罗意、E．薛定谔、W．K．海森伯、P．A．M．狄喇克等物理学家建立了研究电子、质子等微观粒子行为的量子力学。量子力学的一个基本观点是微观粒子的行为不能以空间和时间的确定函数表达，故量子力学是非经典的。 由于牛顿力学和相对论力学在描述物体行为的观点上是一致的，现代的经典力学著作都把狭义相对论的知识作为经典力学的组成部分。这些著作常包括牛顿力学和其重要发展体系——拉格朗日体系、哈密顿体系，以及狭义相对论等部分。因此，经典力学可分为非相对论经典力学和相对论经典力学。 经典力学是力学的一个分支。经典力学是以牛顿运动定律为基础，在宏观世界和低速状态下，研究物体运动的基要学术。在物理学里，经典力学是最早被接受为力学的一个基本纲领。经典力学又分为静力学（描述静止物体）、运动学（描述物体运动）和动力学（描述物体受力作用下的运动）。在十六世纪，伽利略·伽利莱就已采用科学实验和数学分析的方法研究力学。他为后来的科学家提供了许多豁然开朗的启示。艾萨克·牛顿则是最早使用数学语言描述力学定律的科学家。', '2020-12-15 18:02:50', '', null, null, '15');
INSERT INTO `comments` VALUES ('57', '经典力学', '不错！', '2020-12-15 18:02:50', '', null, null, '15');
INSERT INTO `comments` VALUES ('58', 'Naive Bayes ', 'This is a very good tutorial on NB. -Hui', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('59', 'Naive Bayes ', 'One more comment.', '2020-12-15 18:02:50', '', null, null, '10');
INSERT INTO `comments` VALUES ('60', '量子力学！', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('80', '量子力学！', '- -', '2020-12-15 18:02:50', '', null, null, '8');
INSERT INTO `comments` VALUES ('82', 'Naive Bayes for Machine Learning', '666666666666666', '2020-12-15 18:02:50', '', null, null, '16');
INSERT INTO `comments` VALUES ('83', '保护环境', '1', '2020-12-15 18:02:50', '', null, null, '11');
INSERT INTO `comments` VALUES ('84', 'Naive Bayes for Machine Learning', '不错！', '2020-12-15 18:02:50', '', null, null, '16');
INSERT INTO `comments` VALUES ('85', '基因工程', 'Great!', '2020-12-15 18:02:50', '', null, null, '12');
INSERT INTO `comments` VALUES ('86', 'Naive Bayes for Machine Learning', 'test comment.', '2020-12-15 18:02:50', '', null, null, '16');
INSERT INTO `comments` VALUES ('87', 'Naive Bayes for Machine Learning', 'This is a nice essay. -Hui', '2020-12-15 18:02:50', '', null, null, '16');
INSERT INTO `comments` VALUES ('88', 'Naive Bayes for Machine Learning', 'Greeting from Advanced Software Engineering class. -Hui', '2020-12-15 18:02:50', '', null, null, '16');
INSERT INTO `comments` VALUES ('89', '量子力学！', '66666666', '2020-12-21 12:22:10', '', null, null, null);
INSERT INTO `comments` VALUES ('90', '量子力学！', '666666', '2020-12-23 15:41:16', '', null, null, null);
INSERT INTO `comments` VALUES ('91', '杠杆原理', '666666666666666', '2020-12-24 18:03:29', '', null, null, null);
INSERT INTO `comments` VALUES ('92', '牛顿运动定律', 'HHH', '2020-12-24 20:44:33', '', null, null, null);
INSERT INTO `comments` VALUES ('93', '牛顿运动定律', '苹果为什么不往上面掉？', '2020-12-26 14:24:13', '', null, null, null);

-- ----------------------------
-- Table structure for love_article
-- ----------------------------
DROP TABLE IF EXISTS `love_article`;
CREATE TABLE `love_article` (
  `ip` varchar(20) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `prefer` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of love_article
-- ----------------------------
INSERT INTO `love_article` VALUES ('101.66.173.188', '量子力学！', '1', '8');
INSERT INTO `love_article` VALUES ('113.214.196.48', 'Naive Bayes', '1', '10');
INSERT INTO `love_article` VALUES ('113.214.196.48', '量子力学！', '1', '8');
INSERT INTO `love_article` VALUES ('123.157.19.26', 'Naive Bayes', '1', '10');
INSERT INTO `love_article` VALUES ('223.95.63.179', '量子力学！', '0', '8');
INSERT INTO `love_article` VALUES ('223.95.63.179', '保护环境', '1', '11');
INSERT INTO `love_article` VALUES ('223.95.63.179', 'Naive Bayes for Machine Learning', '0', '16');
INSERT INTO `love_article` VALUES ('123.157.19.30', '量子力学！', '1', '8');
INSERT INTO `love_article` VALUES ('123.157.19.30', '基因工程', '1', '12');
INSERT INTO `love_article` VALUES ('112.17.240.173', '基因工程', '1', '12');
INSERT INTO `love_article` VALUES ('0:0:0:0:0:0:0:1', '毒气', '1', '14');
INSERT INTO `love_article` VALUES ('223.95.63.198', '量子力学！', '0', '8');
INSERT INTO `love_article` VALUES ('0:0:0:0:0:0:0:1', 'Naive Bayes', '1', '10');
INSERT INTO `love_article` VALUES ('113.214.196.105', 'Naive Bayes for Machine Learning', '1', '16');
INSERT INTO `love_article` VALUES ('112.17.241.152', '量子力学！', '1', null);
INSERT INTO `love_article` VALUES ('112.17.241.152', 'Naive Bayes', '0', null);
INSERT INTO `love_article` VALUES ('223.95.63.120', '杠杆原理', '1', null);
INSERT INTO `love_article` VALUES ('223.95.63.120', '牛顿运动定律', '1', null);
INSERT INTO `love_article` VALUES ('113.214.196.25', 'Naive Bayes for Machine Learning', '1', null);

-- ----------------------------
-- Table structure for love_comment
-- ----------------------------
DROP TABLE IF EXISTS `love_comment`;
CREATE TABLE `love_comment` (
  `ip` varchar(20) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `prefer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of love_comment
-- ----------------------------
INSERT INTO `love_comment` VALUES ('223.95.63.233', '40', '1');
INSERT INTO `love_comment` VALUES ('223.95.63.233', '41', '0');
INSERT INTO `love_comment` VALUES ('113.214.196.48', '42', '1');
INSERT INTO `love_comment` VALUES ('123.157.19.26', '43', '0');
INSERT INTO `love_comment` VALUES ('0:0:0:0:0:0:0:1', '56', '1');
INSERT INTO `love_comment` VALUES ('60.12.158.35', '45', '1');
INSERT INTO `love_comment` VALUES ('60.12.158.35', '44', '1');
INSERT INTO `love_comment` VALUES ('123.157.19.20', '72', '1');
INSERT INTO `love_comment` VALUES ('223.95.63.179', '84', '0');
INSERT INTO `love_comment` VALUES ('223.95.63.179', '82', '1');
INSERT INTO `love_comment` VALUES ('123.157.19.30', '62', '1');
INSERT INTO `love_comment` VALUES ('123.157.19.30', '63', '0');
INSERT INTO `love_comment` VALUES ('119.4.175.54', '52', '1');
INSERT INTO `love_comment` VALUES ('223.95.63.198', '89', '1');
INSERT INTO `love_comment` VALUES ('223.95.63.198', '80', '1');
INSERT INTO `love_comment` VALUES ('223.95.63.120', '91', '0');
INSERT INTO `love_comment` VALUES ('223.95.63.120', '92', '0');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parentsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', 'Physical Sciences', '2020-11-15 14:36:31', '0');
INSERT INTO `subject` VALUES ('2', 'Social Sciences', '2020-11-15 14:36:45', '0');
INSERT INTO `subject` VALUES ('3', 'Biological Sciences', '2020-11-15 14:36:58', '0');
INSERT INTO `subject` VALUES ('4', 'Computer Sciences', '2020-11-15 14:37:12', '0');
INSERT INTO `subject` VALUES ('5', 'Statistics', '2020-11-15 14:37:24', '0');
INSERT INTO `subject` VALUES ('6', 'Mathematics', '2020-11-15 14:37:36', '0');
INSERT INTO `subject` VALUES ('7', 'Medical Sciences', '2020-11-15 14:37:48', '0');
INSERT INTO `subject` VALUES ('8', 'Physics', '2020-11-15 14:38:01', '1');
INSERT INTO `subject` VALUES ('9', ' Chemistry', '2020-11-15 14:38:14', '1');
INSERT INTO `subject` VALUES ('10', ' Environmental Sciences', '2020-11-15 14:38:34', '1');
INSERT INTO `subject` VALUES ('11', ' Anthropology', '2020-11-15 14:38:46', '2');
INSERT INTO `subject` VALUES ('12', 'Sustainability Science ', '2020-11-15 14:39:00', '2');
INSERT INTO `subject` VALUES ('13', 'Cell Biology', '2020-11-15 14:39:20', '3');
INSERT INTO `subject` VALUES ('14', ' Genetics', '2020-11-15 14:39:35', '3');
INSERT INTO `subject` VALUES ('15', 'Machine Learning', '2020-11-15 14:39:55', '4');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `vdate` datetime DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES ('10', '10', '124.160.213.56', '2020-12-03 01:22:00');
INSERT INTO `visit` VALUES ('11', '8', '124.160.213.56', '2020-12-03 01:23:43');
INSERT INTO `visit` VALUES ('12', '8', '115.212.61.105', '2020-12-03 11:09:28');
INSERT INTO `visit` VALUES ('13', '10', '115.212.61.105', '2020-12-03 11:10:34');
INSERT INTO `visit` VALUES ('15', '11', '124.160.213.41', '2020-12-07 15:57:14');
INSERT INTO `visit` VALUES ('16', '10', '124.160.213.41', '2020-12-07 15:58:14');
INSERT INTO `visit` VALUES ('18', '8', '124.160.213.41', '2020-12-07 16:04:34');
INSERT INTO `visit` VALUES ('19', '16', '124.160.213.41', '2020-12-07 16:07:19');
INSERT INTO `visit` VALUES ('21', '16', '223.104.246.116', '2020-12-07 17:01:15');
INSERT INTO `visit` VALUES ('22', '16', '60.12.158.57', '2020-12-07 17:14:46');
INSERT INTO `visit` VALUES ('23', '15', '60.12.158.57', '2020-12-07 17:18:37');
INSERT INTO `visit` VALUES ('24', '11', '60.12.158.57', '2020-12-07 17:19:05');
INSERT INTO `visit` VALUES ('27', '8', '113.214.196.97', '2020-12-07 22:38:44');
INSERT INTO `visit` VALUES ('28', '16', '113.214.196.97', '2020-12-08 08:43:50');
INSERT INTO `visit` VALUES ('29', '10', '123.157.19.38', '2020-12-08 11:35:53');
INSERT INTO `visit` VALUES ('30', '16', '123.157.19.38', '2020-12-08 11:37:44');
INSERT INTO `visit` VALUES ('31', '8', '60.12.158.35', '2020-12-08 13:59:34');
INSERT INTO `visit` VALUES ('32', '16', '60.12.158.35', '2020-12-08 14:00:18');
INSERT INTO `visit` VALUES ('33', '16', '123.157.19.30', '2020-12-08 14:56:07');
INSERT INTO `visit` VALUES ('34', '10', '123.157.19.30', '2020-12-08 14:56:23');
INSERT INTO `visit` VALUES ('35', '10', '113.214.196.97', '2020-12-08 21:49:52');
INSERT INTO `visit` VALUES ('36', '16', '123.157.19.26', '2020-12-09 10:56:44');
INSERT INTO `visit` VALUES ('37', '10', '123.157.19.20', '2020-12-10 14:03:51');
INSERT INTO `visit` VALUES ('38', '17', '123.157.19.20', '2020-12-10 14:04:15');
INSERT INTO `visit` VALUES ('39', '8', '123.157.19.20', '2020-12-10 14:40:13');
INSERT INTO `visit` VALUES ('40', '14', '8.210.250.75', '2020-12-12 10:21:35');
INSERT INTO `visit` VALUES ('41', '17', '8.210.250.75', '2020-12-12 10:21:51');
INSERT INTO `visit` VALUES ('42', '11', '8.210.250.75', '2020-12-12 10:22:53');
INSERT INTO `visit` VALUES ('43', '17', '124.160.213.155', '2020-12-13 12:33:17');
INSERT INTO `visit` VALUES ('44', '16', '124.160.213.155', '2020-12-13 12:35:20');
INSERT INTO `visit` VALUES ('45', '11', '223.95.63.29', '2020-12-13 16:53:05');
INSERT INTO `visit` VALUES ('46', '16', '223.95.63.29', '2020-12-13 16:55:45');
INSERT INTO `visit` VALUES ('47', '14', '223.95.63.29', '2020-12-13 17:00:28');
INSERT INTO `visit` VALUES ('48', '8', '223.95.63.29', '2020-12-13 17:34:21');
INSERT INTO `visit` VALUES ('49', '8', '124.160.213.155', '2020-12-13 17:44:56');
INSERT INTO `visit` VALUES ('50', '8', '223.95.63.179', '2020-12-14 09:32:26');
INSERT INTO `visit` VALUES ('51', '18', '223.95.63.179', '2020-12-14 09:35:12');
INSERT INTO `visit` VALUES ('52', '11', '223.95.63.179', '2020-12-14 09:35:30');
INSERT INTO `visit` VALUES ('53', '16', '223.95.63.179', '2020-12-14 09:37:37');
INSERT INTO `visit` VALUES ('54', '14', '223.95.63.179', '2020-12-14 09:39:53');
INSERT INTO `visit` VALUES ('55', '10', '223.95.63.179', '2020-12-14 09:40:24');
INSERT INTO `visit` VALUES ('58', '17', '123.157.19.30', '2020-12-14 14:58:54');
INSERT INTO `visit` VALUES ('59', '8', '123.157.19.30', '2020-12-14 15:01:10');
INSERT INTO `visit` VALUES ('60', '8', '112.17.240.173', '2020-12-14 15:03:46');
INSERT INTO `visit` VALUES ('62', '17', '112.17.240.173', '2020-12-14 15:05:53');
INSERT INTO `visit` VALUES ('63', '8', '123.157.19.34', '2020-12-14 16:53:06');
INSERT INTO `visit` VALUES ('64', '12', '112.17.240.173', '2020-12-14 17:00:32');
INSERT INTO `visit` VALUES ('65', '14', '112.17.240.173', '2020-12-14 17:02:32');
INSERT INTO `visit` VALUES ('66', '12', '123.157.19.34', '2020-12-14 17:05:29');
INSERT INTO `visit` VALUES ('67', '18', '123.157.19.34', '2020-12-14 17:05:46');
INSERT INTO `visit` VALUES ('68', '13', '123.157.19.34', '2020-12-14 17:05:59');
INSERT INTO `visit` VALUES ('69', '10', '123.157.19.34', '2020-12-14 17:07:20');
INSERT INTO `visit` VALUES ('70', '12', '123.157.19.30', '2020-12-14 17:08:39');
INSERT INTO `visit` VALUES ('71', '12', '223.104.246.56', '2020-12-14 17:10:58');
INSERT INTO `visit` VALUES ('72', '12', '123.157.19.21', '2020-12-14 17:12:51');
INSERT INTO `visit` VALUES ('74', '12', '124.160.216.248', '2020-12-14 17:55:47');
INSERT INTO `visit` VALUES ('83', '8', '119.4.175.54', '2020-12-16 17:48:40');
INSERT INTO `visit` VALUES ('84', '8', '61.151.178.177', '2020-12-16 18:00:48');
INSERT INTO `visit` VALUES ('85', '16', '113.214.196.18', '2020-12-18 10:33:07');
INSERT INTO `visit` VALUES ('86', '8', '113.214.196.18', '2020-12-18 10:37:26');
INSERT INTO `visit` VALUES ('87', '18', '113.214.196.18', '2020-12-18 10:37:56');
INSERT INTO `visit` VALUES ('88', '20', '113.214.196.18', '2020-12-18 10:38:05');
INSERT INTO `visit` VALUES ('89', '-1', '113.214.196.18', '2020-12-18 10:38:32');
INSERT INTO `visit` VALUES ('90', '19', '113.214.196.18', '2020-12-18 10:38:45');
INSERT INTO `visit` VALUES ('91', '8', '223.95.63.198', '2020-12-21 10:28:18');
INSERT INTO `visit` VALUES ('92', '20', '223.95.63.198', '2020-12-21 12:01:55');
INSERT INTO `visit` VALUES ('93', '21', '223.95.63.198', '2020-12-21 12:12:15');
INSERT INTO `visit` VALUES ('94', '22', '223.95.63.198', '2020-12-21 12:24:32');
INSERT INTO `visit` VALUES ('95', '16', '223.95.63.198', '2020-12-21 12:25:38');
INSERT INTO `visit` VALUES ('96', '13', '223.95.63.198', '2020-12-21 12:25:52');
INSERT INTO `visit` VALUES ('97', '14', '223.95.63.198', '2020-12-21 12:25:58');
INSERT INTO `visit` VALUES ('98', '10', '223.95.63.198', '2020-12-21 12:28:29');
INSERT INTO `visit` VALUES ('99', '8', '36.19.100.6', '2020-12-21 16:04:37');
INSERT INTO `visit` VALUES ('100', '8', '123.157.19.38', '2020-12-21 16:17:25');
INSERT INTO `visit` VALUES ('101', '16', '223.104.247.0', '2020-12-21 16:55:56');
INSERT INTO `visit` VALUES ('102', '14', '113.214.196.105', '2020-12-21 20:20:56');
INSERT INTO `visit` VALUES ('103', '8', '101.66.173.179', '2020-12-22 12:24:09');
INSERT INTO `visit` VALUES ('104', '10', '124.160.214.3', '2020-12-22 15:23:36');
INSERT INTO `visit` VALUES ('105', '10', '113.214.196.105', '2020-12-22 17:37:36');
INSERT INTO `visit` VALUES ('106', '16', '113.214.196.105', '2020-12-22 17:37:57');
INSERT INTO `visit` VALUES ('107', '16', '113.214.196.37', '2020-12-23 09:32:55');
INSERT INTO `visit` VALUES ('108', '8', '123.157.19.26', '2020-12-23 10:47:52');
INSERT INTO `visit` VALUES ('109', '10', '123.157.19.26', '2020-12-23 10:47:58');
INSERT INTO `visit` VALUES ('110', '8', '223.95.63.177', '2020-12-23 14:42:30');
INSERT INTO `visit` VALUES ('111', '23', '223.95.63.177', '2020-12-23 14:47:44');
INSERT INTO `visit` VALUES ('112', '25', '223.95.63.177', '2020-12-23 14:54:53');
INSERT INTO `visit` VALUES ('114', '10', '223.95.63.177', '2020-12-23 14:55:16');
INSERT INTO `visit` VALUES ('115', '24', '223.95.63.177', '2020-12-23 15:00:05');
INSERT INTO `visit` VALUES ('116', '26', '47.115.56.157', '2020-12-23 15:34:11');
INSERT INTO `visit` VALUES ('117', '27', '47.115.56.157', '2020-12-23 15:37:30');
INSERT INTO `visit` VALUES ('118', '8', '47.115.56.157', '2020-12-23 15:40:33');
INSERT INTO `visit` VALUES ('119', '11', '47.115.56.157', '2020-12-23 15:41:00');
INSERT INTO `visit` VALUES ('120', '26', '124.160.220.165', '2020-12-23 15:41:21');
INSERT INTO `visit` VALUES ('121', '27', '124.160.220.165', '2020-12-23 15:41:25');
INSERT INTO `visit` VALUES ('122', '27', '223.95.63.177', '2020-12-23 15:41:46');
INSERT INTO `visit` VALUES ('123', '13', '47.115.56.157', '2020-12-23 15:41:50');
INSERT INTO `visit` VALUES ('124', '28', '223.95.63.177', '2020-12-23 15:47:36');
INSERT INTO `visit` VALUES ('125', '28', '47.115.56.157', '2020-12-23 15:48:40');
INSERT INTO `visit` VALUES ('126', '29', '47.115.56.157', '2020-12-23 15:50:44');
INSERT INTO `visit` VALUES ('127', '27', '61.129.8.179', '2020-12-23 15:50:54');
INSERT INTO `visit` VALUES ('128', '30', '47.115.56.157', '2020-12-23 15:57:03');
INSERT INTO `visit` VALUES ('129', '8', '0:0:0:0:0:0:0:1', '2020-12-23 22:34:15');
INSERT INTO `visit` VALUES ('130', '10', '0:0:0:0:0:0:0:1', '2020-12-23 22:35:38');
INSERT INTO `visit` VALUES ('131', '10', '112.17.241.152', '2020-12-23 22:50:37');
INSERT INTO `visit` VALUES ('132', '8', '112.17.241.152', '2020-12-23 22:52:39');
INSERT INTO `visit` VALUES ('133', '26', '112.17.241.152', '2020-12-23 22:53:12');
INSERT INTO `visit` VALUES ('134', '8', '223.104.244.93', '2020-12-23 22:59:15');
INSERT INTO `visit` VALUES ('135', '10', '101.91.60.104', '2020-12-23 22:59:36');
INSERT INTO `visit` VALUES ('136', '14', '112.17.245.54', '2020-12-23 23:01:51');
INSERT INTO `visit` VALUES ('137', '31', '223.95.63.120', '2020-12-24 18:02:39');
INSERT INTO `visit` VALUES ('138', '27', '223.95.63.120', '2020-12-24 18:03:18');
INSERT INTO `visit` VALUES ('139', '8', '223.95.63.120', '2020-12-24 19:57:53');
INSERT INTO `visit` VALUES ('140', '32', '223.95.63.120', '2020-12-24 20:30:36');
INSERT INTO `visit` VALUES ('141', '8', '124.160.215.208', '2020-12-24 20:34:14');
INSERT INTO `visit` VALUES ('142', '26', '223.95.63.120', '2020-12-24 20:44:23');
INSERT INTO `visit` VALUES ('143', '14', '60.12.158.47', '2020-12-25 08:14:43');
INSERT INTO `visit` VALUES ('144', '10', '113.214.196.25', '2020-12-26 10:59:00');
INSERT INTO `visit` VALUES ('145', '8', '113.214.196.25', '2020-12-26 10:59:05');
INSERT INTO `visit` VALUES ('146', '27', '113.214.196.25', '2020-12-26 10:59:18');
INSERT INTO `visit` VALUES ('147', '11', '113.214.196.25', '2020-12-26 11:00:17');
INSERT INTO `visit` VALUES ('148', '16', '113.214.196.25', '2020-12-26 11:00:35');
INSERT INTO `visit` VALUES ('149', '18', '113.214.196.25', '2020-12-26 11:00:49');
INSERT INTO `visit` VALUES ('150', '24', '113.214.196.25', '2020-12-26 11:00:55');
INSERT INTO `visit` VALUES ('151', '26', '113.214.196.25', '2020-12-26 11:01:45');
INSERT INTO `visit` VALUES ('152', '32', '113.214.196.25', '2020-12-26 11:10:33');
