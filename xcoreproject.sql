/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 27/03/2020 11:07:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ImgUrl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址，oss地址',
  `Title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `Url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片指向链接',
  `Remark` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `ModifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `ModifyBy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `Online` tinyint(3) DEFAULT NULL COMMENT '(0上线，5暂时下架，10过期)',
  `EffecitiveTime` datetime DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for clientusers
-- ----------------------------
DROP TABLE IF EXISTS `clientusers`;
CREATE TABLE `clientusers`  (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `Status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态 (0 有效 5 临时锁定,10 禁用10天,20 废弃 )以5递增',
  `UserCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户编码',
  `LoginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `Pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码md5',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `RealName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `Phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `UserType` tinyint(3) NOT NULL DEFAULT 0 COMMENT '用户类型 （0 没有实名个人，5 已实名个人 10 企业 15 已实名企业 ）',
  `VipLevel` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'vip等级 (0 没有vip,10 vip1,20 vip2,30 vip3)',
  `HeadImgUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `Age` tinyint(3) DEFAULT NULL COMMENT '年龄',
  `Sex` bit(3) NOT NULL DEFAULT b'0' COMMENT '性别 0男 1女',
  `OpenId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'openId',
  `Country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地区国家',
  `City` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `Province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份',
  `Remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for clientuserwallets
-- ----------------------------
DROP TABLE IF EXISTS `clientuserwallets`;
CREATE TABLE `clientuserwallets`  (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `ClientUserId` bigint(11) NOT NULL,
  `AvailablePoints` int(11) DEFAULT NULL COMMENT '可用积分',
  `AvailableBonus` decimal(14, 0) DEFAULT NULL COMMENT '可用奖金',
  `FreezePoints` int(11) DEFAULT NULL COMMENT '冻结积分',
  `FreezeBonus` decimal(14, 0) DEFAULT NULL COMMENT '冻结奖金',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for filecenter
-- ----------------------------
DROP TABLE IF EXISTS `filecenter`;
CREATE TABLE `filecenter`  (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BatchId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件批次id',
  `BatchSeq` tinyint(3) NOT NULL COMMENT '批次中的序号 ',
  `FileName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `FileSize` int(11) DEFAULT NULL COMMENT '文件大小',
  `Url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件的网络地址',
  `Status` tinyint(3) NOT NULL COMMENT '文件状态（0 有效，10无效）',
  `Remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `FileType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `ExterndAtt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附加属性',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `ParentId` bigint(20) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LinkUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Area` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Controller` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Action` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrderSort` bigint(20) DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IsMenu` tinyint(1) DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (1, 0, NULL, 'values接口', '/api/values', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (2, 0, NULL, 'claims的接口', '/api/claims', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (3, 0, NULL, 'UserRole接口', '/api/UserRole', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (4, 0, NULL, '', '/api/v2/Apb/apbs', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (5, 0, NULL, '修改 tibug 文章', '/api/TopicDetail/update', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (6, 0, NULL, '删除tibug文章', '/api/TopicDetail/delete', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (7, 0, NULL, '获取用户', '/api/user/get', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (8, 0, NULL, '获取用户详情', '/api/user/get/\\d+', '', '', '', '', '', 1, '', 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (9, 1, NULL, '角色接口', '/api/role', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (10, 0, NULL, '添加用户', '/api/user/post', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (11, 0, NULL, '删除用户', '/api/user/delete', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (12, 0, NULL, '修改用户', '/api/user/put', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (13, 0, NULL, '获取api接口', '/api/module/get', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (14, 0, NULL, '删除api接口', '/api/module/delete', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (15, 0, NULL, '修改api接口', '/api/module/put', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (16, 0, NULL, '添加api接口', '/api/module/post', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (17, 0, NULL, '获取菜单', '/api/permission/get', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (18, 0, NULL, '删除菜单', '/api/permission/delete', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (19, 0, NULL, '修改菜单', '/api/permission/put', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (20, 0, NULL, '添加菜单', '/api/permission/post', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (21, 0, NULL, '获取菜单树', '/api/permission/getpermissiontree', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (22, 0, NULL, '获取角色', '/api/role/get', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (23, 0, NULL, '删除角色', '/api/role/delete', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (24, 0, NULL, '修改角色', '/api/role/put', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (25, 0, NULL, '添加角色', '/api/role/post', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (26, 0, NULL, '获取bug', '/api/TopicDetail/Get', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (27, 0, NULL, '获取博客', '/api/Blog', '', '', '', '', '', 0, '', 0, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (28, 0, NULL, '保存分配', '/api/permission/Assign', '', '', '', '', '', 0, '', 0, 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (29, 0, NULL, 'Get导航条', '/api/permission/GetNavigationBar', '', '', '', '', '', 0, '', 0, 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (30, 1, NULL, 'test', '/api/Blog/delete1', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (31, 1, NULL, 'test', '/api/Blog/delete2', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (32, 0, NULL, '删除博客', '/api/Blog/delete', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (33, 0, NULL, '获取全部日志', '/api/Monitor/get', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (34, 1, NULL, 'Agent -测试- 快速添加接口权限', '/api/Agent/get', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (35, 1, NULL, 'Department - 测试 - 新建api，授权认证', '/api/Department/get', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `module` VALUES (36, 0, NULL, 'Department - 测试新建api -  部门管控', '/api/Department/get', '', '', '', '', '', 0, '', 0, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');

-- ----------------------------
-- Table structure for modulepermission
-- ----------------------------
DROP TABLE IF EXISTS `modulepermission`;
CREATE TABLE `modulepermission`  (
  `Id` bigint(20) NOT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `ModuleId` bigint(20) DEFAULT NULL,
  `PermissionId` bigint(20) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operatelog
-- ----------------------------
DROP TABLE IF EXISTS `operatelog`;
CREATE TABLE `operatelog`  (
  `Id` bigint(20) NOT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `Area` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Controller` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Action` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `IPAddress` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `LogTime` datetime DEFAULT NULL,
  `LoginName` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IsButton` tinyint(1) DEFAULT NULL,
  `IsHide` tinyint(1) DEFAULT NULL,
  `Func` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pid` bigint(20) DEFAULT NULL,
  `Mid` bigint(20) DEFAULT NULL,
  `OrderSort` bigint(20) DEFAULT NULL,
  `Icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '/', 'QQ欢迎页', 0, 0, '', 0, 0, 0, 'fa-qq', '33', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (2, '-', '用户角色管理', 0, 0, '', 0, 0, 0, 'fa-users', '11', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (3, '/User/Roles', '角色管理', 0, 0, '', 2, 22, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (4, '/User/Users', '用户管理', 0, 0, '', 2, 7, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (5, '-', '菜单权限管理', 0, 0, '', 0, 0, 0, 'fa-sitemap', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (6, '/Permission/Module', '接口管理', 0, 0, '', 5, 13, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (7, '/Permission/Permission', '菜单管理', 0, 0, '', 5, 17, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (8, '/Thanks', '致谢页', 0, 0, '', 0, 0, 5, 'fa-star ', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (9, '无', '查询', 1, 0, '', 4, 7, 0, '', '这个用户页的查询按钮', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (10, '-', '报表管理', 0, 0, '', 0, 0, 0, 'fa-line-chart', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (11, '/Form/Charts', '图表', 0, 0, '', 10, 0, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (12, '/Form/Form', '表单', 0, 0, '', 10, 0, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (13, ' ', '新增', 1, 0, '', 4, 10, 0, '', '新增用户', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (14, ' ', '编辑', 1, 0, '', 4, 12, 0, '', '编辑用户', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (15, ' ', '删除', 1, 0, '', 4, 11, 0, '', '删除用户', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (16, ' ', '查询', 1, 0, '', 3, 22, 0, '', '查询 角色', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (17, ' ', '新增', 1, 0, '', 3, 25, 0, '', '新增 角色', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (18, ' ', '编辑', 1, 0, '', 3, 24, 0, '', '编辑角色', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (19, ' ', '删除', 1, 0, '', 3, 23, 0, '', '删除角色', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (20, ' ', '查询', 1, 0, '', 6, 13, 0, '', '查询 接口', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (21, ' ', '新增', 1, 0, '', 6, 16, 0, '', '新增 接口', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (22, ' ', '编辑', 1, 0, '', 6, 15, 0, '', '编辑 接口', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (23, ' ', '删除', 1, 0, '', 6, 14, 0, '', '删除接口', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (24, ' ', '查询', 1, 0, '', 7, 17, 0, '', '查询 菜单', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (25, ' ', '新增', 1, 0, '', 7, 20, 0, '', '新增菜单', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (26, ' ', '编辑', 1, 0, '', 7, 19, 0, '', '编辑菜单', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (27, ' ', '删除', 1, 0, '', 7, 18, 0, '', '删除 菜单', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (28, '/Tibug/Bugs', 'TiBug', 0, 0, '', 42, 26, 0, '', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (29, '-', '博客管理', 0, 0, '', 0, 0, 0, 'fa-file-word-o', '', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (30, ' ', '编辑', 1, 0, '', 28, 5, 0, '', '编辑 tibug ', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (31, ' ', '删除', 1, 0, '', 28, 6, 0, '', '删除 tibug', 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (32, ' ', '查询', 1, 0, '', 28, 26, 0, '', '查询 tibug', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (33, ' ', '菜单树', 1, 0, '', 7, 21, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (34, '/Permission/Assign', '权限分配', 0, 0, '', 5, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (35, ' ', '保存权限', 1, 0, '', 34, 28, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (36, ' ', '左侧导航', 1, 0, '', 7, 29, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (37, '-', '测试页面管理', 0, 0, '', 0, 0, 0, 'fa-flask', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (38, '/TestShow/TestOne', '测试页面1', 0, 0, '', 37, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (39, '/TestShow/TestTwo', '测试页面2', 0, 0, '', 37, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (40, '/I18n/index', '国际化', 0, 0, '', 41, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (41, '-', '多语言管理', 0, 0, '', 0, 0, 0, 'fa-language', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (42, '-', '问题管理', 0, 0, '', 0, 0, 0, 'fa-bug', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (43, '/Blog/Blogs', '博客', 0, 0, '', 29, 27, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (44, '-', '多级路由', 0, 0, '', 0, 0, 0, 'fa-sort-amount-asc', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (45, '-', 'Menu-1', 0, 0, '', 44, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (46, '/Recursion/Menu_1/Menu_1_2', 'Menu-1-2', 0, 0, '', 45, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (47, '-', 'Menu-1-1', 0, 0, '', 45, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (48, '/Recursion/Menu_1/Menu_1_1/Menu_1_1_1', 'Menu-1-1-1', 0, 0, '', 47, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (49, '/Recursion/Menu_1/Menu_1_1/Menu_1_1_2', 'Menu-1-1-2', 0, 0, '', 47, 0, 0, '', '', 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (50, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (51, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (52, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (53, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (54, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (55, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (56, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (57, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (58, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (59, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (60, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (61, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (62, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (63, 's', 's', 0, 0, '', 0, 0, 0, '', '', 0, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (64, ' ', '删除', 1, 0, '', 43, 32, 0, '', '删除博客按钮', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (65, '-', '日志管理', 0, 0, '', 0, 0, 0, 'fa-diamond', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (66, '/Logs/Index', '全部日志', 0, 0, '', 65, 33, 0, '', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (67, '/Blog/Detail/:id', '博客详情', 0, 1, '', 29, 0, 0, '', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (68, '-', '系统管理', 0, 0, '', 0, 0, 1, 'el-icon-s-operation', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (69, '/System/My', '个人中心', 0, 0, '', 68, 0, 0, '', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);
INSERT INTO `permission` VALUES (70, ' ', '查询', 1, 0, '', 69, 34, 0, '', 'Agent 代理的查询接口', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (71, ' ', '查询', 1, 0, '', 69, 35, 0, '', '查询 部门 Department get', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 1);
INSERT INTO `permission` VALUES (72, ' ', '查询', 1, 0, '', 69, 36, 0, '', '', 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00', 0);

-- ----------------------------
-- Table structure for productquote
-- ----------------------------
DROP TABLE IF EXISTS `productquote`;
CREATE TABLE `productquote`  (
  `Id` bigint(11) NOT NULL,
  `ClientUserId` bigint(11) DEFAULT NULL COMMENT '报价用户ID',
  `ProductId` bigint(11) DEFAULT NULL COMMENT '产品id',
  `ProductOwnerId` bigint(11) DEFAULT NULL COMMENT '产品的拥有者Id',
  `ProductOwner` bigint(255) DEFAULT NULL COMMENT '产品拥有者',
  `OfferMoney` decimal(12, 2) DEFAULT NULL COMMENT '报价',
  `OfferTime` datetime DEFAULT NULL COMMENT '报价时间',
  `OfferEndTime` datetime DEFAULT NULL COMMENT '报价结束时间',
  `AttachPicBatchId` bigint(11) DEFAULT NULL COMMENT '报价附件Id',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pruducts
-- ----------------------------
DROP TABLE IF EXISTS `pruducts`;
CREATE TABLE `pruducts`  (
  `Id` bigint(20) NOT NULL,
  `ProductName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `CategoryId` bigint(20) DEFAULT NULL COMMENT '产品分类',
  `CategoryName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品分类名称',
  `ProductImgId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品主图(在文件中心里的id)',
  `ThumbnailId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品缩略图(文件中心里的id)',
  `ProductDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品描述',
  `PicBatchId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片批次Id',
  `ProductPrice` decimal(10, 2) DEFAULT NULL COMMENT '价格',
  `ProductUnit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位',
  `ProductStock` int(11) DEFAULT NULL COMMENT '产品库存',
  `ProductType` tinyint(3) DEFAULT NULL COMMENT '产品类型',
  `ProductStatus` tinyint(3) DEFAULT NULL COMMENT '产品状态(0,上线，5下线 10过期 20 非法）',
  `ProductAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品所在地',
  `ProductWeight` decimal(10, 0) DEFAULT NULL COMMENT '产品重量',
  `ProductHeight` decimal(10, 0) DEFAULT NULL COMMENT '产品高度',
  `ProductWidth` decimal(10, 0) DEFAULT NULL COMMENT '产品宽度',
  `ProductWatched` int(11) DEFAULT NULL COMMENT '产品被浏览次数',
  `OwnerId` bigint(11) DEFAULT NULL COMMENT '产品拥有者',
  `OwnerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拥有者的名字',
  `EffecitiveTime` datetime DEFAULT NULL COMMENT '有效截止时间',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者（可以是系统帮忙创建）',
  `ModifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `Longitude` double(11, 0) DEFAULT NULL COMMENT '经度',
  `Latitude` double(11, 0) DEFAULT NULL COMMENT '纬度',
  `Prop1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性1',
  `Prop2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性2',
  `Prop3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性3',
  `Porp4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性4',
  `Prop5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性5',
  `Prop6` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性6',
  `Prop7` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性7',
  `Prop8` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '属性8',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrderSort` bigint(20) DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 0, 'Admin', '普通管理', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (2, 0, 'System', '系统管理', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (3, 0, 'Tibug', 'tibug系统管理', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (4, 0, 'SuperAdmin', '超级管理', 0, 1, 23, 'blogadmin', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (5, 1, 'AdminTest', '', 1, 1, 18, '提bug账号', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (6, 0, 'AdminTest', '测试管理', 1, 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (7, 0, 'AdminTest2', '测试管理2', 1, 1, 23, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (8, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (9, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (10, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (11, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (12, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (13, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (14, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (15, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (16, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (17, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (18, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (19, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (20, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (21, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (22, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (23, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (24, 1, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (25, NULL, 'sss', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (26, NULL, '213', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (27, NULL, '抬头填', '', 1, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (28, 0, 'hello1', '测试 常用 get post put 请求', 1, 1, 12, '后台总管理员', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `role` VALUES (29, 1, '55', '555', 1, 0, 39, 'Kawhi', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');

-- ----------------------------
-- Table structure for rolemodulepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolemodulepermission`;
CREATE TABLE `rolemodulepermission`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `RoleId` bigint(20) DEFAULT NULL,
  `ModuleId` bigint(20) DEFAULT NULL,
  `PermissionId` bigint(20) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rolemodulepermission
-- ----------------------------
INSERT INTO `rolemodulepermission` VALUES (1, 0, 1, 1, NULL, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (2, 0, 1, 2, NULL, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (3, 0, 1, 3, NULL, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (4, 0, 1, 4, NULL, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (5, 0, 2, 4, NULL, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (6, 0, 3, 5, 30, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (7, 0, 3, 6, 31, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (8, 0, 3, 7, 9, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (9, 0, 3, 26, 28, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (10, 0, 4, 7, 3, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (11, 0, 4, 7, 9, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (12, 0, 4, 10, 13, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (13, 0, 4, 12, 14, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (14, 0, 4, 11, 15, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (15, 0, 4, 0, 2, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (16, 0, 4, 22, 4, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (17, 0, 4, 22, 16, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (18, 0, 4, 25, 17, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (19, 0, 4, 24, 18, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (20, 0, 4, 23, 19, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (21, 0, 4, 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (22, 0, 4, 0, 5, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (23, 0, 4, 13, 6, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (24, 0, 4, 13, 20, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (25, 0, 4, 16, 21, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (26, 0, 4, 15, 22, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (27, 0, 4, 14, 23, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (28, 0, 4, 17, 7, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (29, 0, 4, 17, 24, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (30, 0, 4, 20, 25, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (31, 0, 4, 19, 26, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (32, 0, 4, 18, 27, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (33, 0, 4, 0, 8, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (34, 0, 4, 0, 10, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (35, 0, 4, 0, 11, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (36, 0, 4, 0, 12, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (37, 0, 4, 26, 28, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (38, 0, 4, 5, 30, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (39, 0, 4, 6, 31, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (40, 0, 4, 27, 29, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (41, 0, 4, 26, 32, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (42, 0, 6, 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (43, 0, 6, 0, 8, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (44, 0, 6, 0, 10, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (45, 0, 6, 0, 11, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (46, 0, 6, 0, 12, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (47, 0, 6, 27, 29, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (48, 0, 6, 0, 2, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (49, 0, 6, 7, 3, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (50, 0, 6, 22, 4, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (51, 0, 6, 0, 5, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (52, 0, 6, 13, 6, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (53, 0, 6, 17, 7, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (54, 0, 6, 26, 28, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (55, 0, 4, 28, 34, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (56, 0, 4, 21, 33, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (57, 0, 6, 7, 9, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (58, 0, 6, 22, 16, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (59, 0, 6, 13, 20, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (60, 0, 6, 17, 24, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (61, 0, 6, 26, 32, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (62, 0, 4, 28, 35, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (63, 0, 6, 21, 33, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (64, 0, 4, 29, 36, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (65, 0, 6, 0, 34, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (66, 0, 7, 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (67, 0, 7, 0, 2, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (68, 0, 7, 7, 4, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (69, 0, 7, 0, 10, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (70, 0, 7, 0, 12, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (71, 0, 7, 0, 8, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (72, 0, 7, 22, 16, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (73, 0, 4, 0, 37, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (74, 0, 4, 0, 38, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (75, 0, 4, 0, 39, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (76, 0, 4, 0, 40, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (77, 0, 6, 0, 40, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (78, 0, 6, 0, 37, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (79, 0, 6, 0, 38, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (80, 0, 6, 0, 39, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (81, 0, 4, 0, 41, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (82, 0, 6, 0, 41, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (83, 0, 4, 0, 42, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (84, 0, 6, 0, 42, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (85, 0, 3, 0, 42, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (86, 0, 4, 0, 43, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (87, 0, 6, 0, 43, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (88, 0, 6, 0, 44, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (89, 0, 6, 0, 45, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (90, 0, 6, 0, 46, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (91, 0, 6, 0, 47, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (92, 0, 6, 0, 48, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (93, 0, 4, 32, 64, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (94, 0, 6, 0, 65, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (95, 0, 6, 33, 66, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (96, 0, 4, 0, 65, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (97, 0, 4, 33, 66, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (98, 0, 4, 0, 67, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (99, 0, 6, 0, 67, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (100, 0, 4, 0, 68, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (101, 0, 4, 0, 69, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (102, 0, 6, 0, 68, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (103, 0, 6, 0, 69, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (104, 0, 6, 29, 36, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (105, 0, 7, 29, 36, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (106, 0, 7, 27, 33, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (107, 0, 4, 36, 72, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (108, 0, 28, 0, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (109, 0, 28, 0, 2, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (110, 0, 28, 22, 3, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (111, 0, 28, 7, 4, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (112, 0, 28, 22, 16, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (113, 0, 28, 7, 9, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (114, 0, 28, 25, 17, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (115, 0, 28, 10, 13, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (116, 0, 28, 21, 33, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `rolemodulepermission` VALUES (117, 0, 28, 29, 36, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');

-- ----------------------------
-- Table structure for sysparam
-- ----------------------------
DROP TABLE IF EXISTS `sysparam`;
CREATE TABLE `sysparam`  (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `ShowName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示名',
  `ParamConfigName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名',
  `Key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key值',
  `Value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'value值',
  `Alpha1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha1',
  `Alpha2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha2',
  `Alpha3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha3',
  `Alpha4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha4',
  `Alpha5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha5',
  `Alpha6` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha6',
  `Alpha7` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Alpha7',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sysparamdefine
-- ----------------------------
DROP TABLE IF EXISTS `sysparamdefine`;
CREATE TABLE `sysparamdefine`  (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AliasName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名',
  `ParamConfigName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置参数名',
  `KeyDesc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数1显示名称',
  `ValueDesc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数1值含义',
  `Alpha1Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数2显示名称',
  `Alpha2Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数3显示名称',
  `Alpha3Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数4显示名称',
  `Alpha4Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数5显示名称',
  `Alpha5Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数6显示名称',
  `Alpha6Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数7显示名称',
  `Alpha7Desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数8显示名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sysuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `sysuserinfo`;
CREATE TABLE `sysuserinfo`  (
  `uID` bigint(20) NOT NULL AUTO_INCREMENT,
  `uLoginName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uLoginPWD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uRealName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uStatus` bigint(20) DEFAULT NULL,
  `uRemark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uCreateTime` datetime DEFAULT NULL,
  `uUpdateTime` datetime DEFAULT NULL,
  `uLastErrTime` datetime DEFAULT NULL,
  `uErrorCount` bigint(20) DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` bigint(20) DEFAULT NULL,
  `age` bigint(20) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tdIsDelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sysuserinfo
-- ----------------------------
INSERT INTO `sysuserinfo` VALUES (1, 'laozhang', '2AEFC34200A294A3CC7DB81B43A81873', '老张', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '老张的哲学', 1, 0, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (2, 'laoli', '2AEFC34200A294A3CC7DB81B43A81873', 'laoli', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 1, 0, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (3, 'user', '2AEFC34200A294A3CC7DB81B43A81873', 'userli', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '广告', 1, 0, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (4, 'admins', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (5, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (6, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (7, 'tibug', 'BB1C0516F0F4469549CD4A95833A78E5', '提bug账号', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 1, 0, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (8, 'test', '2AEFC34200A294A3CC7DB81B43A81873', '后台测试1号', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '测试是', 1, 3, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (9, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (10, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (11, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (12, 'blogadmin', '2AEFC34200A294A3CC7DB81B43A81873', '后台总管理员', 0, 't15', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 1, 10, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (13, 'test2', 'AD0234829205B9033196BA818F7A872B', '后台测试2号', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 12, '2019-01-01 00:00:00', '北京市', 0);
INSERT INTO `sysuserinfo` VALUES (14, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (15, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (16, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (17, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (18, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (19, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (20, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (21, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (22, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (23, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (24, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (25, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (26, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (27, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (28, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (29, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (30, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (31, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (32, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (33, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (34, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (35, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (36, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (37, 'xx', '2AEFC34200A294A3CC7DB81B43A81873', 'admins', 0, '', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 0, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (38, '99', 'AC627AB1CCBDB62EC96E702F7F6425B', '99', 0, 'blogadmin', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', -1, 0, '2019-01-01 00:00:00', '', 1);
INSERT INTO `sysuserinfo` VALUES (39, 'Kawhi', '96FEE3FD714358658BFB881A4E1642BE', 'Kawhi 测试员', 0, 'blogadmin', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0, '', 1, 18, '2019-01-01 00:00:00', '', 0);
INSERT INTO `sysuserinfo` VALUES (40, 'fakeyoulife', 'E10ADC3949BA59ABBE56E057F20F883E', '测试管理员', 0, 'blogadmin', '2020-03-12 13:18:26', '2020-03-12 13:18:26', '2020-03-12 13:18:26', 0, '', 1, 12, '2020-03-02 00:00:00', 'no address', 0);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  `RoleId` bigint(20) DEFAULT NULL,
  `CreateId` bigint(20) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyId` bigint(20) DEFAULT NULL,
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 0, 4, 1, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (2, 0, 3, 2, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (3, 0, 7, 3, NULL, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (4, 0, 12, 4, 23, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (5, 0, 1, 2, 1, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (6, 0, 1, 1, 1, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (7, 0, 2, 1, 13, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (8, 0, 8, 6, 19, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (9, 0, 13, 7, 24, '', '2019-01-01 00:00:00', NULL, '', '2019-01-01 00:00:00');
INSERT INTO `userrole` VALUES (10, 0, 0, 0, 0, '', '2019-01-01 00:00:00', NULL, '', NULL);
INSERT INTO `userrole` VALUES (11, 0, 39, 28, 39, '', '2019-01-01 00:00:00', NULL, '', NULL);
INSERT INTO `userrole` VALUES (12, 0, 40, 1, 40, NULL, '2020-03-12 13:25:24', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
