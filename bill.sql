-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 05:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bill`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billcode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billcodeid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billdatetime` datetime DEFAULT NULL,
  `customerid` bigint(20) DEFAULT NULL,
  `grandtotal` decimal(65,2) DEFAULT NULL,
  `discper` decimal(5,2) DEFAULT NULL,
  `discamt` decimal(65,2) DEFAULT NULL,
  `othercharges` decimal(9,2) DEFAULT NULL,
  `roundoff` decimal(9,2) DEFAULT NULL,
  `netamount` decimal(65,2) DEFAULT NULL,
  `billpay` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_care_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_bills`
--

CREATE TABLE `d_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billid` bigint(20) NOT NULL,
  `itemid` bigint(20) DEFAULT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` bigint(20) DEFAULT NULL,
  `rate` decimal(65,2) DEFAULT NULL,
  `netamount` decimal(65,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_invpaymententry`
--

CREATE TABLE `d_invpaymententry` (
  `invpaymententrydetailid` bigint(20) UNSIGNED NOT NULL,
  `invpaymententryid` bigint(20) NOT NULL,
  `billid` bigint(20) NOT NULL,
  `invoiceamount` decimal(65,2) DEFAULT NULL,
  `payingamount` decimal(65,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stats_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `h_invpaymententry`
--

CREATE TABLE `h_invpaymententry` (
  `invpaymententryid` bigint(20) UNSIGNED NOT NULL,
  `paymentcode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentcodeid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentdatetime` datetime NOT NULL,
  `partyid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paidamount` decimal(65,2) DEFAULT NULL,
  `paymentmode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionno` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactiondate` date DEFAULT NULL,
  `bankname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stats_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_03_31_000001_create_permissions_table', 1),
(8, '2020_03_31_000002_create_roles_table', 1),
(9, '2020_03_31_000003_create_users_table', 1),
(10, '2020_03_31_000008_create_permission_role_pivot_table', 1),
(11, '2020_03_31_000009_create_role_user_pivot_table', 1),
(16, '2022_11_27_063216_create_m_codegeneration_table', 4),
(19, '2022_11_26_064114_create_customers_table', 5),
(20, '2022_11_26_064905_create_items_table', 5),
(21, '2022_11_26_090157_create_bills_table', 5),
(22, '2022_11_26_091716_create_d_bills_table', 5),
(23, '2022_11_27_051030_create_h_invpaymententry_table', 5),
(24, '2022_11_27_052555_create_d_invpaymententry_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `m_codegeneration`
--

CREATE TABLE `m_codegeneration` (
  `id` int(10) UNSIGNED NOT NULL,
  `typeid` bigint(20) NOT NULL,
  `pattern` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `startmonth` int(11) NOT NULL,
  `startwith` bigint(20) NOT NULL,
  `leadingzero` int(11) NOT NULL,
  `tags_separator` enum('F','B','D') COLLATE utf8mb4_unicode_ci DEFAULT 'F' COMMENT 'F-forward slash, b-backward slash, d-dash',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stats_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_codegeneration`
--

INSERT INTO `m_codegeneration` (`id`, `typeid`, `pattern`, `startmonth`, `startwith`, `leadingzero`, `tags_separator`, `status`, `created_at`, `updated_at`, `deleted_at`, `stats_flag`) VALUES
(1, 1, '[DOC]/[YYYY]/[SR]', 1, 1, 5, 'F', 1, NULL, NULL, NULL, ''),
(2, 2, '[DOC]/[YYYY]/[SR]', 1, 1, 5, 'F', 1, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `m_documenttype`
--

CREATE TABLE `m_documenttype` (
  `typeid` bigint(20) UNSIGNED NOT NULL,
  `typecode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stats_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_documenttype`
--

INSERT INTO `m_documenttype` (`typeid`, `typecode`, `typename`, `created_at`, `updated_at`, `deleted_at`, `stats_flag`) VALUES
(1, 'BL', 'Bill', '2022-11-27 06:26:24', NULL, NULL, 'N'),
(2, 'PE', 'Payment Entry', '2022-11-27 11:56:41', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `m_lookupfixed`
--

CREATE TABLE `m_lookupfixed` (
  `lookupfixid` bigint(20) UNSIGNED NOT NULL,
  `keyname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyvalue` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_lookupfixed`
--

INSERT INTO `m_lookupfixed` (`lookupfixid`, `keyname`, `keyvalue`) VALUES
(1, 'gender', 'Male'),
(2, 'gender', 'Female'),
(3, 'gender', 'Transgender'),
(4, 'bloodgroup', 'A+'),
(5, 'bloodgroup', 'A-'),
(6, 'bloodgroup', 'AB+'),
(7, 'bloodgroup', 'AB-'),
(8, 'bloodgroup', 'B+'),
(9, 'bloodgroup', 'B-'),
(10, 'bloodgroup', 'O+'),
(11, 'bloodgroup', 'O-'),
(12, 'prefix', 'Mr'),
(13, 'prefix', 'Mrs'),
(14, 'prefix', 'Dr.'),
(15, 'maritalstatus', 'Married'),
(16, 'maritalstatus', 'Single'),
(17, 'maritalstatus', 'Widow'),
(18, 'period', 'Days'),
(19, 'period', 'Month'),
(20, 'period', 'Week'),
(21, 'period', 'Year'),
(22, 'appstatus', 'Year'),
(23, 'appstatus', 'Pending'),
(24, 'appstatus', 'Schedule'),
(25, 'appstatus', 'Waiting'),
(26, 'appstatus', 'Completed'),
(27, 'appstatus', 'Cancelled'),
(28, 'labtesttype', 'Individual'),
(29, 'labtesttype', 'Group/Profile'),
(30, 'labresulttypr', 'Numeric'),
(31, 'labresulttypr', 'Text'),
(32, 'labresulttypr', 'Text'),
(33, 'labresulttypr', 'Title'),
(34, 'labresulttypr', 'Writeup'),
(35, 'episodetype', 'General Visit'),
(36, 'episodetype', 'Pediatrics Visit'),
(37, 'episodetype', 'Gynec Visit'),
(38, 'episodetype', 'Neuro Visit'),
(39, 'episodetype', 'Ophthalmologist Visit'),
(40, 'episodetype', 'Ortho Visit'),
(41, 'episodetype', 'Dental Visit'),
(42, 'vaccinestatus', 'Dental Visit'),
(43, 'vaccinestatus', 'Schedule'),
(44, 'vaccinestatus', 'Given'),
(45, 'vaccinestatus', 'Pending'),
(46, 'receiptfor', 'Advanced'),
(47, 'receiptfor', 'Against Bill'),
(48, 'paymentmode', 'Cash'),
(49, 'paymentmode', 'Credit Card'),
(50, 'paymentmode', 'Debit Card'),
(51, 'paymentmode', 'Cheque'),
(52, 'validityduration', 'Minute'),
(53, 'validityduration', 'Hour'),
(54, 'validityduration', 'Day'),
(55, 'ID Name', 'Adhaar Card'),
(56, 'ID Name', 'Passport'),
(57, 'ID Name', 'Driving License'),
(58, 'ID Name', 'Election Commission ID Card'),
(59, 'ID Name', 'Ration Card'),
(60, 'ID Name', 'Electricity Bill'),
(61, 'ID Name', 'Social Security'),
(62, 'pricelistfor', 'General'),
(63, 'pricelistfor', 'Laboratory'),
(64, 'pricelistfor', 'Radiology'),
(65, 'gynaecstatus', 'Dead'),
(66, 'gynaecstatus', 'Alive'),
(67, 'AdmissionStatus', 'Admitted'),
(68, 'AdmissionStatus', 'Discharged'),
(69, 'YesNoOnly', 'Yes'),
(70, 'YesNoOnly', 'No'),
(71, 'otstatus', 'Cancelled'),
(72, 'otstatus', 'Completed'),
(73, 'otstatus', 'Confirm'),
(74, 'otstatus', 'Re-Schedule'),
(75, 'otstatus', 'Schedule'),
(76, 'otstatus', 'Waiting'),
(77, 'opstatus', 'Failed'),
(78, 'opstatus', 'Success'),
(79, 'IPDbilltype', 'Running'),
(80, 'IPDbilltype', 'Final'),
(81, 'labresulttype', 'Numeric'),
(82, 'labresulttype', 'Text/Write'),
(83, 'genderref', 'Male'),
(84, 'genderref', 'Female'),
(85, 'genderref', 'All'),
(86, 'specimenstatus', 'Approved'),
(87, 'specimenstatus', 'Rejected'),
(88, 'invdocumenttypegrn', 'Direct'),
(89, 'invdocumenttypegrn', 'PO'),
(90, 'invdocumenttypepo', 'Direct'),
(91, 'invdocumenttypepo', 'Indent/Requisition'),
(92, 'taxation', 'Inclusive'),
(93, 'taxation', 'Exclusive'),
(94, 'taxation', 'Not Applicable'),
(95, 'invdocumenttypebill', 'Direct'),
(96, 'invdocumenttypebill', 'PO'),
(97, 'invdocumenttypebill', 'GRN');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', '2022-11-26 06:32:05', NULL, NULL),
(2, 'permission_create', '2022-11-26 06:32:05', NULL, NULL),
(3, 'permission_edit', '2022-11-26 06:32:05', NULL, NULL),
(4, 'permission_show', '2022-11-26 06:32:05', NULL, NULL),
(5, 'permission_delete', '2022-11-26 06:32:05', NULL, NULL),
(6, 'permission_access', '2022-11-26 06:32:05', NULL, NULL),
(7, 'role_create', '2022-11-26 06:32:05', NULL, NULL),
(8, 'role_edit', '2022-11-26 06:32:05', NULL, NULL),
(9, 'role_show', '2022-11-26 06:32:05', NULL, NULL),
(10, 'role_delete', '2022-11-26 06:32:05', NULL, NULL),
(11, 'role_access', '2022-11-26 06:32:05', NULL, NULL),
(12, 'user_create', '2022-11-26 06:32:05', NULL, NULL),
(13, 'user_edit', '2022-11-26 06:32:05', NULL, NULL),
(14, 'user_show', '2022-11-26 06:32:05', NULL, NULL),
(15, 'user_delete', '2022-11-26 06:32:05', NULL, NULL),
(16, 'user_access', '2022-11-26 06:32:05', NULL, NULL),
(17, 'profile_password_edit', '2022-11-26 06:32:05', NULL, NULL),
(18, 'customer_access', '2022-11-26 10:18:44', '2022-11-26 10:18:44', NULL),
(19, 'customer_create', '2022-11-26 10:19:08', '2022-11-26 10:19:08', NULL),
(20, 'customer_edit', '2022-11-26 10:19:18', '2022-11-26 10:19:18', NULL),
(21, 'customer_delete', '2022-11-26 10:19:28', '2022-11-26 10:19:28', NULL),
(22, 'customer_show', '2022-11-26 10:19:47', '2022-11-26 10:19:47', NULL),
(23, 'item_access', '2022-11-26 15:52:15', '2022-11-26 15:52:15', NULL),
(24, 'item_create', '2022-11-26 15:52:28', '2022-11-26 15:52:28', NULL),
(25, 'item_edit', '2022-11-26 15:52:38', '2022-11-26 15:52:38', NULL),
(26, 'item_delete', '2022-11-26 15:53:01', '2022-11-26 15:53:01', NULL),
(27, 'code_generation_view', '2022-11-27 01:03:13', '2022-11-27 01:03:13', NULL),
(28, 'bill_view', '2022-11-27 02:30:43', '2022-11-27 02:30:43', NULL),
(29, 'bill_add', '2022-11-27 02:30:57', '2022-11-27 02:30:57', NULL),
(30, 'bill_edit', '2022-11-27 02:31:06', '2022-11-27 02:31:06', NULL),
(31, 'payment_entry_view', '2022-11-28 13:23:09', '2022-11-28 13:23:09', NULL),
(32, 'payment_entry_add', '2022-11-28 13:23:25', '2022-11-28 13:23:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(538018, 1),
(538018, 2),
(538018, 3),
(538018, 4),
(538018, 5),
(538018, 6),
(538018, 7),
(538018, 8),
(538018, 9),
(538018, 10),
(538018, 11),
(538018, 12),
(538018, 13),
(538018, 14),
(538018, 15),
(538018, 16),
(538018, 17),
(538019, 17),
(538018, 18),
(538018, 19),
(538018, 20),
(538018, 21),
(538018, 22),
(538018, 23),
(538018, 24),
(538018, 25),
(538018, 26),
(538018, 27),
(538018, 28),
(538018, 29),
(538018, 30),
(538018, 31),
(538018, 32);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(538018, 'Admin', '2022-11-26 06:32:05', NULL, NULL),
(538019, 'User', '2022-11-26 06:32:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 538018),
(2, 538019);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `mobile_no`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$KjopsXqbCq1NrrGYJe7rr./68LzZSGCas5XxBHHbG.9AF4mc3GPR.', NULL, '', 1, '2022-11-26 06:32:07', NULL, NULL),
(2, 'test', 'admin333@admin.com', NULL, '$2y$10$m3ohNpHPm3Zjl8vns8dcOORTh6KJ/9xBmbMv5ZGXhz3wqpBwJvfPi', NULL, '1234567890', 1, '2022-11-26 06:34:17', '2022-11-26 01:04:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_bills`
--
ALTER TABLE `d_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_invpaymententry`
--
ALTER TABLE `d_invpaymententry`
  ADD PRIMARY KEY (`invpaymententrydetailid`);

--
-- Indexes for table `h_invpaymententry`
--
ALTER TABLE `h_invpaymententry`
  ADD PRIMARY KEY (`invpaymententryid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_codegeneration`
--
ALTER TABLE `m_codegeneration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_documenttype`
--
ALTER TABLE `m_documenttype`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `m_lookupfixed`
--
ALTER TABLE `m_lookupfixed`
  ADD PRIMARY KEY (`lookupfixid`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_role_id_fk` (`role_id`),
  ADD KEY `permission_role_permission_id_fk` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_user_id_fk` (`user_id`),
  ADD KEY `role_user_role_id_fk` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_bills`
--
ALTER TABLE `d_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_invpaymententry`
--
ALTER TABLE `d_invpaymententry`
  MODIFY `invpaymententrydetailid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `h_invpaymententry`
--
ALTER TABLE `h_invpaymententry`
  MODIFY `invpaymententryid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `m_codegeneration`
--
ALTER TABLE `m_codegeneration`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_documenttype`
--
ALTER TABLE `m_documenttype`
  MODIFY `typeid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_lookupfixed`
--
ALTER TABLE `m_lookupfixed`
  MODIFY `lookupfixid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538020;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
