-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2020 at 01:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rubystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `subject`, `message`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Emeka', 'Ndulue', 'iamemekandulue@gmail.com', 'viiorifv roviv', 'ioviofdiirf hf wf jskdh e uvhdiuhr uiffdhijhvi riuhiduh', NULL, '2020-04-01 12:27:17', '2020-04-01 12:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_03_26_135756_product_table', 1),
(4, '2020_03_26_141007_contact_table', 2),
(5, '2020_03_28_000427_create_subscription_table', 3),
(6, '2020_03_30_175303_create_wishlist_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` int(11) NOT NULL,
  `manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `price`, `sku`, `title`, `description`, `label`, `view`, `manufacturer`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586220065/912iX-Sve0L._UL1500__lpk2sf.jpg', 20000, 'RFS222', 'CROWN SUBMIT BACKPACK', 'Ideal for cold-weathered training worked lorem ipsum outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 0, 'Dolce', NULL, '2020-03-26 16:11:18', '2020-03-26 16:11:18'),
(3, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586220082/CatBanner_2up-bella6_x8ttio.jpg', 25000, 'RFS875', 'DIAMOND SUBMIT BACKPACK', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 2, 'Dolce', NULL, '2020-03-26 16:16:33', '2020-03-26 16:16:33'),
(4, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586220099/collections-1024x683_hq2dwq.jpg', 17000, 'RFS845', 'Pot of Gold', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 1, 'Dolce', NULL, '2020-03-26 18:50:02', '2020-03-26 18:50:02'),
(5, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219980/2842056198440_qc8rtq.jpg', 5000, 'RFS863', 'Travelers Jewelers', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 0, 'Nike', NULL, '2020-03-26 18:50:02', '2020-03-26 18:50:02'),
(6, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586220010/2842056198439_csjc8l.jpg', 70000, 'RFS716', 'Diamond Sea', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 2, 'Dolce', NULL, '2020-03-26 18:50:02', '2020-03-26 18:50:02'),
(7, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219980/2842056198440_qc8rtq.jpg', 30000, 'RFS660', 'Sunkissed Jewelry', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 2, 'Dolce', NULL, '2020-03-26 18:50:02', '2020-03-26 18:50:02'),
(8, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219957/cropped-DSC2659-1_y3ml7u.jpg', 47000, 'RFS204', 'Jewelry Empire', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 1, 'Gucci', NULL, '2020-03-26 18:59:36', '2020-03-26 18:59:36'),
(9, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219953/CatBanner_2up-earCharm1_1_eoq5qr.jpg', 18000, 'RFS363', 'Sterling Co. Jewelry', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 1, 'Versace', NULL, '2020-03-26 18:59:36', '2020-03-26 18:59:36'),
(10, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219941/RoseGoldJewelry_BrowseGridHero_1440x1440_Mobile_oguxhr.jpg', 75000, 'RFS252', 'Ice Jewelers', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 0, 'Gucci', NULL, '2020-03-26 18:59:36', '2020-03-26 18:59:36'),
(11, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219941/2842056198442_cc6oox.jpg', 60000, 'RFS185', 'Goldmine Jewelry', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 4, 'Gabbana', NULL, '2020-03-26 18:59:36', '2020-03-26 18:59:36'),
(12, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219703/single-pro-thumb-5_b7rucp.jpg', 74000, 'RFS114', 'The Gemstone Gallery', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 1, 'Gucci', NULL, '2020-03-26 19:08:20', '2020-03-26 19:08:20'),
(13, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219701/single-pro-thumb-4_nbrjey.jpg', 82000, 'RFS640', 'Luxury Gold', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 1, 'Versace', NULL, '2020-03-26 19:08:21', '2020-03-26 19:08:21'),
(14, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219674/single-pro-thumb-3_qettw4.jpg', 55000, 'RFS561', 'Goldbar Jewelry', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 0, 'Gucci', NULL, '2020-03-26 19:08:21', '2020-03-26 19:08:21'),
(15, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219674/single-pro-thumb-2_llakdt.jpg', 110000, 'RFS356', 'The Velvet Box', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 1, 'Gabbana', NULL, '2020-03-26 19:08:21', '2020-03-26 19:08:21'),
(16, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219674/single-pro-thumb_kuotjl.jpg', 44000, 'RFS336', 'Illuminate Jewelers', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 1, 'Nike', NULL, '2020-03-26 19:14:34', '2020-03-26 19:14:34'),
(17, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219674/single-pro-thumb_kuotjl.jpghttps://res.cloudinary.com/dn89dampf/image/upload/v1586219674/single-pro-thumb_kuotjl.jpg', 32000, 'RFS693', 'Infinity Jewelers', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 1, 'Versace', NULL, '2020-03-26 19:14:34', '2020-03-26 19:14:34'),
(18, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219672/sale-product-1_ashj5v.jpg', 8000, 'RFS912', 'Smith Jewelers', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 3, 'Gucci', NULL, '2020-03-26 19:14:34', '2020-03-26 19:14:34'),
(19, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219672/new-product-3_dwytcy.jpg', 15000, 'RFS967', 'Galleria of Gems', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 1, 'Gabbana', NULL, '2020-03-26 19:14:34', '2020-03-26 19:14:34'),
(20, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219672/new-product-2_wizv2p.jpg', 44000, 'RFS247', 'Magic Clasp', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'New', 1, 'Nike', NULL, '2020-03-26 19:19:41', '2020-03-26 19:19:41'),
(21, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219998/hbz-baublebar-index1-1565811867.jpg_xu0ixv.jpg', 32000, 'RFS136', 'Ring of Memories', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Sale', 1, 'Versace', NULL, '2020-03-26 19:19:41', '2020-03-26 19:19:41'),
(22, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219998/hbz-baublebar-index1-1565811867.jpg_xu0ixv.jpg', 7500, 'RFS404', 'Sparkles Shop', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 3, 'Gucci', NULL, '2020-03-26 19:19:41', '2020-03-26 19:19:41'),
(23, 'https://res.cloudinary.com/dn89dampf/image/upload/v1586219971/mouawad-victoria_kvin8u.jpg', 15000, 'RFS489', 'Stone Appeals', 'training worked lorem ipsum outdoors,Ideal for cold-weathered, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum', 'Featured', 1, 'Gabbana', NULL, '2020-03-26 19:19:41', '2020-03-26 19:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Emeka ndulue', 'Iamemekandulue@gmail.com', '2020-05-14 23:00:00', 'Password', NULL, '2020-05-14 23:00:00', '2020-05-14 23:00:00'),
(2, 'Mastermind inc', 'devng44@gmail.com', '2020-05-15 03:14:26', 'Mypass123', NULL, '2020-05-15 15:32:21', '2020-05-15 10:44:29'),
(3, 'randy', 'randy@gmail.com', NULL, '$2b$10$RXaZVjmn9pHLiNDpAG.mZ.VKs.qaryzszjaqAMmW.gpURF034hgem', NULL, NULL, NULL),
(6, 'emekus', 'mailme@emeka.com', NULL, '$2b$10$lF6duAA6GgJnjonLnGyz9.3n1kur4N3cTPOPfilRstgRU1W0WjEbm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
