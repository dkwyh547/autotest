/*
 Navicat MySQL Data Transfer

 Source Server         : django
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : autotest

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 22/01/2019 19:11:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apitest_apis
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apis`;
CREATE TABLE `apitest_apis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apiname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiparamvalue` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apimethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiresult` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apistatus` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apitest_apis_Product_id_d86ce861_fk_product_product_id`(`Product_id`) USING BTREE,
  CONSTRAINT `apitest_apis_Product_id_d86ce861_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apitest_apis
-- ----------------------------
INSERT INTO `apitest_apis` VALUES (1, '登录', 'http://127.0.0.1:8000/login', 'null', '0', 'login', 0, '2019-01-13 07:55:37.660863', 4);

-- ----------------------------
-- Table structure for apitest_apistep
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apistep`;
CREATE TABLE `apitest_apistep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apiname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apistep` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apiparamvalue` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apimethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apiresult` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apistatus` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Apitest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apitest_apistep_Apitest_id_ceefdb33_fk_apitest_apitest_id`(`Apitest_id`) USING BTREE,
  CONSTRAINT `apitest_apistep_Apitest_id_ceefdb33_fk_apitest_apitest_id` FOREIGN KEY (`Apitest_id`) REFERENCES `apitest_apitest` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apitest_apistep
-- ----------------------------
INSERT INTO `apitest_apistep` VALUES (2, 'test', 'test', 'test', 'test', 'get', 'test', 'test', '2019-01-11 14:20:28.478759', 2);
INSERT INTO `apitest_apistep` VALUES (3, 'test', 'http://127.0.0.1:8000/', 'test', 'test', 'get', 'test', 'test', '2019-01-11 14:22:31.858857', 3);

-- ----------------------------
-- Table structure for apitest_apitest
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apitest`;
CREATE TABLE `apitest_apitest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apitestname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apitestdesc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apitester` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apitestresult` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apitest_apitest_Product_id_260d36dd_fk_product_product_id`(`Product_id`) USING BTREE,
  CONSTRAINT `apitest_apitest_Product_id_260d36dd_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apitest_apitest
-- ----------------------------
INSERT INTO `apitest_apitest` VALUES (2, 'test', 'test', 'test', 1, '2019-01-11 14:20:28.476767', 1);
INSERT INTO `apitest_apitest` VALUES (3, 'test', 'test', 'test', 0, '2019-01-11 14:22:31.855896', 1);

-- ----------------------------
-- Table structure for apptest_appcase
-- ----------------------------
DROP TABLE IF EXISTS `apptest_appcase`;
CREATE TABLE `apptest_appcase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appcasename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apptestresult` tinyint(1) NOT NULL,
  `apptester` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apptest_appcase_Product_id_2cfe383a_fk_product_product_id`(`Product_id`) USING BTREE,
  CONSTRAINT `apptest_appcase_Product_id_2cfe383a_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apptest_appcase
-- ----------------------------
INSERT INTO `apptest_appcase` VALUES (1, 'test', 0, 'Jhin•W', '2019-01-14 12:08:57.979268', 3);

-- ----------------------------
-- Table structure for apptest_appcasestep
-- ----------------------------
DROP TABLE IF EXISTS `apptest_appcasestep`;
CREATE TABLE `apptest_appcasestep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appteststep` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apptestobjname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appfindmethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appevelement` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appoptmethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apptestdata` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appassertdata` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apptestresult` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Appcase_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apptest_appcasestep_Appcase_id_f2f5be83_fk_apptest_appcase_id`(`Appcase_id`) USING BTREE,
  CONSTRAINT `apptest_appcasestep_Appcase_id_f2f5be83_fk_apptest_appcase_id` FOREIGN KEY (`Appcase_id`) REFERENCES `apptest_appcase` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apptest_appcasestep
-- ----------------------------
INSERT INTO `apptest_appcasestep` VALUES (1, '第一步', '返回按钮', 'find', 'test', 'test', 'test', 'test', 0, '2019-01-14 12:08:57.980246', 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 产品管理', 7, 'add_product');
INSERT INTO `auth_permission` VALUES (26, 'Can change 产品管理', 7, 'change_product');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 产品管理', 7, 'delete_product');
INSERT INTO `auth_permission` VALUES (28, 'Can view 产品管理', 7, 'view_product');
INSERT INTO `auth_permission` VALUES (29, 'Can add apistep', 8, 'add_apistep');
INSERT INTO `auth_permission` VALUES (30, 'Can change apistep', 8, 'change_apistep');
INSERT INTO `auth_permission` VALUES (31, 'Can delete apistep', 8, 'delete_apistep');
INSERT INTO `auth_permission` VALUES (32, 'Can view apistep', 8, 'view_apistep');
INSERT INTO `auth_permission` VALUES (33, 'Can add 流程场景接口', 9, 'add_apitest');
INSERT INTO `auth_permission` VALUES (34, 'Can change 流程场景接口', 9, 'change_apitest');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 流程场景接口', 9, 'delete_apitest');
INSERT INTO `auth_permission` VALUES (36, 'Can view 流程场景接口', 9, 'view_apitest');
INSERT INTO `auth_permission` VALUES (37, 'Can add 单一场景接口', 10, 'add_apis');
INSERT INTO `auth_permission` VALUES (38, 'Can change 单一场景接口', 10, 'change_apis');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 单一场景接口', 10, 'delete_apis');
INSERT INTO `auth_permission` VALUES (40, 'Can view 单一场景接口', 10, 'view_apis');
INSERT INTO `auth_permission` VALUES (41, 'Can add bug 管理', 11, 'add_bug');
INSERT INTO `auth_permission` VALUES (42, 'Can change bug 管理', 11, 'change_bug');
INSERT INTO `auth_permission` VALUES (43, 'Can delete bug 管理', 11, 'delete_bug');
INSERT INTO `auth_permission` VALUES (44, 'Can view bug 管理', 11, 'view_bug');
INSERT INTO `auth_permission` VALUES (45, 'Can add 系统设置', 12, 'add_set');
INSERT INTO `auth_permission` VALUES (46, 'Can change 系统设置', 12, 'change_set');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 系统设置', 12, 'delete_set');
INSERT INTO `auth_permission` VALUES (48, 'Can view 系统设置', 12, 'view_set');
INSERT INTO `auth_permission` VALUES (49, 'Can add appcasestep', 13, 'add_appcasestep');
INSERT INTO `auth_permission` VALUES (50, 'Can change appcasestep', 13, 'change_appcasestep');
INSERT INTO `auth_permission` VALUES (51, 'Can delete appcasestep', 13, 'delete_appcasestep');
INSERT INTO `auth_permission` VALUES (52, 'Can view appcasestep', 13, 'view_appcasestep');
INSERT INTO `auth_permission` VALUES (53, 'Can add app 测试用例', 14, 'add_appcase');
INSERT INTO `auth_permission` VALUES (54, 'Can change app 测试用例', 14, 'change_appcase');
INSERT INTO `auth_permission` VALUES (55, 'Can delete app 测试用例', 14, 'delete_appcase');
INSERT INTO `auth_permission` VALUES (56, 'Can view app 测试用例', 14, 'view_appcase');
INSERT INTO `auth_permission` VALUES (57, 'Can add web 测试用例', 15, 'add_webcase');
INSERT INTO `auth_permission` VALUES (58, 'Can change web 测试用例', 15, 'change_webcase');
INSERT INTO `auth_permission` VALUES (59, 'Can delete web 测试用例', 15, 'delete_webcase');
INSERT INTO `auth_permission` VALUES (60, 'Can view web 测试用例', 15, 'view_webcase');
INSERT INTO `auth_permission` VALUES (61, 'Can add webcasestep', 16, 'add_webcasestep');
INSERT INTO `auth_permission` VALUES (62, 'Can change webcasestep', 16, 'change_webcasestep');
INSERT INTO `auth_permission` VALUES (63, 'Can delete webcasestep', 16, 'delete_webcasestep');
INSERT INTO `auth_permission` VALUES (64, 'Can view webcasestep', 16, 'view_webcasestep');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$FLfC3Y0RNSUj$gWyoMeVaOoIRU+Z2yXMg6a+ATDyM1LVxR14KZ9uqokE=', '2019-01-11 14:00:26.580289', 1, 'admin', '', '', '261229090@qq.com', 1, 1, '2019-01-03 13:26:19.298490');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$120000$YMjK8wVVFc7f$gASli8grjU22bBFR0qZMNBHlWhni5MJl4gLHKXA1IeU=', NULL, 0, 'test', '', '', '', 1, 1, '2019-01-07 13:48:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES (1, 2, 1);
INSERT INTO `auth_user_user_permissions` VALUES (2, 2, 2);
INSERT INTO `auth_user_user_permissions` VALUES (3, 2, 3);
INSERT INTO `auth_user_user_permissions` VALUES (4, 2, 4);
INSERT INTO `auth_user_user_permissions` VALUES (5, 2, 17);
INSERT INTO `auth_user_user_permissions` VALUES (6, 2, 18);
INSERT INTO `auth_user_user_permissions` VALUES (7, 2, 19);
INSERT INTO `auth_user_user_permissions` VALUES (8, 2, 20);
INSERT INTO `auth_user_user_permissions` VALUES (9, 2, 21);
INSERT INTO `auth_user_user_permissions` VALUES (10, 2, 22);
INSERT INTO `auth_user_user_permissions` VALUES (11, 2, 23);
INSERT INTO `auth_user_user_permissions` VALUES (12, 2, 24);

-- ----------------------------
-- Table structure for bug_bug
-- ----------------------------
DROP TABLE IF EXISTS `bug_bug`;
CREATE TABLE `bug_bug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bugname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugdetail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buglevel` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bugcreater` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugassign` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `Product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bug_bug_Product_id_5f035205_fk_product_product_id`(`Product_id`) USING BTREE,
  CONSTRAINT `bug_bug_Product_id_5f035205_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-01-07 13:48:05.315768', '2', 'test', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-01-07 13:50:32.666009', '2', 'test', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"user_permissions\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-01-07 14:24:57.475798', '1', 'web产品', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-01-07 14:25:36.676029', '2', '自动化平台', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-01-07 14:29:01.873073', '3', 'APP产品', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-01-07 14:29:10.620337', '2', '自动化平台', 2, '[{\"changed\": {\"fields\": [\"producter\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-01-07 14:29:13.676242', '3', 'APP产品', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-01-07 14:29:18.210433', '1', 'web产品', 2, '[{\"changed\": {\"fields\": [\"producter\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-01-07 14:29:37.687019', '4', '商城', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-01-09 14:13:37.949573', '1', 'test', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"test\"}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-01-09 14:13:40.911648', '1', 'test', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-01-09 14:14:05.397942', '1', 'test', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-01-11 14:20:28.480753', '2', 'test', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"test\"}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-01-11 14:22:31.861855', '3', 'test', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"test\"}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-01-13 07:54:04.633141', '1', 'test', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-01-13 07:55:37.675815', '1', '登录', 2, '[{\"changed\": {\"fields\": [\"Product\", \"apiname\", \"apiurl\", \"apiparamvalue\", \"apiresult\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-01-14 12:08:57.983253', '1', 'test', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u7b2c\\u4e00\\u6b65\"}}]', 14, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (10, 'apitest', 'apis');
INSERT INTO `django_content_type` VALUES (8, 'apitest', 'apistep');
INSERT INTO `django_content_type` VALUES (9, 'apitest', 'apitest');
INSERT INTO `django_content_type` VALUES (14, 'apptest', 'appcase');
INSERT INTO `django_content_type` VALUES (13, 'apptest', 'appcasestep');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (11, 'bug', 'bug');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'product', 'product');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'set', 'set');
INSERT INTO `django_content_type` VALUES (15, 'webtest', 'webcase');
INSERT INTO `django_content_type` VALUES (16, 'webtest', 'webcasestep');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-01-03 13:21:11.141868');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-01-03 13:21:19.691997');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-01-03 13:21:21.625825');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-01-03 13:21:21.689654');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-01-03 13:21:21.738523');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-01-03 13:21:22.993167');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-01-03 13:21:23.784052');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-01-03 13:21:24.622808');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-01-03 13:21:24.696611');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-01-03 13:21:25.367815');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-01-03 13:21:25.425661');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-01-03 13:21:25.497469');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-01-03 13:21:26.326256');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-01-03 13:21:27.107163');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2019-01-03 13:21:27.624778');
INSERT INTO `django_migrations` VALUES (16, 'product', '0001_initial', '2019-01-07 14:10:56.063464');
INSERT INTO `django_migrations` VALUES (17, 'apitest', '0001_initial', '2019-01-09 14:00:24.320343');
INSERT INTO `django_migrations` VALUES (18, 'apitest', '0002_apis', '2019-01-13 07:52:58.839632');
INSERT INTO `django_migrations` VALUES (19, 'bug', '0001_initial', '2019-01-13 08:46:07.345483');
INSERT INTO `django_migrations` VALUES (20, 'set', '0001_initial', '2019-01-13 12:16:13.850298');
INSERT INTO `django_migrations` VALUES (21, 'apptest', '0001_initial', '2019-01-14 12:02:24.359232');
INSERT INTO `django_migrations` VALUES (22, 'apptest', '0002_auto_20190116_2037', '2019-01-16 12:37:38.201979');
INSERT INTO `django_migrations` VALUES (23, 'webtest', '0001_initial', '2019-01-16 12:37:40.685738');
INSERT INTO `django_migrations` VALUES (24, 'product', '0002_auto_20171226_1051', '2019-01-22 11:03:55.062315');
INSERT INTO `django_migrations` VALUES (25, 'product', '0003_auto_20171230_1054', '2019-01-22 11:03:55.251804');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('8zuunwe26v9z97b9rwnxui1etxtrymjc', 'YjlkZjYwZDRiMzJkNDdkYWU4NWMwNWFmYTg0OGIyNmRlNDU5MzY3NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzhiNDc1ODA5MTdmMGVhMmVlZTMxZWI2M2I3OGQ2YWEzYTJiMmM4IiwidXNlciI6ImFkbWluIn0=', '2019-01-25 14:00:26.677056');

-- ----------------------------
-- Table structure for product_product
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productdesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `producter` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_product
-- ----------------------------
INSERT INTO `product_product` VALUES (1, 'web产品', '百度搜索', 'jhin•W', '2019-01-07 14:29:18.209459');
INSERT INTO `product_product` VALUES (2, '自动化平台', '包含API、WebUI、AppUI自动化测试', 'jhin•W', '2019-01-07 14:29:10.620337');
INSERT INTO `product_product` VALUES (3, 'APP产品', '计算器、Csdn', 'jhin•W', '2019-01-07 14:29:13.672233');
INSERT INTO `product_product` VALUES (4, '商城', '图书', 'jhin•W', '2019-01-07 14:29:37.686015');

-- ----------------------------
-- Table structure for set_set
-- ----------------------------
DROP TABLE IF EXISTS `set_set`;
CREATE TABLE `set_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setvalue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for webtest_webcase
-- ----------------------------
DROP TABLE IF EXISTS `webtest_webcase`;
CREATE TABLE `webtest_webcase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webcasename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webtestresult` tinyint(1) NOT NULL,
  `webtester` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `webtest_webcase_Product_id_dfe176e9_fk_product_product_id`(`Product_id`) USING BTREE,
  CONSTRAINT `webtest_webcase_Product_id_dfe176e9_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for webtest_webcasestep
-- ----------------------------
DROP TABLE IF EXISTS `webtest_webcasestep`;
CREATE TABLE `webtest_webcasestep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webcasename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webteststep` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webtestobjname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webfindmethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webevelement` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weboptmethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webtestdata` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `webassertdata` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `webtestresult` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Webcase_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `webtest_webcasestep_Webcase_id_c8229174_fk_webtest_webcase_id`(`Webcase_id`) USING BTREE,
  CONSTRAINT `webtest_webcasestep_Webcase_id_c8229174_fk_webtest_webcase_id` FOREIGN KEY (`Webcase_id`) REFERENCES `webtest_webcase` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
