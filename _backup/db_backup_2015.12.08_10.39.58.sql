-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `auth_assignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item_child`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_rule`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `benhan`
-- -------------------------------------------
DROP TABLE IF EXISTS `benhan`;
CREATE TABLE IF NOT EXISTS `benhan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maHS` int(10) NOT NULL,
  `deXuatKham` text COLLATE utf8_unicode_ci NOT NULL,
  `ketLuanBA` text COLLATE utf8_unicode_ci NOT NULL,
  `lichHen` date DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_benhan_hoso` (`maHS`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  CONSTRAINT `fk_benhan_hoso` FOREIGN KEY (`maHS`) REFERENCES `hoso` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `benhnhan`
-- -------------------------------------------
DROP TABLE IF EXISTS `benhnhan`;
CREATE TABLE IF NOT EXISTS `benhnhan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tenBN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `gioiTinh` bit(1) NOT NULL,
  `ngheNghiep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `danToc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `benhnhan_phongkham`
-- -------------------------------------------
DROP TABLE IF EXISTS `benhnhan_phongkham`;
CREATE TABLE IF NOT EXISTS `benhnhan_phongkham` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maBA` int(10) NOT NULL,
  `maPK` int(10) NOT NULL,
  `ketQua` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKham` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BAPK_BA` (`maBA`),
  KEY `fk_BAPK_PK` (`maPK`),
  CONSTRAINT `fk_BAPK_BA` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_BAPK_PK` FOREIGN KEY (`maPK`) REFERENCES `phongkham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `donthuoc`
-- -------------------------------------------
DROP TABLE IF EXISTS `donthuoc`;
CREATE TABLE IF NOT EXISTS `donthuoc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maBA` int(10) NOT NULL,
  `donthuoc` text COLLATE utf8_unicode_ci NOT NULL,
  `cachSD` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKeDon` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_donthuoc_benhan` (`maBA`),
  CONSTRAINT `fk_donthuoc_benhan` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `donthuocnt`
-- -------------------------------------------
DROP TABLE IF EXISTS `donthuocnt`;
CREATE TABLE IF NOT EXISTS `donthuocnt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maNT` int(10) NOT NULL,
  `donthuoc` text COLLATE utf8_unicode_ci NOT NULL,
  `cachSD` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKeDon` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_donthuocnt_noitru` (`maNT`),
  CONSTRAINT `fk_donthuocnt_noitru` FOREIGN KEY (`maNT`) REFERENCES `noitru` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `duoc`
-- -------------------------------------------
DROP TABLE IF EXISTS `duoc`;
CREATE TABLE IF NOT EXISTS `duoc` (
  `maDMThuoc` int(10) NOT NULL AUTO_INCREMENT,
  `tenDMThuoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`maDMThuoc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `hoso`
-- -------------------------------------------
DROP TABLE IF EXISTS `hoso`;
CREATE TABLE IF NOT EXISTS `hoso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maBN` int(10) NOT NULL,
  `created_at` int(50) NOT NULL,
  `updated_at` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hoso_benhnhan` (`maBN`),
  CONSTRAINT `fk_hoso_benhnhan` FOREIGN KEY (`maBN`) REFERENCES `benhnhan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `khoa`
-- -------------------------------------------
DROP TABLE IF EXISTS `khoa`;
CREATE TABLE IF NOT EXISTS `khoa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tenKhoa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `menu`
-- -------------------------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `nhanvien`
-- -------------------------------------------
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maKhoa` int(10) NOT NULL,
  `chucVu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tenNV` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gioiTinh` bit(1) NOT NULL,
  `queQuan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `danToc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nhanvien_khoa` (`maKhoa`),
  CONSTRAINT `fk_nhanvien_khoa` FOREIGN KEY (`maKhoa`) REFERENCES `khoa` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `noitru`
-- -------------------------------------------
DROP TABLE IF EXISTS `noitru`;
CREATE TABLE IF NOT EXISTS `noitru` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maBN` int(10) NOT NULL,
  `soPhong` int(10) NOT NULL,
  `soGiuong` int(10) NOT NULL,
  `ngayXuatVien` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_noitru_benhnhan` (`maBN`),
  CONSTRAINT `fk_noitru_benhnhan` FOREIGN KEY (`maBN`) REFERENCES `benhnhan` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `phongkham`
-- -------------------------------------------
DROP TABLE IF EXISTS `phongkham`;
CREATE TABLE IF NOT EXISTS `phongkham` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maKhoa` int(10) NOT NULL,
  `tenPK` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phongkham_khoa` (`maKhoa`),
  CONSTRAINT `fk_phongkham_khoa` FOREIGN KEY (`maKhoa`) REFERENCES `khoa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `profile`
-- -------------------------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `social_account`
-- -------------------------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `token`
-- -------------------------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `vienphi`
-- -------------------------------------------
DROP TABLE IF EXISTS `vienphi`;
CREATE TABLE IF NOT EXISTS `vienphi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `maBA` int(10) NOT NULL,
  `tien` int(50) NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayDongVP` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vienphi_benhan` (`maBA`),
  CONSTRAINT `fk_vienphi_benhan` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE DATA auth_assignment
-- -------------------------------------------
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','1','1449504509');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('Bác sĩ','2','1449438691');



-- -------------------------------------------
-- TABLE DATA auth_item
-- -------------------------------------------
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/*','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/assignment/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/assignment/assign','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/assignment/index','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/assignment/search','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/assignment/view','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/default/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/default/index','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/*','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/create','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/delete','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/index','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/update','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/menu/view','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/*','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/assign','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/create','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/delete','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/index','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/search','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/update','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/permission/view','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/*','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/assign','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/create','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/delete','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/index','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/search','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/update','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/role/view','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/route/*','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/route/assign','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/route/create','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/route/index','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/route/search','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/create','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/delete','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/index','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/update','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/admin/rule/view','2','','','','1449443243','1449443243');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/create','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/delete','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/index','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/update','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhan/view','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/*','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/create','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/delete','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/hoso','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/index','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/update','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/benhnhan/view','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/*','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/create','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/delete','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/index','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/update','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/bnpk/view','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/db-explain','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/download-mail','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/index','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/toolbar','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/debug/default/view','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/*','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/create','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/delete','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/index','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/update','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/donthuoc/view','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/*','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/create','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/delete','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/index','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/update','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/duoc/view','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/*','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/action','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/diff','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/index','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/preview','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/gii/default/view','2','','','','1449443244','1449443244');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/*','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/create','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/delete','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/index','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/update','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/hoso/view','2','','','','1449443245','1449443245');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/*','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/create','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/delete','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/index','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/update','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/khoa/view','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/*','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/create','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/delete','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/index','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/update','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/nhanvien/view','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/*','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/create','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/delete','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/index','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/update','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/noitru/view','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/*','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/create','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/delete','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/index','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/update','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/phongkham/view','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/assignment/*','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/assignment/assign','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/assignment/index','2','','','','1449443240','1449443240');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/assignment/search','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/assignment/view','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/default/*','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/default/index','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/*','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/create','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/delete','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/index','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/update','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/menu/view','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/*','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/assign','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/create','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/delete','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/index','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/search','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/update','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/permission/view','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/assign','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/create','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/delete','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/index','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/search','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/update','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/role/view','2','','','','1449443241','1449443241');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/route/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/route/assign','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/route/create','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/route/index','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/route/search','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/*','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/create','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/delete','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/index','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/update','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/rbac/rule/view','2','','','','1449443242','1449443242');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/*','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/about','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/captcha','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/contact','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/error','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/index','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/login','2','','','','1449443246','1449443246');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/site/logout','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/*','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/create','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/delete','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/index','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/update','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/user/view','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/*','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/create','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/delete','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/index','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/update','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('/vienphi/view','2','','','','1449443247','1449443247');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin','1','admin','','','1449244350','1449244350');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('Bác sĩ','1','Bác sĩ','','','1449437987','1449437987');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('Y tá','1','Y tá','','','1449438038','1449438038');



-- -------------------------------------------
-- TABLE DATA auth_item_child
-- -------------------------------------------
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/assignment/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/assignment/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/assignment/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/assignment/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/assignment/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/default/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/default/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/menu/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/permission/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/role/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/route/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/route/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/route/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/route/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/route/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/admin/rule/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhan/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/benhan/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/hoso');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/benhnhan/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/bnpk/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/bnpk/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/db-explain');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/download-mail');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/toolbar');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/debug/default/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/donthuoc/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/donthuoc/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/duoc/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/action');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/diff');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/preview');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/gii/default/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/hoso/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/hoso/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/khoa/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/nhanvien/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/noitru/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/phongkham/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/assignment/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/assignment/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/assignment/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/assignment/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/assignment/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/default/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/default/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/menu/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/permission/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/role/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/route/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/route/assign');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/route/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/route/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/route/search');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/rbac/rule/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/about');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/about');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/captcha');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/captcha');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/contact');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/contact');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/error');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/error');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/login');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/login');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/site/logout');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('Bác sĩ','/site/logout');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/user/view');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/*');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/create');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/delete');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/index');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/update');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','/vienphi/view');



-- -------------------------------------------
-- TABLE DATA benhan
-- -------------------------------------------
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('1','2','3 4','fff','2006-10-09','1447027200','1449517268');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('2','3','khoa noi tiet','tot','2015-10-09','1441756800','1441756800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('3','3','khoa than kinh','','2010-10-09','1441756800','1441756800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('4','4','3 4','Tốt','2016-01-01','1441756800','1449518250');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('6','6','3 8','Tốt','2016-01-01','1449420809','1449518333');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('7','6','Nội tiết','tốt','2016-01-01','1449421004','1449421004');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('8','6','Nội tiết','Tốt','2016-01-01','1449421022','1449421022');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('9','7','Nội tiết','Tốt ','2016-01-01','1449421062','1449421062');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('10','7','khoa thần kinh','Tốt','2016-01-01','1447027200','1447027200');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('11','7','khoa thần kinh','Tốt','2016-01-01','1441756800','1441756800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('12','9','Khoa xương khớp','Tốt','2016-01-01','1447027200','1447027200');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('13','9','Khoa Nội tiết','Tốt','2016-01-01','1444348800','1444348800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('14','8','Khoa ung thư','Tốt','2016-01-01','1444348800','1444348800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('15','8','Khoa ung thư','Tốt','2016-01-01','1444348800','1444348800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('16','7','Khoa ung thư','Tốt','2016-01-01','1444348800','1444348800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('17','7','Khoa tim mạch','Tốt','2016-01-01','1444348800','1444348800');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('19','2','3 4 5','','2016-01-01','1449510122','1449513446');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('22','2','3 4 5','','0000-00-00','1449514588','1449514606');
INSERT INTO `benhan` (`id`,`maHS`,`deXuatKham`,`ketLuanBA`,`lichHen`,`created_at`,`updated_at`) VALUES
('23','2','7 8','','0000-00-00','1449516984','1449516984');



-- -------------------------------------------
-- TABLE DATA benhnhan
-- -------------------------------------------
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('5','nguyễn thế anh','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('6','nguyen anh tuan','2001-01-02','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('7','lê xuân cần','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('8','nguyễn thị A','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('9','nguyen A','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('10','nguyen A','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('11','nguyen ABC','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('12','nguyen ACDDDD','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('13','aaaaabbbbbb','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('14','aaaaabbbbbb','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('15','aaaaabbbbbb','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('16','gam1','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('17','Lý Lệ Thanh','1994-10-09','1','','','','');
INSERT INTO `benhnhan` (`id`,`tenBN`,`ngaySinh`,`gioiTinh`,`ngheNghiep`,`danToc`,`diaChi`,`anh`) VALUES
('18','sdfghjkl','1994-10-09','1','qwertyui','','','');



-- -------------------------------------------
-- TABLE DATA benhnhan_phongkham
-- -------------------------------------------
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('1','1','2','Bị sỏi thận','1449119539');
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('2','1','2','Tốt','1449430646');
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('3','1','8','Tốt','1449430701');
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('4','1','4','Tốt','1449430751');
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('7','19','3','Tốt','1449514030');
INSERT INTO `benhnhan_phongkham` (`id`,`maBA`,`maPK`,`ketQua`,`ngayKham`) VALUES
('8','4','3','tot','1449518282');



-- -------------------------------------------
-- TABLE DATA donthuoc
-- -------------------------------------------
INSERT INTO `donthuoc` (`id`,`maBA`,`donthuoc`,`cachSD`,`ngayKeDon`) VALUES
('1','1','gggg','gggg','1448812955');
INSERT INTO `donthuoc` (`id`,`maBA`,`donthuoc`,`cachSD`,`ngayKeDon`) VALUES
('5','23','hhh','hhhh','1449517168');



-- -------------------------------------------
-- TABLE DATA duoc
-- -------------------------------------------
INSERT INTO `duoc` (`maDMThuoc`,`tenDMThuoc`) VALUES
('1','1');
INSERT INTO `duoc` (`maDMThuoc`,`tenDMThuoc`) VALUES
('2','3');



-- -------------------------------------------
-- TABLE DATA hoso
-- -------------------------------------------
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('2','5','2147483647','2147483647');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('3','6','2147483647','2147483647');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('4','7','2147483647','2147483647');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('5','8','2147483647','2147483647');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('6','11','1448795304','1448795304');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('7','12','1448806717','1448806717');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('8','15','1448807372','1448807372');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('9','16','1449042749','1449042749');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('10','17','1449516787','1449516787');
INSERT INTO `hoso` (`id`,`maBN`,`created_at`,`updated_at`) VALUES
('11','18','1449541351','1449541351');



-- -------------------------------------------
-- TABLE DATA khoa
-- -------------------------------------------
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('1','Khoa Noi Tiet','Khoa Noi tiết');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('2','Khoa thần kinh','Khoa thần kinh');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('3','Khoa xương khớp','Khoa xương khớp');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('4','Khoa hô hấp','Khoa hô hấp');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('5','Khoa tiêu hóa','Khoa tiêu hóa');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('6','Khoa tim mạch','Khoa tim mạch');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('7','Khoa da liễu','Khoa da liễu');
INSERT INTO `khoa` (`id`,`tenKhoa`,`moTa`) VALUES
('10','X','X');



-- -------------------------------------------
-- TABLE DATA migration
-- -------------------------------------------
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1449243421');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140209_132017_init','1449243426');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140403_174025_create_account_table','1449243427');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_113157_update_tables','1449243432');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_130429_create_token_table','1449243433');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140506_102106_rbac_init','1449243533');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_171933_fix_ip_field','1449243435');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_172703_change_account_table_name','1449243435');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_110026_update_ip_field','1449243436');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_135246_alter_username_length','1449243437');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150614_103145_update_social_account_table','1449243441');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150623_212711_fix_username_notnull','1449243441');



-- -------------------------------------------
-- TABLE DATA nhanvien
-- -------------------------------------------
INSERT INTO `nhanvien` (`id`,`maKhoa`,`chucVu`,`tenNV`,`gioiTinh`,`queQuan`,`danToc`) VALUES
('1','1','Bác sĩ','Nguyễn Văn A','1','Thanh Hóa','Kinh');
INSERT INTO `nhanvien` (`id`,`maKhoa`,`chucVu`,`tenNV`,`gioiTinh`,`queQuan`,`danToc`) VALUES
('2','1','Bác sĩ','Nguyễn Văn B','1','Thanh Hóa','Kinh');
INSERT INTO `nhanvien` (`id`,`maKhoa`,`chucVu`,`tenNV`,`gioiTinh`,`queQuan`,`danToc`) VALUES
('3','1','Y tá','Ngô Thị A','1','Thanh Hóa','Kinh');



-- -------------------------------------------
-- TABLE DATA noitru
-- -------------------------------------------
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('5','8','12','12','2006-10-09');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('6','9','12','1','2006-10-09');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('7','6','444','44','0000-00-00');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('8','18','23','567','0000-00-00');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('9','5','23','5','0000-00-00');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('10','7','34','98','0000-00-00');
INSERT INTO `noitru` (`id`,`maBN`,`soPhong`,`soGiuong`,`ngayXuatVien`) VALUES
('11','7','124','67','0000-00-00');



-- -------------------------------------------
-- TABLE DATA phongkham
-- -------------------------------------------
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('2','1','Phòng khám nội tiết','Phòng khám nội tiết');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('3','3','Phòng khám xương khớp','Phòng khám xương khớp');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('4','4','Phòng khám hô hấp','Phòng khám hô hấp');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('5','2','Phòng khám khoa thần kinh','Phòng khám khoa thần kinh');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('6','7','Phòng khám khoa da liễu','Phòng khám khoa da liễu');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('7','5','Phòng khám tiêu hóa','Phòng khám tiêu hóa');
INSERT INTO `phongkham` (`id`,`maKhoa`,`tenPK`,`moTa`) VALUES
('8','6','Phòng khám tim mạch','Phòng khám tim mạch');



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`username`,`email`,`password_hash`,`auth_key`,`confirmed_at`,`unconfirmed_email`,`blocked_at`,`registration_ip`,`created_at`,`updated_at`,`flags`) VALUES
('1','admin','admin@gmail.com','admin','','0','','0','','0','0','0');
INSERT INTO `user` (`id`,`username`,`email`,`password_hash`,`auth_key`,`confirmed_at`,`unconfirmed_email`,`blocked_at`,`registration_ip`,`created_at`,`updated_at`,`flags`) VALUES
('2','user','nguyenanh@gmail.com','user','','0','','0','','2147483647','2147483647','1');



-- -------------------------------------------
-- TABLE DATA vienphi
-- -------------------------------------------
INSERT INTO `vienphi` (`id`,`maBA`,`tien`,`mota`,`ngayDongVP`) VALUES
('1','1','100000','','1448810254');
INSERT INTO `vienphi` (`id`,`maBA`,`tien`,`mota`,`ngayDongVP`) VALUES
('2','23','1000000','','1449517012');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
