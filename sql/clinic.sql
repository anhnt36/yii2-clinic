-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2015 at 01:00 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1449547952),
('Bác sĩ', '2', 1449438691);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, '', '', '', 1449443247, 1449443247),
('/admin/*', 2, '', '', '', 1449443244, 1449443244),
('/admin/assignment/*', 2, '', '', '', 1449443242, 1449443242),
('/admin/assignment/assign', 2, '', '', '', 1449443242, 1449443242),
('/admin/assignment/index', 2, '', '', '', 1449443242, 1449443242),
('/admin/assignment/search', 2, '', '', '', 1449443242, 1449443242),
('/admin/assignment/view', 2, '', '', '', 1449443242, 1449443242),
('/admin/default/*', 2, '', '', '', 1449443242, 1449443242),
('/admin/default/index', 2, '', '', '', 1449443242, 1449443242),
('/admin/menu/*', 2, '', '', '', 1449443243, 1449443243),
('/admin/menu/create', 2, '', '', '', 1449443242, 1449443242),
('/admin/menu/delete', 2, '', '', '', 1449443243, 1449443243),
('/admin/menu/index', 2, '', '', '', 1449443242, 1449443242),
('/admin/menu/update', 2, '', '', '', 1449443243, 1449443243),
('/admin/menu/view', 2, '', '', '', 1449443242, 1449443242),
('/admin/permission/*', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/assign', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/create', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/delete', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/index', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/search', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/update', 2, '', '', '', 1449443243, 1449443243),
('/admin/permission/view', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/*', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/assign', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/create', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/delete', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/index', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/search', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/update', 2, '', '', '', 1449443243, 1449443243),
('/admin/role/view', 2, '', '', '', 1449443243, 1449443243),
('/admin/route/*', 2, '', '', '', 1449443243, 1449443243),
('/admin/route/assign', 2, '', '', '', 1449443243, 1449443243),
('/admin/route/create', 2, '', '', '', 1449443243, 1449443243),
('/admin/route/index', 2, '', '', '', 1449443243, 1449443243),
('/admin/route/search', 2, '', '', '', 1449443243, 1449443243),
('/admin/rule/*', 2, '', '', '', 1449443244, 1449443244),
('/admin/rule/create', 2, '', '', '', 1449443243, 1449443243),
('/admin/rule/delete', 2, '', '', '', 1449443244, 1449443244),
('/admin/rule/index', 2, '', '', '', 1449443243, 1449443243),
('/admin/rule/update', 2, '', '', '', 1449443244, 1449443244),
('/admin/rule/view', 2, '', '', '', 1449443243, 1449443243),
('/benhan/*', 2, '', '', '', 1449443244, 1449443244),
('/benhan/create', 2, '', '', '', 1449443244, 1449443244),
('/benhan/delete', 2, '', '', '', 1449443244, 1449443244),
('/benhan/index', 2, '', '', '', 1449443244, 1449443244),
('/benhan/update', 2, '', '', '', 1449443244, 1449443244),
('/benhan/view', 2, '', '', '', 1449443244, 1449443244),
('/benhnhan/*', 2, '', '', '', 1449443245, 1449443245),
('/benhnhan/create', 2, '', '', '', 1449443245, 1449443245),
('/benhnhan/delete', 2, '', '', '', 1449443245, 1449443245),
('/benhnhan/hoso', 2, '', '', '', 1449443244, 1449443244),
('/benhnhan/index', 2, '', '', '', 1449443244, 1449443244),
('/benhnhan/update', 2, '', '', '', 1449443245, 1449443245),
('/benhnhan/view', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/*', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/create', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/delete', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/index', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/update', 2, '', '', '', 1449443245, 1449443245),
('/bnpk/view', 2, '', '', '', 1449443245, 1449443245),
('/debug/*', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/*', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/db-explain', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/download-mail', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/index', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/toolbar', 2, '', '', '', 1449443244, 1449443244),
('/debug/default/view', 2, '', '', '', 1449443244, 1449443244),
('/donthuoc/*', 2, '', '', '', 1449443245, 1449443245),
('/donthuoc/create', 2, '', '', '', 1449443245, 1449443245),
('/donthuoc/delete', 2, '', '', '', 1449443245, 1449443245),
('/donthuoc/index', 2, '', '', '', 1449443245, 1449443245),
('/donthuoc/update', 2, '', '', '', 1449443245, 1449443245),
('/donthuoc/view', 2, '', '', '', 1449443245, 1449443245),
('/duoc/*', 2, '', '', '', 1449443245, 1449443245),
('/duoc/create', 2, '', '', '', 1449443245, 1449443245),
('/duoc/delete', 2, '', '', '', 1449443245, 1449443245),
('/duoc/index', 2, '', '', '', 1449443245, 1449443245),
('/duoc/update', 2, '', '', '', 1449443245, 1449443245),
('/duoc/view', 2, '', '', '', 1449443245, 1449443245),
('/gii/*', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/*', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/action', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/diff', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/index', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/preview', 2, '', '', '', 1449443244, 1449443244),
('/gii/default/view', 2, '', '', '', 1449443244, 1449443244),
('/hoso/*', 2, '', '', '', 1449443246, 1449443246),
('/hoso/create', 2, '', '', '', 1449443245, 1449443245),
('/hoso/delete', 2, '', '', '', 1449443246, 1449443246),
('/hoso/index', 2, '', '', '', 1449443245, 1449443245),
('/hoso/update', 2, '', '', '', 1449443245, 1449443245),
('/hoso/view', 2, '', '', '', 1449443245, 1449443245),
('/khoa/*', 2, '', '', '', 1449443246, 1449443246),
('/khoa/create', 2, '', '', '', 1449443246, 1449443246),
('/khoa/delete', 2, '', '', '', 1449443246, 1449443246),
('/khoa/index', 2, '', '', '', 1449443246, 1449443246),
('/khoa/update', 2, '', '', '', 1449443246, 1449443246),
('/khoa/view', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/*', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/create', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/delete', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/index', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/update', 2, '', '', '', 1449443246, 1449443246),
('/nhanvien/view', 2, '', '', '', 1449443246, 1449443246),
('/noitru/*', 2, '', '', '', 1449443246, 1449443246),
('/noitru/create', 2, '', '', '', 1449443246, 1449443246),
('/noitru/delete', 2, '', '', '', 1449443246, 1449443246),
('/noitru/index', 2, '', '', '', 1449443246, 1449443246),
('/noitru/update', 2, '', '', '', 1449443246, 1449443246),
('/noitru/view', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/*', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/create', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/delete', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/index', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/update', 2, '', '', '', 1449443246, 1449443246),
('/phongkham/view', 2, '', '', '', 1449443246, 1449443246),
('/rbac/*', 2, '', '', '', 1449443242, 1449443242),
('/rbac/assignment/*', 2, '', '', '', 1449443241, 1449443241),
('/rbac/assignment/assign', 2, '', '', '', 1449443241, 1449443241),
('/rbac/assignment/index', 2, '', '', '', 1449443240, 1449443240),
('/rbac/assignment/search', 2, '', '', '', 1449443241, 1449443241),
('/rbac/assignment/view', 2, '', '', '', 1449443241, 1449443241),
('/rbac/default/*', 2, '', '', '', 1449443241, 1449443241),
('/rbac/default/index', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/*', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/create', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/delete', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/index', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/update', 2, '', '', '', 1449443241, 1449443241),
('/rbac/menu/view', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/*', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/assign', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/create', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/delete', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/index', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/search', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/update', 2, '', '', '', 1449443241, 1449443241),
('/rbac/permission/view', 2, '', '', '', 1449443241, 1449443241),
('/rbac/role/*', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/assign', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/create', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/delete', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/index', 2, '', '', '', 1449443241, 1449443241),
('/rbac/role/search', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/update', 2, '', '', '', 1449443242, 1449443242),
('/rbac/role/view', 2, '', '', '', 1449443241, 1449443241),
('/rbac/route/*', 2, '', '', '', 1449443242, 1449443242),
('/rbac/route/assign', 2, '', '', '', 1449443242, 1449443242),
('/rbac/route/create', 2, '', '', '', 1449443242, 1449443242),
('/rbac/route/index', 2, '', '', '', 1449443242, 1449443242),
('/rbac/route/search', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/*', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/create', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/delete', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/index', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/update', 2, '', '', '', 1449443242, 1449443242),
('/rbac/rule/view', 2, '', '', '', 1449443242, 1449443242),
('/site/*', 2, '', '', '', 1449443247, 1449443247),
('/site/about', 2, '', '', '', 1449443247, 1449443247),
('/site/captcha', 2, '', '', '', 1449443246, 1449443246),
('/site/contact', 2, '', '', '', 1449443247, 1449443247),
('/site/error', 2, '', '', '', 1449443246, 1449443246),
('/site/index', 2, '', '', '', 1449443246, 1449443246),
('/site/login', 2, '', '', '', 1449443246, 1449443246),
('/site/logout', 2, '', '', '', 1449443247, 1449443247),
('/user/*', 2, '', '', '', 1449443247, 1449443247),
('/user/create', 2, '', '', '', 1449443247, 1449443247),
('/user/delete', 2, '', '', '', 1449443247, 1449443247),
('/user/index', 2, '', '', '', 1449443247, 1449443247),
('/user/update', 2, '', '', '', 1449443247, 1449443247),
('/user/view', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/*', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/create', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/delete', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/index', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/update', 2, '', '', '', 1449443247, 1449443247),
('/vienphi/view', 2, '', '', '', 1449443247, 1449443247),
('admin', 1, 'admin', '', '', 1449244350, 1449244350),
('admin1', 2, 'admin', '', '', 1449547196, 1449547196),
('admin22', 1, 'admin22', '', '', 1449547597, 1449547597),
('Bác sĩ', 1, 'Bác sĩ', '', '', 1449437987, 1449437987),
('Y tá', 1, 'Y tá', '', '', 1449438038, 1449438038);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', '/*'),
('admin1', '/*'),
('admin', '/admin/*'),
('admin1', '/admin/*'),
('admin', '/admin/assignment/*'),
('admin1', '/admin/assignment/*'),
('admin', '/admin/assignment/assign'),
('admin1', '/admin/assignment/assign'),
('admin', '/admin/assignment/index'),
('admin1', '/admin/assignment/index'),
('admin', '/admin/assignment/search'),
('admin1', '/admin/assignment/search'),
('admin', '/admin/assignment/view'),
('admin1', '/admin/assignment/view'),
('admin', '/admin/default/*'),
('admin1', '/admin/default/*'),
('admin', '/admin/default/index'),
('admin1', '/admin/default/index'),
('admin', '/admin/menu/*'),
('admin1', '/admin/menu/*'),
('admin', '/admin/menu/create'),
('admin1', '/admin/menu/create'),
('admin', '/admin/menu/delete'),
('admin1', '/admin/menu/delete'),
('admin', '/admin/menu/index'),
('admin1', '/admin/menu/index'),
('admin', '/admin/menu/update'),
('admin1', '/admin/menu/update'),
('admin', '/admin/menu/view'),
('admin1', '/admin/menu/view'),
('admin', '/admin/permission/*'),
('admin1', '/admin/permission/*'),
('admin', '/admin/permission/assign'),
('admin1', '/admin/permission/assign'),
('admin', '/admin/permission/create'),
('admin1', '/admin/permission/create'),
('admin', '/admin/permission/delete'),
('admin1', '/admin/permission/delete'),
('admin', '/admin/permission/index'),
('admin1', '/admin/permission/index'),
('admin', '/admin/permission/search'),
('admin1', '/admin/permission/search'),
('admin', '/admin/permission/update'),
('admin1', '/admin/permission/update'),
('admin', '/admin/permission/view'),
('admin1', '/admin/permission/view'),
('admin', '/admin/role/*'),
('admin1', '/admin/role/*'),
('admin', '/admin/role/assign'),
('admin1', '/admin/role/assign'),
('admin', '/admin/role/create'),
('admin1', '/admin/role/create'),
('admin', '/admin/role/delete'),
('admin1', '/admin/role/delete'),
('admin', '/admin/role/index'),
('admin1', '/admin/role/index'),
('admin', '/admin/role/search'),
('admin1', '/admin/role/search'),
('admin', '/admin/role/update'),
('admin1', '/admin/role/update'),
('admin', '/admin/role/view'),
('admin1', '/admin/role/view'),
('admin', '/admin/route/*'),
('admin1', '/admin/route/*'),
('admin', '/admin/route/assign'),
('admin1', '/admin/route/assign'),
('admin', '/admin/route/create'),
('admin1', '/admin/route/create'),
('admin', '/admin/route/index'),
('admin1', '/admin/route/index'),
('admin', '/admin/route/search'),
('admin1', '/admin/route/search'),
('admin', '/admin/rule/*'),
('admin1', '/admin/rule/*'),
('admin', '/admin/rule/create'),
('admin1', '/admin/rule/create'),
('admin', '/admin/rule/delete'),
('admin1', '/admin/rule/delete'),
('admin', '/admin/rule/index'),
('admin1', '/admin/rule/index'),
('admin', '/admin/rule/update'),
('admin1', '/admin/rule/update'),
('admin', '/admin/rule/view'),
('admin1', '/admin/rule/view'),
('admin', '/benhan/*'),
('admin1', '/benhan/*'),
('Bác sĩ', '/benhan/*'),
('admin', '/benhan/create'),
('admin1', '/benhan/create'),
('Bác sĩ', '/benhan/create'),
('admin', '/benhan/delete'),
('admin1', '/benhan/delete'),
('Bác sĩ', '/benhan/delete'),
('admin', '/benhan/index'),
('admin1', '/benhan/index'),
('Bác sĩ', '/benhan/index'),
('admin', '/benhan/update'),
('admin1', '/benhan/update'),
('Bác sĩ', '/benhan/update'),
('admin', '/benhan/view'),
('admin1', '/benhan/view'),
('Bác sĩ', '/benhan/view'),
('admin', '/benhnhan/*'),
('admin1', '/benhnhan/*'),
('admin', '/benhnhan/create'),
('admin1', '/benhnhan/create'),
('admin', '/benhnhan/delete'),
('admin1', '/benhnhan/delete'),
('admin', '/benhnhan/hoso'),
('admin1', '/benhnhan/hoso'),
('admin', '/benhnhan/index'),
('admin1', '/benhnhan/index'),
('admin', '/benhnhan/update'),
('admin1', '/benhnhan/update'),
('admin', '/benhnhan/view'),
('admin1', '/benhnhan/view'),
('admin', '/bnpk/*'),
('admin1', '/bnpk/*'),
('Bác sĩ', '/bnpk/*'),
('admin', '/bnpk/create'),
('admin1', '/bnpk/create'),
('Bác sĩ', '/bnpk/create'),
('admin', '/bnpk/delete'),
('admin1', '/bnpk/delete'),
('Bác sĩ', '/bnpk/delete'),
('admin', '/bnpk/index'),
('admin1', '/bnpk/index'),
('Bác sĩ', '/bnpk/index'),
('admin', '/bnpk/update'),
('admin1', '/bnpk/update'),
('Bác sĩ', '/bnpk/update'),
('admin', '/bnpk/view'),
('admin1', '/bnpk/view'),
('Bác sĩ', '/bnpk/view'),
('admin', '/debug/*'),
('admin1', '/debug/*'),
('admin', '/debug/default/*'),
('admin1', '/debug/default/*'),
('admin', '/debug/default/db-explain'),
('admin1', '/debug/default/db-explain'),
('admin', '/debug/default/download-mail'),
('admin1', '/debug/default/download-mail'),
('admin', '/debug/default/index'),
('admin1', '/debug/default/index'),
('admin', '/debug/default/toolbar'),
('admin1', '/debug/default/toolbar'),
('admin', '/debug/default/view'),
('admin1', '/debug/default/view'),
('admin', '/donthuoc/*'),
('admin1', '/donthuoc/*'),
('Bác sĩ', '/donthuoc/*'),
('admin', '/donthuoc/create'),
('admin1', '/donthuoc/create'),
('Bác sĩ', '/donthuoc/create'),
('admin', '/donthuoc/delete'),
('admin1', '/donthuoc/delete'),
('Bác sĩ', '/donthuoc/delete'),
('admin', '/donthuoc/index'),
('admin1', '/donthuoc/index'),
('Bác sĩ', '/donthuoc/index'),
('admin', '/donthuoc/update'),
('admin1', '/donthuoc/update'),
('Bác sĩ', '/donthuoc/update'),
('admin', '/donthuoc/view'),
('admin1', '/donthuoc/view'),
('Bác sĩ', '/donthuoc/view'),
('admin', '/duoc/*'),
('admin1', '/duoc/*'),
('admin', '/duoc/create'),
('admin1', '/duoc/create'),
('admin', '/duoc/delete'),
('admin1', '/duoc/delete'),
('admin', '/duoc/index'),
('admin1', '/duoc/index'),
('admin', '/duoc/update'),
('admin1', '/duoc/update'),
('admin', '/duoc/view'),
('admin1', '/duoc/view'),
('admin', '/gii/*'),
('admin1', '/gii/*'),
('admin', '/gii/default/*'),
('admin1', '/gii/default/*'),
('admin', '/gii/default/action'),
('admin1', '/gii/default/action'),
('admin', '/gii/default/diff'),
('admin1', '/gii/default/diff'),
('admin', '/gii/default/index'),
('admin1', '/gii/default/index'),
('admin', '/gii/default/preview'),
('admin1', '/gii/default/preview'),
('admin', '/gii/default/view'),
('admin1', '/gii/default/view'),
('admin', '/hoso/*'),
('admin1', '/hoso/*'),
('admin', '/hoso/create'),
('admin1', '/hoso/create'),
('admin', '/hoso/delete'),
('admin1', '/hoso/delete'),
('admin', '/hoso/index'),
('admin1', '/hoso/index'),
('Bác sĩ', '/hoso/index'),
('admin', '/hoso/update'),
('admin1', '/hoso/update'),
('admin', '/hoso/view'),
('admin1', '/hoso/view'),
('admin', '/khoa/*'),
('admin1', '/khoa/*'),
('admin22', '/khoa/*'),
('admin', '/khoa/create'),
('admin1', '/khoa/create'),
('admin22', '/khoa/create'),
('admin', '/khoa/delete'),
('admin1', '/khoa/delete'),
('admin22', '/khoa/delete'),
('admin', '/khoa/index'),
('admin1', '/khoa/index'),
('admin22', '/khoa/index'),
('admin', '/khoa/update'),
('admin1', '/khoa/update'),
('admin22', '/khoa/update'),
('admin', '/khoa/view'),
('admin1', '/khoa/view'),
('admin22', '/khoa/view'),
('admin', '/nhanvien/*'),
('admin1', '/nhanvien/*'),
('admin22', '/nhanvien/*'),
('admin', '/nhanvien/create'),
('admin1', '/nhanvien/create'),
('admin22', '/nhanvien/create'),
('admin', '/nhanvien/delete'),
('admin1', '/nhanvien/delete'),
('admin22', '/nhanvien/delete'),
('admin', '/nhanvien/index'),
('admin1', '/nhanvien/index'),
('admin22', '/nhanvien/index'),
('admin', '/nhanvien/update'),
('admin1', '/nhanvien/update'),
('admin22', '/nhanvien/update'),
('admin', '/nhanvien/view'),
('admin1', '/nhanvien/view'),
('admin22', '/nhanvien/view'),
('admin', '/noitru/*'),
('admin1', '/noitru/*'),
('admin22', '/noitru/*'),
('admin', '/noitru/create'),
('admin1', '/noitru/create'),
('admin22', '/noitru/create'),
('admin', '/noitru/delete'),
('admin1', '/noitru/delete'),
('admin22', '/noitru/delete'),
('admin', '/noitru/index'),
('admin1', '/noitru/index'),
('admin', '/noitru/update'),
('admin1', '/noitru/update'),
('admin', '/noitru/view'),
('admin1', '/noitru/view'),
('admin', '/phongkham/*'),
('admin1', '/phongkham/*'),
('admin', '/phongkham/create'),
('admin1', '/phongkham/create'),
('admin', '/phongkham/delete'),
('admin1', '/phongkham/delete'),
('admin', '/phongkham/index'),
('admin1', '/phongkham/index'),
('admin', '/phongkham/update'),
('admin1', '/phongkham/update'),
('admin', '/phongkham/view'),
('admin1', '/phongkham/view'),
('admin', '/rbac/*'),
('admin1', '/rbac/*'),
('admin', '/rbac/assignment/*'),
('admin1', '/rbac/assignment/*'),
('admin', '/rbac/assignment/assign'),
('admin1', '/rbac/assignment/assign'),
('admin', '/rbac/assignment/index'),
('admin1', '/rbac/assignment/index'),
('admin', '/rbac/assignment/search'),
('admin1', '/rbac/assignment/search'),
('admin', '/rbac/assignment/view'),
('admin1', '/rbac/assignment/view'),
('admin', '/rbac/default/*'),
('admin1', '/rbac/default/*'),
('admin', '/rbac/default/index'),
('admin1', '/rbac/default/index'),
('admin', '/rbac/menu/*'),
('admin1', '/rbac/menu/*'),
('admin', '/rbac/menu/create'),
('admin1', '/rbac/menu/create'),
('admin', '/rbac/menu/delete'),
('admin1', '/rbac/menu/delete'),
('admin', '/rbac/menu/index'),
('admin1', '/rbac/menu/index'),
('admin', '/rbac/menu/update'),
('admin1', '/rbac/menu/update'),
('admin', '/rbac/menu/view'),
('admin1', '/rbac/menu/view'),
('admin', '/rbac/permission/*'),
('admin1', '/rbac/permission/*'),
('admin', '/rbac/permission/assign'),
('admin1', '/rbac/permission/assign'),
('admin', '/rbac/permission/create'),
('admin1', '/rbac/permission/create'),
('admin', '/rbac/permission/delete'),
('admin1', '/rbac/permission/delete'),
('admin', '/rbac/permission/index'),
('admin1', '/rbac/permission/index'),
('admin', '/rbac/permission/search'),
('admin1', '/rbac/permission/search'),
('admin', '/rbac/permission/update'),
('admin1', '/rbac/permission/update'),
('admin', '/rbac/permission/view'),
('admin1', '/rbac/permission/view'),
('admin', '/rbac/role/*'),
('admin1', '/rbac/role/*'),
('admin', '/rbac/role/assign'),
('admin1', '/rbac/role/assign'),
('admin', '/rbac/role/create'),
('admin1', '/rbac/role/create'),
('admin', '/rbac/role/delete'),
('admin1', '/rbac/role/delete'),
('admin', '/rbac/role/index'),
('admin1', '/rbac/role/index'),
('admin', '/rbac/role/search'),
('admin1', '/rbac/role/search'),
('admin', '/rbac/role/update'),
('admin1', '/rbac/role/update'),
('admin', '/rbac/role/view'),
('admin1', '/rbac/role/view'),
('admin', '/rbac/route/*'),
('admin1', '/rbac/route/*'),
('admin', '/rbac/route/assign'),
('admin1', '/rbac/route/assign'),
('admin', '/rbac/route/create'),
('admin1', '/rbac/route/create'),
('admin', '/rbac/route/index'),
('admin1', '/rbac/route/index'),
('admin', '/rbac/route/search'),
('admin1', '/rbac/route/search'),
('admin', '/rbac/rule/*'),
('admin1', '/rbac/rule/*'),
('admin', '/rbac/rule/create'),
('admin1', '/rbac/rule/create'),
('admin', '/rbac/rule/delete'),
('admin1', '/rbac/rule/delete'),
('admin', '/rbac/rule/index'),
('admin1', '/rbac/rule/index'),
('admin', '/rbac/rule/update'),
('admin1', '/rbac/rule/update'),
('admin', '/rbac/rule/view'),
('admin1', '/rbac/rule/view'),
('admin', '/site/*'),
('admin1', '/site/*'),
('Bác sĩ', '/site/*'),
('admin', '/site/about'),
('admin1', '/site/about'),
('Bác sĩ', '/site/about'),
('admin', '/site/captcha'),
('admin1', '/site/captcha'),
('Bác sĩ', '/site/captcha'),
('admin', '/site/contact'),
('admin1', '/site/contact'),
('Bác sĩ', '/site/contact'),
('admin', '/site/error'),
('admin1', '/site/error'),
('Bác sĩ', '/site/error'),
('admin', '/site/index'),
('admin1', '/site/index'),
('Bác sĩ', '/site/index'),
('admin', '/site/login'),
('admin1', '/site/login'),
('Bác sĩ', '/site/login'),
('admin', '/site/logout'),
('admin1', '/site/logout'),
('Bác sĩ', '/site/logout'),
('admin', '/user/*'),
('admin1', '/user/*'),
('admin', '/user/create'),
('admin1', '/user/create'),
('admin', '/user/delete'),
('admin1', '/user/delete'),
('admin', '/user/index'),
('admin1', '/user/index'),
('admin', '/user/update'),
('admin1', '/user/update'),
('admin', '/user/view'),
('admin1', '/user/view'),
('admin', '/vienphi/*'),
('admin1', '/vienphi/*'),
('admin', '/vienphi/create'),
('admin1', '/vienphi/create'),
('admin', '/vienphi/delete'),
('admin1', '/vienphi/delete'),
('admin', '/vienphi/index'),
('admin1', '/vienphi/index'),
('admin', '/vienphi/update'),
('admin1', '/vienphi/update'),
('admin', '/vienphi/view'),
('admin1', '/vienphi/view');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `benhan`
--

CREATE TABLE IF NOT EXISTS `benhan` (
  `id` int(10) NOT NULL,
  `maHS` int(10) NOT NULL,
  `deXuatKham` text COLLATE utf8_unicode_ci NOT NULL,
  `ketLuanBA` text COLLATE utf8_unicode_ci NOT NULL,
  `lichHen` date DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `benhan`
--

INSERT INTO `benhan` (`id`, `maHS`, `deXuatKham`, `ketLuanBA`, `lichHen`, `created_at`, `updated_at`) VALUES
(1, 2, '3 4', 'fff', '2006-10-09', 1447027200, 1449517268),
(2, 3, 'khoa noi tiet', 'tot', '2015-10-09', 1441756800, 1441756800),
(3, 3, 'khoa than kinh', '', '2010-10-09', 1441756800, 1441756800),
(4, 4, '3 4', 'Tốt', '2016-01-01', 1441756800, 1449518250),
(6, 6, '3 8', 'Tốt', '2016-01-01', 1449420809, 1449518333),
(7, 6, 'Nội tiết', 'tốt', '2016-01-01', 1449421004, 1449421004),
(8, 6, 'Nội tiết', 'Tốt', '2016-01-01', 1449421022, 1449421022),
(9, 7, 'Nội tiết', 'Tốt ', '2016-01-01', 1449421062, 1449421062),
(10, 7, 'khoa thần kinh', 'Tốt', '2016-01-01', 1447027200, 1447027200),
(11, 7, 'khoa thần kinh', 'Tốt', '2016-01-01', 1441756800, 1441756800),
(12, 9, 'Khoa xương khớp', 'Tốt', '2016-01-01', 1447027200, 1447027200),
(13, 9, 'Khoa Nội tiết', 'Tốt', '2016-01-01', 1444348800, 1444348800),
(14, 8, 'Khoa ung thư', 'Tốt', '2016-01-01', 1444348800, 1444348800),
(15, 8, 'Khoa ung thư', 'Tốt', '2016-01-01', 1444348800, 1444348800),
(16, 7, 'Khoa ung thư', 'Tốt', '2016-01-01', 1444348800, 1444348800),
(17, 7, 'Khoa tim mạch', 'Tốt', '2016-01-01', 1444348800, 1444348800),
(19, 2, '3 4 5', '', '2016-01-01', 1449510122, 1449513446),
(22, 2, '3 4 5', '', '0000-00-00', 1449514588, 1449514606),
(23, 2, '7 8', '', '0000-00-00', 1449516984, 1449516984),
(24, 6, '5 6 7', '', '0000-00-00', 1449551947, 1449551947),
(25, 2, '2 3', '', '0000-00-00', 1449560066, 1449560066);

-- --------------------------------------------------------

--
-- Table structure for table `benhnhan`
--

CREATE TABLE IF NOT EXISTS `benhnhan` (
  `id` int(10) NOT NULL,
  `tenBN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `gioiTinh` bit(1) NOT NULL,
  `ngheNghiep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `danToc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `benhnhan`
--

INSERT INTO `benhnhan` (`id`, `tenBN`, `ngaySinh`, `gioiTinh`, `ngheNghiep`, `danToc`, `diaChi`, `anh`) VALUES
(5, 'nguyễn thế anh', '1994-10-09', b'1', '', '', '', ''),
(6, 'nguyen anh tuan', '2001-01-02', b'1', '', '', '', ''),
(7, 'lê xuân cần', '1994-10-09', b'1', '', '', '', ''),
(8, 'nguyễn thị A', '1994-10-09', b'1', '', '', '', ''),
(9, 'nguyen A', '1994-10-09', b'1', '', '', '', ''),
(10, 'nguyen A', '1994-10-09', b'1', '', '', '', ''),
(11, 'nguyen ABC', '1994-10-09', b'1', '', '', '', ''),
(12, 'nguyen ACDDDD', '1994-10-09', b'1', '', '', '', ''),
(15, 'aaaaabbbbbb', '1994-10-09', b'1', '', '', '', ''),
(16, 'gam1', '1994-10-09', b'1', '', '', '', ''),
(17, 'Lý Lệ Thanh', '1994-10-09', b'1', '', '', '', ''),
(27, 'TRẦN VĂN THỌ', '1994-10-09', b'1', '', '', '', ''),
(29, 'TRẦN VĂN THỌ', '1994-10-09', b'1', '', '', '', ''),
(31, 'de tau lam nha', '1994-10-09', b'1', '', '', '', ''),
(33, 'TRẦN VĂN THỌ C', '1994-10-09', b'1', '', '', '', ''),
(34, 'nguyen A', '1994-10-09', b'1', '', '', '', ''),
(35, 'hdue', '1994-10-09', b'1', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `benhnhan_phongkham`
--

CREATE TABLE IF NOT EXISTS `benhnhan_phongkham` (
  `id` int(10) NOT NULL,
  `maBA` int(10) NOT NULL,
  `maPK` int(10) NOT NULL,
  `ketQua` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKham` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `benhnhan_phongkham`
--

INSERT INTO `benhnhan_phongkham` (`id`, `maBA`, `maPK`, `ketQua`, `ngayKham`) VALUES
(1, 1, 2, 'Bị sỏi thận', 1449119539),
(2, 1, 2, 'Tốt', 1449430646),
(3, 1, 8, 'Tốt', 1449430701),
(4, 1, 4, 'Tốt', 1449430751),
(7, 19, 3, 'Tốt', 1449514030),
(8, 4, 3, 'tot', 1449518282),
(9, 23, 6, 'tốt', 1449553170),
(10, 1, 3, 'tot', 1449560223);

-- --------------------------------------------------------

--
-- Table structure for table `donthuoc`
--

CREATE TABLE IF NOT EXISTS `donthuoc` (
  `id` int(10) NOT NULL,
  `maBA` int(10) NOT NULL,
  `donthuoc` text COLLATE utf8_unicode_ci NOT NULL,
  `cachSD` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKeDon` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donthuoc`
--

INSERT INTO `donthuoc` (`id`, `maBA`, `donthuoc`, `cachSD`, `ngayKeDon`) VALUES
(1, 1, 'gggg', 'gggg', 1448812955),
(5, 23, 'hhh', 'hhhh', 1449517168),
(6, 2, 'kkk', 'kkk', 1449552136);

-- --------------------------------------------------------

--
-- Table structure for table `donthuocnt`
--

CREATE TABLE IF NOT EXISTS `donthuocnt` (
  `id` int(10) NOT NULL,
  `maNT` int(10) NOT NULL,
  `donthuoc` text COLLATE utf8_unicode_ci NOT NULL,
  `cachSD` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayKeDon` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donthuocnt`
--

INSERT INTO `donthuocnt` (`id`, `maNT`, `donthuoc`, `cachSD`, `ngayKeDon`) VALUES
(1, 5, 'hhhh', 'hhhh', 1449548415),
(2, 6, 'kkkk', 'kkkk', 1449551856);

-- --------------------------------------------------------

--
-- Table structure for table `duoc`
--

CREATE TABLE IF NOT EXISTS `duoc` (
  `maDMThuoc` int(10) NOT NULL,
  `tenDMThuoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `duoc`
--

INSERT INTO `duoc` (`maDMThuoc`, `tenDMThuoc`) VALUES
(2, 'Bubivicain'),
(4, 'isofluran'),
(5, 'isoflurane'),
(6, 'lidocain'),
(7, 'morphin'),
(8, 'aceclofenac'),
(9, 'celecoricle');

-- --------------------------------------------------------

--
-- Table structure for table `hoso`
--

CREATE TABLE IF NOT EXISTS `hoso` (
  `id` int(10) NOT NULL,
  `maBN` int(10) NOT NULL,
  `created_at` int(50) NOT NULL,
  `updated_at` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hoso`
--

INSERT INTO `hoso` (`id`, `maBN`, `created_at`, `updated_at`) VALUES
(2, 5, 2147483647, 2147483647),
(3, 6, 2147483647, 2147483647),
(4, 7, 2147483647, 2147483647),
(5, 8, 2147483647, 2147483647),
(6, 11, 1448795304, 1448795304),
(7, 12, 1448806717, 1448806717),
(8, 15, 1448807372, 1448807372),
(9, 16, 1449042749, 1449042749),
(10, 17, 1449516787, 1449516787),
(20, 27, 1449554203, 1449554203),
(22, 29, 1449554420, 1449554420),
(24, 31, 1449554598, 1449554598),
(26, 33, 1449554637, 1449554637),
(27, 34, 1449556032, 1449556032),
(28, 35, 1449559819, 1449559819);

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE IF NOT EXISTS `khoa` (
  `id` int(10) NOT NULL,
  `tenKhoa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`id`, `tenKhoa`, `moTa`) VALUES
(1, 'Khoa Noi Tiet', 'Khoa Noi tiết'),
(2, 'Khoa thần kinh', 'Khoa thần kinh'),
(3, 'Khoa xương khớp', 'Khoa xương khớp'),
(4, 'Khoa hô hấp', 'Khoa hô hấp'),
(5, 'Khoa tiêu hóa', 'Khoa tiêu hóa'),
(6, 'Khoa tim mạch', 'Khoa tim mạch'),
(7, 'Khoa da liễu', 'Khoa da liễu'),
(8, 'xxxxxx', 'xxxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1449243421),
('m140209_132017_init', 1449243426),
('m140403_174025_create_account_table', 1449243427),
('m140504_113157_update_tables', 1449243432),
('m140504_130429_create_token_table', 1449243433),
('m140506_102106_rbac_init', 1449243533),
('m140830_171933_fix_ip_field', 1449243435),
('m140830_172703_change_account_table_name', 1449243435),
('m141222_110026_update_ip_field', 1449243436),
('m141222_135246_alter_username_length', 1449243437),
('m150614_103145_update_social_account_table', 1449243441),
('m150623_212711_fix_username_notnull', 1449243441);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE IF NOT EXISTS `nhanvien` (
  `id` int(10) NOT NULL,
  `maKhoa` int(10) NOT NULL,
  `chucVu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tenNV` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gioiTinh` bit(1) NOT NULL,
  `queQuan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `danToc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `maKhoa`, `chucVu`, `tenNV`, `gioiTinh`, `queQuan`, `danToc`) VALUES
(1, 1, 'Bác sĩ', 'Nguyễn Văn A', b'1', 'Thanh Hóa', 'Kinh'),
(2, 1, 'Bác sĩ', 'Nguyễn Văn B', b'1', 'Thanh Hóa', 'Kinh'),
(3, 1, 'Y tá', 'Ngô Thị A', b'1', 'Thanh Hóa', 'Kinh'),
(4, 1, 'Bác sĩ', 'Nguyễn Văn DDD', b'1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `noitru`
--

CREATE TABLE IF NOT EXISTS `noitru` (
  `id` int(10) NOT NULL,
  `maBN` int(10) NOT NULL,
  `soPhong` int(10) NOT NULL,
  `soGiuong` int(10) NOT NULL,
  `ngayXuatVien` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `noitru`
--

INSERT INTO `noitru` (`id`, `maBN`, `soPhong`, `soGiuong`, `ngayXuatVien`) VALUES
(5, 8, 12, 12, '2006-10-09'),
(6, 9, 12, 1, '2006-10-09'),
(7, 6, 444, 44, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `phongkham`
--

CREATE TABLE IF NOT EXISTS `phongkham` (
  `id` int(10) NOT NULL,
  `maKhoa` int(10) NOT NULL,
  `tenPK` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phongkham`
--

INSERT INTO `phongkham` (`id`, `maKhoa`, `tenPK`, `moTa`) VALUES
(2, 1, 'Phòng khám nội tiết', 'Phòng khám nội tiết'),
(3, 3, 'Phòng khám xương khớp', 'Phòng khám xương khớp'),
(4, 4, 'Phòng khám hô hấp', 'Phòng khám hô hấp'),
(5, 2, 'Phòng khám khoa thần kinh', 'Phòng khám khoa thần kinh'),
(6, 7, 'Phòng khám khoa da liễu', 'Phòng khám khoa da liễu'),
(7, 5, 'Phòng khám tiêu hóa', 'Phòng khám tiêu hóa'),
(8, 6, 'Phòng khám tim mạch', 'Phòng khám tim mạch'),
(9, 1, 'a', 'ssss');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
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
  `flags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '', 0, '', 0, '', 0, 0, 0),
(2, 'user', 'nguyenanh@gmail.com', 'user', '', 0, '', 0, '', 2147483647, 2147483647, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vienphi`
--

CREATE TABLE IF NOT EXISTS `vienphi` (
  `id` int(10) NOT NULL,
  `maBA` int(10) NOT NULL,
  `tien` int(50) NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `ngayDongVP` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vienphi`
--

INSERT INTO `vienphi` (`id`, `maBA`, `tien`, `mota`, `ngayDongVP`) VALUES
(1, 1, 100000, '', 1448810254),
(2, 23, 1000000, '', 1449517012),
(3, 6, 100000, '', 1449552087),
(4, 2, 77777777, '77777', 1449552242),
(5, 3, 8888888, '888', 1449552342);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `item_name` (`item_name`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `benhan`
--
ALTER TABLE `benhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_benhan_hoso` (`maHS`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `benhnhan`
--
ALTER TABLE `benhnhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benhnhan_phongkham`
--
ALTER TABLE `benhnhan_phongkham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_BAPK_BA` (`maBA`),
  ADD KEY `fk_BAPK_PK` (`maPK`);

--
-- Indexes for table `donthuoc`
--
ALTER TABLE `donthuoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_donthuoc_benhan` (`maBA`);

--
-- Indexes for table `donthuocnt`
--
ALTER TABLE `donthuocnt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_donthuocnt_noitru` (`maNT`);

--
-- Indexes for table `duoc`
--
ALTER TABLE `duoc`
  ADD PRIMARY KEY (`maDMThuoc`);

--
-- Indexes for table `hoso`
--
ALTER TABLE `hoso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hoso_benhnhan` (`maBN`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nhanvien_khoa` (`maKhoa`);

--
-- Indexes for table `noitru`
--
ALTER TABLE `noitru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noitru_benhnhan` (`maBN`);

--
-- Indexes for table `phongkham`
--
ALTER TABLE `phongkham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_phongkham_khoa` (`maKhoa`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_email` (`email`),
  ADD UNIQUE KEY `user_unique_username` (`username`);

--
-- Indexes for table `vienphi`
--
ALTER TABLE `vienphi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vienphi_benhan` (`maBA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `benhan`
--
ALTER TABLE `benhan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `benhnhan`
--
ALTER TABLE `benhnhan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `benhnhan_phongkham`
--
ALTER TABLE `benhnhan_phongkham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `donthuoc`
--
ALTER TABLE `donthuoc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `donthuocnt`
--
ALTER TABLE `donthuocnt`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `duoc`
--
ALTER TABLE `duoc`
  MODIFY `maDMThuoc` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `hoso`
--
ALTER TABLE `hoso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `noitru`
--
ALTER TABLE `noitru`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `phongkham`
--
ALTER TABLE `phongkham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vienphi`
--
ALTER TABLE `vienphi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `benhan`
--
ALTER TABLE `benhan`
  ADD CONSTRAINT `fk_benhan_hoso` FOREIGN KEY (`maHS`) REFERENCES `hoso` (`id`);

--
-- Constraints for table `benhnhan_phongkham`
--
ALTER TABLE `benhnhan_phongkham`
  ADD CONSTRAINT `fk_BAPK_BA` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_BAPK_PK` FOREIGN KEY (`maPK`) REFERENCES `phongkham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donthuoc`
--
ALTER TABLE `donthuoc`
  ADD CONSTRAINT `fk_donthuoc_benhan` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`);

--
-- Constraints for table `donthuocnt`
--
ALTER TABLE `donthuocnt`
  ADD CONSTRAINT `fk_donthuocnt_noitru` FOREIGN KEY (`maNT`) REFERENCES `noitru` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoso`
--
ALTER TABLE `hoso`
  ADD CONSTRAINT `fk_hoso_benhnhan` FOREIGN KEY (`maBN`) REFERENCES `benhnhan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `fk_nhanvien_khoa` FOREIGN KEY (`maKhoa`) REFERENCES `khoa` (`id`);

--
-- Constraints for table `noitru`
--
ALTER TABLE `noitru`
  ADD CONSTRAINT `fk_noitru_benhnhan` FOREIGN KEY (`maBN`) REFERENCES `benhnhan` (`id`);

--
-- Constraints for table `phongkham`
--
ALTER TABLE `phongkham`
  ADD CONSTRAINT `fk_phongkham_khoa` FOREIGN KEY (`maKhoa`) REFERENCES `khoa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vienphi`
--
ALTER TABLE `vienphi`
  ADD CONSTRAINT `fk_vienphi_benhan` FOREIGN KEY (`maBA`) REFERENCES `benhan` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
