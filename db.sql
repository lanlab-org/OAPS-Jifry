/*
Navicat MySQL Data Transfer

Source Server         : 121.4.94.30
Source Server Version : 50650
Source Host           : 121.4.94.30:3306
Source Database       : oo

Target Server Type    : MYSQL
Target Server Version : 50650
File Encoding         : 65001

Date: 2021-01-23 01:01:52
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('8', '8', '量子力学！', '量子力学和经典力学！', '物理学细小分支！', '455@51', '2020-11-15 16:38:57', 'kong.pdf', 'resources/1/Physics/量子力学！/kong.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('10', '15', 'Naive Bayes ', 'A practical guide with a great example on how to classify Sports and Non-sports', 'Naive Bayes is a family of probabilistic algorithms that take advantage of probability theory and Bayes’ Theorem to predict the tag of a text (like a piece of news or a customer review). They are probabilistic, which means that they calculate the probability of each tag for a given text, and then output the tag with the highest one. The way they get these probabilities is by using Bayes’ Theorem, which describes the probability of a feature, based on prior knowledge of conditions that might be related to that feature.', '1348141770@qq.com', '2020-12-02 09:59:52', 'A practical explanation of a Naive Bayes classifier.pdf', 'resources/4/Machine Learning/Naive Bayes /A practical explanation of a Naive Bayes classifier.pdf', 'No', '47.115.56', 'Mr.Lan');
INSERT INTO `article` VALUES ('11', '10', '保护环境', '人与自然', '环境科学', '455@51', '2020-12-02 22:34:50', 'kong.pdf', 'resources/1/Environmental Sciences/保护环境/kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('12', '14', '基因工程', '转基因技术', '基因学', '455@51', '2020-12-02 22:43:48', 'kong.pdf', 'resources/3/Genetics/基因工程/kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('13', '13', '细胞', '细胞的构造', '细胞生物学', '455@51', '2020-12-02 22:52:23', 'kong.pdf', 'resources/3/Cell Biology/细胞/kong.pdf', 'No', '47.115.56', '吴钟富');
INSERT INTO `article` VALUES ('14', '9', '毒气', '731部队', '化学', '455@51', '2020-12-03 01:12:06', 'kong.pdf', 'resources/1/Chemistry/毒气/kong.pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('15', '8', '经典力学', '牛顿定律', '经典力学', '455@51', '2020-12-03 01:25:43', 'kong.pdf', 'resources/1/Physics/经典力学/kong.pdf', 'Yes', '124.160.213.56', '吴钟富');
INSERT INTO `article` VALUES ('16', '15', 'Naive Bayes for Machine Learning', 'Naive Bayes is a simple but surprisingly powerful algorithm for predictive modeling.', 'Naive Bayes is a classification algorithm for binary (two-class) and multi-class classification problems. The technique is easiest to understand when described using binary or categorical input values.', 'lanhui@zjnu.edu.cn', '2020-12-07 16:07:11', 'nb.pdf', 'resources/4/Machine Learning/Naive Bayes for Machine Learning/nb.pdf', 'No', '124.160.213.41', '吴钟富, lanhui');
INSERT INTO `article` VALUES ('18', '14', '转基因技术', '转基因技术原理', '生物工程学', '455@51', '2020-12-14 09:35:08', 'kong.pdf', 'resources/3/Genetics/转基因技术/kong.pdf', 'No', '223.95.63.179', '吴钟富');
INSERT INTO `article` VALUES ('20', '9', '生化', '生物化学，顾名思义是研究生物体中的化学进程的一门学科，常常被简称为生化。', '它主要用于研究细胞内各组分，如蛋白质、糖类、脂类、核酸等生物大分子的结构和功能。而对于化学生物学来说，则着重于利用化学合成中的方法来解答生物化学所发现的相关问题', '455@51', '2020-12-15 18:46:38', 'kong.pdf', 'resources/1/Chemistry/生化/kong.pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('23', '10', 'biological environments.', 'It encompasses environmental chemistry, soil science, ecology, climatology, ', 'biological environments.', '455@51', '2020-12-23 14:47:22', 'kong.pdf', 'resources/1/Environmental Sciences/biological environments./kong.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('24', '13', '细胞器', '细胞器是细胞质中具有特定形态结构和功能的微器官', '细胞器（organelle）一般认为是散布在细胞质内具有一定形态和功能的微结构或微器官。但对于“细胞器”这一名词的范围，还存在着某些不同意见', '455@51', '2020-12-23 14:52:56', 'nb.pdf', 'resources/3/Cell Biology/细胞器/nb.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('25', '13', '细胞核', '细胞核(nucleus)是真核细胞内最大、最重要的细胞结构', '它主要由核膜（nuclear membrane）、染色质（chromatin）、核仁(nucleolus)、核基质（nuclear matrix） 等组成。', '455@51', '2020-12-23 14:54:49', 'A practical explanation of a Naive Bayes classifier.pdf', 'resources/3/Cell Biology/细胞核/A practical explanation of a Naive Bayes classifier.pdf', 'No', '223.95.63.177', '吴钟富');
INSERT INTO `article` VALUES ('26', '8', '牛顿运动定律', '理想实验法', '经典力学', '455@51', '2020-12-23 15:34:04', 'nb.pdf', 'resources/1/Physics/牛顿运动定律/nb.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('27', '8', '杠杆原理', '以柔克刚！', '一根杠杆能撬动地球！', '455@51', '2020-12-24 18:03:13', 'nb.pdf', 'resources/1/Physics/杠杆原理/nb.pdf', 'No', '47.115.56.157', '吴钟富');
INSERT INTO `article` VALUES ('64', '15', 'DSADASD', 'DAFSDF', 'FDSF', '455@51', '2021-01-22 00:49:21', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/4/Machine Learning/DSADASD/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('65', '11', 'vdcgsdfg', 'fdsfdsf', '发多少方式的', '455@51', '2021-01-22 00:57:03', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/2/Anthropology/vdcgsdfg/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('66', '8', '佛挡杀佛第三方', '防守打法', '发多少', '455@51', '2021-01-22 01:47:31', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/1/Physics/佛挡杀佛第三方/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('67', '11', 'ADD', 'DS', 'DS', '455@51', '2021-01-22 01:55:22', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/2/Anthropology/ADD/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('68', '11', 'DSADFDSF', 'FSDFFGFG', 'GFDGDFG', '455@51', '2021-01-22 01:56:18', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/2/Anthropology/DSADFDSF/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '0:0:0:0:0:0:0:1', '吴钟富');
INSERT INTO `article` VALUES ('69', '8', '大萨达', '答', '大萨达', '455@51', '2021-01-22 02:18:08', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/1/Physics/大萨达/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '111.29.153.5', '吴钟富');
INSERT INTO `article` VALUES ('70', '11', 'DSADADD', 'DSAD', 'dsadasd', '455@51', '2021-01-22 02:19:07', '2020年下半年英语六级笔试准考证(吴钟富).pdf', 'resources/2/Anthropology/DSADADD/2020年下半年英语六级笔试准考证(吴钟富).pdf', 'No', '111.29.153.5', '吴钟富');

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
  `ip` varchar(30) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `comments` VALUES ('94', '量子力学！', '6!', '2021-01-21 15:24:53', null, null, null, '8');
INSERT INTO `comments` VALUES ('95', 'Naive Bayes ', '6啊', '2021-01-22 02:02:23', null, null, null, '10');
INSERT INTO `comments` VALUES ('96', 'Naive Bayes for Machine Learning', '挺好', '2021-01-22 02:03:06', null, null, null, '16');
INSERT INTO `comments` VALUES ('97', '保护环境', '好！', '2021-01-22 02:16:32', null, null, null, '11');
INSERT INTO `comments` VALUES ('98', 'Naive Bayes for Machine Learning', 'hao ', '2021-01-23 00:45:15', null, null, null, '16');
