/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-01-05 23:01:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add choice', '7', 'add_choice');
INSERT INTO `auth_permission` VALUES ('20', 'Can change choice', '7', 'change_choice');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete choice', '7', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('22', 'Can add question', '8', 'add_question');
INSERT INTO `auth_permission` VALUES ('23', 'Can change question', '8', 'change_question');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete question', '8', 'delete_question');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 用户', '9', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 用户', '9', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 用户', '9', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can add blog', '10', 'add_blog');
INSERT INTO `auth_permission` VALUES ('29', 'Can change blog', '10', 'change_blog');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete blog', '10', 'delete_blog');
INSERT INTO `auth_permission` VALUES ('31', 'Can add blog_classfies', '11', 'add_blog_classfies');
INSERT INTO `auth_permission` VALUES ('32', 'Can change blog_classfies', '11', 'change_blog_classfies');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete blog_classfies', '11', 'delete_blog_classfies');
INSERT INTO `auth_permission` VALUES ('34', 'Can add t news', '12', 'add_tnews');
INSERT INTO `auth_permission` VALUES ('35', 'Can change t news', '12', 'change_tnews');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete t news', '12', 'delete_tnews');
INSERT INTO `auth_permission` VALUES ('37', 'Can add punch', '13', 'add_punch');
INSERT INTO `auth_permission` VALUES ('38', 'Can change punch', '13', 'change_punch');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete punch', '13', 'delete_punch');
INSERT INTO `auth_permission` VALUES ('40', 'Can add excel_ model', '14', 'add_excel_model');
INSERT INTO `auth_permission` VALUES ('41', 'Can change excel_ model', '14', 'change_excel_model');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete excel_ model', '14', 'delete_excel_model');
INSERT INTO `auth_permission` VALUES ('43', 'Can add excel_ type', '15', 'add_excel_type');
INSERT INTO `auth_permission` VALUES ('44', 'Can change excel_ type', '15', 'change_excel_type');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete excel_ type', '15', 'delete_excel_type');
INSERT INTO `auth_permission` VALUES ('46', 'Can add department', '16', 'add_department');
INSERT INTO `auth_permission` VALUES ('47', 'Can change department', '16', 'change_department');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete department', '16', 'delete_department');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$39EEdyibR899$IlJuu1vVnpFPPr+DfC42RwMnvk13bI7QCH44hl+mMp0=', '2018-08-12 08:21:45.324016', '1', 'yes', '', '', 'emzhangpan@qq.com', '1', '1', '2018-05-01 12:54:58.707395');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_name` varchar(128) NOT NULL,
  `blog_content` varchar(10000) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `createtime` datetime(6) NOT NULL,
  `classfy` int(11) DEFAULT NULL,
  `blog_tag` varchar(256) DEFAULT NULL,
  `updatetime` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `remote_ip` varchar(256) NOT NULL,
  `access_num` int(11) NOT NULL,
  `editor_flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_name` (`blog_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES ('1', 'f', '### 三级标题', '', '2018-06-12 09:47:10.961343', '4', 'f', '2018-06-12 09:47:10.960354', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('5', 'ONTOWB测试markdown', '|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n', 'emzhangpan@163.com', '2018-06-18 08:14:22.815741', '4', 'markdown', '2018-06-18 08:14:22.815741', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('8', 'ontoweb博客系统', '[ds](www.baidu.com)', 'emzhangpan@163.com', '2018-06-18 08:19:04.608579', '4', 'markdown', '2018-06-18 08:19:04.608051', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('9', '111', '|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n', 'emzhangpan@163.com', '2018-06-20 14:04:35.364136', '1', 'dff', '2018-06-20 14:04:35.364136', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('10', 'java', '# `mysql ` 百万级数据查询优化笔记：\n\n* 方法一：建立索引\n\n1.1、索引类别:\n`unique` : 唯一索引\n\n```java \n@Data\npublic class Order {\n    public static void main(String[] args)\n    {\n        Type.FileTypeEnum[] fileTypeEnums = {Type.FileTypeEnum.PDF, Type.FileTypeEnum.DOC, Type.FileTypeEnum.DOCX};\n        for (int i = 0 ; i <fileTypeEnums.length;i++){\n\n        }\n    }\n}\n\n```', 'emzhangpan@163.com', '2018-06-27 13:38:31.374017', '4', 'java', '2018-06-27 13:38:31.373017', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('11', 'java单例模式', '```java\npublic class SingletonDemo {\n    private static SingletonDemo instance;\n    private SingletonDemo(){\n\n    }\n    public static SingletonDemo getInstance(){\n        if(instance==null){\n            instance=new SingletonDemo();\n        }\n        return instance;\n    }\n}\n```', 'emzhangpan@163.com', '2018-06-29 13:31:09.188745', '4', 'java，单例模式', '2018-06-29 13:31:09.188276', '1', '0.0.0.0', '0', '0');
INSERT INTO `blog_blog` VALUES ('12', 'Jna', 'a', 'emzhangpan@163.com', '2018-06-30 08:30:23.258243', '1', '获取ip', '2018-06-30 08:30:23.257243', '1', '127.0.0.1', '0', '0');

-- ----------------------------
-- Table structure for blog_blog_classfies
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog_classfies`;
CREATE TABLE `blog_blog_classfies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(128) NOT NULL,
  `class_content` varchar(256) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog_classfies
-- ----------------------------
INSERT INTO `blog_blog_classfies` VALUES ('1', 'C++/C', '计算机科学与技术', '2018-05-26 11:53:41.019620', '2018-05-29 12:41:45.331452');
INSERT INTO `blog_blog_classfies` VALUES ('2', 'Ddjango', 'python', '2018-05-26 11:53:59.016814', '2018-05-29 12:41:45.331452');
INSERT INTO `blog_blog_classfies` VALUES ('3', 'python', 'python', '2018-05-26 11:54:08.866020', '2018-05-29 12:41:45.331452');
INSERT INTO `blog_blog_classfies` VALUES ('4', '其它', '其它分类', '2018-06-18 08:06:16.333584', '2018-06-18 08:06:16.333584');

-- ----------------------------
-- Table structure for day_excel_model
-- ----------------------------
DROP TABLE IF EXISTS `day_excel_model`;
CREATE TABLE `day_excel_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_1` varchar(256) DEFAULT NULL,
  `column_2` varchar(256) DEFAULT NULL,
  `column_3` varchar(256) DEFAULT NULL,
  `column_4` varchar(256) DEFAULT NULL,
  `column_5` varchar(256) DEFAULT NULL,
  `column_6` varchar(256) DEFAULT NULL,
  `column_7` varchar(256) DEFAULT NULL,
  `column_8` varchar(256) DEFAULT NULL,
  `column_9` varchar(256) DEFAULT NULL,
  `column_10` varchar(256) DEFAULT NULL,
  `column_11` varchar(256) DEFAULT NULL,
  `column_12` varchar(256) DEFAULT NULL,
  `column_13` varchar(256) DEFAULT NULL,
  `column_14` varchar(256) DEFAULT NULL,
  `column_15` varchar(256) DEFAULT NULL,
  `column_16` varchar(256) DEFAULT NULL,
  `column_17` varchar(256) DEFAULT NULL,
  `column_18` varchar(256) DEFAULT NULL,
  `column_19` varchar(256) DEFAULT NULL,
  `column_20` varchar(256) DEFAULT NULL,
  `field_name` varchar(1024) DEFAULT NULL,
  `excel_id` varchar(256) DEFAULT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'CURRENT_TIMESTAMP',
  `delete` int(11) NOT NULL DEFAULT '0',
  `check_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of day_excel_model
-- ----------------------------
INSERT INTO `day_excel_model` VALUES ('1', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('2', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('3', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('4', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('5', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('6', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 21:41:41', '0', '0');
INSERT INTO `day_excel_model` VALUES ('7', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('8', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('9', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('10', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('11', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('12', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:23:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('13', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('14', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('15', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('16', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('17', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('18', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:26:29', '0', '0');
INSERT INTO `day_excel_model` VALUES ('19', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('20', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('21', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('22', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('23', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('24', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:27:55', '0', '0');
INSERT INTO `day_excel_model` VALUES ('25', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('26', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('27', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('28', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('29', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('30', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:28:33', '0', '0');
INSERT INTO `day_excel_model` VALUES ('31', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('32', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('33', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('34', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('35', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('36', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:30:46', '0', '0');
INSERT INTO `day_excel_model` VALUES ('37', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('38', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('39', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('40', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('41', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('42', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:35:47', '0', '0');
INSERT INTO `day_excel_model` VALUES ('43', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('44', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('45', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('46', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('47', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('48', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-10 23:40:13', '0', '0');
INSERT INTO `day_excel_model` VALUES ('49', 'ddddddddddddddd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:25:35', '0', '0');
INSERT INTO `day_excel_model` VALUES ('50', 'ddddddddddddddd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:26:10', '0', '0');
INSERT INTO `day_excel_model` VALUES ('51', 'ddddddddddddddd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:26:31', '0', '0');
INSERT INTO `day_excel_model` VALUES ('52', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('53', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('54', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('55', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('56', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('57', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:27:30', '0', '0');
INSERT INTO `day_excel_model` VALUES ('58', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('59', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('60', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('61', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('62', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('63', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:28:48', '0', '0');
INSERT INTO `day_excel_model` VALUES ('64', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('65', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('66', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('67', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('68', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('69', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 00:29:22', '0', '0');
INSERT INTO `day_excel_model` VALUES ('70', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('71', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('72', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('73', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('74', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('75', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 01:38:27', '0', '0');
INSERT INTO `day_excel_model` VALUES ('76', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('77', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('78', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('79', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('80', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('81', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-08-11 20:19:00', '0', '0');
INSERT INTO `day_excel_model` VALUES ('82', '1531706020595', '四川川投水务集团射洪股份有限公司', '872614', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');
INSERT INTO `day_excel_model` VALUES ('83', '1531706020631', '广州市龙能城市运营管理股份有限公司', '872657', '2018-01-18 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');
INSERT INTO `day_excel_model` VALUES ('84', '1531706020634', '西部金属材料股份有限公司', '872531', '2017-07-24 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');
INSERT INTO `day_excel_model` VALUES ('85', '1531706020637', '江西群鑫强磁新材料股份有限公司', '872630', '2018-01-05 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');
INSERT INTO `day_excel_model` VALUES ('86', '1531706020639', '广州市昊志机电股份有限公司', '879999', '2018-04-27 09:59:56', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');
INSERT INTO `day_excel_model` VALUES ('87', '1531706020641', '太原力业装饰工程股份有限公司', '872611', '2017-12-29 00:00:00', '新的测试任务', 'http://www.cninfo.com.cn/cninfo-new/disclosure/szse/bulletin_detail/true/1205159742?announceTime=2018-07-16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '33', '2018-08-11 21:39:24', '0', '0');

-- ----------------------------
-- Table structure for day_excel_type
-- ----------------------------
DROP TABLE IF EXISTS `day_excel_type`;
CREATE TABLE `day_excel_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) DEFAULT NULL,
  `createtime` datetime(6) DEFAULT NULL,
  `excel_name` varchar(256) DEFAULT NULL,
  `is_push_check` int(11) NOT NULL,
  `field_rule` varchar(256) DEFAULT NULL,
  `is_closed` int(11) NOT NULL DEFAULT '1',
  `last_time` datetime(6) NOT NULL,
  `delete` int(11) NOT NULL DEFAULT '0',
  `notice_content` varchar(1024) DEFAULT NULL,
  `field_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of day_excel_type
-- ----------------------------
INSERT INTO `day_excel_type` VALUES ('0', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('1', '1', '2018-08-10 18:21:54.000000', '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('2', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('3', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('4', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('5', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('6', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('7', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('8', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('9', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('10', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('11', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('12', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('13', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('14', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'sss', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('15', '1', null, '任务列表.xls', '2', null, '1', '2018-08-23 21:42:28.000000', '0', 'wlxc', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('17', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('18', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('19', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('20', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('21', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('22', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('23', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('24', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('25', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'aaa', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('26', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 18:19:11.000000', '0', 'aaa', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('27', '1', null, '任务列表.xls', '2', null, '1', '2018-08-14 23:23:44.000000', '0', 'zhangpan12', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('28', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 20:13:05.000000', '0', 'ddd', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('29', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 20:13:05.000000', '0', 'ddd', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('31', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 20:13:05.000000', '0', 'dddfff', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('32', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 20:13:05.000000', '0', 'dddfff', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');
INSERT INTO `day_excel_type` VALUES ('33', '1', null, '任务列表.xls', '2', null, '1', '2018-08-08 20:13:05.000000', '0', 'dddfff', '[\'任务代码\', \'主体名称\', \'证券代码\', \'公告日期\', \'配置任务名称\', \'公告地址\']');

-- ----------------------------
-- Table structure for day_punch
-- ----------------------------
DROP TABLE IF EXISTS `day_punch`;
CREATE TABLE `day_punch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) NOT NULL,
  `day_time` varchar(256) NOT NULL,
  `first_time` datetime(6) NOT NULL,
  `last_time` datetime(6) NOT NULL,
  `delete` int(11) NOT NULL DEFAULT '0',
  `times` int(11) DEFAULT NULL,
  `rates` decimal(3,2) DEFAULT NULL,
  `punch_host` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of day_punch
-- ----------------------------
INSERT INTO `day_punch` VALUES ('2', '1', '2018-07-12', '2018-07-12 12:12:43.000000', '2018-07-12 20:15:01.000000', '0', '28938', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('5', '2', '2018-07-12', '2018-07-12 14:55:51.000000', '2018-07-12 15:04:10.000000', '0', '499', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('6', '2', '2018-07-11', '2018-07-11 11:07:15.000000', '2018-07-11 15:07:35.000000', '0', '14400', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('7', '2', '2018-07-18', '2018-07-18 15:19:21.000000', '2018-07-18 17:17:04.000000', '0', '7063', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('8', '2', '2018-07-19', '2018-07-19 09:36:11.000000', '2018-07-19 09:36:11.000000', '0', '0', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('9', '1', '2018-07-19', '2018-07-19 12:50:38.000000', '2018-07-19 12:50:38.000000', '0', '0', null, '127.0.0.1');
INSERT INTO `day_punch` VALUES ('10', '1', '2018-08-09', '2018-08-09 11:05:19.000000', '2018-08-09 11:05:32.000000', '0', '13', null, '127.0.0.1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-02 04:31:12.158397', '2', 'furture question is created,check alter debug  test', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-05-02 07:20:11.277565', '3', 'wlx', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"who is uzi?\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"who is lwx?\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"who is jacklove?\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-05-11 08:14:50.521287', '1', 'zhangpan', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-05-26 11:53:41.020647', '1', 'C++/C', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-05-26 11:53:59.018311', '2', 'Ddjango', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-05-26 11:54:08.866519', '3', 'python', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-06-18 08:06:16.340086', '4', '其它', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-08-12 08:22:42.122502', '1', '软件工程（专硕）', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-08-12 08:23:22.100523', '2', '计算机科学与技术（学硕）', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-08-12 08:23:53.526354', '3', '计算机科学与技术（专硕）', '1', '[{\"added\": {}}]', '16', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'blog');
INSERT INTO `django_content_type` VALUES ('11', 'blog', 'blog_classfies');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('14', 'day', 'excel_model');
INSERT INTO `django_content_type` VALUES ('15', 'day', 'excel_type');
INSERT INTO `django_content_type` VALUES ('13', 'day', 'punch');
INSERT INTO `django_content_type` VALUES ('16', 'login', 'department');
INSERT INTO `django_content_type` VALUES ('9', 'login', 'user');
INSERT INTO `django_content_type` VALUES ('7', 'polls', 'choice');
INSERT INTO `django_content_type` VALUES ('8', 'polls', 'question');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('12', 'zpSpider', 'tnews');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-01 12:10:59.171601');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-01 12:11:00.231210');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-05-01 12:11:00.543356');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-05-01 12:11:00.566387');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-05-01 12:11:00.739551');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-05-01 12:11:00.835054');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-05-01 12:11:00.942613');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-05-01 12:11:00.962618');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-05-01 12:11:01.057877');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-05-01 12:11:01.066862');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-05-01 12:11:01.087892');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-05-01 12:11:01.324714');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2018-05-01 12:11:01.437189');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-05-01 12:11:01.573996');
INSERT INTO `django_migrations` VALUES ('15', 'polls', '0001_initial', '2018-05-01 12:37:03.560980');
INSERT INTO `django_migrations` VALUES ('16', 'login', '0001_initial', '2018-05-11 07:06:26.767532');
INSERT INTO `django_migrations` VALUES ('17', 'blog', '0001_initial', '2018-05-26 11:41:20.771854');
INSERT INTO `django_migrations` VALUES ('18', 'blog', '0002_auto_20180529_2040', '2018-05-29 12:41:45.432679');
INSERT INTO `django_migrations` VALUES ('19', 'blog', '0003_auto_20180529_2042', '2018-05-29 12:42:58.643346');
INSERT INTO `django_migrations` VALUES ('20', 'blog', '0004_auto_20180612_1450', '2018-06-12 06:51:31.214757');
INSERT INTO `django_migrations` VALUES ('21', 'blog', '0005_auto_20180612_1521', '2018-06-12 07:22:01.399836');
INSERT INTO `django_migrations` VALUES ('22', 'blog', '0006_auto_20180612_1532', '2018-06-12 07:32:48.588062');
INSERT INTO `django_migrations` VALUES ('23', 'blog', '0007_auto_20180630_1605', '2018-06-30 08:05:48.723083');
INSERT INTO `django_migrations` VALUES ('24', 'blog', '0008_auto_20180630_1800', '2018-06-30 10:00:52.135201');
INSERT INTO `django_migrations` VALUES ('25', 'zpSpider', '0001_initial', '2018-07-07 10:45:26.860312');
INSERT INTO `django_migrations` VALUES ('26', 'zpSpider', '0002_auto_20180711_1616', '2018-07-11 08:16:36.042784');
INSERT INTO `django_migrations` VALUES ('27', 'day', '0001_initial', '2018-07-11 08:52:41.686479');
INSERT INTO `django_migrations` VALUES ('28', 'day', '0002_punch_punch_host', '2018-07-11 12:24:07.291498');
INSERT INTO `django_migrations` VALUES ('29', 'day', '0003_excel_model_excel_type', '2018-08-09 02:57:49.240196');
INSERT INTO `django_migrations` VALUES ('30', 'login', '0002_user_stuno', '2018-08-09 07:17:09.607666');
INSERT INTO `django_migrations` VALUES ('31', 'login', '0003_auto_20180809_1058', '2018-08-09 07:17:09.666776');
INSERT INTO `django_migrations` VALUES ('32', 'login', '0004_auto_20180809_1508', '2018-08-09 07:17:09.830094');
INSERT INTO `django_migrations` VALUES ('33', 'login', '0005_auto_20180809_1510', '2018-08-09 07:17:09.847147');
INSERT INTO `django_migrations` VALUES ('34', 'login', '0006_auto_20180809_1513', '2018-08-09 07:17:09.867092');
INSERT INTO `django_migrations` VALUES ('35', 'day', '0004_excel_type_notice_content', '2018-08-09 07:28:27.175918');
INSERT INTO `django_migrations` VALUES ('36', 'day', '0005_excel_type_field_name', '2018-08-09 13:48:11.293267');
INSERT INTO `django_migrations` VALUES ('37', 'day', '0006_auto_20180810_1817', '2018-08-10 10:18:17.259266');
INSERT INTO `django_migrations` VALUES ('38', 'day', '0007_auto_20180812_1618', '2018-08-12 08:19:14.867866');
INSERT INTO `django_migrations` VALUES ('39', 'login', '0007_auto_20180812_1618', '2018-08-12 08:19:15.425843');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('162ecvlzcpuq3buhit5e1at9t8xrit3b', 'YzVhZTE4ZTY0NTFmN2NmMzJmNzNlMTZhNjhmZWFkYTVjN2MwMGMyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiN2FkNzJkYjU2YjQwYjFkODA3YTA5YWI1MzA0NTIzODE5ZmY0MWFmIn0=', '2018-05-15 12:58:20.370494');
INSERT INTO `django_session` VALUES ('6wp8qgbd9cf15xy0bz21pd2dfr8im22m', 'YzVhZTE4ZTY0NTFmN2NmMzJmNzNlMTZhNjhmZWFkYTVjN2MwMGMyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiN2FkNzJkYjU2YjQwYjFkODA3YTA5YWI1MzA0NTIzODE5ZmY0MWFmIn0=', '2018-05-25 08:09:45.724051');
INSERT INTO `django_session` VALUES ('rnkh5vb7u1qibe3jtn1mcvr9oqgt4mg1', 'MGE1ZTYzN2NmNDYwYmVmZTg1MGMwOTc3MDliODMxM2M0MmZkNGYxMjp7ImNoZWNrX2NvZGUiOiJIcVkzIiwidmVyaWZ5Y29kZSI6InVuNWQifQ==', '2018-06-10 13:59:49.693956');
INSERT INTO `django_session` VALUES ('zda5pu5nwfca04hhgkupsjahld5y2mri', 'NzllMjA4M2FiZmYyNzk3ZDUyOTNlNjQ2ZTI2MTQ1YjAzNWI1YzEyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiN2FkNzJkYjU2YjQwYjFkODA3YTA5YWI1MzA0NTIzODE5ZmY0MWFmIiwidmVyaWZ5Y29kZSI6Imtqd2gifQ==', '2018-06-21 09:22:33.551985');

-- ----------------------------
-- Table structure for execel_status
-- ----------------------------
DROP TABLE IF EXISTS `execel_status`;
CREATE TABLE `execel_status` (
  `id` int(11) NOT NULL,
  `statusname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of execel_status
-- ----------------------------
INSERT INTO `execel_status` VALUES ('1', '未推送');
INSERT INTO `execel_status` VALUES ('2', '用户审核');
INSERT INTO `execel_status` VALUES ('3', '推送关闭');
INSERT INTO `execel_status` VALUES ('4', '不需要推送');
INSERT INTO `execel_status` VALUES ('5', '审核完毕');
INSERT INTO `execel_status` VALUES ('6', '未审核');
INSERT INTO `execel_status` VALUES ('7', '用户审核完毕');

-- ----------------------------
-- Table structure for login_department
-- ----------------------------
DROP TABLE IF EXISTS `login_department`;
CREATE TABLE `login_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(128) NOT NULL,
  `departmentcode` varchar(128) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `createtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departmentname` (`departmentname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_department
-- ----------------------------
INSERT INTO `login_department` VALUES ('1', '计算机科学与技术（学硕）', '1701', '1348225990@qq.com', '2018-08-12 08:23:22.099024');
INSERT INTO `login_department` VALUES ('2', '计算机科学与技术（专硕）', '1702', 'emzhangpan@163.com', '2018-08-12 08:23:53.519367');
INSERT INTO `login_department` VALUES ('3', '软件工程（专硕）', '1703', 'emzhangpan@qq.com', '2018-08-12 08:22:42.121504');

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `stuno` varchar(128) DEFAULT NULL,
  `departmentcode` int(11),
  `phone` varchar(256) DEFAULT NULL,
  `status` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_user
-- ----------------------------
INSERT INTO `login_user` VALUES ('1', 'zhangpan', '12345678', 'emzhangpan@163.com', 'male', '2018-05-11 08:14:50.514285', '201713704097', '0', null, '0');
INSERT INTO `login_user` VALUES ('2', 'wlx', '12345678', 'e@qq.com', 'male', '2018-07-10 19:59:41.000000', '201713704100', '0', null, '0');
INSERT INTO `login_user` VALUES ('3', 'lzz', '111', '111', 'male', '2018-08-13 02:38:21.973225', '2017', '1703', '111', '0');
INSERT INTO `login_user` VALUES ('7', 'zh', '12345', '123456', 'male', '2018-08-13 07:21:45.967934', '111111111111', '1703', '11111111111', '0');

-- ----------------------------
-- Table structure for polls_choice
-- ----------------------------
DROP TABLE IF EXISTS `polls_choice`;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of polls_choice
-- ----------------------------
INSERT INTO `polls_choice` VALUES ('1', 'Not much', '4', '1');
INSERT INTO `polls_choice` VALUES ('2', 'The sky', '1', '1');
INSERT INTO `polls_choice` VALUES ('3', 'Just hacking again', '0', '1');
INSERT INTO `polls_choice` VALUES ('4', 'who is uzi?', '0', '3');
INSERT INTO `polls_choice` VALUES ('5', 'who is lwx?', '0', '3');
INSERT INTO `polls_choice` VALUES ('6', 'who is jacklove?', '0', '3');

-- ----------------------------
-- Table structure for polls_question
-- ----------------------------
DROP TABLE IF EXISTS `polls_question`;
CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of polls_question
-- ----------------------------
INSERT INTO `polls_question` VALUES ('1', 'who are you?', '2018-05-01 12:39:21.817916');
INSERT INTO `polls_question` VALUES ('2', 'furture question is created,check alter debug  test', '2018-05-30 22:00:00.000000');
INSERT INTO `polls_question` VALUES ('3', 'wlx', '2018-05-01 07:19:42.000000');

-- ----------------------------
-- Table structure for zpspider_tnews
-- ----------------------------
DROP TABLE IF EXISTS `zpspider_tnews`;
CREATE TABLE `zpspider_tnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `article` varchar(20000) NOT NULL,
  `publish_time` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `url_http` varchar(256) NOT NULL,
  `img_tp` varchar(256) NOT NULL,
  `img_url` varchar(256) NOT NULL,
  `comments_num` int(11) NOT NULL,
  `resouces` varchar(256) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_id` (`news_id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zpspider_tnews
-- ----------------------------
INSERT INTO `zpspider_tnews` VALUES ('1', 'hexfcvk8433023', '时间线梳理 中美贸易摩擦是如何步步升级的(图)', '\n　　原标题：图说国是|中美贸易摩擦是如何步步升级的\n　　博弈。\n　　6日，美国开始对340亿美元中国产品加征25%的关税。而中国外交部也亮出态度：中方将理所当然作出必要反击。\n　　中美贸易摩擦究竟是如何步步升级的？国是直通车整理出中美过招最全时间线。\n国是直通车 侯雨彤 制图\n　　中美贸易战时间线梳理\n　　3月8日，美国总统特朗普签署命令，决定将对进口钢铁和铝产品全面征税，税率分别为25%和10%。\n　　3月22日，美国总统特朗普宣布计划对中国600亿美元的商品征收关税，并表示将限制中国企业对美投资并购。\n　　3月23日，中国商务部宣布将对进口自美国的30亿美元的商品征收关税。\n　　3月23日，美国在世贸组织争端解决机制项下向中方提出磋商请求。\n　　4月1日午夜，中国宣布对自美进口的128项产品加征15%或25%关税。这意味着针对美国此前对进口钢铁和铝产品加征关税的回击正式落地。\n　　4月3日，美国正式提出要对中国500亿美元的商品征收关税。\n　　4月4日，中国提出要对美国进口的大豆、汽车、化学用品、飞机等106项价值500亿美元的商品征收关税，税率为25%。\n　　4月5日，美国总统特朗普宣布，考虑对中国额外的1000亿美元商品征收关税。\n　　4月5日，中国在世贸组织争端解决机制项下向美方提出磋商请求，正式启动争端解决程序。\n　　5月15日-5月17日，美国贸易代表办公室举行针对中国的301关税清单公众听证会。\n　　5月17日-5月18日，国务院副总理刘鹤赴华盛顿讨论关税事宜。\n　　5月19日， 中美在华盛顿就双边经贸磋商发表联合声明，称将在能源、农产品、高科技产品、金融等领域加强贸易合作。\n　　5月29日，美国重提要对中国500亿美元商品征收25%的关税。\n　　6月2日至4日，美国商务部长罗斯率团访华进行贸易磋商。\n　　6月15日，美国公布500亿美元商品关税清单。\n　　6月16日，中国国务院关税税则委员会发布公告决定，对原产于美国的659项约500亿美元进口商品加征25%的关税。\n　　6月30日前，美国将公布对来自中国投资的进一步限制。\n　　7月6日，美国将于当地时间7月6日00：01（北京时间6日12：01）起对第一批清单上818个类别、价值340亿美元的中国商品加征25%的进口关税。\n　　7月6日，中国对美部分进口商品加征关税措施已于北京时间6日12：01开始正式实施。\n责任编辑：霍宇昂 \n', '2018年07月06日 22:54', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk8433023.shtml', '', '', '3', '中国新闻网', '2018-07-07 11:09:01.419856');
INSERT INTO `zpspider_tnews` VALUES ('2', 'hexfcvk8179665', '美国那船大豆可能“凉”了 这些国家大豆却笑了', '\n　　原标题：热点 | 美国那船大豆可能“凉”了，这些国家的大豆却“笑”了！\n　　我国日前决定，从7月起将对原产于印度、孟加拉国、老挝和斯里兰卡等国的进口大豆实行零关税。这一重大贸易政策的调整，将会给我国的农产品对外贸易带来哪些变化呢？\n　　主动降低关税税率体现大国责任感\n\n　　6月下旬，中国国务院关税税则委员会发布《关于实施〈亚洲-太平洋贸易协定〉第二修正案协定税率的通知》。《通知》指出，7月起我国将对原产于印度、孟加拉国、老挝、斯里兰卡和韩国的进口大豆关税税率，从3%下调至零。专家分析说，中国主动降低关税税率，体现了中国的大国责任感。\n\n　　国务院发展研究中心农村经济部部长 叶兴庆：全球农产品的平均关税是60%。而中国目前的农产品平均关税是15.3%，相对于我们人多地少这样一种自然禀赋来说，这样一种关税水平是非常之低的，也就是说我们对外开放的门槛、力度是大大超出了发达国家，也超出了同等条件的其他的发展中国家。\n　　促进我国大豆进口来源多元化\n　　巴西、美国和阿根廷是中国进口大豆的三大主要来源国，来自东南亚的进口大豆数量相对较少。专家认为，虽然数量少，但作为新兴的大豆出口国，客观上也能促进我国大豆进口来源的多元化。\n\n　　中国社科院研究员 李国祥：增加了大豆进口的来源，将来更加有效地提高我们国家应对风险的能力，减少过去高度依赖少数国家进口大豆所带来的市场冲击。其他国家、其他来源的增加，也会增加国内的供给，保证市场的稳定。\n \n责任编辑：霍宇昂 \n', '2018年07月06日 21:57', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk8179665.shtml', '', '', '1219', '参考消息', '2018-07-07 11:09:01.431329');
INSERT INTO `zpspider_tnews` VALUES ('3', 'hexfcvk8178541', '普吉游船倾覆事故亲历者:船上的坐垫都被大风卷跑', '\n　　原标题：我们采访了普吉游船倾覆事故的中国救援者和风暴亲历者\n　　截至目前，船上127名中国游客中，16人死亡、33人失踪，另有78人获救，受伤游客已送当地医院治疗。\n　　据新华社6日报道，7月5日，两艘载有中国游客的游船在泰国普吉岛附近海域突遇特大暴风雨发生倾覆事故。截至目前，船上127名中国游客中，16人死亡、33人失踪，另有78人获救，受伤游客已送当地医院治疗。\n　　习近平就泰国普吉岛翻船事件\n　　作出指示\n　　事故发生后，中共中央总书记、国家主席、中央军委主席习近平作出重要指示，外交部和我驻泰国使领馆要加大工作力度，要求泰国政府及有关部门全力搜救失踪人员，积极救治受伤人员。文化和旅游部要配合做好相关工作。习近平强调，目前正值暑期，外出旅游人员较多，一些地方雨情汛情等情况突出，各地区各有关部门要及时进行风险提示，提醒旅行社和游客增强风险防范意识，消除安全隐患，加强安全检查监测和应急工作，切实保障人民群众生命财产安全。\n　　中共中央政治局常委、国务院总理李克强作出批示，要求全力搜救我失踪游客、救治伤员，妥为做好善后工作。要重视做好外出旅游人员安全防范工作，通过境外中国公民保护机制，切实维护好我公民合法权益，确保出行安全。\n　　按照习近平指示和李克强要求，外交部和我驻泰国使领馆已启动应急机制，积极协调泰方全力开展搜救工作、救治受伤人员。泰方正持续增派救援力量，全力开展搜救。目前，外交部、交通运输部、文化和旅游部已组成联合工作组赶赴泰国普吉参与现场处置。\n　　参与普吉游船倾覆事故搜救的\n　　中国救援者\n　　普吉游船倾覆事故牵动了中泰两国的心。\n　　6日，泰国普吉岛一家由华人组成的民间救援队—普吉蓝海救援队闻讯参与救援。该救援队的成员“牛仔”向环环介绍称，今日救援工作取得的最大的进展是实现了船只定位，并进行初步勘测。截至发稿时，“牛仔”传来信息，今日已有15名遇难者遗体被打捞上来，由不同打捞队伍完成。\n普吉蓝海救援队队员。\n普吉蓝海救援队提供的搜寻现场图。\n　　“我们在前往救援的路上，就有消息传来称，6名遇难者的尸体被发现，另外还有2名幸存者。”“牛仔”介绍称，在抵达事故现场时，他们发现海面浪很大，搜救工作并不容易。“海上有浪的同时，水下还有洋流，加上能见度不高，水深，搜索海域并不小。”这一切都增加了搜寻工作的难度。 \n　　而在如此困难的情况下，这支搜救队伍又是如何展开工作的呢？“我们先用船的声纳寻找，在大概确认沉船位置后，放下了一个摄像机，对水下情况进行了解，之后采用了放绳拖寻的方式，绳索底端挂到了沉船。随后我们的潜水员延绳索下潜，确认了沉船的位置。”\n　　虽然船只位置被确定了，但接下来的打捞工作仍困难重重。据“牛仔”介绍，涉事船只所在的位置很深，为水下44米左右，且向右舷倾覆。他们虽然在水下发现多具遇难者遗体，但由于装备有限，无法把水下遇难者的遗体打捞上来。\n普吉蓝海救援队提供的搜寻现场图。\n　　至于包括打捞尸体在内的进一步救援工作将如何展开，“牛仔”表示，他们并不是唯一参与救援的队伍，各家都有各家的方案，所以还要等到最终的方案出来才能知道怎么做。\n普吉蓝海救援队提供的搜寻现场图。\n　　截至发稿时，“牛仔”传来信息，今日已有15名遇难者遗体被打捞上来，由不同打捞队伍完成。“牛仔”还透露，昨天事故发生之后，泰国的政府、军方高度关注此事，当地的华人华侨也自发组织展开救援。但出海搜寻是高度专业的事，并不是所有人都能做，所以今天参与搜寻的都是专业人士。　　\n　　风暴亲历者讲述可怕经历\n　　“你想象不到当时多么可怕，我在普吉岛待了一年多，从没见过这么危险的情况。”谈到5日泰国普吉岛海域的那场风暴，“熊猫”（网名）心有余悸。“熊猫”算是幸运的，他所在“天秤”号潜水船经受住了风浪。另一艘“凤凰”号游船则在风暴中倾覆，导致数十名中国游客伤亡或失踪。\n　　6日，环环采访到亲历这场死亡风暴的“熊猫”，这名中国小伙在普吉工作已经一年多，是“天秤”号潜水船上的一名工作人员。“熊猫”介绍说，当天本来天气还不错，“天秤”号正从小皇帝岛驶往大皇帝岛，突然一阵黑压压的乌云扑过来，能见度瞬间降到只有几十米。强风带来巨浪，船身一直摇摆，船上的坐垫都被大风卷跑了，场面非常可怕。\n　　“幸亏‘天秤’号是一艘比较大的船，没有出事。”“熊猫”接着说，他们在行使途中，遇到一对驾驶摩托艇的俄罗斯情侣在求救。要命的是，这对俄罗斯人没有穿救生衣。船员先是抛出救生圈，把女孩救上来。轮到这名男子时，他不舍得放弃摩托艇，所以花了很长时间才把他救下。“当时都傍晚6点多，天快黑，再晚就来不及了”。\n　　另一名逃生的中国游客6日在社交网站上写道：开船不久，就来了暴风雨，导游马上叫我们躲进船上的小房间里，真的是一瞬间的事，站都站不稳，风很大，整个人都是歪的，很多东西都吹走了，导游和船员把我们一个个拉进去。浪越来越高，船身都快翻成90度了，中途有几次，浪冲进船里，坐在一排的人因为船歪得太厉害，全部扑倒到另外一边的人身上……后来看了新闻，才知道有船在珊瑚岛附近出事……\n　　环环6日还接到一个投诉电话，对方称，她的一对朋友当时正在一艘30多人的游船上，男生正在上厕所，突然船上起火，船员纷纷跳海，开着摩托艇跑了。女生在导游的催促下也跳海，借着漂浮球和冲浪板游到附近的小岛上。6日上午终于联系上男生。由于在海里浸泡时间长，两人伤情比较重，需要转院。“他们的手机都没了，是借导游的电话告诉我们情况的”。由于没法联系到两名当事人，记者无法确认这些说法是否属实。\n　　普吉岛游船倾覆事故\n　　时间梳理\n　　2018-07-05\n　　当地时间7月5日下午5点45分左右，在泰国南部普吉府，两艘共载有127名中国游客的游船在返航普吉岛途中突遇特大暴风雨，发生倾覆。\n　　2018-07-05\n　　进入深夜，救援行动由于天黑中断。截至凌晨，事故已造成1名中国游客溺亡，76名中国游客获救，另有数十人暂时无法核实下落。\n　　2018-07-06\n　　早上6时30分，因天黑而中断的救援活动恢复。在上午的搜寻过程中，又发现另外12具遗体，两船翻船事故死亡人数上升至13人。\n　　2018-07-06\n　　泰国船长回忆倾覆原因时称，当时天气恶劣，垃圾卷入排水系统导致船体不稳，又有大浪打来，引发事故。泰国副总理巴威则表示，涉事船只不顾泰国气象厅警告，擅自出海。\n　　2018-07-06\n　　泰国海军潜水员找到其中一艘沉没游艇，并打捞到26具遇难者遗体，加上此前发现的遇难者，死亡游客人数已经增加至40人，剩余失踪者仍在持续搜寻中。\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 21:53', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk8178541.shtml', '', '', '2', '环球网', '2018-07-07 11:09:01.435827');
INSERT INTO `zpspider_tnews` VALUES ('4', 'hexfcvk8137674', '江苏泰兴数万吨废料污泥堆长江边追踪：5人被处分', '\n　　原标题：江苏泰兴数万吨化工废料和污泥堆放长江边追踪：进一步加大整治力度，已有5人被处分\n　　记者6日从泰兴市政府获悉，针对近期生态环境部通报的两起环保不作为问题，泰州、泰兴两级纪委监委介入展开调查，目前已有5名相关责任人被处分。 \n泰兴市滨江镇头圩村紧靠长江岸边的污泥堆积池（6月11日无人机拍摄）。新华社记者 季春鹏 摄\n　　6月11日、20日，生态环境部先后通报了泰兴市滨江污水处理有限公司违法倾倒污泥和泰兴化工园区扬子医药西侧地块填埋化工废料问题，批评泰兴市政府对中央环保督察交办的问题未做整改，存在敷衍塞责等问题，给周边环境和长江水质安全带来巨大威胁。 \n泰兴市滨江镇头圩村紧靠长江岸边的污泥堆积池（6月11日无人机拍摄）。新华社记者 季春鹏 摄\n　　7月2日，新华社“新华视点”栏目播发稿件《中央督察两年有的丝毫未改，有的不减反增——江苏泰兴数万吨化工废料和污泥堆放长江边调查》，披露了堆放在长江岸边的污泥不减反增、化工废料未及时清理的具体原因，引发各界高度关注。 \n　　据介绍，泰州市纪委监委给予泰兴市委副书记、泰兴经济开发区党工委书记张坤党内警告处分，给予泰兴经济开发区党工委副书记、泰兴经济开发区管委会主任吉勇党内严重警告处分。泰兴市纪委监委给予泰兴经济开发区管委会副主任王新宇政务记大过处分，给予滨江镇环保科科长景龙飞党内警告处分，给予泰兴市滨江污水处理有限公司法定代表人、常务副总经理曹国家撤销党内职务处分。 \n　　针对存放在长江岸边约4万吨污泥处置问题，泰兴市政府已制定污泥处置工作方案，邀请专家对方案进行评审后，决定采取干化脱水、药剂固化、原位固化三种方式对生化污泥进行预处理。 \n　　截至4日下午5时，累计干化处理污泥约4532吨，固化处理污泥约6404吨，运入暂存库污泥10682吨。从15日起，作业现场10台带式压滤机、6台高压板框压滤机将全部运行，届时日均污泥预处理能力将达2000吨，确保8月15日前规范转运暂存污泥完毕，2019年6月底前安全处置完毕。 \n　　针对扬子医药西侧地块填埋化工废料的问题，泰兴市政府已编制转运、暂存、处置等方案。目前，填埋场地四周已安装防尘隔离栏，场内铺设了防雨膜。填埋场地下坡边沿雨水收集明沟施工结束，并安有400根防渗桩。洗车台设备正在采购，配套集水池正在抓紧施工。泰兴市政府已委托生态环境部南京环境科学研究所编制相关综合治理方案，预计8月15日通过专家论证后立即组织实施。 \n　　此外，泰兴市相关部门将对沿江1公里范围内的化工企业，进一步加大整治力度，确保拟淘汰关闭、搬迁转移的21家企业年底前全部拆除、搬迁到位。对拟改造升级的企业，再次逐家进行深入评估，再确定一批搬迁转移项目，提升转型升级的标准。此外，泰兴市环保部门将从严环境执法，倒逼企业转型升级，确保环境持续改善。 \n　　同时，泰兴市政府将进一步完善督察反馈机制，加大问责力度，对整改工作进展缓慢、作风不实，不担当、不作为的责任人及时严肃追责，确保整改承诺落实到位、环境风险隐患整改到位、群众反映的环境问题解决到位。\n　　记者郑生竹\n责任编辑：霍宇昂 \n', '2018年07月06日 21:46', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk8137674.shtml', '', '', '79', '新华视点', '2018-07-07 11:09:01.444328');
INSERT INTO `zpspider_tnews` VALUES ('5', 'hexfcvk8029483', '侠客岛：中美贸易战第一天 给特朗普支个招', '\n　　原标题：[解局]中美贸易战第一天，给特朗普支个招\n　　[侠客岛按]\n　　解局开始之前，岛叔先和大家讲一个趣闻。\n　　就在今天，一艘载有上万吨美国大豆的货船在黄海上疾驰，上演了一场“奔跑吧大豆”的戏码。这个戏码还有另外一个名字，叫“只要我开得够快，关税就追不上我”。\n　　为什么要“奔跑”？因为时间就是金钱。针对美国今天开始对340亿美元中国产品加征25%的关税，中方将实施对等报复性单；如果这艘船在中国对美国大豆征收25%惩罚性关税生效前靠港清关，就能省下几千万人民币的关税。船长慌啊。\n　　昨天推文大家也看到了，“中方承诺不打第一枪，但为了捍卫国家核心利益和人民群众利益，不得不被迫作出必要反击”——这不，根据海关总署最新表态，中国对美部分进口商品加征关税措施已于北京时间6日12：01开始正式实施。看到这个消息，相信船长也淡定了……\n　　贸易战的第一回合，双方互征关税已经开始。商务部国际贸易经济合作研究院研究员梅新育为侠客岛撰文解读。他的观点角度很新颖。\n\n　　美国贸易代表已经确认，自美国东部时间6日（周五）0点01分开始，对华加征关税，我方立刻宣布实施早已公布的对等报复清单。这场无可避免的、创造了全球贸易史上涉案贸易额最高纪录的贸易战，双方正式动手了。\n　　美方挑起这场贸易战，并无经济逻辑可言。\n　　现在的美国不是处于经济萧条，而是处于经济景气峰顶，已经实现了充分就业；贸易保护不能，哪怕是暂时增加美国就业总量，只能对美国经济施加额外的干扰，加大从产业界的供应链混乱到宏观经济的通货膨胀的压力。\n　　山姆大叔一直神神叨叨的美国贸易逆差，归根结底也不是他们所描述的中国和其它贸易伙伴“不公正贸易行为”所致，而是山姆大叔自己的错。\n　　继续维持天文数字的军费，甚至还要进一步加码，就是美国推高自身经济压力的最大错误之一。\n　　军费 \n　　美国军费，与贸易逆差何干？\n　　很有关系。在宏观层次上，美国贸易逆差的本质，是其国民储蓄过低；而美国国民储蓄过低的重要根源之一，就是美国政府数十年如一日是负储蓄部门。其中，军费、社会保障两大开支过度膨胀且布局不合理，是其负储蓄的主要来源。\n　　可以说，军事开支膨胀失控，堪称恶化美国财政支出结构的头号“杀手”，进而使美国贸易收支逆差格局定型、不断强化。\n　　军费开支过度膨胀是如何恶化美国国际收支的呢？\n　　平时，在产业和贸易的层次上，过高的军费开支、过于丰厚的军事合同利润，吸引美国产业界把过多的优质资源投向军工业，民用工业因此相对衰落，在世界市场上竞争力日益减退。这就使美国不仅被牵制海外市场继续攻城略地的脚步，也让本土市场被聚焦民用工业的外企占据的态势蔓延。\n　　而一旦爆发较大规模战争，陡然涌现的大量军需订单，更是要有相当一部分流向外国产业界。如果战场邻近国家和地区恰恰有潜在生产能力，也有强烈的抓住机遇谋求发展之心，他们就会拿下很大一部分美军“特需”订单，以及美国国民经济“军事化”而腾出来的民品生产、供应市场空间。\n全球军费开支排行\n　　回顾历史，美国在二战之后参加的历次大规模战争，都对其国际收支产生了相当明显的影响，也有力地推动了后来被美国视为制造业竞争对手的经济体的工业和出口增长。\n　　比如，朝鲜战争爆发之前的1948、1949年，美国货物贸易顺差分别为45.72亿美元和45.07亿美元；朝鲜战争爆发的1950年，美国货物贸易顺差急剧萎缩至3.62亿美元；停战翌年，顺差便回升至17.14亿美元。\n　　可以看出，这几年美国贸易顺差的涨跌，和战争爆发和结束后的时间点精确相吻。也正是朝鲜战争带来的“特需景气”，一举把日本拉出了战后萧条的泥坑。\n　　再比如，1964年，美国炮制“北部湾事件”，制造了全面、大规模直接参与越南战争的借口。1965年越战爆发，当年美国的货物贸易顺差，便从上年的53.84亿美元，大幅度下降至35.11亿美元。\n　　也是从美军宣布停战的1968年开始，二战后美国货物贸易收支顺差的常态，开始转折为逆差。1968、1969连续两年，美国货物贸易分别逆差12.87亿美元、9.80亿美元；到1973年签署《关于在越南结束战争、恢复和平的协定》时，美国货物贸易收支逆差格局已经定型，仅1975年一年短暂实现过顺差，其余所有年份均为逆差。\n　　也正是越战期间，实施出口导向型经济增长模式的“东亚四小龙”实现了经济腾飞，在工业化进程中彻底脱胎换骨。\n\n　　近一些的案例也有。\n　　2001年10月，美军出兵阿富汗（至今仍有可观兵力）；2003年3月，出兵伊拉克，2011年撤军。也正是在这两场战争期间，美国货物贸易逆差规模接连上了几个台阶：\n　　阿富汗战争爆发翌年（2002年），美国年度货物贸易逆差首次突破5000亿美元大关，达到5071亿美元，比上一年猛增571亿美元；\n　　伊拉克战争爆发翌年（2004年），美国年度货物贸易逆差从上年的5783亿美元猛增至7108亿美元，首次突破7000亿美元大关；\n　　2005年，美国年度货物贸易逆差首次突破8000亿美元大关，达到8316亿美元。\n　　……\n　　大炮一响黄金万两，这两场战争带给美国的，几乎是一年1000亿美元逆差的节奏。\n　　可以肯定，如果美国不彻底反省过度卷入海外政治军事事务的失误，不大幅度削减已经过度膨胀的天文数字军费，要想有效压缩贸易逆差，没可能。\n　　问题\n　　美国精英阶层中，不是没有人意识到这个问题。\n　　上世纪五六十年代，或许是因为对美国损耗巨大的朝鲜战争，昔日的二战欧洲盟军总司令、凭借“结束朝鲜战争”承诺而入主白宫的艾森豪威尔总统就意识到了当时刚初步成型的“军工复合体”对国家的潜在危害。\n　　在1961年的告别演说中，艾森豪威尔总统满怀忧虑地告诫——\n　　“我们已被迫创建一个规模宏大的永久性的军事工业，350万男女服务于国防机构，我们每年在军事安全上的开支超过了美国所有公司的纯收入。我们必须警惕“军工复合体”有意无意所形成的不正当的影响力，而且这不当的权力配置的灾难可能会持续下去。”\n艾森豪威尔\n　　特朗普对此也一清二楚。\n　　从竞选期间起，特朗普就高举“美国优先”（America First）这面两次世界大战间孤立主义运动的旗号，不断抨击其前任们轻举妄动、没有必要地干预外部事务、卷入在国外的大规模军事冲突，耗竭了美国资源。竞选时，特朗普力主集中资源聚焦国内经济建设，固本培元。\n　　比如，2016年4月27日，在第一场面对共和党精英系统陈述其外交政策理念的演讲中，他是这样说的——\n　　“这些外交政策灾难接踵而至……这一切都始于一个危险的想法：我们可以让那些没有经验或者没有兴趣成为西方民主国家的国家成为西方民主国家”；\n　　“与其他总统候选人不一样的是，战争和入侵将不会是我的首个本能。没有外交手段就没有外交政策。一个超级大国明白小心谨慎和克制才是力量的真正标记”；\n　　“尽管从未在政府任职，我曾完全反对伊拉克战争，我对非常自豪，我多年前就一直在讲，伊拉克战争将会使中东地区出现乱局，不幸的是，我是正确的。”\n　　在2017年1月的就职演讲中，特朗普则声明，“我们不寻求将自己的生活方式强加于人”。2017年8月公布的阿富汗及南亚新战略中，特朗普一再强调，在阿富汗等国行动目标是打击恐怖分子，而不是建设外国国家（We are not nation-building again。  We are killing terrorists）。\n\n　　2017年12月，特朗普政府发布第一份国家安全战略报告，也定义了四项至关重要的美国国家利益——\n　　保护美国人民、国土安全和美国的生活方式；促进美国的繁荣，首次提出经济安全是国家安全；用军事力量维护和平；战略是为了推进美国在世界上的影响力，但首先要在国内创造财富和保障权益。\n　　应该说，上述所有这些主张，都体现了他减少在海外军事干预中耗竭美国资源的理念，倘若能够切实全面落实，必定有助于削减美国贸易逆差。问题是，特朗普同时又主张大规模更新美军装备，提高军费开支——这就不能不抵销他上述理念主张的效果了。\n　　2018年，全球国防费用将增长3.3%，达到1.67万亿美元的冷战后最高峰。在这样的增长中，美国一家军费开支就独占40%之多！但2017年，美国的实际GDP仅占全球15.40%。\n　　这样的格局，无论特朗普如何逼迫盟国提高防务开支贡献，能够持久吗？有如此巨大的、消耗性的防务开支，对美国国民储蓄、进而对其贸易收支的影响可想而知。\n　　换言之，想通过贸易战降低贸易逆差，特朗普总统找错了靶向；不如先看看自己的军费能不能削减再说。否则，缘木求鱼。\n　　文/梅新育\n责任编辑：霍宇昂 \n', '2018年07月06日 21:24', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk8029483.shtml', '', '', '476', '海外网', '2018-07-07 11:09:01.450832');
INSERT INTO `zpspider_tnews` VALUES ('6', 'hexfcvk7981528', '这两天世界都静等“关键时刻” 台湾省也发生大事', '\n　　在静默等待中，一个关键时刻终于到来。\n　　而这两天的世界，似乎从没有如此焦灼，台湾也不例外。\n　　还记得斯威士兰吗？\n　　这个在布基纳法索与台湾“断交”后，台当局在非洲仅剩的最后一个“友邦”，因中方对中非合作大家庭“全家福”的期待，而走入人们视线。\n　　随着9月中非合作论坛的临近，台当局终于坐不住了。\n　　据台媒报道，台外事部门“亚非司司长”刘邦治昨天（5日）召开记者会，“替”斯威士兰保证“不会出席”中非合作论坛，并称与斯威士兰的关系“至死不渝”。\n▲刘邦治在记者会上\n　　与此同时，一项“预计投入10万美金”的合作计划据称也已敲定并进入招标阶段。\n　　连“至死不渝”这种言情小说里的对白都使了出来，台当局的努力可见一斑。\n　　但这一幕不禁令小锐觉得似曾相识：台当局在今年4月刚强调与布基纳法索“邦交稳固”并大撒援助后，次月就被“断交”……\n　　那么问题来了：斯威士兰与台湾的“友邦关系”，果真能至死不渝么？\n▲斯威士兰\n　　为了留住这颗非洲“遗珠”，台当局苦心费尽\n　　昨天（5日），斯威士兰再次占据了台湾媒体的版面。\n　　据台湾中时电子报报道，中非合作论坛北京峰会即将于9月举行，岛内舆论普遍关注斯威士兰是否会出现在中非“全家福”中。\n　　斯威士兰还没表态，台当局就已迫不及待。\n　　在5日上午举行的记者会上，刘邦治主动宣称，斯威士兰尚未收到中非合作论坛的邀请函，并且也不会参加，台斯关系“至死不渝”，他对双方关系“充满信心”。\n▲台湾中评网截图\n　　虽然嘴上说着“充满信心”，但近段时间以来台当局的行动却相当“煞费苦心”。\n　　先是4月蔡英文亲赴斯威士兰为斯国王姆斯瓦蒂三世庆生并送上厚礼，再是6月以高规格接待到访的姆斯瓦蒂三世并邀请其视导“汉光”军演，对在台留学的斯威士兰王子也是极尽关照百般呵护。\n　　香港星岛环球网注意到，姆斯瓦蒂三世在访问台湾时，并未如海地总统那番“狮子大开口”，而是仅提到经济合作计划，令台当局暂松一口气。\n▲蔡英文与斯威士兰国王姆斯瓦蒂三世（左）\n　　据台湾《中国时报》报道，在姆斯瓦蒂三世来访期间，双方签署了据称涵盖贸易、投资、加工出口区、技术及人员交流合作等五大方面的“经济合作协定”。\n　　尽管以上协定何时生效尚是未知数，但可以确定的是，这并非台湾给斯威士兰的唯一“献礼”——昨天的记者会上，另一项“温室合作计划”也被迫不及待地宣布了。\n　　刘邦治称，4月访问斯威士兰时由蔡英文主动向斯“王母基金会”提出的这项合作计划，目前“进展顺利”。\n　　“预计投入10万美金，6月下旬已经划拨承诺的部分款项，现正进行招标。”\n　　嗯，可以说……很“豪气”了……\n　　台当局忙着与斯威士兰“秀恩爱”，岛内：flag已经立好！\n　　尽管台当局试图用“秀恩爱”来打消舆论关于“邦交生变”的忧虑，但岛内媒体和民众却明显不买账。\n　　5日当天记者会后，在绿媒纷纷为“至死不渝”的“硬气”欢呼时，“台湾中评网”就来了一篇大爆料。\n　　报道中被如实还原的记者会现场媒体与刘邦治的一段对话，信息量颇大——\n　　当刘邦治表示斯威士兰称没有收到邀请函后，媒体追问就算收到中国大陆邀请函，斯威士兰国王也不会去参加中非论坛？刘表示，目前获悉的回应、说法，就是没有收到邀请函。\n　　媒体继续追问斯威士兰是否力挺台湾的态度坚定？他回答“yes”。\n　　事实上，语焉不详也好，刻意回避也罢，这段对话都让人忍不住想到前不久美国CNN的一篇报道。\n▲CNN报道截图\n　　在那篇6月8日刊发的文章中，CNN援引斯政治人士观点指出：台湾和斯威士兰看似深厚的关系，正是得益于前者长期提供的大量资金和经济援助。\n　　“这是非常自私的、只有利于王室家族的关系。”报道说。\n　　巧合的是，也正是在这篇报道中，台湾驻斯代表陈经铨向CNN强调，“每天晚上我都在一分钟内入眠，这就是我对双边关系安心的程度”。\n　　后来的事，我们都看到了：仅仅半个月后，陈经铨就因“压力过大”而累到中风……\n▲媒体报道截图\n　　当时台媒纷纷表示，当初陈经铨就不该夸海口“立flag”。\n　　谁也没想到的是，转眼间第二个flag就来了。\n　　“‘邦交’至死不渝？希望小编不会有用到‘然后他就死了’这个梗的一天。”在社交媒体上发布相关新闻时，联合新闻网这样“补刀”。\n　　而在这条新闻下，岛内网友更是火力全开，直指台当局为了挽留斯威士兰“连命都不要了”，更预言：连“至死不渝”这种话都说出来，看来“断交真不远了”。\n\n\n\n\n专家：斯威士兰与大陆建交是“早晚的事”\n　　“台当局官员鼓吹所谓‘至死不渝’，只不过是‘走夜路吹口哨——虚张声势’罢了。”中国社科院台湾研究所副研究员钟厚涛这样告诉小锐。\n　　在他看来，结合台湾当局多次宣称“邦交”稳固后迅速“被断交”的经历，面子话说得越多，越体现台当局的心虚，“至于真相如何，蔡英文心里其实比谁都清楚”。\n　　事实上，斯威士兰在态度和意愿上逐渐倾向大陆的事实，正被更多人看在眼里。\n　　钟厚涛介绍，近年来，中国大陆和斯威士兰的经贸关系显著上升，大陆对斯威士兰的投资也远高于台湾方面。\n　　不仅如此，自2000年在北京举行的第一届中非合作论坛部长级会议开始，斯威士兰就多次以观察员身份列席。\n\n　　巧合的是，此前也曾以观察员身份列席会议的布基纳法索、马拉维和冈比亚等国目前都已与中国大陆建交或复交。\n　　正如《联合报》在不久前的一篇报道中所说，蔡英文当局上下目前最担心的莫过于在非洲被“剃光头”。\n　　文章称，导致台湾“邦交国”越来越少的原因在于蔡英文当局自己，只有承认“九二共识”，才能为台湾找到出路，避免被“剃光头”。\n　　在6月1日的外交部记者会上，发言人华春莹重申：“我们当然欢迎斯威士兰早日加入中非合作大家庭，照一张中非合作大家庭的欢乐全家福。当然，这取决于斯威士兰自己作出选择。”\n▲华春莹\n　　那么，斯威士兰将作出怎样的选择呢？\n　　“从长远来看，斯威士兰与中国大陆建交是早晚的事情。”钟厚涛说。\n责任编辑：霍宇昂 \n', '2018年07月06日 20:45', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/gat/2018-07-06/doc-ihexfcvk7981528.shtml', '', '', '1499', '参考消息网', '2018-07-07 11:09:01.456827');
INSERT INTO `zpspider_tnews` VALUES ('7', 'hexfcvk7953278', '香港末代港督大肆吹捧“港独” 港媒斥责：太无耻', '\n　　原标题：香港末代港督大肆吹捧“港独” 港媒斥责：太无耻！\n彭定康\n　　海外网7月6日电 香港末代港督彭定康一直“不甘寂寞”，经常对香港事务指手画脚，日前又就香港回归二十一周年大放厥词，由《中英联合声明》谈到黄之锋等非法“占中”分子。\n　　据香港《文汇报》消息，彭定康每次谈及香港，一定不忘祭出《中英联合声明》作为“护身符”，这回也不例外。他妄称，“英国有权监察《中英联合声明》在港的落实情况”，还说，“有人声称香港的未来与英国无关，我感到特别奇怪。”此外，彭定康还乘机对梁天琦、黄之锋等人大加吹捧，称其行为是他“有生以来见过最勇敢的表现。”\n　　报道直斥，彭定康“太无耻了”，其态度嚣张，但内容却不值一哂，“徒显其厚颜和饶舌的政客嘴脸而已”。因为关于香港，“开宗明义、清楚明确，一九九七年七月一日以后的香港是中国一部分，与英国无关。”\n　　多次对香港事务指手画脚\n　　事实上，彭定康近年来屡屡以前港督身份对香港内部事务指手画脚，用诸如“非常缓慢”、“惊讶”等字眼点评香港的民主；曾参与“占中”行动，并以“道德高地”形容违法“占领”事件。\n黄之锋、周永康及罗冠聪等。（图源：港媒）\n　　上个月，彭定康就香港“本土民主前线”发言人梁天琦因暴动罪被判入狱6年，再次妄言“有关法律违反国际人权并被滥用”。英国国会议员也称，“香港特区政府利用这条法律恐吓‘民主运动’并削弱了香港言论自由。”对此，中国外交部驳斥，香港是中国的特别行政区，香港事务完全是中国内政。我们坚决反对任何外部势力干预香港事务和特区的司法。\n　　而对于彭定康以《中英联合声明》作为“护身符”。外交部也明确指出，现在香港已经回归祖国怀抱20年，《中英联合声明》作为一个历史文件，不再具有任何现实意义，对中国中央政府对香港特区的管理也不具备任何约束力。英方对回归后的香港无主权、无治权，无监督权。\n　　林郑月娥：在大是大非上，态度绝不含糊\n　　对于彭定康的言行，香港《大公报》评论称，一个早已过气的英国政客一再替“港独”势力张目，到底是不甘寂寞还是别有居心？但事实却是，尽管香港特区和英国仍有诸多商贸往来，但香港的未来早已和英国没有关系。彭定康不顾当年在港劣迹，不断攻击抹黑香港，不仅帮不到“港独”分子，反而是帮了倒忙。\n　　香港特首林郑月娥也曾就彭定康言论表态，在被问到“往后会否有可能拒绝前港督彭定康入境”时，她表示，“不能排除任何可能。”今年7月1日，林郑月娥明确表态，过去一年，特区政府坚持“一国”之本，在大是大非上，态度绝不含糊，对触碰国家底线的行为绝不容忍，并无畏无惧地正确处理中央和香港特区的关系，加强各界对宪法、《基本法》和国家安全的认识。与此同时，特区政府善用“两制”之利，在中央的大力支持下，积极参与“一带一路“倡议，并与粤澳共同谋划“粤港澳大湾区”发展。（海外网 朱箫）\n责任编辑：霍宇昂 \n', '2018年07月06日 20:34', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7953278.shtml', '', '', '3163', '海外网', '2018-07-07 11:09:01.466328');
INSERT INTO `zpspider_tnews` VALUES ('8', 'hexfcvk7770890', '中国在世贸组织起诉美国301征税措施', '\n　　7月6日，中国在世贸组织就美国对华301调查项下正式实施的征税措施追加起诉。\n责任编辑：霍宇昂 \n', '2018年07月06日 20:33', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7770890.shtml', '', '', '3428', '商务部网站', '2018-07-07 11:09:01.475830');
INSERT INTO `zpspider_tnews` VALUES ('9', 'hexfcvk7733658', '外媒：泰国沉船事故已致33名中国人遇难', '\n　　原标题：外媒：泰国沉船事故已致33人遇难 全部为中国公民\n\n　　海外网7月6日电 当地时间7月5日，两艘共载有100多人的船在泰国普吉岛翻覆，据美联社最新消息，截至目前，遇难者人数已上升至33人，且全为中国公民，仍有23人失踪。\n　　据早前报道，当地时间7月5日下午5时45分，两艘发生事故的船上共载有127名中国游客，外交部6日下午透露，中国游客中共有78人获救、33人失踪、16人遇难。\n　　《曼谷邮报》报道称，沉没船只 “凤凰号”上共载有105人，其中包括93名乘客、12名船员和导游；另一艘“斯瑞尼塔”号上载有42人，其中包括35名乘客、5名船员、1名导游和1名摄影师。\n　　受当日暴雨天气影响，同时发生翻覆的还有一艘水上快艇，上面载有2名游客。泰国警方证实，2人获救后已被带到安全地带。\n　　7月5日18时45分许，两艘载有中国游客的游船在泰国普吉岛附近海域突遇特大暴风雨发生倾覆事故。截至目前，船上127名中国游客中，16人死亡、33人失踪，另有78人获救，受伤游客已送当地医院治疗。\n　　事故发生后，中共中央总书记、国家主席、中央军委主席习近平作出重要指示，外交部和我驻泰国使领馆要加大工作力度，要求泰国政府及有关部门全力搜救失踪人员，积极救治受伤人员。文化和旅游部要配合做好相关工作。习近平强调，目前正值暑期，外出旅游人员较多，一些地方雨情汛情等情况突出，各地区各有关部门要及时进行风险提示，提醒旅行社和游客增强风险防范意识，消除安全隐患，加强安全检查监测和应急工作，切实保障人民群众生命财产安全。\n　　中共中央政治局常委、国务院总理李克强作出批示，要求全力搜救我失踪游客、救治伤员，妥为做好善后工作。要重视做好外出旅游人员安全防范工作，通过境外中国公民保护机制，切实维护好我公民合法权益，确保出行安全。\n　　按照习近平指示和李克强要求，外交部和我驻泰国使领馆已启动应急机制，积极协调泰方全力开展搜救工作、救治受伤人员。泰方正持续增派救援力量，全力开展搜救。目前，外交部、交通运输部、文化和旅游部已组成联合工作组赶赴泰国普吉参与现场处置。\n　　相关新闻\n　　普吉沉船船长：船遭巨浪袭击 进水来不及抽干就已下沉\n　　专家谈普吉事故：72小时 船上这些地方生还可能大\n　　解读普吉岛翻船：救援难在哪 游客获救窗口有多久\n　　中国女记者亲历普吉岛翻船：最可怕的两个半小时\n　　交通运输部将派10人救助小分队赴泰救援\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 19:51', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7733658.shtml', '', '', '1467', '海外网', '2018-07-07 11:09:01.480362');
INSERT INTO `zpspider_tnews` VALUES ('10', 'hexfcvk7394872', '泰驻华使馆:向普吉游船事故受灾游客亲友表示慰问', '\n　　原标题：泰驻华使馆就游船倾覆事故发布公告：向受灾游客亲友表示慰问\n　　中新网7月6日电 泰国驻华使馆6日就普吉府近海域区发生的游船倾覆事故发布公告。公告称，泰王国驻华大使馆和泰国驻华9所总领馆对在该事件中丧生和受伤的游客的亲友表示慰问。使馆已就此事开通求助热线，以便公众及时跟进关于救助受灾游客的相关信息。\n泰国驻华使馆网站截图。\n\n\n\n \n\n\n\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 19:10', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/o/2018-07-06/doc-ihexfcvk7394872.shtml', '', '', '0', '中国新闻网', '2018-07-07 11:09:01.485326');
INSERT INTO `zpspider_tnews` VALUES ('11', 'hexfcvk7341253', '专家谈普吉事故：72小时 船上这些地方生还可能大', '\n　　原标题：中国救援专家：关键时间72小时 船上这些地方生还可能大\n　　央视网消息：针对海上发生事故，交通运输部南海救助局高级船长张贵平表示，为便于搜救，首先要确认地方和水深，黄金救援时间是72小时。曾参与过多次海上搜救的高级潜水员钟松民也表示，普吉岛的天气多变，如果落船者在游船的机舱或者底舱位置，那么，生还可能性较大。\n救援现场\n　　交通运输部南海救助局高级船长张贵平：“像这个沉船的状况，如果在我们救援情况下，首先是要确定沉船的位置，它大概的水深和现场的气象海况情况。潜水员下去尽快的找到沉船，探摸沉船的状况，确认有没有生还者。”\n　　张贵平表示，一般海上事故的黄金救援时间是72小时，但会根据当地的气象、海况、水温等条件而变化。目前泰国部分地区已进入雨季，天气多变，海况复杂，对于搜救打捞来说有一定的难度。\n　　曾参与多次水下打捞的高级潜水员钟松民表示，一般发生海上事故后，如果落船者在游船的机舱或者货舱，生还的可能性大。\n　　交通运输部广州打捞局高级潜水员钟松民：“这种救助难度在什么？就是它一般都是在舱室以内的，而且船一扣过来，就反个方向我们要去找，这种大脑意识要全部要把这个船反过来；第二个，舱室内的空间又不像甲板，甲板那个杂物多，（水下舱室）在里面又很浑浊，看不到，然后有些出入口又很小，又经常会被杂物堵死，所以这种搜救难度非常的大。（船如果）倒覆过来的话，它有空气的就是在机舱和货舱这两个地方，我们今年救了20多个幸存者都是从这些地方救出来的。”\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 18:52', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/2018-07-06/doc-ihexfcvk7341253.shtml', '', '', '17', '央视新闻', '2018-07-07 11:09:01.490357');
INSERT INTO `zpspider_tnews` VALUES ('12', 'hexfcvk7268156', '吴敦义喊话蔡英文:立即兑现10年不缺电不涨价支票', '\n　　原标题：吴敦义喊话蔡英文：立即兑现10年不缺电不涨价“支票”\n　　[观察者网综合报道]中国国民党主席吴敦义6日下午出席青年活水营第五期开幕式时向蔡英文喊话，要求蔡英文兑现选前提出“10年不缺电、不涨电费”的支票，不然就吞回去，也盼望蔡英文当局能放下清算斗争，大家一起拚经济，因为只有搞好经济，人民才不会受苦。\n　　据香港“中评社”7月6日消息，青年活水营第五期研习活动下午在剑潭活动中心教学大楼举行，约50位青年学子参加，吴敦义受邀出席开幕式，再由周继祥与国民党智库资深顾问、政治大学教授朱新民一起和青年座谈。\n　　吴敦义因为行程繁忙延后半小时抵达，原订下午2点开幕式因此延后，开幕式原订大陆事务部主任周继祥主持，但周下周要随前主席连战赴陆访问，中午人在连战办公室研究相关行程延误，因此周继祥比吴敦义还晚到半小时。\n　　吴敦义结束讲话后，还特别和周继祥另辟房间密谈近一小时，周继祥才和朱新民一起和青年座谈。\n　　吴敦义表示，这个青年活水营研习活动是民间捐资而成立，取名活水营，就是希望吸引有抱负、有远景与实践决心的青年参与。\n　　他表示他有四项愿景，一是希望有一个廉能而有效率的政府；二是希望整个社会是繁荣均富的经济；三是公义和谐的社会，四是和平稳定发展的两岸。\n　　他提到，马英九8年执政，经济成长最快、最多、最高的时期，正好就是2009年9月至2012年2月间他担任“行政院长”任内。\n　　他指出，当一个政府是亲切、勤快、廉能、有效率，不去斗争，不去清算人家，真的埋头苦干拼经济，让两岸能和平稳定发展，自然经济民生都会向上，可是大家可以看过去两年多的状况，多盼望蔡英文当局能放下清算斗争，大家一起拼经济，因为只有搞好经济，人民才不会受苦。\n　　他说，蔡英文还没做“总统”时，曾参加游行活动，游行标语、沿路呼口号就是“用爱发电”，现在大家讲的却是“人民用肺在发电”、“用肝在发电”、“用肾脏在发电”；现在真想告诉蔡英文，选前说“10年不缺电”、“10年不涨电费”的支票，现在要就兑现，要就吞回去。\n　　吴敦义表示，现在推动的新愿景，可能要走很长的路、经过很长的时间才能达到，但如果不跨出这一步，就会停留在现状，所以要用行动提供社会一些服务与说法，让更多人接受与感动，做一些好事，而礼记礼运大同篇的107个字就是做好事的最高目标。\n责任编辑：余鹏飞 \n', '2018年07月06日 18:48', '责任编辑：余鹏飞 ', 'http://news.sina.com.cn/c/gat/2018-07-06/doc-ihexfcvk7268156.shtml', '', '', '35', '观察者网', '2018-07-07 11:09:01.495327');
INSERT INTO `zpspider_tnews` VALUES ('13', 'hexfcvk7235588', '港媒:解放军已发出预警信号“台独”切勿错判形势', '\n　　原标题：港媒：解放军已发出预警信号 “台独”切勿错判形势\n　　2018年6月28日下午，国防部召开6月例行记者会，国防部新闻局局长、国防部新闻发言人吴谦大校回答记者提问。（来源：国防部网）\n　　海外网7月6日电 近半年来，国防部发言人已经两次就解放军军机军舰绕台一事明确表示，解放军一系列行动针对的是岛内“台独”分裂势力。对此，港媒发表评论称，相比于过去的“年度常规计划训练”说法，国防部这两次回应毫不避讳地直接公开挑明针对“台独”，实属罕见。港媒认为，这是解放军在向“台独”势力发出严重预警信号，“台独”势力切莫误判大陆对“台独”的底线。\n　　国防部：解放军一系列行动针对的是“台独”势力\n　　据香港中评社6日报道，继今年4月解放军空军组织多机型战机开展绕岛巡航之后，近日，解放军“济南”号驱逐舰、“黄冈”号护卫舰经台湾东部海域南下，由巴士海峡向西，并且在台湾西南海域逗留。有媒体称，这是解放军首次派出有“中华神盾”之称的052C型驱逐舰执行此类任务。但台湾防务部门却“闷不吭声”没有声张。\n资料图：052C济南舰。（来源：解放军报）\n　　国防部发言人吴谦6月28日回应此问题时谈到三点：第一，台湾是中国的一部分，捍卫国家主权和领土完整是解放军的神圣使命。第二，我们采取的一系列行动，针对的是岛内的“台独”分裂势力，为的是防止台湾民众的福祉因“台独”图谋而受损害。第三，我们将根据台海两岸形势的发展变化，按照计划组织实施相关训练行动。\n　　中评社评论称，国防部发言人字里行间传递出的信号是非常明确的，一是大陆对“台独”的立场是零容忍，二是大陆将积极采取行动解决“台独”问题。这既是对近来“台独”势力动作频频的预警，也是对“美台”军事互动升温的预警。预警是指在危机或危害发生之前，根据以往总结的规律或观测得到的可能性前兆，发出紧急信号。预警的目的是为了减轻或避免危机发生并造成伤害和损失。\n　　那么，为何大陆军方敏感神经会被挑起，发出这样的预警信号？中评社进行了盘点。\n台湾爱国人士持五星红旗在蔡办前参加活动（图源：台媒）\n　　“台独”势力花样百出 挑战大陆底线\n　　首先，“台独”势力花样百出逼近大陆底线。“台独”是一条不可逾越的红线，没有任何商量妥协的余地。比如赖清德多次抛出“台独”言论，自诩“务实的‘台独’工作者”，这是台当局首位在任行政部门负责人。随后，解放军在泉州海域进行了实弹军事演习。此外，自今年年初台当局降低“公投”门坎的相关修订法案实施以来，挑战两岸关系的“公投案”接二连三出现：今年3月，台湾“中选会”通过了所谓“2020奥运正名”的“公投”提案；日前，民进党当局又继续加推“禁止五星红旗”的“公投”提案，甚至助推所谓要“参加国际组织”的“公投”提案等。\n　　评论认为，不论是“明独”还是“暗独”，“台独”势力这一系列挑衅动作，都在挑战着大陆的底线。大陆对台政策在“台独”问题处理上的态度也越来越坚硬和有底气，从“绝不允许”到“绝不容忍台独”，从“反对台独”到“处理台独”、“遏制台独”、再到有能力“挫败台独”，大陆军方也表示将根据台海两岸形势的发展变化，组织实施相关训练行动。\n　　港媒提醒，这样的底线一旦被突破，后果将不堪设想，“台独”势力切莫低估了大陆的决心和能力，更不要低估了这条不可触碰的高压线的危险性。\n　　美国打“台湾牌” “台独”势力蠢蠢欲动\n　　其次，“美台”军事互动升温，美国频出“台湾牌”。而台湾当局为了与大陆作对，也乐于配合，甚至积极主动出谋划策成为美国牵制大陆的筹码。因此，近一年多来“美台”军事互动发展动向格外引人注目。美国通过“台湾旅行法”，并通过“2019年国防授权法案”建议美军参加台湾“汉光演习”。CNN还报道称，美国务院已提出要求派驻海军陆战队前往台湾，以协防“美国在台协会”（AIT），如果这一要求获得批准，将是近40年来美国海军陆战队第一次被派往台湾执行相关任务。\n　　评论称，中方已多次强调，一个中国原则是中美关系的政治基础，美方应当恪守一个中国承诺，不与台湾方面发生任何官方关系和军事往来。而美国在向“台独”势力发出十分危险的信号，让“台独”势力误以为是美国对“台独”的公开支持，“台独”势力以为有了美国的撑腰，就可以更加肆无忌惮大胆地加足“台独”戏码。但美国必须注意的是，正所谓“过犹不及”、“物极必反”，如果美国这张“台湾牌”打过了头，触碰到大陆核心利益底线是非常危险的，更何况，与1996年“台海危机”时相比，如今中国军事等方面综合实力早已今非昔比。\n　　“台独”切莫误判形势 以为可以为所欲为\n　　评论强调，互利共赢、尊重对方核心利益、不冲突、不对抗，这是理性的战略选择。台海两岸形势的发展变化，是大陆军方下一步是否会采取行动、以及采取什么样的行动一个重要的判断标准，这既是危机也是转机。大陆并没有把路完全堵死，只要“台独”势力收起这颗蠢蠢欲动、不切实际的“台独”幻想之心，不再继续“搞事情”，那么大陆军方也将不会有所行动。\n　　评论提醒，“台独”是影响当前两岸关系和平发展的最大威胁，如今大陆军方的预警信号已经发出，“台独”势力切莫误判了大陆的政治定力和决断力，以为有美国“撑腰”就可以为所欲为，以为有“两岸一家亲”的保驾护航就可以平安无事。毋庸置疑，一旦“台独”越过红线，大陆断然会采取措施。（海外网 姜舒译）\n责任编辑：霍宇昂 \n', '2018年07月06日 18:09', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7235588.shtml', '', '', '498', '海外网', '2018-07-07 11:09:01.500327');
INSERT INTO `zpspider_tnews` VALUES ('14', 'hexfcvk7128264', '贸易战打响后中美双方还会继续谈判吗?外交部回应', '\n　　原标题：2018年7月6日外交部发言人陆慷主持例行记者会\n\n　　应法兰西共和国政府和布基纳法索政府邀请，国务院副总理胡春华将于7月8日至13日对上述两国进行访问。\n　　问：美国政府有关对价值340亿美元的中国产品加征25%关税的措施已于今天正式生效。请问中国外交部对此有何回应？\n　　答：美方这一错误做法公然违反了世界贸易组织规则，将打击全球贸易秩序、引发全球市场动荡、阻碍全球经济复苏。世界范围内更多跨国企业、中小企业和普通消费者都将被殃及，美国的众多行业和公众也已越来越意识到自身将深受其害。\n　　事实上，美国政府近来采取的一系列单边主义和贸易投资保护主义措施已经在世界范围内引起广泛担忧和谴责，也已招致不少国家的反制和报复。\n　　中方始终反对单边主义行径，反对贸易投资保护主义。我们一直在尽最大努力推动有关方面客观认识全球化进程，理性处理贸易关系中出现的分歧和问题，但这需要有关方面相向而行。任何试图单方面施压都是徒劳的，任何人对此不要抱有幻想。在中国自身正当利益受到不公平对待的情况下，中方理所当然作出必要反击。中国商务部新闻发言人今天已表示，我们将及时向世贸组织通报相关情况，我们有决心与世界各国一道，共同维护自由贸易和多边贸易体制。\n　　问：据报道，5日，两艘船只在泰国普吉岛附近倾覆，船上载有133人，多为中国游客。请问外交部能否核实船上有多少中国公民？中国公民伤亡情况如何？\n　　答：当地时间7月5日下午，两艘载有133名游客的游船分别在泰国普吉珊瑚岛、梅通岛倾覆，其中127人为中国游客。截至目前，中国游客中共有78人获救、33人失踪、16人遇难（注：根据最新情况更新）。部分受伤中国游客已紧急送医院救治。鉴于救助工作仍在进行中，我们将及时核实更新有关情况。\n　　党中央、国务院对此高度重视，习近平总书记等中央、国务院领导作出重要指示和批示。外交部第一时间启动应急机制，牵头成立多部委联合工作组正在赶赴泰国协助工作。中国驻泰国使领馆工作组今天早上抵达普吉参与处置，中国驻宋卡总领馆连夜派员赴医院探望伤员，协调院方全力救助，并组织志愿者教师和留学生赶赴各医院提供协助。\n　　目前，泰国普吉府尹已赶赴现场指挥救援，泰国海军、水警、旅游警察等部门派出多艘救援船只和直升机持续联合搜救，泰国陆海空均投入救援。中方对泰方积极搜寻和救治伤员表示感谢，希望泰方继续全力搜救失踪人员，并做好伤员救治、家属安抚及有关善后等工作。\n　　中国政府和中国驻泰使领馆将继续全力为此次事故中中国同胞及其家属提供协助。我这里可以向大家提供有关联系电话：外交部领保中心热线：12308，中国驻泰国使馆求助热线： 0066-642351752，0066-820367651。\n　　我也愿借此机会再次强调一下，近期，海外连续发生涉及中国游客的交通安全事故。进入7月以来，暑期出境游进入高峰期。我们再次提醒赴海外旅游的中国公民提高风险防范意识，切实重视当地政府和有关部门的安全提醒，谨慎安排行程，务必做到安全第一。\n　　问：第一，中方是否已经开始实施加征关税措施？第二，习近平主席与特朗普总统最近一次沟通是在什么时候？不管是就经贸问题还是其他任何问题进行沟通。\n　　答：关于第一个问题，这两天，中国国务院关税税则委员会、中国商务部和海关总署都已发布了消息，在美方对中方片面、不公正加征关税措施生效后，中方对美方部分产品加征关税措施也已经立即生效。\n　　关于第二个问题，中美双方就共同关心的问题一直保持着沟通。至于你问到的具体经贸问题，中方的立场是非常明确和一贯的，美方各层级对此都非常清楚。\n　　问：联合国秘书长任命了新任联合国驻印巴军事观察小组首席军事观察员。中方对此有何评论？\n　　答：我们注意到有关报道。作为巴基斯坦和印度共同的邻国和朋友，中方希望巴印双方继续通过对话协商，冷静、妥善处理有关问题，共同致力于维护南亚地区的和平与稳定。\n　　问：金砖国家第八次经贸部长会议昨天在南非约翰内斯堡举行。我们知道主要是中国经济部门负责人参与了此次会议，请问外交部对此次会议有何看法？\n　　答：7月5日，金砖国家第八次经贸部长会议在南非约翰内斯堡举行。会议主要是为将于本月25—27日举行的金砖国家领导人约翰内斯堡会晤在经贸方面做准备。关于会议具体情况，中方已经发布了消息，你可以查阅。\n　　此次会议的背景十分独特，是在当前国际经贸形势复杂严峻、单边主义和贸易投资保护主义抬头的情况下举行的。你可能已经注意到，会议发表了金砖国家支持多边贸易体制、反对单边主义和保护主义的单独声明。声明强调，金砖国家致力于坚定维护以世贸组织为核心、以规则为基础、透明、非歧视、开放和包容的多边贸易体制，坚决反对单边主义和保护主义，特别是对当前不符合世贸组织规则、将多边贸易体制置于危机中的单边措施予以强烈关注。声明呼吁世贸组织成员恪守世贸组织规则，信守多边贸易体制承诺，共同加强世贸组织，全力应对当前多边贸易体制面临的严峻挑战。\n　　我想这不仅反映了金砖国家的共同看法，也反映了国际社会的普遍心声。中国有句话叫得道多助，失道寡助。我想，任何违背经济规律、违背国际共识、逆潮流而动的做法，都是没有出路的，也是注定要付出代价的。\n　　问：第一，中方对美方部分产品加征关税措施是否已经开始实施？具体开始时间是什么？第二，在过去24小时内中美双方是否就该问题进行磋商或对话？\n　　答：我刚才已经回答了类似问题。关于第一个问题，这两天，中国国务院关税税则委员会、商务部和海关总署都已发布了消息，在美方对中方片面、不公正加征关税措施生效后，中方对美方部分产品加征关税措施也已经立即生效。\n　　关于第二个问题，自从美方挑起中美贸易摩擦之后，中美双方就该问题保持着沟通。中方一直尽自己最大努力推动有关方面客观认识、理性处理双边贸易中出现的分歧和问题，这一立场是明确、一贯的。美方对中方的立场从一开始就十分清楚。\n\n　　问：据报道，近日，赞比亚总统伦古出席了在赞比亚东方省某小学举行的“万村通”项目启动仪式。中国驻赞比亚使馆也派官员出席。在上周举行的中非媒体合作论坛上，“万村通”工程也是非洲媒体和同行口中的一个高频词汇。你能否介绍一下“万村通”项目进展情况，以及该项目在中非人文交流中所扮演的角色？\n　　答：“万村通”数字卫星电视项目是习近平主席在2015年中非合作论坛约翰内斯堡峰会上宣布的对非援助举措之一，目的是为了丰富非洲当地人民文化生活，促进中非文化交流和民心相通。项目已于去年8月正式启动，正在具备条件的25个非洲国家的1万个村落接入数字电视信号。赞比亚“万村通”项目是整个“万村通”项目的一部分。令我们非常高兴的是，这些天，赞比亚偏远地区的小学生们已经能够通过该项目收看到今年世界杯足球赛了！\n　　当前，中非各领域合作快速发展，包括“万村通”在内的一大批合作项目有力支持了非洲经济多元化发展和自主可持续发展。今年9月将举行中非合作论坛北京峰会，对中非全面战略合作伙伴关系作出新的规划。我们愿与广大非洲兄弟一道，致力于合作共赢、共同发展，为中国和非洲人民带来更多的获得感。\n　　问：中方能否介绍受中方加征关税影响的美国商品的总价值及商品清单？\n　　答：你问到的这些涉及征税的具体问题，建议你向有关主管部门了解。\n　　问：你刚才宣布了胡春华副总理将访问布基纳法索的消息。我们知道，中布两国复交刚刚一个多月，那么这次中国政府代表团访问布基纳法索有什么特殊的意义？访问都有哪些安排？中方对此访的主要期待是什么？\n　　答：5月26日，中国和布基纳法索在北京签署两国复交联合公报，正式宣布恢复大使级外交关系。中布复交后，两国关系发展顺利，各部门全面恢复交往联系，各领域合作有序展开。布基纳法索总统卡博雷将应邀出席于今年9月召开的中非合作论坛北京峰会。\n　　胡春华副总理即将对布基纳法索的访问是中布复交以来首个中国政府代表团往访，距离复交仅仅1个多月时间，体现了中布两国政府对双边关系的高度重视。\n　　胡春华副总理访布期间，将会见卡博雷总统，同蒂耶巴总理举行会谈，就中布关系、中非合作论坛北京峰会以及共同关心的其他问题交换意见。胡春华副总理还将同布方领导人共同出席中国驻布基纳法索使馆开馆仪式。\n　　事实证明，中布复交完全符合两国人民的根本和长远利益，将为布基纳法索国家发展开辟更广阔前景，为布人民带来实实在在的福祉。我们相信，此访将为增进两国政治互信，全面推进各领域友好合作，深化两国人民的了解和友谊发挥重要作用，为中布关系未来发展注入强劲动力。\n　　问：制造东京地铁沙林毒气事件的“奥姆真理教教主”麻原彰晃今天上午在东京被执行死刑。中方对此有何评论？\n　　答：中方当年就对邪教分子制造这一令人发指事件、造成大量平民伤亡表示谴责。\n　　问：中国外交部和商务部此前都表示中美谈判的大门是敞开的。请问贸易战打响后，中美双方是否还会继续谈判？\n　　答：我想强调的是，就中方而言，我们并不希望贸易分歧扩大为贸易争端或贸易冲突，更不希望看到贸易战，因为贸易战不会给任何国家、任何企业和任何个人带来好处。从一开始，中方就作出了最大努力，希望有关方面能够客观认识全球化进程，包括在全球化进程中出现的一些情况，能够理性处理好有关贸易关系中存在的分歧，但这需要有关方面相向而行。\n　　任何一方试图在贸易关系中采取霸凌主义的做法是不可能得逞的。中方这一立场是一贯的，也是非常明确的。美方各层级从一开始对中方这一立场就是非常清楚的。\n\n责任编辑：霍宇昂 \n', '2018年07月06日 18:27', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/o/2018-07-06/doc-ihexfcvk7128264.shtml', '', '', '24', '外交部网站', '2018-07-07 11:09:01.509828');
INSERT INTO `zpspider_tnews` VALUES ('15', 'hexfcvk7125619', '普吉岛翻船事故沉船画面曝光 事故海域浪高5米', '\n\n\n\n				SINA_TEXT_PAGE_INFO[\'videoDatas0\'] = [						{\n							ad_state: \'1\',\n							pid: \'1\',\n							video_id: 259953549,	//vid\n							pic: \'//n.sinaimg.cn/translate/415/w608h607/20180706/MItB-hexfcvk7414321.jpg\',		//节目列表小图\n							thumbUrl: \'//n.sinaimg.cn/translate/415/w608h607/20180706/MItB-hexfcvk7414321.jpg\',	//html5播放器上视频还未开始播显示的图片，可与pic相同\n							title: \'普吉岛沉船已致遇难者升至40人，温州游客亲历普吉岛大风暴：大脑一片空白，就像坐过山车…\',	//标题\n							source: \'\',	//视频发布来源。如：新华网。\n							url: \'http://k.sina.cn/article_1739114873_m67a8c979019007faz.html?from=news&subch=onews\'\n						},						{\n							ad_state: \'1\',\n							pid: \'1\',\n							video_id: 259959416,	//vid\n							pic: \'//n.sinaimg.cn/front/0/w1024h576/20180706/20vV-hexfcvk8024072.jpg\',		//节目列表小图\n							thumbUrl: \'//n.sinaimg.cn/front/0/w1024h576/20180706/20vV-hexfcvk8024072.jpg\',	//html5播放器上视频还未开始播显示的图片，可与pic相同\n							title: \'泰国沉船游客家属集结宁波公司外等消息\',	//标题\n							source: \'\',	//视频发布来源。如：新华网。\n							url: \'http://k.sina.cn/article_5044281310_m12ca99fde02000i7sx.html?from=news&subch=onews\'\n						},						{\n							ad_state: \'1\',\n							pid: \'1\',\n							video_id: 259931854,	//vid\n							pic: \'//n.sinaimg.cn/translate/233/w661h372/20180706/6thl-hexfcvk7819626.jpg\',		//节目列表小图\n							thumbUrl: \'//n.sinaimg.cn/translate/233/w661h372/20180706/6thl-hexfcvk7819626.jpg\',	//html5播放器上视频还未开始播显示的图片，可与pic相同\n							title: \'普吉岛沉船浙江游客1死22失联！获救者包括4名儿童，网友亲历生死一刻…出事船长称垃圾卷进排水系统致船体不稳\',	//标题\n							source: \'\',	//视频发布来源。如：新华网。\n							url: \'http://k.sina.cn/article_2426565464_m90a2735801900c5sh.html?from=edu\'\n						}];\n				SinaPage.loadWidget({\n					trigger: {\n					id: \'videoList0\'\n					},\n				require:[\n				{\n					url: \"//sjs2.sinajs.cn/video/sinaplayer/js/page/player_v1.js\"\n				},\n				{\n					url: \"//finance.sina.com.cn/other/src/sinaPageVideo2017.js\"\n				}\n				],\n				onAfterLoad: function () {\n					new SinaPageVideo({ \n						 wrap:\'videoList0\',//播放器外层id \n		 				videoList:SINA_TEXT_PAGE_INFO[\'videoDatas0\']\n				 });\n			}\n			});\n		\n\n　　原标题：祈祷！普吉翻船事故中国游客已有16人死亡、超30人失联\n　　根据中国驻泰国宋卡总领馆最新数据，截至当地时间6日17时，泰国南部普吉海域翻船事故涉事中国游客16人死亡、30人至40人失联，获救游客中5人受伤接受手术、6人留院治疗观察。\n　　事故海域浪高5米\n　　当地时间5日17时45分左右，两艘共载有127名中国游客的船只返回普吉岛途中，突遇特大暴风雨，瞬间发生倾覆。普吉府府尹诺拉帕说，当时事故海域海浪高达5米。\n　　诺拉帕6日中午在普吉府救援指挥中心接受新华社记者采访时说，经过重新计算，今日救援行动开始前有58人失踪，救援行动开始后发现了两名幸存者，其中一名为中国游客，另一名为泰籍船员，因此泰国南部普吉海域翻船事故仍有56人失踪。\n图为运送遗体。（泰国救援力量提供）\n　　失联人员多来自一艘名为“凤凰号”的游船。“凤凰号”已在风浪中倾覆沉没，有分析称失联人员恐被困在沉船内。\n图为沉没的凤凰号。（泰国救援力量提供）\n　　中国驻泰国宋卡总领馆6日在通报中说，事故发生后，驻泰国使领馆高度重视，第一时间启动应急机制。驻宋卡总领馆派工作组连夜赶赴现场，敦促泰有关部门全力搜救，慰问安抚受伤游客，组织志愿者教师和留学生赶赴医院为游客及家属提供协助。\n　　通报说，经协调，泰国海军、水警和旅游警察等相关部门紧急出动数艘救援船、直升机持续进行海上联合搜救，海事局、防灾减灾中心、游客协助中心及各大医院均参与救援工作。驻宋卡总领馆将做好后续处置工作，不放弃任何一丝搜救希望，全力以赴为中国游客及家属提供协助。\n7月5日，在泰国普吉府普吉岛，急救人员救治获救游客。新华社发\n　　驻泰国大使吕健6日同泰国副总理颂奇紧急通电话，要求泰方妥善做好普吉游船倾覆事故搜救和伤者救助等工作。\n　　中国文化和旅游部5日晚已启动应急机制，要求驻泰国旅游办事处了解事故情况，全力配合使领馆做好相关工作。初步了解，涉事中国游客多是通过在线平台订购产品的自由行游客，来自江苏、浙江、广东、辽宁、河南等省。\n　　出事海域什么样\n　　新华社前驻曼谷记者凌朔说，泰国南部实际上分属两个海域，西侧是印度洋海域的安达曼海，东侧是太平洋海域的泰国湾。我们通常知道的泰国南部海岛游分为两大块，一块在印度洋的海岛和海滨，例如普吉岛、攀牙府007岛，它们都在安达曼海；另一块在太平洋海域的泰国湾，例如苏梅岛和象岛。\n　　这两片海域最大的区别是在同一季节风浪反向：每年的7月到9月，普吉岛所在安达曼海域风浪相对大，而苏梅岛所在泰国湾海域相对风平浪静；12月到次年1月，苏梅岛区域的风浪相对大，而普吉岛区域的风浪相对小。当然，台风过境等特殊情形例外。泰国旅游从业者基本都知道这种情况。\n2012年8月1日，一群游客在泰国苏梅岛的海滩上休闲。（新华社记者刘潺摄）\n　　这次翻船事故位于安达曼海。泰国当地人一般不会在这时候去安达曼海域观光，因为很有可能遇到恶劣天气。\n　　出境游关注气候规避风险\n　　凌朔建议，出境游第一要考虑的是气候条件，这会避开很多风险。\n　　游客出行时，一般会关注当地7天至15天的天气预报。而出境游、特别是去海岛游、丛林游时，要特别关注当地气候，这能帮助你确定这个季节去哪个海域风浪出现几率会小一些、去浮潜会不会遇到一些海洋动物。游客应关注当地气象部门等方面发布的相关公告。\n　　2011年6月10日，泰国普吉岛上，泰国和缅甸工人夜间在沙滩上打木桩，以阻止汹涌的海浪侵袭海边的餐馆。 新华社/EPA欧新\n　　驻宋卡总领馆提醒，目前，普吉、甲米、攀牙等泰南安达曼海域已进入雨季，天气多变，海风强劲，海浪汹涌，海况复杂，不适合乘船出海或下海游泳。广大游客务必提高安全意识，事先了解天气海况，遇风高浪急等恶劣天气或海滩插有红旗警示时，切勿冒险下海或乘船出海，确保旅行安全。\n　　泰国旅游业相对发达，但是这些年由于入境游客人数暴增，导致出现有些旅游配套设施跟不上、一些小型旅行社资质不够或风险管控能力比较差等问题。\n　　另外，如果旺季出行的话，特别要选择有资质的旅游服务商。在旅游旺季，一些正规大型的游船公司可能出现一票难求的情况，而如果转而选择小公司或资质存在问题的公司，安全风险就会增加。\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 18:26', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7125619.shtml', '', '', '255', '新华国际', '2018-07-07 11:09:01.515827');
INSERT INTO `zpspider_tnews` VALUES ('16', 'hexfcvk7076396', '大连原常务副市长袁克力被双开', '\n　　据辽宁省纪委监委消息：日前，经辽宁省委批准，辽宁省纪委监委对大连市委原常委、市政府原常务副市长袁克力严重违纪违法问题进行了纪律审查和监察调查。\n　　经查，袁克力严重违反党的政治纪律，对抗组织审查；违反中央八项规定精神，违规接受私营企业主宴请，违规安排下属单位购买超标准车辆作为公务车；违反组织纪律，不如实报告个人有关事项，在组织进行函询时不如实说明问题，利用职务上的便利在干部选拔任用等方面为他人谋取利益并收受财物；违反廉洁纪律，违规收受礼金。利用职务上的便利为他人谋取利益并收受财物涉嫌受贿犯罪。\n　　袁克力身为党员领导干部，理想信念丧失，纪律意识淡薄，严重违反党的纪律，并涉嫌违法犯罪。依据《中国共产党纪律处分条例》、《中华人民共和国监察法》等，经辽宁省纪委常委会会议、省监委会会议研究并报省委批准，决定给予袁克力开除党籍、开除公职处分；收缴其违纪所得；将其涉嫌犯罪问题及所涉款物移送检察机关依法审查、提起公诉。\n　　袁克力简历 \n　　袁克力，男，汉族，1960年10月出生，山东长岛人，1982年8月参加工作，1984年7月加入中国共产党，大学学历。\n　　1978.09--1982.08 哈尔滨电工学院电机专业学生\n　　1982.08--1984.12 大连电机厂助理工程师\n　　1984.12--1988.02 共青团大连市委常委、青工部部长、办公室主任\n　　1988.02--1993.03 共青团大连市委副书记\n　　1993.03--1996.02 辽宁省庄河市副市长\n　　1996.02--2000.07 大连市西岗区副区长\n　　2000.07--2001.01 大连市西岗区委常委、副区长\n　　2001.01--2002.04 大连市西岗区委副书记\n　　2002.04--2002.12 辽宁省普兰店市委副书记、副市长、代市长\n　　2002.12--2004.04 辽宁省普兰店市委副书记、市长\n　　2004.04--2004.08 辽宁省普兰店市委副书记（主持工作）\n　　2004.08--2007.05 辽宁省普兰店市委书记\n　　2007.05--2011.02 大连市甘井子区委书记\n　　2011.02--2011.03 大连市委常委、甘井子区委书记\n　　2011.03--2016.09 大连市委常委、宣传部部长、市社科联（社科院）主席（院长）（其间：2015.03--2015.04 中央党校第64期厅局级干部进修班学习）\n　　2016.09--2018.01 大连市委常委、常务副市长\n　　2018.01--2018.02 大连市委常委\n　　（辽宁省纪委监委）\n责任编辑：霍宇昂 \n', '2018年07月06日 18:19', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7076396.shtml', '', '', '32', '中央纪委国家监委', '2018-07-07 11:09:01.521830');
INSERT INTO `zpspider_tnews` VALUES ('17', 'hexfcvk7060877', '外交部:万村通项目让非偏远地区小学生看到世界杯', '\n　　原标题：外交部：“万村通”项目让非洲偏远地区小学生看到世界杯\n\n　　据报道，近日，赞比亚总统伦古出席了在赞比亚东方省某小学举行的“万村通”项目启动仪式。中国驻赞比亚使馆也派官员出席。中国外交部发言人陆慷在今天（6日）的例行记者会上介绍，“万村通”数字卫星电视项目是习近平主席在2015年中非合作论坛约翰内斯堡峰会上宣布的对非援助举措之一，目的是为了丰富非洲当地人民文化生活，促进中非文化交流和民心相通。项目已于去年8月正式启动，正在具备条件的25个非洲国家的1万个村落接入数字电视信号。赞比亚“万村通”项目是整个“万村通”项目的一部分。令我们高兴的是，赞比亚偏远地区的小学生们已经能够通过该项目收看到今年世界杯足球赛了！\n\n　　当前，中非各领域合作快速发展，包括“万村通”在内的一大批合作项目有力支持了非洲经济多元化发展和自主可持续发展。今年9月将举行中非合作论坛北京峰会，对中非全面战略合作伙伴关系作出新的规划。中方愿与广大非洲兄弟一道，致力于合作共赢、共同发展，为中国和非洲人民带来更多的获得感。（央视记者 申杨）\n　　\n责任编辑：霍宇昂 \n', '2018年07月06日 16:45', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk7060877.shtml', '', '', '0', '央视新闻', '2018-07-07 11:09:01.531328');
INSERT INTO `zpspider_tnews` VALUES ('18', 'hexfcvk6874142', '甘肃文县暴洪泥石流致212个村逾4万人受灾(图)', '\n　　原标题：甘肃文县暴洪泥石流致212个村逾4万人受灾\n图为7月2日文县受灾村里抢险救灾。　钟欣　摄\n　　中新网兰州7月6日电 （记者 南如卓玛）甘肃陇南市文县县委宣传部6日对外通报，6月29日以来，文县连续普降中到大雨，局部地方因短时强降水引发暴洪泥石流，境内“两江八河”水位短时间猛涨，白水江文县城关镇断面流量监测值一度达到每秒436立方米、尚德镇断面流量达到每秒730立方米，为近10年来同期最大值。\n　　截至7月4日下午6时，暴雨洪涝灾害造成全县20个乡镇212个村11082户41649人不同程度受灾，未造成人员伤亡，紧急转移安置327户1275人，初步估算，直接经济损失达27033.93万元。\n图为文县暴洪泥石流抢险救灾现场。　钟欣 摄\n　　道路交通方面，国道212线东峪口至堡子坝陶家湾段、尚德镇横丹电站出水口段等洪水冲毁路段目前已抢通。此外，河水路、何马路等7条省道255.8公里、3条28.712公里县乡公路和65条通村公路750.6公里不同程度受损，堡子坝镇马儿河坝等7个村通村道路尚未抢通。\n　　据通报，截至目前，7条10KV线路受损2.3公里，16个村因灾断电，马儿河坝等7个村尚未恢复供电。同时，14个区域通讯信号中断，尚有8个基站通讯信号未恢复。\n　　据统计，文县暴洪泥石流灾害造成玉米、水稻、油菜籽、花椒、核桃等农作物和白芨、党参等中药材不同程度受灾，受灾面积达891.97公顷，成灾面积达693.85公顷，绝收315.4公顷，冲毁耕地2445亩。\n图为文县暴洪泥石流后道路抢险。　钟欣 摄\n　　灾害发生后，文县对强降雨集中的堡子坝、石坊、中庙等乡镇及时启用山洪泥石流预警系统，紧急转移安置房屋倒塌、受损和泥石流影响群众327户1275人。下拨应急抢险和临时救助资金150万元，调运救灾帐篷15顶、药品三件、矿泉水500件、方便面200件。\n　　与此同时，动员社会各界人士向灾区群众捐款捐物，组织志愿者队伍175人，进入灾区帮助受灾群众。截至目前，已收到捐款14700元，捐助物资折合人民币8.5万元。\n　　据通报，灾情发生后，文县交通部门投入各类机械166台次、人工289人，开展公路水毁抢修工作。截至7月5日下午，铁楼、中寨、桥头、梨坪等乡镇受损公路己全部恢复通车。\n　　目前，文县正在全力开展基础设施抢修和清淤疏浚工作，已紧急出动机械300余台（次），投入人力2000余人次，清理塌方、滑坡及泥石流近5万方。（完）\n责任编辑：霍宇昂 \n', '2018年07月06日 17:42', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/o/2018-07-06/doc-ihexfcvk6874142.shtml', '', '', '4', '中国新闻网', '2018-07-07 11:09:01.537827');
INSERT INTO `zpspider_tnews` VALUES ('19', 'hexfcvk6774274', '哈尔滨人大原副主任贾剑涛被双开:生活放纵不老实', '\n　　原标题：哈尔滨市人大常委会原党组成员、副主任贾剑涛被“双开”\n　　据黑龙江省纪委监委消息：日前，经黑龙江省委批准，黑龙江省纪委监委对哈尔滨市人大常委会原党组成员、副主任贾剑涛严重违纪违法问题进行了纪律审查和监察调查。\n　　经查，贾剑涛严重违反政治纪律，与他人串供，对抗组织审查；违反组织纪律，不按规定如实报告个人有关事项，利用职权为他人谋取人事方面利益并收受钱款；违反廉洁纪律，违规收受礼金，违规买卖股票，搞钱色权色交易；违反工作纪律，违规决定建设重大项目；利用职务上的便利在人事调动、企业转让、工程发包等方面为他人谋取利益并收受钱款，涉嫌受贿犯罪；利用职务上的便利非法占有抢险专项资金，涉嫌贪污犯罪。\n　　贾剑涛身为党员领导干部，理想信念丧失，宗旨意识淡漠，罔顾党纪国法，政治上对党不忠诚、不老实，口头上相信组织，行动上对抗组织，与他人串供并隐匿多套房产；经济上贪婪成性，以权谋私，违规买卖股票攫取暴利，将国家项目工程建设当成自己的“摇钱树”，侵吞国家特定资金；工作上擅权妄为，违规决策，影响恶劣；生活放纵，搞钱色权色交易，并涉嫌受贿、贪污犯罪，且在党的十八大之后仍不收敛、不收手，性质恶劣、情节严重，应予严肃处理。依据《中国共产党纪律处分条例》《中华人民共和国监察法》等有关规定，经省纪委常委会议、省监委委务会议审议并报省委批准，决定给予贾剑涛开除党籍、开除公职处分；收缴其违纪所得；将其涉嫌犯罪问题及所涉钱款移送检察机关依法审查、提起公诉。\n　　贾剑涛简历\n　　贾剑涛，男，汉族，1959年9月生，黑龙江木兰人，1976年6月参加工作，1978年11月加入中国共产党，齐齐哈尔轻工学院轻机系自动化控制专业和哈尔滨工业大学管理学院工商管理专业毕业，省委党校研究生学历，工学学士、工商管理硕士学位，高级经济师、高级政工师。\n　　1976.06—1978.08　黑龙江省呼兰县白奎公社知青\n　　1978.08—1982.08　齐齐哈尔轻工学院轻机系自动化控制专业学习\n　　1982.08—1984.12　哈尔滨市二轻局组织部干事\n　　1984.12—1989.09　哈尔滨电焊机厂厂长（其间：1987.09—1989.07黑龙江省委党校行政管理专业在职研究生学习）\n　　1989.09—1991.01　哈尔滨市委组织部干部三处科级干事\n　　1991.01—1991.10　哈尔滨市计委质量处副处长\n　　1991.10—1995.02　哈尔滨市经委质量处副处长\n　　1995.02—1995.05　哈尔滨市机械局党委组织部副部长\n　　1995.05—1998.01　哈尔滨市机械局党委组织部部长\n　　1998.01—2000.04　哈尔滨市机械局党委副书记兼纪委书记\n　　2000.04—2000.06　哈尔滨市机械局党委书记\n　　2000.06—2004.08　哈尔滨市机械局党委书记、局长，哈尔滨金工资产经营有限公司董事长、总经理\n　　2004.08—2005.12　哈尔滨机械控股有限公司董事长、党委书记、总经理\n　　（2003.11—2005.12哈尔滨工业大学管理学院工商管理专业在职研究生学习，获工商管理硕士学位；2003.05—2005.12兼任哈尔滨空调股份公司董事长）\n　　2005.12—2006.01　哈尔滨市交通局党委书记\n　　2006.01—2010.01　哈尔滨市交通局局长、党委书记\n　　2010.01—2012.02　哈尔滨市交通运输局局长、党委书记\n　　2012.02—2014.11　哈尔滨市呼兰区委书记\n　　2014.11—2014.12　哈尔滨市副市长人选、呼兰区委书记\n　　2014.12—2015.01　哈尔滨市副市长、呼兰区委书记\n　　2015.01—2017.01　哈尔滨市副市长\n　　2017.01—2018.04　哈尔滨市人大常委会党组成员、副主任\n　　2018.04 免职\n责任编辑：霍宇昂 \n', '2018年07月06日 17:31', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk6774274.shtml', '', '', '278', '央视新闻', '2018-07-07 11:09:01.542856');
INSERT INTO `zpspider_tnews` VALUES ('20', 'hexfcvk6721243', '航站楼可放下水立方 北京新机场内部究竟长啥样？', '\n\n\n\n				SINA_TEXT_PAGE_INFO[\'videoDatas0\'] = [						{\n							ad_state: \'1\',\n							pid: \'1\',\n							video_id: 259947123,	//vid\n							pic: \'//n.sinaimg.cn/news/transform/59/w550h309/20180706/hWSO-hexfcvk6758628.jpg\',		//节目列表小图\n							thumbUrl: \'//n.sinaimg.cn/news/transform/59/w550h309/20180706/hWSO-hexfcvk6758628.jpg\',	//html5播放器上视频还未开始播显示的图片，可与pic相同\n							title: \'视频|凤凰初展颜：央视记者探访在建北京新机场\',	//标题\n							source: \'\',	//视频发布来源。如：新华网。\n							url: \'http://video.sina.com.cn/p/news/o/doc/2018-07-06/174168917536.html\'\n						}];\n				SinaPage.loadWidget({\n					trigger: {\n					id: \'videoList0\'\n					},\n				require:[\n				{\n					url: \"//sjs2.sinajs.cn/video/sinaplayer/js/page/player_v1.js\"\n				},\n				{\n					url: \"//finance.sina.com.cn/other/src/sinaPageVideo2017.js\"\n				}\n				],\n				onAfterLoad: function () {\n					new SinaPageVideo({ \n						 wrap:\'videoList0\',//播放器外层id \n		 				videoList:SINA_TEXT_PAGE_INFO[\'videoDatas0\']\n				 });\n			}\n			});\n		\n\n　　原标题：航站楼里可放下一个水立方？！北京新机场内部究竟长啥样？\n　　民航局今天（6日）宣布，\n　　北京新机场已经进入全面装修和设施安装阶段。\n　　预计明年6月30日竣工验收，\n　　9月30日投入运营。\n　　目前，北京新机场的航站楼已经封顶封围，\n　　从空中看，\n　　它就像是一只展翅欲飞的钢铁凤凰，\n　　而它的内部竟然可以放下一个水立方？！\n　　戳视频，央视记者带你一探究竟\n　　↓↓↓\n　　北京新机场位于北京市大兴区榆垡镇、礼贤镇和河北省廊坊市广阳区的交界处。按直线距离计算，距离天安门46公里，距离首都国际机场67公里，距离天津滨海机场85公里，距离廊坊市中心只有26公里。 \n\n　　北京新机场航站楼的外型被形容为凤凰展翅，看上去也像是五指张开。这样的设计不仅可以设置更多的进机位，而且也使航站楼中心到最远端登机口步行距离不超过600米，步行时间不到8分钟。\n\n　　北京新机场航站楼是目前世界上唯一一座“双进双出”的航站楼，即有两个到达层和两个出发层，目的是为了解决机场出发、到达集中，落客难等问题。\n\n　　航站楼中央核心区的屋顶是不规则自由曲面、空间网架钢结构，面积18万平方米，用钢量4万多吨，相当于鸟巢的用钢量。航站楼由8根拔地而起的C型柱托起整个屋盖，柱子围成的最大空间可以放下一个水立方。\n\n　　北京新机场建成后，南航，东航将作为主基地航空公司，整体搬迁到新机场。另外，天合联盟的20家航空公司也都将整体搬入新机场。\n责任编辑：霍宇昂 \n', '2018年07月06日 17:25', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk6721243.shtml', '', '', '0', '央视新闻', '2018-07-07 11:09:01.548330');
INSERT INTO `zpspider_tnews` VALUES ('21', 'hexfcvk6553152', '外交部回应泰国游船事故:多部委联合工作组正赴泰', '\n　　原标题：外交部：中泰积极处置普吉岛附近游船倾覆事故\n　　[环球网综合报道]2018年7月6日外交部发言人陆慷主持例行记者会，有记者问道，据报道，5日，两艘船只在泰国普吉岛附近倾覆，船上载有133人，多为中国游客。请问外交部能否核实船上有多少中国公民？中国公民伤亡情况如何？\n　　陆慷回应称，7月5日下午，两艘载有133名游客的游船分别在泰国普吉珊瑚岛、梅通岛倾覆，其中127人为中国游客。截至今天中午12点，中国游客中共有78人获救、47人失踪、2人遇难。部分受伤中国游客已紧急送医院救治。\n　　党中央、国务院对此高度重视，习近平总书记等中央、国务院领导作出重要指示、批示。外交部第一时间启动应急机制，牵头成立多部委联合工作组正赶赴泰国协助工作。中国驻泰国使领馆工作组今早抵普吉参与处置，中国驻宋卡总领馆连夜派员赴医院探望伤员，协调院方全力救助，并组织志愿者教师、留学生赶赴各医院提供协助。\n　　目前，普吉府尹已赶赴现场指挥救援，泰国海军、水警、旅游警察等部门派出多艘救援船只和直升机持续联合搜救，泰国陆海空均投入救援。中方对泰方积极搜寻和救治伤员表示感谢，希望泰方继续全力搜救失踪人员，并做好伤员救治、家属安抚及有关善后等工作。\n　　中国政府和中国驻泰使领馆将继续全力为此次事故中中国同胞及其家属提供协助。\n　　[外交部领保中心热线：12308，驻泰使馆求助热线：0066-642351752，0066-820367651。]\n　　近期，海外连续发生涉及中国游客的交通安全事故。进入7月以来，暑期出境游进入高峰期。我们再次提醒赴海外旅游的中国公民提高风险防范意识，重视当地政府和有关部门的安全提醒，谨慎安排行程，安全第一。\n\n点击进入专题：\n泰国普吉岛游船翻覆已致多人遇难 乘客大部分是中国人\n责任编辑：霍宇昂 \n', '2018年07月06日 16:49', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk6553152.shtml', '', '', '0', '环球网', '2018-07-07 11:09:01.553828');
INSERT INTO `zpspider_tnews` VALUES ('22', 'hexfcvk6553169', '胡春华将访问布基纳法索有何特殊意义?外交部回应', '\n　　原标题：胡春华副总理将访问布基纳法索有何特殊的意义？外交部回应\n　　[环球网综合报道]2018年7月6日外交部发言人陆慷主持例行记者会，你刚才宣布了胡春华副总理将访问布基纳法索的消息。我知道，中布两国复交刚刚一个多月，那么这次中国政府代表团访问布基纳法索有什么特殊的意义？访问都有哪些安排？中方对此访的主要期待是什么？\n　　陆慷回应称，5月26日，中国和布基纳法索在北京签署两国复交联合公报，正式宣布恢复大使级外交关系。中布复交后，两国关系发展顺利，各部门全面恢复交往联系，各领域合作有序展开。布基纳法索总统卡博雷将应邀出席于今年9月召开的中非合作论坛北京峰会。\n　　胡春华副总理即将对布基纳法索的访问是中布复交以来首个中国政府代表团往访，距离复交仅仅1个多月时间，体现了中布两国政府对双边关系的高度重视。\n　　胡春华副总理访布期间，将会见卡博雷总统，同蒂耶巴总理举行会谈，就中布关系、中非合作论坛北京峰会以及共同关心的其他问题交换意见。胡春华副总理还将同布方领导人共同出席中国驻布基纳法索使馆开馆仪式。\n　　事实证明，中布复交完全符合两国人民的根本和长远利益，将为布基纳法索国家发展开辟更广阔前景，为布人民带来实实在在的福祉。我们相信，此访将为增进两国政治互信，全面推进各领域友好合作，深化两国人民的了解和友谊发挥重要作用，为中布关系未来发展注入强劲动力。\n责任编辑：霍宇昂 \n', '2018年07月06日 16:54', '责任编辑：霍宇昂 ', 'http://news.sina.com.cn/c/nd/2018-07-06/doc-ihexfcvk6553169.shtml', '', '', '0', '环球网', '2018-07-07 11:09:01.562831');
