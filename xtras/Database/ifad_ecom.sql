-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 01:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ifad_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `blog_author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `blog_banner_image` varchar(255) DEFAULT NULL,
  `blog_date` date DEFAULT NULL,
  `blog_short_desc` text DEFAULT NULL,
  `blog_long_desc` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `blog_order` varchar(10) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `name`, `blog_category_id`, `blog_author`, `image`, `blog_banner_image`, `blog_date`, `blog_short_desc`, `blog_long_desc`, `status`, `blog_order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'IFAD Nutri Bite', 7, 'Rafi', '2-579154.jfif', '0a5a5bfe-41cc-4516-873f-2efa2c3dac45-346028.jfif', '2022-12-19', 'Nutri Bite is a nutritive cracker in the country! Nutri Bite contain a bagful of nutrients. They are packed with Vitamin B-1, Vitamin E, Zinc, Iron, fiber, folate and protein. Some of the healthiest cracker you should ensure your loved ones are taking on a routine basis. This fresh and delicious cracker is best snack for health-conscious people and diabetic prone people. As we are aging, appetite suppresses and energy decreases. We don’t eat much because of suppressed appetite. Sometimes we even skip our meals. Because of that, most of us aren’t able to lead a very active lifestyle. The fact is, many of us is undernutrition. Nutri Bite Vegetable Crackers isn’t just a delicious cracker but also a vitamin fortified cracker. They help us to guard our Immune and boosts our energy. It also supports the growth and development of human body.', 'Nutri Bite is a nutritive cracker in the country! Nutri Bite contain a bagful of nutrients. They are packed with Vitamin B-1, Vitamin E, Zinc, Iron, fiber, folate and protein. Some of the healthiest cracker you should ensure your loved ones are taking on a routine basis. This fresh and delicious cracker is best snack for health-conscious people and diabetic prone people. As we are aging, appetite suppresses and energy decreases. We don’t eat much because of suppressed appetite. Sometimes we even skip our meals. Because of that, most of us aren’t able to lead a very active lifestyle. The fact is, many of us is undernutrition. Nutri Bite Vegetable Crackers isn’t just a delicious cracker but also a vitamin fortified cracker. They help us to guard our Immune and boosts our energy. It also supports the growth and development of human body.', '1', '1', 'Admin', 'Admin', '2022-12-19 17:52:52', '2023-02-08 08:33:11'),
(6, 'Brown Atta', 7, NULL, '4b52da1a-669a-45ee-b9ba-7f51b9fb848f-147373.jpg', '4b52da1a-669a-45ee-b9ba-7f51b9fb848f-391002.jpg', '2023-01-04', 'IFAD Brown Atta is obtained by grinding the entire wheat kernel. Nothing is removed from the wheat and the final product thus obtained has a grainy texture with all the nutrients intact. It is relatively healthier as compared to regular wheat flour.\r\nThey\'re typically high in iron, magnesium, manganese, phosphorus, selenium, B vitamins and dietary fiber. Interestingly, choosing whole grains over refined grains has been linked to lower risks of heart disease, type 2 diabetes, cancer and more.', 'IFAD Brown Atta is obtained by grinding the entire wheat kernel. Nothing is removed from the wheat and the final product thus obtained has a grainy texture with all the nutrients intact. It is relatively healthier as compared to regular wheat flour.\r\nThey\'re typically high in iron, magnesium, manganese, phosphorus, selenium, B vitamins and dietary fiber. Interestingly, choosing whole grains over refined grains has been linked to lower risks of heart disease, type 2 diabetes, cancer and more.', '1', '1', 'Admin', 'Admin', '2022-12-21 12:20:22', '2023-01-19 02:42:31'),
(7, 'Multi-Grain Chips', 7, NULL, 'Multi-Grain-257200.jpg', 'Multi-Grain-634680.jpg', NULL, '\"Multigrain\" simply means that the loaf contains several different types of grains, distinguishing it from whole grains. These grains can include oats, barley, cornmeal, wheat, millet, flax and others. However, there is no universal list of grains that a product with this label must contain.', '\"Multigrain\" simply means that the loaf contains several different types of grains, distinguishing it from whole grains. These grains can include oats, barley, cornmeal, wheat, millet, flax and others. However, there is no universal list of grains that a product with this label must contain. Additionally, the product only needs to contain two or more different grains to be deemed \"multigrain\". \r\nThe dietary fibre from multigrain is a part of an overall healthy diet as they help in improving blood cholesterol levels. The health benefits attached to multigrain products are many, but there are many more reasons for you to be consuming multigrain.\r\n\r\nIFAD Wavy Chips doesn’t only come in Bar-B-Q flavor but it’s also healthier as it is made from multigrain. Make your adventure fun and energetic with IFAD Wavy Chips.', '1', NULL, 'Admin', 'Ifadadmin', '2023-01-18 08:45:32', '2023-03-29 03:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categorys`
--

CREATE TABLE `blog_categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categorys`
--

INSERT INTO `blog_categorys` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 'Home', '1', 'Admin', NULL, '2022-12-19 17:49:22', '2022-12-19 17:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cacheadmin@gmail.com|59.152.13.86', 'i:1;', 1680424902),
('laravel_cacheadmin@gmail.com|59.152.13.86:timer', 'i:1680424902;', 1680424902);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_text` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `category_text`, `image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'Chips', 'Chips', 'product_bg.39b07c19-537733.png', '1', 'Admin', 'Admin', '2022-11-15 05:56:29', '2023-03-05 08:02:23'),
(6, 'Biscuit & Bakery', 'Biscuit & Bakery', 'product_bg.39b07c19-122333.png', '1', 'Admin', 'Admin', '2022-11-15 09:46:28', '2023-03-05 08:02:09'),
(7, 'Groceries', 'Groceries', 'product_bg.39b07c19-500341.png', '1', 'api', 'Ifadadmin', '2022-12-08 13:11:36', '2023-03-12 03:06:51'),
(8, 'Noodles', 'Noodles', 'product_bg.39b07c19-597171.png', '1', 'api', 'Admin', '2022-12-08 13:12:29', '2023-03-05 08:01:56'),
(9, 'Snacks', 'Snacks', 'product_bg.39b07c19-975861.png', '1', 'api', 'Admin', '2022-12-08 13:14:38', '2023-03-05 08:01:46'),
(12, 'Home Care', 'Home Care', '7804151-646958.jpg', '1', 'Admin', 'Admin', '2023-02-08 08:50:28', '2023-03-05 03:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_address` text DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_map_key` varchar(255) DEFAULT NULL,
  `contact_link` varchar(255) DEFAULT NULL,
  `contact_longitude` varchar(255) DEFAULT NULL,
  `contact_latitude` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `contact_address`, `contact_email`, `contact_phone`, `contact_map_key`, `contact_link`, `contact_longitude`, `contact_latitude`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Address 1', 'Plot # 7 (New), Tejgaon Industrial Area, Dhaka-1208', 'contact@ifadgroup.com', '09612114444', NULL, '#', '22.261780', '70.804470', '1', 'Admin', 'Admin', '2022-12-28 04:53:38', '2023-01-03 07:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `content_categorys`
--

CREATE TABLE `content_categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_categorys`
--

INSERT INTO `content_categorys` (`id`, `name`, `image`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'IFAD GROUP', 'q-935192.png', 'IFAD GROUP', '1', 'Admin', 'api', '2022-11-10 10:13:34', '2022-12-15 16:34:32'),
(2, 'IFAD GROUP 1', 'IFAD-English-Logo-376852.png', 'IFAD GROUP 1', '1', 'Admin', 'api', '2022-11-13 10:05:33', '2022-12-15 16:35:08'),
(3, 'IMPL Default', NULL, NULL, '1', 'Admin', NULL, '2022-12-20 12:24:18', '2022-12-20 12:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `content_items`
--

CREATE TABLE `content_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `item_image_banner` varchar(255) DEFAULT NULL,
  `item_link` varchar(255) DEFAULT NULL,
  `item_video_link` varchar(255) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  `item_short_desc` text DEFAULT NULL,
  `item_long_desc` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `item_order` varchar(10) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_items`
--

INSERT INTO `content_items` (`id`, `name`, `category_id`, `type_id`, `module_id`, `image`, `item_image_banner`, `item_link`, `item_video_link`, `item_date`, `item_short_desc`, `item_long_desc`, `status`, `item_order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(11, 'Tashfeen Ahmed', 1, 7, 1, '1437363353D.4-398388.png', '0', NULL, NULL, NULL, 'Group Vice Chairman (iii)', 'The Group Vice Chairman (iii) of IFAD Group is Tashfeen Ahmed. He has a Bachelor\'s Degree in Finance from the University of Maryland and earned his MBA from American University in the U.S. He started working for IFAD group in 2012, leading all branding initiatives and developing an internal design and development agency.\r\n\r\nHe founded The Digital Professor, a provider of digital solutions delivering web development and digital marketing services, after establishing IFAD Information and Technology Ltd in 2014. The product portfolio of IFAD IT included IFAD IT vehicle tracking solutions in 2016.\r\n\r\nIn addition, he oversees the business activities of IFAD Enterprises Ltd., Bangladesh\'s only distributor for ELGI Equipment of India\'s Industrial Grade Air Compressors. Over 2500 installations across the nation have been servicing clients since 2002, and that number is rising. The business currently dominates the nation\'s Industrial Air Compressor Sales and Service coverage.\r\n\r\nAdditionally, Mr. Tashfeen has been a leader in numerous CSR efforts in Bangladesh. He started social media campaigns to benefit street children and actively supports the Bangladeshi International Children\'s Animation and Cartoon Festival. He is in charge of IFAD Eggy\'s charitable division, which institutionally administers lots of CSR projects across the nation.', '1', '5', 'Admin', 'Ifad IT', '2022-12-19 15:47:09', '2023-02-22 08:39:28'),
(12, 'Mrs. Nilufar Ahmed', 1, 7, 1, '231414496D.2-705295.png', '0', NULL, NULL, NULL, 'Director', 'Mrs. Nilufar Ahmed was born in Faridpur District, Bangladesh. She is wife of Mr. Iftekhar Ahmed Tipu. She did her M.A in the year 1983 from the University of Dhaka. From 1987 she has been actively playing a vital role in IFAD Group.\r\n\r\n \r\nShe is director of IFAD Group, IFAD Autos Ltd., IFAD Information and Technology Ltd., IFAD Auto Services Ltd., IFAD Enterprise Ltd., IFAD Agro Complex Ltd., IFAD Multi Products Ltd., IFAD Beverage Ltd., and the Managing Director of IFAD Automobiles Ltd. She is also significant shareholder of IFAD Motors Ltd. and IFAD Salt & Chemical Ltd. Other than business, she is also engaged in many social affairs and she is a permanent member of Dhaka Ladies Club. In her personal life, she is a person of pleasant personality and a loving mother of three sons.', '1', '2', 'Admin', 'Admin', '2022-12-19 15:47:30', '2023-03-02 03:29:40'),
(13, 'Tanveer Ahmed', 1, 7, 1, '1461063768D.1-959386.png', '0', NULL, NULL, NULL, 'Group Vice Chairman (i)', 'The Group Vice Chairman (i) of IFAD Group is Tanveer Ahmed. In 2001, after completing his studies in the United States, he began working at IFAD Autos Ltd. He formed IFAD Enterprises Ltd. the next year as the sole dealership of ELGI Equipment of India to offer Industrial Grade Air Compressors in Bangladesh.\r\n\r\n[BR]\r\n\r\nBy entering the consumer foods sector as IFAD Multi Products Ltd in 2005, Mr. Tanveer oversaw IFAD\'s transformation into the real form of a conglomerate in Bangladesh. He thinks that IFAD has always upheld high standards for its clients and is dedicated to offering the highest-quality cuisine that distinguishes itself from the competition. The President\'s SME Award IFAD got in 2011 for outstanding Quality and Production Practices was a testimonial to his dedication. The application of HACCP in flour production systems, which has since evolved into the ISO 22000 certification, was pioneered by Mr. Tanveer in Bangladesh for ensuring cleanliness and flour quality. As a result, the quality standard applied to all future IFAD goods made with flour. The company has accepted the BRC (British Retail Consortium) standard and is SEDEX certified, going above and above to ensure food safety.\r\n[BR]\r\nIn addition to being featured in regional business journals like Arthokontho\'s Most Influential Young Businessmen, he was presented with and accepted The Bizz 2014 Business Excellence Award in Venice, Italy, for IFAD group.\r\n[BR]\r\nIn Bangladesh, Mr. Tanveer was the driving force behind programs that revolutionized corporate social responsibility. He helped establish and continues to support Bangladesh\'s third annual International Children\'s Animation and Cartoon Festival. The inaugural IFAD Go Green and Gomi Zero Bicycle Marathons, as well as IFAD Big Bangla Marathon Run in the city, were supported by him. He advocated for many more such endurance events to promote tourism and environmental consciousness.', '1', '3', 'Admin', 'Admin', '2022-12-19 15:49:38', '2023-02-23 07:57:50'),
(15, 'About Us', 1, 4, 7, '298757945_450294873783528_6976537349057032484_n-224886.jpg', 'Leadeship-banner-278603.jpg', NULL, NULL, NULL, 'Who We Are', 'Instituted in 2003, IFAD Multi Products Limited is recognized as\r\none of the largest consumer food producers in Bangladesh. It began its\r\njourney by erecting one of the largest automated flour mills in the nation\r\nand currently contends as a major supplier of flour products. Concurrently\r\nthe company also established itself as one of the largest suppliers of salt,\r\nboth consumer and industrial grade, following a thorough refining process\r\nthat attributes to its superior quality. Currently the company is also a major\r\nmanufacturer and supplier of Instant Noodles, Stick Noodles, a varied range\r\nof Biscuits and Cookies, Chips, Custard Cakes, Toast Biscuits, Instant Drinks,\r\nChanachur, Lachcha Semai, Puffed Rice, Rice Bran Oil and Bottled Drinking\r\nWater extracted from local aquifers, all of which has been established in its\r\nown industrial park.', '1', NULL, 'Admin', 'Admin', '2022-12-19 15:50:21', '2023-01-08 05:21:00'),
(16, 'Slider 1', 1, 1, 14, 'Factory-458233.jpg', 'IMPL-Factory-431058.jpg', 'ifadmultiproducts.com', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'api', '2022-12-19 17:24:11', '2023-01-02 03:50:41'),
(17, 'Slider 2', 1, 1, 14, 'Atta-Moida-suji-Banner-1920X1080-662781.jpg', 'Atta-Moida-suji-Banner-1920X1080-926846.jpg', 'ifadmultiproducts.com', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'api', '2022-12-19 17:24:42', '2023-01-02 03:50:02'),
(18, 'Slider 3', 1, 1, 14, '3-946250.jpg', '3-294740.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'api', '2022-12-19 17:26:36', '2023-01-02 03:50:23'),
(19, 'banner 1', 1, 1, 3, '301774001_171059498807745_2714559173644570290_n-907565.jpg', '0', NULL, NULL, NULL, NULL, NULL, '1', '3', 'Admin', 'Ifadadmin', '2022-12-20 12:20:42', '2023-02-12 02:50:34'),
(20, 'banner 2', 1, 1, 3, '416x416-258596.jpg', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'Admin', '2022-12-20 12:21:13', '2023-01-04 03:49:40'),
(21, 'banner 3', 1, 1, 3, 'product-471800.png', '0', NULL, NULL, NULL, NULL, NULL, '1', '2', 'Admin', 'Admin', '2022-12-20 12:21:37', '2023-01-04 04:09:16'),
(22, 'Md Rubel', 1, 1, 3, '289273123_158634343376568_526014040734053503_n-306232-740638.jpg', '0', NULL, NULL, NULL, NULL, NULL, '1', '4', 'Admin', 'Ifadadmin', '2022-12-20 12:23:12', '2023-02-12 02:50:48'),
(23, 'banner 5', 1, 1, 3, '321238924_552723203062799_6861729047294013726_n-831344.jpg', '0', NULL, NULL, NULL, NULL, NULL, '1', '1', 'Admin', 'Admin', '2022-12-20 12:23:40', '2023-01-04 03:56:07'),
(24, 'Taskeen Ahmed', 3, 7, 1, '3-720050.jpg', '0', NULL, NULL, NULL, 'Group Vice Chairman (ii)', 'Taskeen Ahmed serves as Group Vice Chairman (ii). He received a Bachelor of Business Management from Independent University of Bangladesh and Rutgers University in New Jersey, USA.\r\n[BR]\r\n\r\nAt Bangladesh\'s North South University, he also pursued an MBA. He began working with Ashok Leyland, which today provides the bulk of trucks, buses, and light cargo vehicles on the market, through IFAD Autos Ltd. in 1999. Under his leadership, the company\'s car sales over the previous ten years had expanded ten-fold, and it now sells more than 3000 units yearly. This rise is attributed to his creation of aggressive sales methods, customer-friendly lending facilities, and a strong credit recovery system, which have elevated IFAD Autos Ltd to the top of the capital market since its IPO in 2014.\r\n[BR]\r\nMr. Taskeen was the president of the India Bangladesh Chamber of Commerce and Industry in November 2015 (IBCCI). He is now the director of DCCI.', '1', '4', 'Admin', 'Admin', '2022-12-20 12:53:29', '2023-02-23 07:56:50'),
(26, 'Food Distribution to Orphanage', 3, 8, 9, 'helpinghand-812021.jpg', NULL, 'http://fb.com', NULL, '2022-12-20', NULL, NULL, '1', NULL, 'Admin', NULL, '2022-12-20 16:03:51', '2022-12-20 16:03:51'),
(27, 'Eid Gift for Poor', 3, 8, 9, 'helpinghand2-994200.jpg', NULL, NULL, NULL, '2022-12-19', NULL, NULL, '1', NULL, 'Admin', NULL, '2022-12-20 16:04:50', '2022-12-20 16:04:50'),
(28, 'Masks & PPE donation', 3, 8, 9, 'helpinghand-527871.jpg', NULL, NULL, NULL, '2022-12-12', NULL, NULL, '1', NULL, 'Admin', NULL, '2022-12-20 16:05:35', '2022-12-20 16:05:35'),
(29, 'Donation to Journalist during COVID-19', 3, 8, 9, '290723012_1059385911347864_8294638877680809452_n-184288.jpg', NULL, NULL, NULL, '2022-12-05', NULL, NULL, '1', NULL, 'Admin', 'Admin', '2022-12-20 16:06:14', '2022-12-20 16:06:47'),
(30, 'award 4', 3, 9, 8, 'a2-519207.png', NULL, NULL, NULL, NULL, 'Chairman, IFAD Multi Products Limited', 'the World greatest Leaders 2017-2018', '1', NULL, 'Admin', 'Admin', '2022-12-20 16:13:03', '2023-01-01 03:11:51'),
(31, 'award 3', 3, 9, 8, 'a1-701191.png', NULL, NULL, NULL, NULL, 'Chairman, IFAD Multi Products Limited', 'the World greatest Leaders 2017-2018', '1', NULL, 'Admin', 'Admin', '2022-12-20 16:13:42', '2023-01-01 03:11:44'),
(32, 'award 2', 3, 9, 8, 'a2-614180.png', NULL, NULL, NULL, NULL, 'Chairman, IFAD Multi Products Limited', 'the World greatest Leaders 2017-2018', '1', NULL, 'Admin', 'Admin', '2022-12-20 16:14:28', '2023-01-01 03:11:32'),
(33, 'award 1', 3, 9, 8, 'a1-883140.png', NULL, NULL, NULL, NULL, 'Chairman, IFAD Multi Products Limited', 'the World greatest Leaders 2017-2018', '1', NULL, 'Admin', 'Admin', '2022-12-20 16:14:59', '2023-01-01 03:11:23'),
(34, 'IFAD currently exporting products to 16 countries around the world.', 3, 10, 6, 'IMPL-Map-833359.png', 'IMPL-Map-201840.png', 'http://implcms.ifadgroup.com:8080/storage/document-image/IMPL-Products-Catelogue-995932.pdf', NULL, NULL, 'For Export information: -\r\nEmail: mrityunjoy@implbd.com -\r\nContact: +8801755629226, -\r\nAddress: Plot # 7 (New), Tejgaon Industrial Area, Dhaka 1208.', 'Australia - Bahrain - Bhutan -  India - KSA - Kuwait  - Malaysia - Netherlands - Oman - Qatar  - Singapore - South Africa - UAE -  UK - USA', '1', NULL, 'Admin', 'Admin', '2022-12-31 04:24:50', '2023-02-08 09:09:14'),
(38, 'Iftekhar Ahmed Tipu', 1, 7, 1, 'chairman-leardersip-622097.jpg', '0_leader1-519404.png', NULL, NULL, NULL, 'Chairman', 'Mr. Iftekhar Ahmed Tipu is a prosperous businessman whose contributions have influenced Bangladesh\'s transportation industry. As the founding firm of IFAD Group, IFAD Autos Ltd., took over Ashok Leyland\'s single dealership in order to meet the nation\'s transportation demands. It was founded in 1985. His desire and vision have come to fruition over the years in the form of one of Bangladesh\'s biggest consumer food producers. Additionally, he established one of Bangladesh\'s major industrial compressor suppliers. He had successfully provided Ashok Leyland Double Decker buses to the Bangladesh Road Transport Corporation four times under the Indian line of state credit.\r\n\r\n[BR]\r\nThe growth of this collection of businesses is an example of Mr. Iftekhar\'s dynamism and desire for creating a company that is always contributing to the development of the country. With four decades of experience as a corporate figure, he wrote one of the most well-liked books that explores issues at the national level and suggest workable answers. He established \"The Daily Nabaraj,\" a daily with a national readership and of which he also serves as editor-in-chief, in order to further his goal of enlightening the country. In 2008 Asia One Magazine accorded him with the “World’s Greatest Leaders” Award in Dubai and also awarded IFAD Autos Ltd. the title of ‘World’s Greatest Brand”.\r\n[BR]\r\n\r\nMr. Iftekhar Ahmed served as the President of the Bangladesh Automobile Assemblers and Manufacturers Association (BAAMA) and is still a member of the FBCCI and all of the country\'s top clubs. Mr. Iftekhar has received praise from many organizations for his tenacity, investment tactics, management skills, and economic contribution. Last but not least, he actively supports the education and training of those with disabilities since he believes in the welfare of individuals from all walks of life. A great father, a visionary leader, a captivating conversationalist, and a philanthropic individual.', '1', '1', NULL, 'Admin', '2023-01-01 04:26:10', '2023-03-02 03:29:30'),
(39, 'IFAD PILLOW Chips', 3, 1, 15, 'PILLOW-275619.png', 'PILLOW-LSB-887687.jpg', NULL, NULL, NULL, 'ইফাদ পিলো চিপস', 'বিকালের স্নাকসে, ইফাদ পিলো চিপস থাকুক হাতে।', '1', '1', 'Admin', 'Admin', '2023-01-01 07:07:24', '2023-01-24 09:10:25'),
(40, 'IFAD MUSTARD OIL', 3, 1, 15, 'MUS-233153.png', 'Musterdoil-743259.jpg', NULL, NULL, NULL, 'ইফাদ সরিষার তেল', 'ইফাদ সরিষার তেল দেশী সরিষার ঝাঁঝে ও গন্ধে অতুলনীয়।', '1', '7', 'Admin', 'Admin', '2023-01-01 07:35:58', '2023-01-24 09:06:48'),
(41, 'IFAD EGGY', 3, 1, 16, '302199495_521672726433610_1259289982517317123_n-926392.jpg', NULL, 'https://www.facebook.com/IfadEggy/', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'Admin', '2023-01-01 08:25:37', '2023-02-08 07:15:57'),
(42, 'IFAD Noodles', 3, 1, 16, '273489529_100907705857300_8909578837914103063_n-300299.jpg', NULL, 'https://www.facebook.com/IFADnoodles/', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'Admin', '2023-01-01 08:39:11', '2023-01-24 02:10:19'),
(43, 'IFAD Snacks', 3, 1, 16, '275483419_128055323108163_1060139879252502937_n-245883.jpg', NULL, 'https://www.facebook.com/Ifadyummysnacks/', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'Admin', '2023-01-01 08:39:55', '2023-01-24 02:11:18'),
(44, 'IFAD Biscuits', 3, 1, 16, '273913945_139093258580392_2278448751789211057_n-318767.png', NULL, 'https://www.facebook.com/ifaddelight', NULL, NULL, NULL, NULL, '1', NULL, 'Admin', 'Admin', '2023-01-01 08:41:26', '2023-01-24 09:12:15'),
(45, 'IFAD Multi products has been awarded as “Green Factory\"', 3, 1, 10, '700200563news-03-924247.png', NULL, NULL, NULL, NULL, NULL, 'IFAD Multi products has been awarded as “Green Factory\"\r\nThe government is going to honour 30 firms with the \'Green Factory Award\' for their outstanding contribution to saving the environment and creation employment, the labour ministry said today.\r\n\r\nThe award will be given in six categories to green factories thanks to local businesses\' efforts to reduce carbon emissions, global warming and address the impact of climate change locally and globally.\r\n\r\nFor all latest news, follow The Daily Star\'s Google News channel. The move has been taken at a time when an increasing number of companies are turning their factories into green production units.\r\n\r\nBangladesh is the global leader having 150 green garment buildings, of which 44 are platinum rated while 93 are gold rated and nine are silver, and four are \'Leadership in Environmental and Energy in Design (LEED)\' by the United States Green Building Council (USGBC).\r\n[BR]\r\nOf the top 10 green garment factories, nine are in Bangladesh.\r\n[BR]\r\nPrime Minister Sheikh Hasina is expected to hand over the awards to the winners on December 8 in Dhaka, marking the celebration of Mujib Borsho, the birth centenary of Father of the Nation Sheikh Mujibur Rahman, said the labour and employment ministry.\r\n\r\nThe ministry introduced the green award in 2020 to inspire more investment in industries but to maintain a green environment, it said in a statement.\r\n[BR]\r\nOf the recipients, some 15 garment factories are under the readymade garment category, three food companies under the food processing sector, four tea estates under the tea industry category, two leather goods industries under the leather and leather goods sector, three factories under the plastic sector and three more factories under the pharmaceuticals sector.\r\n[BR]\r\nThe garment factories are: Remi Holdings, Tarashima Apparels, Plummy Fashions, Mithila Textiles Industries, Vintage Denim Studio, AR Jeans Producer, Karooni Knit Composite, Designer Fashion, Kenpark Bangladesh Apparel (Kenpark Unit 2), Green Textile (Unit -3), Four H Dyeing and Printing, Wisdom Attires, Mahmuda Attires, Snowtex Outwear and Oeko-Tex.\r\n[BR]\r\nThree food processing industries are Habiganj Agro, Akij Food and Beverage and Ifad Multi Products.\r\n\r\nFour tea gardens are Gazipur Tea Garden, Laskarpur Tea Garden, Jagchhara Tea Garden and Neptune Tea Garden.\r\n\r\nTwo leather goods factories are Apex Footwear and Edison Footwear.\r\n\r\nThree plastic industries are Bongo Building Materials, All Plast Bangladesh and Durable Plastic.\r\n\r\nThree pharmaceutical companies are Square Pharmaceuticals, Beximco Pharmaceuticals and Incepta Pharmaceuticals.', '1', NULL, 'Admin', 'Admin', '2023-01-02 01:51:25', '2023-02-23 08:02:44'),
(46, 'Chips', 1, 1, 14, 'New-Chips-491343.jpg', 'New-Chips-782692.jpg', NULL, NULL, NULL, NULL, NULL, '2', NULL, 'Admin', 'api', '2023-01-02 03:58:00', '2023-02-12 02:48:53'),
(48, 'Noodles Banner', 1, 1, 14, 'Noodles-banner-4-984706.jpg', 'Noodles-banner-4-701568.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'api', NULL, '2023-01-02 04:24:33', '2023-01-02 04:24:33'),
(50, 'Fatema Binte Shafik wins ‘Master of Food Plating’', 3, 1, 10, '1799516320news-04-877636.png', '92b712dab8_92b712dab8_baked_bread_cc_Horia_Varlan_banner-455218.jpg', NULL, NULL, NULL, NULL, 'Fatema Binte Shafik has won national food plating master at Dishoom Presents \'Master of Food Plating\' grand finale. The reality show recently held its final at a city hotel, said a press release. The first runner-up is Sanjida Parvin and second runner-up is Moshiur Rahman.\r\n\r\n[BR]\r\n\r\nA significant number of food makers from across the country participated in the programme. Among the total participants, 24 were selected from 8 divisional rounds. On the basis of grooming and best performance, 12 dessert experts were shortlisted for the semi-final round. Finally, 6 food plating masters went ahead for the championship. in Bangladesh\'s first prominent reality show - Dishoom Presents \'Master of Food Plating\'\r\n\r\n[BR]\r\n\r\nNilufar Ahmed, Finance Director of IFAD Group, Shejuti A Ahmed, Director of Human Resource Department with officials from IFAD Home Care Ltd and Nazma Huda, Chairman of International Training Institute of Culinary Arts and Women Culinary Arts of Bangladesh with valued personalities from culinary art arena were present.\r\n[BR]\r\nThe competition was powered by IFAD Mustard Oil & IFAD Eggy Noodles and organized by ITICA.', '1', NULL, 'Admin', 'Admin', '2023-01-02 04:32:57', '2023-02-23 08:02:27'),
(53, 'Our Mission', 3, 1, 7, 'mission-802408.jpg', 'Leadeship-banner-278603.jpg', NULL, NULL, NULL, NULL, 'Our mission is to expand and continually improve utilizing quality\r\npractices and employee involvement to produce food products while\r\npracticing highest standard in quality and hygiene, for human consumption,\r\nboth in the domestic and international markets that result in customer and\r\nemployee satisfaction.', '2', NULL, 'Admin', 'Admin', '2023-01-08 05:04:18', '2023-03-27 04:49:15'),
(54, 'Our Vision', 3, 6, 7, 'new-637494.jpg', 'Leadeship-banner-278603.jpg', NULL, NULL, NULL, NULL, 'Our vision at IMPL outlines who we are, where we want to go and\r\nhow we want the world to view us as a corporate citizen. We are a premier\r\nconsumer food manufacturing company, and our belief in being premier\r\ndoes not mean striving to be just bigger; but it does mean pursuing the best\r\nin terms of consumer value, customer service, employee talent, and consistent\r\nand predictable growth Where we want to go: is at the deepest core of\r\nthe consumer mind, where we want to instill that we are not just a business\r\nthat sells food; but rather an everyday partner of all our valued customers to\r\nmeet their needs. We desire to build a culture that envelops every single\r\nemployee of ours within a sphere of loyalty, ethics, and job satisfaction. And\r\nfinally we will always consider the impact of our actions on the environment\r\nand we will take every necessary step to protect the stage that has given us\r\nthe room to prosper for generations to come.', '2', NULL, 'Admin', 'Admin', '2023-01-08 05:09:34', '2023-03-27 04:49:11'),
(55, 'Quality, Safety and Customer Satisfaction', 3, 6, 7, 'cs-749156.jpg', 'Leadeship-banner-278603.jpg', NULL, NULL, NULL, NULL, 'IFAD Multi Products Limited strongly believes that customer\r\nsatisfaction is the essence of the quality and food safety Policy. We are\r\ncommitted to manufacture quality wheat products (e.g. Atta, Maida and\r\nSuzi), which are safe for human consumption to our customers and end\r\nusers, in a hygienic and dust free environment.\r\n\r\nThrough Research & Development, the company is always\r\nworking out new types of products for our consumers as part of our pursuit\r\nof continuous innovation.\r\n\r\nIt is the responsibility of all employees of IFAD Multi Products\r\nLimited to follow personal hygiene, sanitation, pest control and plant safety\r\nrules. The Quality & Food Safety Policy is communicated to all employees by\r\ndisplaying it at prominent locations and through awareness sessions. The\r\nTop Management of IFAD Multi Products Limited is committed to continual\r\nimprovement of its processes.', '1', NULL, 'Admin', 'Admin', '2023-01-08 05:12:15', '2023-01-24 09:59:39'),
(56, 'General Information', 3, 6, 7, 'general-information-397218.jpg', 'Leadeship-banner-278603.jpg', NULL, NULL, NULL, NULL, 'IFAD Multi Products Limited is a BRC, ISO 22000:2005, ISO\r\n14001:2008 and HACCP certified company. IFAD Multi Products Limited is\r\ncurrently exporting products to more than 33 countries worldwide including\r\nUSA, UK, UAE, KSA, Qatar and Canada along with local operations, IFAD\r\nMulti Products Limited\'s web address, www.ifadmultiproducts.com will\r\nprovide you more information about the spread of the company. \r\n[BR]\r\nIfad Multi Products Ltd. maintains regular interaction with consumers through an\r\nofficial Facebook page called Ifad Eggy (www.facebook.com/IfadEggy) as\r\nwell.', '1', NULL, 'Admin', 'Admin', '2023-01-08 05:13:59', '2023-02-23 08:01:26'),
(57, 'IFAD Atta, Moida & Suzi', 1, 1, 15, 'ATTA-154282.png', 'Atta-418228.png', NULL, NULL, NULL, 'ইফাদ আটা, ময়দা, সুজি', 'ইফাদ আটা, ময়দা ও সুজি প্রকৃতির মতোই বিশুদ্ধ।', '1', '6', 'Admin', 'Admin', '2023-01-08 05:37:30', '2023-01-24 09:06:18'),
(58, 'IFAD Choco Delight', 1, 1, 15, 'CHOCO-184887.png', 'Biskit-855054.png', NULL, NULL, NULL, 'ইফাদ চকো ডিলাইট', 'চকলেট আর বাটারের অনন্য স্বাদে ইফাদ চকো ডিলাইট বিস্কুট।', '1', '5', 'Admin', 'Admin', '2023-01-08 05:46:42', '2023-01-24 09:06:04'),
(59, 'IFAD WAVY Chips', 1, 1, 15, 'WAVY-747627.png', 'Chips-854391.png', NULL, NULL, NULL, 'ইফাদ  চিপস', 'যে-কোনো এডভেঞ্চার শুরু হোক ইফাদ ওয়েভির সাথে।', '1', '2', 'Admin', 'Admin', '2023-01-08 06:01:53', '2023-01-23 09:55:08'),
(60, 'IFAD EGGY Instant Noodles', 1, 1, 15, 'EGGY-307856.png', 'Noodles-220061.png', NULL, NULL, NULL, 'ইফাদ এগি ইনস্ট্যান্ট নুডলস', 'যখন- তখন বদলে দিতে মুড, বেছে নিন ইয়াম্মি স্বাদের ইফাদ এগি ইনস্ট্যান্ট নুডলস!', '1', '8', 'Admin', 'Admin', '2023-01-08 06:03:05', '2023-01-24 09:07:01'),
(61, 'IFAD Butter Delight', 1, 1, 15, 'BUTTER-518206.png', 'Bisket-298488.png', NULL, NULL, NULL, 'ইফাদ বাটার ডিলাইট', 'খাঁটি বাটার সমৃদ্ধ ইফাদ বাটার ডিলাইট বিস্কুট তৈরি হয় সম্পূর্ণ স্বয়ংক্রিয় অত্যাধুনিক মেশিনে।', '1', '4', 'Admin', 'Admin', '2023-01-08 08:43:28', '2023-01-19 05:21:02'),
(62, 'IFAD Nutri Bite', 1, 1, 15, 'Nutri-640917.png', 'Ifad_Nutribite_Billboard-749096.jpg', NULL, NULL, NULL, 'ইফাদ নিউট্রি বাইট', 'প্রতি বাইটে নিউট্রিশন।', '1', '3', 'Admin', 'Admin', '2023-01-19 04:29:15', '2023-01-23 09:55:54'),
(64, 'Reazul Haque Chowdhury', 1, 1, 18, 'WhatsApp-Image-2023-03-27-at-16.20.01-359365.jpg', NULL, NULL, NULL, NULL, 'Group Managing Director', 'Mr. Reazul Haque Chowdhury is the Group Managing Director of IFAD Group. Mr. Chowdhury is a seasoned business professional with decades of experience in the FMCG and Automotive industries. He commenced his career journey with BAT Bangladesh and has gathered vast cross country exposures and all round expertise in different functional and general management roles; working with other renowned large scale multinationals such as Reckitt Benckiser and Unilever at home and abroad. After 23 years of challenging and successful roles in the FMCG industry, Mr. Chowdhury embarked into the vibrant Automobile industry by taking up the role of Managing Director and Chief Executive Officer (CEO) at Runner Automobiles PLC. He completed his Masters of Business Administration in Marketing with exceptional result from the University of Dhaka.', '1', NULL, 'Admin', 'Ifadadmin', '2023-03-02 06:59:45', '2023-03-27 07:53:46'),
(65, 'Mahbub Baset', 1, 1, 19, '03-(1)-918188.jpg', NULL, NULL, NULL, NULL, 'Chief Operating Officer', 'Mr. Mahbub Baset is the Chief Operating Officer for the FMCG Division of IFAD Group. He completed his M.B.A in Marketing from North South University. Mr. Baset has an enriching 25 years of experience in the FMCG industry at home and abroad. He has served as the Head of Marketing in Dabur International Limited for the Sub Sahara Africa. Before that, he was the Marketing Director at Reckitt Benckiser PLC. Currently, Mr. Baset is looking after the key Operations- Sales, Marketing, Product Development, and Portfolio Management. He is also responsible for driving the business growth and profitability.', '1', '3', 'Admin', 'Ifadadmin', '2023-03-02 07:00:19', '2023-05-03 07:20:17'),
(66, 'Shah Jalal Chowdhury FCA', 1, 1, 19, 'Shah-Jalal-Chowdhury-999826.JPG', NULL, NULL, NULL, NULL, 'Chief Financial Officer', 'Mr. Shah Jalal Chowdhury is the Chief Financial Officer for the FMCG Division of IFAD Group. Mr. Shah Jalal is a qualified Chartered Accountant (FCA) under the Institute of Chartered Accountants of Bangladesh (ICAB) having more than 10 (Ten) years of experience in the field of Accounts & Finance in FMCG industry. Prior to joining IFAD, he has served Meghna Group of Industries and Annesha Group.', '1', '5', 'Admin', 'Ifadadmin', '2023-03-02 07:00:53', '2023-05-03 05:11:04'),
(68, 'Mohammed Saleh Uddin Bhuyan', 1, 1, 19, 'saleh-390668.png', NULL, NULL, NULL, NULL, 'Head of Marketing', 'Mr. Mohammed Saleh Uddin Bhuyan is the Head of Marketing for the FMCG Division of IFAD Group. He completed his M.B.A in Marketing and has more than a decade of experience in Brand and Marketing. Prior to joining IFAD, he has been in New Zealand Dairy Products (BD) Ltd. Mr. Saleh is responsible for developing and implementing portfolio strategy and increase the market share of current brands.', '1', '7', 'Admin', 'Ifadadmin', '2023-03-02 07:02:07', '2023-05-03 05:12:01'),
(69, 'Saiful Alam Bappy', 1, 1, 19, 'Saiful-HOS-230785.jpg', NULL, NULL, NULL, NULL, 'Head of Sales', 'Mr. Saiful Alam Bappy is the Head of Sales for the FMCG Division of IFAD Group. Mr. Bappy has more than a decade of experience in Sales. He has served in Coca-Cola International Beverages Private Limited, Reckitt Benckiser (Bangladesh) Limited, MGH Group & multiple other renowned organizations. Currently, he is responsible for market development, managing distributors, channels and the sales force to deliver over business growth, profitability, and productivity.', '1', '6', 'Admin', 'Ifadadmin', '2023-03-02 07:02:43', '2023-05-03 05:11:53'),
(70, 'TEAMWORK', 3, 4, 20, '04-384214.png', NULL, NULL, NULL, NULL, NULL, 'We recognize that our customers are the reason for our success in business, and we are committed to listen and respond positively to their needs.', '2', NULL, 'Admin', 'Admin', '2023-03-19 02:00:10', '2023-03-27 04:35:12'),
(71, 'ASPIRATION', 3, 4, 20, '01-855461.png', NULL, NULL, NULL, NULL, NULL, 'We recognize that our customers are the reason for our success in business, and we are committed to listen and respond positively to their needs.', '2', NULL, 'Admin', 'Admin', '2023-03-19 02:01:11', '2023-03-27 04:35:08'),
(72, 'RESPONSIBILITIES', 3, 4, 20, '06-319402.png', NULL, NULL, NULL, NULL, NULL, 'We recognize that our customers are the reason for our success in business, and we are committed to listen and respond positively to their needs.', '2', NULL, 'Admin', 'Admin', '2023-03-19 02:02:02', '2023-03-27 04:35:04'),
(73, 'CUSTOMER FOCUS', 3, 4, 20, '03-819652.png', NULL, NULL, NULL, NULL, NULL, 'We recognize that our customers are the reason for our success in business, and we are committed to listen and respond positively to their needs.', '2', NULL, 'Admin', 'Admin', '2023-03-19 02:03:10', '2023-03-27 04:35:01'),
(74, 'Md. Zakir Hossain Mondal', 1, 1, 19, 'Mondol-944079.jpg', NULL, NULL, NULL, NULL, 'Head of Plant', 'Mr. Md. Zakir Hossain Mondal is the Head of Plant for the FMCG Division of IFAD Group. Mr. Mondol has over 16 years of valuable experience in the FMCG Industry. He is a professional Food Technologist with expertise on Plant Operation, Quality Assurance, Product Development, Process Development and Optimization, and Food Safety. Mr. Mondal is also trained on various Quality and Safety Compliance Standards such as ISO22K (Food Safety Management System) from BV BD Ltd, Total Quality Management (TQM) from AOTS, Tokyo, Japan and many more. He completed his M.Sc in Food Technology from Islamic University and M.B.A in Marketing from Bangladesh Open University respectively.', '1', '8', 'Ifadadmin', 'Ifadadmin', '2023-03-26 11:52:24', '2023-05-03 07:22:22'),
(75, 'Mission', 3, 1, 21, 'FMCG-876381.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', 'Admin', 'Admin', '2023-03-27 04:46:47', '2023-04-12 08:22:47'),
(76, 'Our Vision', 3, 1, 21, 'FMCG-(1)-916581.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 'Admin', NULL, '2023-03-27 04:48:15', '2023-03-27 04:48:15'),
(77, 'Shejuti A. Ahmed', 1, 1, 19, '06-(1)-209099.jpg', NULL, NULL, NULL, NULL, 'Group Human Resource Director', 'Ms. Shejuti A. Ahmed is the Group Human Resource Director of IFAD Group. With the completion of her M.B.A from American International University, Bangladesh, she commenced her career journey with The World Bank followed by BRAC and ISD. Ms. Shejuti has been at the forefront of the Human Resource Division (HR) of IFAD Group as she led the way for the planning and growth of the HR department as well as aligning other departments, resources, processes and systems with the strategic goals of the organization.', '1', '2', 'Ifadadmin', 'Ifadadmin', '2023-05-03 05:04:55', '2023-05-03 07:20:57'),
(78, 'Syed Mohammed Sibgat Ullah', 1, 1, 19, '01-(1)-994715.jpg', NULL, NULL, NULL, NULL, 'Group Head of Supply Chain Management', 'Mr. Syed Mohammed Sibgat Ullah, Group Head of Supply Chain Management of IFAD Group, is responsible for driving the planning process in the value chain. Mr. Sibgat is a dedicated Supply Chain professional with 27 years of extensive experiences in Multinationals and local conglomerates such as in Shanta Holdings Limited, DBL Group Runner Automobiles Limited, Unilever Bangladesh Limited and many more. He completed his MBA in Finance from International Islamic University of Chittagong.', '1', '4', 'Ifadadmin', 'Ifadadmin', '2023-05-03 05:09:20', '2023-05-03 07:21:32'),
(79, 'Md. Habibur Rahman', 1, 1, 19, '07-707334.jpg', NULL, NULL, NULL, NULL, 'Group Head of Information Technology', 'Mr. Md. Habibur Rahman is the Group Head of Information Technology of IFAD Group. With the completion of B.Sc in Computer Science and Engineering from United International University, he has developed 16 years of extensive experience in Master Data Management, IFS ERP 8.0 and IFS 10. Prior to joining IFAD, he has worked for Apex Footwear Limited, Elucidation Corporation Limited and Genesis Systems Limited. Currently, he is responsible for IFS implementation, SAP and network development at IFAD.', '1', '9', 'Ifadadmin', 'Ifadadmin', '2023-05-03 06:30:38', '2023-05-03 07:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `content_modules`
--

CREATE TABLE `content_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `module_description` text DEFAULT NULL,
  `module_color` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `item_title_status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `item_sdesc_status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_modules`
--

INSERT INTO `content_modules` (`id`, `name`, `image`, `module_description`, `module_color`, `status`, `item_title_status`, `item_sdesc_status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Board of Directors', 'Best-of-Staffing-Client-Diamond-Award-Banner-237149.png', 'Board of Directors', '#a09292', '1', '1', '1', 'Admin', 'Admin', '2022-11-10 10:14:08', '2023-01-26 11:25:54'),
(2, 'Media', NULL, 'Media', '#000000', '1', '1', '1', 'Admin', 'api', '2022-12-13 12:58:30', '2022-12-15 16:26:27'),
(3, 'Who we are', '92b712dab8_92b712dab8_baked_bread_cc_Horia_Varlan_banner-975231.jpg', 'We are an integrated multi-product business group that is highly competitive in the fast-moving FMCG sector to bring high quality, unadulterated, authentic food products to Bangladesh.', '#f9f8f5', '1', '1', '1', 'Admin', 'Admin', '2022-12-15 09:26:45', '2023-01-04 03:35:35'),
(4, 'About Us', NULL, 'About Us', '#000000', '1', '1', '1', 'Admin', 'api', '2022-12-15 10:52:19', '2022-12-15 16:24:22'),
(6, 'IFAD currently exporting products to 16 countries around the world.', NULL, 'Global Reach', '#000000', '1', '1', '1', 'api', 'Admin', '2022-12-15 16:23:56', '2023-01-19 08:55:33'),
(7, 'Company Review', 'Factory-458233-523983.jpg', 'Company Review', '#000000', '1', '1', '1', 'api', 'Admin', '2022-12-15 16:30:39', '2023-01-19 05:56:52'),
(8, 'Award & Recognition', 'helpinghand-726877.jpg', 'Award & Recognition', '#000000', '1', '1', '1', 'api', 'Admin', '2022-12-15 16:31:54', '2023-01-01 03:19:12'),
(9, 'CSR', 'social.c693cc9d-737326.jpg', 'Corporate Social Responsibility', '#000000', '1', '1', '1', 'api', 'Admin', '2022-12-15 16:32:10', '2022-12-21 13:12:15'),
(10, 'News & Events', 'News-and-Event-831799.jpg', 'News & Events', '#000000', '1', '1', '1', 'api', 'Ifadadmin', '2022-12-15 16:32:36', '2023-03-29 03:38:51'),
(11, 'Career', 'IFAD-Auto-Services-LTD-419px-X175px-430273.jpg', 'Career', '#000000', '1', '1', '1', 'api', NULL, '2022-12-15 16:32:47', '2022-12-15 16:32:47'),
(12, 'Contact Us', 'Best-of-Staffing-Client-Diamond-Award-Banner-453678.png', 'Contact Us', '#000000', '1', '1', '1', 'api', 'Admin', '2022-12-15 16:33:27', '2023-01-01 03:18:29'),
(13, 'Our CSR Activitise', 'voice_lang-705932.PNG', 'we contribute to the society against poverty', '#eaf2e9', '1', '1', '1', 'Admin', NULL, '2022-12-18 16:42:48', '2022-12-19 10:54:49'),
(14, 'Slider', NULL, NULL, '#000000', '1', '1', '1', 'Admin', NULL, '2022-12-19 17:20:12', '2022-12-19 17:20:12'),
(15, 'Our Products', NULL, 'Our Products', '#008f4c', '1', '1', '1', 'api', 'Admin', '2022-12-20 12:10:05', '2023-01-04 04:17:29'),
(16, 'Get social with us', NULL, NULL, '#000000', '1', '1', '1', 'Admin', NULL, '2023-01-01 08:12:59', '2023-01-01 08:12:59'),
(18, 'MD', NULL, NULL, '#000000', '1', '1', '1', 'Admin', NULL, '2023-03-02 06:58:07', '2023-03-02 06:58:07'),
(19, 'Leadership Team', NULL, NULL, '#000000', '1', '1', '1', 'Admin', NULL, '2023-03-02 06:58:25', '2023-03-02 06:58:25'),
(20, 'Values', 'Automotive-LAST-731300-values-editedjpg-314788.jpg', NULL, '#fff4e9', '1', '1', '1', 'Admin', 'Admin', '2023-03-19 01:57:43', '2023-04-12 08:22:07'),
(21, 'Mission & Vision', NULL, NULL, '#000000', '1', '1', '1', 'Admin', NULL, '2023-03-27 04:40:44', '2023-03-27 04:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

CREATE TABLE `content_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_types`
--

INSERT INTO `content_types` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Home', '1', 'Admin', 'Admin', '2022-11-10 10:13:46', '2022-12-19 12:20:24'),
(2, 'Product category page', '1', 'Admin', NULL, '2022-12-15 09:24:25', '2022-12-15 09:24:25'),
(3, 'Product Detail Page', '1', 'Admin', NULL, '2022-12-15 09:24:36', '2022-12-15 09:24:36'),
(4, 'About Us Page', '1', 'Admin', NULL, '2022-12-15 09:24:55', '2022-12-15 09:24:55'),
(5, 'Contact Us Page', '1', 'Admin', NULL, '2022-12-15 09:25:07', '2022-12-15 09:25:07'),
(6, 'All Page', '1', 'Admin', NULL, '2022-12-15 09:25:37', '2022-12-15 09:25:37'),
(7, 'Leadership', '1', 'Admin', 'api', '2022-12-15 10:56:49', '2022-12-20 09:20:31'),
(8, 'CSR', '1', 'Admin', 'api', '2022-12-18 16:40:21', '2022-12-20 09:51:36'),
(9, 'Award & Recognition', '1', 'api', NULL, '2022-12-20 09:51:44', '2022-12-20 09:51:44'),
(10, 'Global Reach', '1', 'api', NULL, '2022-12-20 09:52:07', '2022-12-20 09:52:07'),
(11, 'News & Events', '1', 'api', NULL, '2022-12-20 09:52:37', '2022-12-20 09:52:37'),
(12, 'Career', '1', 'api', NULL, '2022-12-20 09:52:50', '2022-12-20 09:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(2) NOT NULL,
  `division_id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lon` varchar(15) DEFAULT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `lat`, `lon`, `url`) VALUES
(1, 1, 'Comilla', 'কুমিল্লা', '23.4682747', '91.1788135', 'www.comilla.gov.bd'),
(2, 1, 'Feni', 'ফেনী', '23.023231', '91.3840844', 'www.feni.gov.bd'),
(3, 1, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', '23.9570904', '91.1119286', 'www.brahmanbaria.gov.bd'),
(4, 1, 'Rangamati', 'রাঙ্গামাটি', '22.65561018', '92.17541121', 'www.rangamati.gov.bd'),
(5, 1, 'Noakhali', 'নোয়াখালী', '22.869563', '91.099398', 'www.noakhali.gov.bd'),
(6, 1, 'Chandpur', 'চাঁদপুর', '23.2332585', '90.6712912', 'www.chandpur.gov.bd'),
(7, 1, 'Lakshmipur', 'লক্ষ্মীপুর', '22.942477', '90.841184', 'www.lakshmipur.gov.bd'),
(8, 1, 'Chattogram', 'চট্টগ্রাম', '22.335109', '91.834073', 'www.chittagong.gov.bd'),
(9, 1, 'Coxsbazar', 'কক্সবাজার', '21.44315751', '91.97381741', 'www.coxsbazar.gov.bd'),
(10, 1, 'Khagrachhari', 'খাগড়াছড়ি', '23.119285', '91.984663', 'www.khagrachhari.gov.bd'),
(11, 1, 'Bandarban', 'বান্দরবান', '22.1953275', '92.2183773', 'www.bandarban.gov.bd'),
(12, 2, 'Sirajganj', 'সিরাজগঞ্জ', '24.4533978', '89.7006815', 'www.sirajganj.gov.bd'),
(13, 2, 'Pabna', 'পাবনা', '23.998524', '89.233645', 'www.pabna.gov.bd'),
(14, 2, 'Bogura', 'বগুড়া', '24.8465228', '89.377755', 'www.bogra.gov.bd'),
(15, 2, 'Rajshahi', 'রাজশাহী', '24.37230298', '88.56307623', 'www.rajshahi.gov.bd'),
(16, 2, 'Natore', 'নাটোর', '24.420556', '89.000282', 'www.natore.gov.bd'),
(17, 2, 'Joypurhat', 'জয়পুরহাট', '25.09636876', '89.04004280', 'www.joypurhat.gov.bd'),
(18, 2, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', '24.5965034', '88.2775122', 'www.chapainawabganj.gov.bd'),
(19, 2, 'Naogaon', 'নওগাঁ', '24.83256191', '88.92485205', 'www.naogaon.gov.bd'),
(20, 3, 'Jashore', 'যশোর', '23.16643', '89.2081126', 'www.jessore.gov.bd'),
(21, 3, 'Satkhira', 'সাতক্ষীরা', NULL, NULL, 'www.satkhira.gov.bd'),
(22, 3, 'Meherpur', 'মেহেরপুর', '23.762213', '88.631821', 'www.meherpur.gov.bd'),
(23, 3, 'Narail', 'নড়াইল', '23.172534', '89.512672', 'www.narail.gov.bd'),
(24, 3, 'Chuadanga', 'চুয়াডাঙ্গা', '23.6401961', '88.841841', 'www.chuadanga.gov.bd'),
(25, 3, 'Kushtia', 'কুষ্টিয়া', '23.901258', '89.120482', 'www.kushtia.gov.bd'),
(26, 3, 'Magura', 'মাগুরা', '23.487337', '89.419956', 'www.magura.gov.bd'),
(27, 3, 'Khulna', 'খুলনা', '22.815774', '89.568679', 'www.khulna.gov.bd'),
(28, 3, 'Bagerhat', 'বাগেরহাট', '22.651568', '89.785938', 'www.bagerhat.gov.bd'),
(29, 3, 'Jhenaidah', 'ঝিনাইদহ', '23.5448176', '89.1539213', 'www.jhenaidah.gov.bd'),
(30, 4, 'Jhalakathi', 'ঝালকাঠি', NULL, NULL, 'www.jhalakathi.gov.bd'),
(31, 4, 'Patuakhali', 'পটুয়াখালী', '22.3596316', '90.3298712', 'www.patuakhali.gov.bd'),
(32, 4, 'Pirojpur', 'পিরোজপুর', NULL, NULL, 'www.pirojpur.gov.bd'),
(33, 4, 'Barisal', 'বরিশাল', NULL, NULL, 'www.barisal.gov.bd'),
(34, 4, 'Bhola', 'ভোলা', '22.685923', '90.648179', 'www.bhola.gov.bd'),
(35, 4, 'Barguna', 'বরগুনা', NULL, NULL, 'www.barguna.gov.bd'),
(36, 5, 'Sylhet', 'সিলেট', '24.8897956', '91.8697894', 'www.sylhet.gov.bd'),
(37, 5, 'Moulvibazar', 'মৌলভীবাজার', '24.482934', '91.777417', 'www.moulvibazar.gov.bd'),
(38, 5, 'Habiganj', 'হবিগঞ্জ', '24.374945', '91.41553', 'www.habiganj.gov.bd'),
(39, 5, 'Sunamganj', 'সুনামগঞ্জ', '25.0658042', '91.3950115', 'www.sunamganj.gov.bd'),
(40, 6, 'Narsingdi', 'নরসিংদী', '23.932233', '90.71541', 'www.narsingdi.gov.bd'),
(41, 6, 'Gazipur', 'গাজীপুর', '24.0022858', '90.4264283', 'www.gazipur.gov.bd'),
(42, 6, 'Shariatpur', 'শরীয়তপুর', NULL, NULL, 'www.shariatpur.gov.bd'),
(43, 6, 'Narayanganj', 'নারায়ণগঞ্জ', '23.63366', '90.496482', 'www.narayanganj.gov.bd'),
(44, 6, 'Tangail', 'টাঙ্গাইল', '24.26361358', '89.91794786', 'www.tangail.gov.bd'),
(45, 6, 'Kishoreganj', 'কিশোরগঞ্জ', '24.444937', '90.776575', 'www.kishoreganj.gov.bd'),
(46, 6, 'Manikganj', 'মানিকগঞ্জ', NULL, NULL, 'www.manikganj.gov.bd'),
(47, 6, 'Dhaka', 'ঢাকা', '23.7115253', '90.4111451', 'www.dhaka.gov.bd'),
(48, 6, 'Munshiganj', 'মুন্সিগঞ্জ', NULL, NULL, 'www.munshiganj.gov.bd'),
(49, 6, 'Rajbari', 'রাজবাড়ী', '23.7574305', '89.6444665', 'www.rajbari.gov.bd'),
(50, 6, 'Madaripur', 'মাদারীপুর', '23.164102', '90.1896805', 'www.madaripur.gov.bd'),
(51, 6, 'Gopalganj', 'গোপালগঞ্জ', '23.0050857', '89.8266059', 'www.gopalganj.gov.bd'),
(52, 6, 'Faridpur', 'ফরিদপুর', '23.6070822', '89.8429406', 'www.faridpur.gov.bd'),
(53, 7, 'Panchagarh', 'পঞ্চগড়', '26.3411', '88.5541606', 'www.panchagarh.gov.bd'),
(54, 7, 'Dinajpur', 'দিনাজপুর', '25.6217061', '88.6354504', 'www.dinajpur.gov.bd'),
(55, 7, 'Lalmonirhat', 'লালমনিরহাট', NULL, NULL, 'www.lalmonirhat.gov.bd'),
(56, 7, 'Nilphamari', 'নীলফামারী', '25.931794', '88.856006', 'www.nilphamari.gov.bd'),
(57, 7, 'Gaibandha', 'গাইবান্ধা', '25.328751', '89.528088', 'www.gaibandha.gov.bd'),
(58, 7, 'Thakurgaon', 'ঠাকুরগাঁও', '26.0336945', '88.4616834', 'www.thakurgaon.gov.bd'),
(59, 7, 'Rangpur', 'রংপুর', '25.7558096', '89.244462', 'www.rangpur.gov.bd'),
(60, 7, 'Kurigram', 'কুড়িগ্রাম', '25.805445', '89.636174', 'www.kurigram.gov.bd'),
(61, 8, 'Sherpur', 'শেরপুর', '25.0204933', '90.0152966', 'www.sherpur.gov.bd'),
(62, 8, 'Mymensingh', 'ময়মনসিংহ', '24.7465670', '90.4072093', 'www.mymensingh.gov.bd'),
(63, 8, 'Jamalpur', 'জামালপুর', '24.937533', '89.937775', 'www.jamalpur.gov.bd'),
(64, 8, 'Netrokona', 'নেত্রকোণা', '24.870955', '90.727887', 'www.netrokona.gov.bd');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `url`) VALUES
(1, 'Chattagram', 'চট্টগ্রাম', 'www.chittagongdiv.gov.bd'),
(2, 'Rajshahi', 'রাজশাহী', 'www.rajshahidiv.gov.bd'),
(3, 'Khulna', 'খুলনা', 'www.khulnadiv.gov.bd'),
(4, 'Barisal', 'বরিশাল', 'www.barisaldiv.gov.bd'),
(5, 'Sylhet', 'সিলেট', 'www.sylhetdiv.gov.bd'),
(6, 'Dhaka', 'ঢাকা', 'www.dhakadiv.gov.bd'),
(7, 'Rangpur', 'রংপুর', 'www.rangpurdiv.gov.bd'),
(8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensinghdiv.gov.bd');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `document_category_id` varchar(255) NOT NULL,
  `document_count` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL,
  `document_desc` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `document_order` varchar(10) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `document_category_id`, `document_count`, `image`, `document_file`, `document_desc`, `status`, `document_order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, 'IMPL Products Catalogue', '6', NULL, '2a293860-8b32-4e77-838b-7e655c24a00d-307504-(1)-293652.jpg', 'IMPL-Product-Catalogue-Design-523795.pdf', NULL, '1', NULL, 'Admin', 'Ifadadmin', '2023-01-24 01:39:50', '2023-03-28 03:37:34'),
(10, 'Global Catalogue', '2', NULL, NULL, 'IMPL-Product--Catalogue-Design-For-Global-302663.pdf', NULL, '1', NULL, 'Admin', 'Ifadadmin', '2023-01-26 05:50:57', '2023-03-28 03:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `document_categories`
--

CREATE TABLE `document_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_categories`
--

INSERT INTO `document_categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Global', '1', 'Admin', 'Admin', '2022-11-28 05:43:05', '2023-01-26 05:57:33'),
(6, 'Catalogue', '1', 'Admin', NULL, '2022-12-19 17:38:53', '2022-12-19 17:38:53'),
(7, 'test', '1', 'Admin', NULL, '2023-02-08 08:30:59', '2023-02-08 08:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categorys`
--

CREATE TABLE `gallery_categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_categorys`
--

INSERT INTO `gallery_categorys` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Gallery Category 1', '1', 'Admin', NULL, '2022-12-19 23:25:40', '2022-12-19 23:25:40'),
(2, 'Gallery Category 2', '1', 'Admin', NULL, '2022-12-19 23:25:51', '2022-12-19 23:25:51'),
(3, 'Gallery Category 3', '1', 'Admin', NULL, '2022-12-20 12:18:48', '2022-12-20 12:18:48'),
(4, 'Static-image-DO-NOT-DELETE', '1', 'Admin', NULL, '2023-01-10 01:54:06', '2023-01-10 01:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retail_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `sales_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `retail_code`, `name`, `owner_name`, `postal_code`, `address`, `zone`, `sales_person`, `phone`, `division`, `district`, `lat`, `long`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(83, 'R00413', 'SHAWRON MOTORS', 'MD.LIAKAT ALI', '6700', 'TRUCK TARMINAL,SIRAJGONJ', 'Bogura Zone', 'Ariful Islam', '01818706862', 'Rajshahi', 'Pabna', '24.0129', '89.2591', '1', NULL, NULL, '2022-12-20 08:56:12', '2022-12-20 08:56:12'),
(84, 'R00414', 'SHAWRON MOTORS', 'MD.LIAKAT ALI', '6700', 'TRUCK TARMINAL,SIRAJGONJ', 'Bogura Zone', 'Ariful Islam', '01818706862', 'Rajshahi', 'Pabna', '24.0129', '89.2591', '1', NULL, NULL, '2022-12-20 08:56:12', '2022-12-20 08:56:12'),
(85, 'R00415', 'SHAWRON MOTORS', 'MD.LIAKAT ALI', '6700', 'TRUCK TARMINAL,SIRAJGONJ', 'Bogura Zone', 'Ariful Islam', '01818706862', 'Rajshahi', 'Pabna', '24.0129', '89.2591', '1', NULL, NULL, '2022-12-20 08:56:12', '2022-12-20 08:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail_address` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_settings`
--

INSERT INTO `mail_settings` (`id`, `name`, `mail_address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Info Department', 'contact@ifadgroup.com', '1', 'Admin', 'Admin', '2022-12-18 08:53:35', '2023-01-04 07:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `deletable` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1=No,2=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Backend Menu', '2', '2020-11-14 11:29:00', '2020-11-14 11:29:00'),
(2, 'Website Menu', '2', '2023-01-01 01:36:59', '2023-01-01 01:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_09_04_194947_create_roles_table', 1),
(4, '2020_09_04_194948_create_users_table', 1),
(5, '2020_09_04_195128_create_menus_table', 1),
(6, '2020_09_04_195217_create_modules_table', 1),
(7, '2020_09_04_195237_create_permissions_table', 1),
(8, '2020_09_04_195355_create_module_role_table', 1),
(21, '2020_09_04_195419_create_permission_role_table', 2),
(22, '2020_09_04_195512_create_settings_table', 2),
(23, '2020_12_06_170829_create_categories_table', 2),
(24, '2020_12_09_165229_create_brands_table', 2),
(25, '2020_12_10_172022_create_taxes_table', 2),
(36, '2020_12_21_161106_create_warehouses_table', 3),
(37, '2020_12_23_171925_create_suppliers_table', 3),
(38, '2020_12_24_143010_create_customer_groups_table', 3),
(39, '2020_12_24_160255_create_customers_table', 3),
(40, '2020_12_24_164025_create_cache_table', 3),
(41, '2020_12_24_164042_create_sessions_table', 3),
(43, '2020_12_25_180232_create_units_table', 4),
(46, '2021_01_09_163834_create_purchases_table', 6),
(47, '2021_01_09_163911_create_purchase_products_table', 6),
(48, '2021_01_09_164002_create_warehouse_products_table', 6),
(49, '2021_01_21_150140_create_accounts_table', 7),
(50, '2021_01_21_185906_create_payments_table', 8),
(51, '2021_01_22_184556_create_expense_categories_table', 9),
(52, '2021_01_22_184604_create_expenses_table', 9),
(53, '2021_01_23_175252_create_sales_table', 10),
(54, '2021_01_23_175329_create_sale_products_table', 10),
(55, '2021_02_02_142458_create_departments_table', 11),
(56, '2021_02_02_175251_create_employees_table', 12),
(57, '2021_02_02_181219_add_image_employee_table', 13),
(58, '2021_02_05_142300_create_hrm_settings_table', 14),
(59, '2021_02_05_150130_create_attendances_table', 15),
(60, '2021_02_06_154732_create_payrolls_table', 16),
(61, '2022_11_07_034855_create_content_categorys_table', 17),
(62, '2022_11_07_152404_create_content_types_table', 17),
(63, '2022_11_08_093144_create_content_modules_table', 17),
(64, '2022_11_10_083932_create_content_items_table', 17),
(65, '2022_11_14_154858_create_tests_table', 18),
(66, '2022_11_15_112339_add_extra_coloums_to_categories_table', 18),
(68, '2022_11_15_120817_create_sub_categories_table', 19),
(69, '2022_11_16_092339_create_variants_table', 20),
(71, '2022_11_16_105406_create_variant_options_table', 21),
(72, '2022_11_17_084435_create_segments_table', 22),
(73, '2022_11_23_084110_create_pack_types_table', 23),
(74, '2022_11_23_084113_create_products_table', 24),
(76, '2022_11_24_083041_create_product_images_table', 25),
(77, '2022_11_27_111751_create_document_categories_table', 26),
(79, '2022_11_28_111428_create_documents_table', 27),
(80, '2022_11_30_094151_add_lifestyle_image_to_products_table', 28),
(82, '2022_11_30_135112_create_locations_table', 29),
(83, '2022_12_06_120201_create_product_lifestyles_table', 30),
(84, '2022_12_06_124446_add_brochure_to_products_table', 31);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') NOT NULL COMMENT '1=divider,2=module',
  `module_name` varchar(255) DEFAULT NULL,
  `divider_title` varchar(255) DEFAULT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `target` enum('_self','_blank') NOT NULL DEFAULT '_self',
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu_id`, `type`, `module_name`, `divider_title`, `icon_class`, `url`, `order`, `parent_id`, `target`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, '_self', '1', NULL, '2023-01-01 01:34:21'),
(2, 1, '1', NULL, 'Menus', NULL, NULL, 2, NULL, '_self', '1', NULL, '2022-12-18 11:12:15'),
(3, 1, '1', NULL, 'Access Control', NULL, NULL, 10, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(4, 1, '2', 'User', NULL, 'fas fa-users', 'user', 11, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(5, 1, '2', 'Role', NULL, 'fas fa-user-tag', 'role', 12, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(6, 1, '1', NULL, 'System', NULL, NULL, 13, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(7, 1, '2', 'Menu', NULL, 'fas fa-th-list', 'menu', 16, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(8, 1, '2', 'Setting', NULL, 'fas fa-cogs', 'setting', 14, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(9, 1, '2', 'Permission', NULL, 'fas fa-tasks', 'menu/module/permission', 17, NULL, '_self', '1', NULL, '2022-12-20 09:29:24'),
(57, 1, '2', 'Content Manager', NULL, 'far fa-address-book', NULL, 3, NULL, '_self', '1', '2022-11-08 09:03:40', '2022-12-20 11:08:33'),
(58, 1, '2', 'Content Category', NULL, 'fab fa-buromobelexperte', 'ccategory', 1, 57, '_self', '1', '2022-11-08 09:04:33', '2022-12-20 11:12:29'),
(59, 1, '2', 'Content Type', NULL, 'fab fa-tumblr-square', 'ctype', 2, 57, '_self', '1', '2022-11-08 09:05:08', '2022-11-16 05:59:14'),
(60, 1, '2', 'Content Module', NULL, 'fas fa-box-open', 'cmodule', 3, 57, '_self', '1', '2022-11-08 09:05:37', '2022-12-20 11:18:17'),
(61, 1, '2', 'Content Item', NULL, 'fa fa-cart-plus', 'citem', 4, 57, '_self', '1', '2022-11-10 03:09:50', '2022-12-20 11:19:19'),
(62, 1, '2', 'Product Manager', NULL, 'fas fa-dolly', NULL, 4, NULL, '_self', '1', '2022-11-15 04:52:45', '2022-12-18 11:12:15'),
(63, 1, '2', 'Categroy', NULL, 'fas fa-list-alt', 'category', 1, 62, '_self', '1', '2022-11-15 04:57:41', '2022-11-16 06:05:42'),
(64, 1, '2', 'Sub Category', NULL, 'fas fa-project-diagram', 'scategory', 2, 62, '_self', '1', '2022-11-15 06:00:07', '2022-12-20 11:22:09'),
(65, 1, '2', 'Variant', NULL, 'fas fa-qrcode', 'variant', 3, 62, '_self', '1', '2022-11-15 09:53:12', '2022-12-20 11:27:15'),
(66, 1, '2', 'Variant Option', NULL, 'fas fa-sitemap', 'voption', 4, 62, '_self', '1', '2022-11-15 09:53:55', '2022-12-20 11:27:51'),
(67, 1, '2', 'Product', NULL, 'fas fa-weight-hanging', 'product', 7, 62, '_self', '1', '2022-11-15 09:54:46', '2022-12-20 11:45:34'),
(68, 1, '2', 'Product Multiple Image', NULL, 'fas fa-images', 'pimage', 8, 62, '_self', '1', '2022-11-15 09:55:21', '2022-12-20 11:53:08'),
(69, 1, '2', 'Segment', NULL, 'fas fa-chart-pie', 'segment', 5, 62, '_self', '1', '2022-11-20 06:04:36', '2022-12-20 11:30:50'),
(70, 1, '2', 'Pack Type', NULL, 'fas fa-ticket-alt', 'pack', 6, 62, '_self', '1', '2022-11-23 03:12:25', '2022-12-20 11:45:54'),
(71, 1, '2', 'Document Category', NULL, 'fas fa-th-list', 'dcategory', 1, 72, '_self', '1', '2022-11-28 05:36:53', '2022-11-28 05:39:05'),
(72, 1, '2', 'Document Manager', NULL, 'fas fa-file', NULL, 5, NULL, '_self', '1', '2022-11-28 05:37:31', '2022-12-18 11:12:15'),
(73, 1, '2', 'Document', NULL, 'fas fa-file', 'document', 2, 72, '_self', '1', '2022-11-28 06:48:56', '2022-11-28 06:49:06'),
(74, 1, '2', 'Location', NULL, 'fas fa-th-list', 'location', 1, 76, '_self', '1', '2022-11-30 08:08:57', '2022-12-04 10:17:20'),
(75, 1, '2', 'Location Import', NULL, 'fas fa-file-import', 'file', 2, 76, '_self', '1', '2022-12-04 05:50:26', '2022-12-04 10:17:24'),
(76, 1, '2', 'Location Manager', NULL, 'fas fa-th-list', NULL, 6, NULL, '_self', '1', '2022-12-04 10:17:03', '2022-12-18 11:12:15'),
(77, 1, '2', 'Product Multiple Lifestyle Image', NULL, 'fas fa-image', 'limage', 9, 62, '_self', '1', '2022-12-06 05:31:22', '2022-12-06 05:31:38'),
(78, 1, '2', 'Blog Manager', NULL, 'fas fa-blog', NULL, 7, NULL, '_self', '1', '2022-12-18 11:06:13', '2022-12-20 09:44:34'),
(79, 1, '2', 'Blog Category', NULL, 'fas fa-th-list', 'bcategory', 1, 78, '_self', '1', '2022-12-18 11:07:14', '2022-12-18 11:09:13'),
(80, 1, '2', 'Blog', NULL, 'fas fa-th-list', 'blog', 2, 78, '_self', '1', '2022-12-18 11:08:56', '2022-12-18 11:09:17'),
(81, 1, '2', 'Picture', NULL, 'fas fa-address-book', 'picture', 2, 85, '_self', '1', '2022-12-18 11:10:45', '2022-12-20 12:16:50'),
(82, 1, '2', 'Video', NULL, 'fas fa-address-book', 'video', 3, 85, '_self', '1', '2022-12-18 11:11:25', '2022-12-20 12:16:50'),
(83, 1, '2', 'Contact', NULL, 'fas fa-address-book', 'contact', 9, NULL, '_self', '1', '2022-12-18 11:11:53', '2022-12-20 09:29:24'),
(84, 1, '2', 'Email Settings', NULL, 'fas fa-th-list', 'email', 15, NULL, '_self', '1', '2022-12-18 15:09:28', '2022-12-20 09:29:24'),
(85, 1, '2', 'Image manager', NULL, 'fas fa-image', NULL, 8, NULL, '_self', '1', '2022-12-20 09:28:18', '2023-05-08 05:35:44'),
(86, 1, '2', 'Category', NULL, 'fas fa-th-list', 'gcategory', 1, 85, '_self', '1', '2022-12-20 12:16:37', '2022-12-20 12:16:50'),
(87, 2, '2', 'Home', NULL, NULL, 'http://13.213.38.174:8001/', 1, 88, '_self', '2', '2023-01-04 02:14:29', '2023-01-04 02:15:59'),
(88, 2, '2', 'Products', NULL, NULL, 'http://13.213.38.174:8001/products', 1, NULL, '_self', '1', '2023-01-04 02:15:47', '2023-01-04 02:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `module_role`
--

CREATE TABLE `module_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_role`
--

INSERT INTO `module_role` (`id`, `module_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2020-11-14 11:40:41', '2020-11-14 11:40:41'),
(5, 1, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(6, 2, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(7, 57, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(8, 58, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(9, 59, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(10, 60, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(11, 61, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(12, 62, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(13, 63, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(14, 64, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(15, 65, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(16, 66, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(17, 69, 3, '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(18, 70, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(19, 67, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(20, 68, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(21, 77, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(22, 72, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(23, 71, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(24, 73, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(25, 76, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(26, 74, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(27, 75, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(28, 3, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(29, 4, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(30, 8, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(32, 57, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(33, 58, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(34, 59, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(35, 60, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(36, 61, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(37, 62, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(38, 63, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(39, 64, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(40, 65, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(41, 66, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(42, 69, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(43, 70, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(44, 67, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(45, 68, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(46, 77, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(47, 72, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(48, 71, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(49, 73, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(56, 8, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(57, 62, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(58, 67, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(59, 68, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(60, 88, 2, '2023-02-08 02:37:13', '2023-02-08 02:37:13'),
(61, 87, 2, '2023-02-08 02:37:13', '2023-02-08 02:37:13'),
(62, 1, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(63, 88, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(64, 87, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(65, 57, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(66, 58, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(67, 59, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(68, 60, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(69, 61, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(70, 62, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(71, 63, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(72, 64, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(73, 65, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(74, 66, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(75, 69, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(76, 70, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(77, 67, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(78, 68, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(79, 77, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(80, 72, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(81, 71, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(82, 73, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(83, 76, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(84, 74, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(85, 75, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(86, 78, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(87, 79, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(88, 80, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(89, 85, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(90, 86, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(91, 81, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(92, 82, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(93, 83, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(94, 4, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(95, 6, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(96, 8, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(97, 84, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(98, 2, 4, '2023-02-09 04:49:27', '2023-02-09 04:49:27'),
(99, 3, 4, '2023-02-09 04:49:27', '2023-02-09 04:49:27'),
(100, 78, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(101, 79, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(102, 80, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `pack_types`
--

CREATE TABLE `pack_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pack_types`
--

INSERT INTO `pack_types` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'Packet', '1', 'Admin', 'Admin', '2022-11-23 03:18:16', '2023-01-05 02:27:48'),
(5, 'Box', '1', 'Admin', NULL, '2023-01-05 02:27:56', '2023-01-05 02:27:56'),
(6, 'Bottle', '1', 'Admin', NULL, '2023-01-05 02:28:08', '2023-01-05 02:28:08'),
(7, 'Liter', '1', 'Admin', NULL, '2023-01-08 01:02:13', '2023-01-08 01:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard Access', 'dashboard-access', '2020-11-14 11:35:13', NULL),
(8, 4, 'User Access', 'user-access', '2020-11-14 11:36:47', NULL),
(9, 4, 'User Add', 'user-add', '2020-11-14 11:36:47', NULL),
(10, 4, 'User Edit', 'user-edit', '2020-11-14 11:36:47', NULL),
(11, 4, 'User View', 'user-view', '2020-11-14 11:36:47', NULL),
(12, 4, 'User Delete', 'user-delete', '2020-11-14 11:36:47', NULL),
(13, 4, 'User Bulk Delete', 'user-bulk-delete', '2020-11-14 11:36:47', NULL),
(14, 4, 'User Report', 'user-report', '2020-11-14 11:36:47', NULL),
(15, 5, 'Role Access', 'role-access', '2020-11-14 11:37:36', NULL),
(16, 5, 'Role Add', 'role-add', '2020-11-14 11:37:36', NULL),
(17, 5, 'Role Edit', 'role-edit', '2020-11-14 11:37:36', NULL),
(18, 5, 'Role View', 'role-view', '2020-11-14 11:37:36', NULL),
(19, 5, 'Role Delete', 'role-delete', '2020-11-14 11:37:36', NULL),
(20, 5, 'Role Bulk Delete', 'role-bulk-delete', '2020-11-14 11:37:36', NULL),
(21, 5, 'Role Report', 'role-report', '2020-11-14 11:37:36', NULL),
(22, 7, 'Menu Access', 'menu-access', '2020-11-14 11:38:52', NULL),
(23, 7, 'Menu Add', 'menu-add', '2020-11-14 11:38:52', NULL),
(24, 7, 'Menu Edit', 'menu-edit', '2020-11-14 11:38:52', NULL),
(25, 7, 'Menu Delete', 'menu-delete', '2020-11-14 11:38:52', NULL),
(26, 7, 'Menu Bulk Delete', 'menu-bulk-delete', '2020-11-14 11:38:52', NULL),
(27, 7, 'Menu Report', 'menu-report', '2020-11-14 11:38:52', NULL),
(28, 7, 'Menu Builder', 'menu-builder', '2020-11-14 11:38:52', NULL),
(29, 7, 'Menu Module Add', 'menu-module-add', '2020-11-14 11:38:52', NULL),
(30, 7, 'Menu Module Edit', 'menu-module-edit', '2020-11-14 11:38:52', NULL),
(31, 7, 'Menu Module Delete', 'menu-module-delete', '2020-11-14 11:38:52', NULL),
(32, 8, 'Setting Access', 'setting-access', '2020-11-14 11:39:09', NULL),
(33, 9, 'Permission Access', 'permission-access', '2020-11-14 11:39:51', NULL),
(34, 9, 'Permission Add', 'permission-add', '2020-11-14 11:39:51', NULL),
(35, 9, 'Permission Edit', 'permission-edit', '2020-11-14 11:39:51', NULL),
(36, 9, 'Permission Delete', 'permission-delete', '2020-11-14 11:39:51', NULL),
(37, 9, 'Permission Bulk Delete', 'permission-bulk-delete', '2020-11-14 11:39:51', NULL),
(38, 9, 'Permission Report', 'permission-report', '2020-11-14 11:39:51', NULL),
(197, 58, 'Content Category Access', 'ccategory-access', '2022-11-08 09:07:58', NULL),
(198, 58, 'Content Category Add', 'ccategory-add', '2022-11-08 09:07:58', NULL),
(199, 58, 'Content Category Edit', 'ccategory-edit', '2022-11-08 09:07:58', NULL),
(200, 58, 'Content Category Delete', 'ccategory-delete', '2022-11-08 09:07:58', NULL),
(201, 58, 'Content Category Bulk Delete', 'ccategory-bulk-delete', '2022-11-08 09:07:58', NULL),
(202, 58, 'Content Category Report', 'ccategory-report', '2022-11-08 09:07:58', NULL),
(203, 59, 'Content Type Access', 'ctype-access', '2022-11-08 09:09:22', '2022-11-08 09:10:32'),
(204, 59, 'Content Type Add', 'ctype-add', '2022-11-08 09:09:22', '2022-11-08 09:10:21'),
(205, 59, 'Content Type Edit', 'ctype-edit', '2022-11-08 09:09:22', '2022-11-08 09:10:13'),
(206, 59, 'Content Type Delete', 'ctype-delete', '2022-11-08 09:09:22', '2022-11-08 09:10:06'),
(207, 59, 'Content Type Bulk Delete', 'ctype-bulk-delete', '2022-11-08 09:09:22', '2022-11-08 09:09:58'),
(208, 59, 'Content Type Report', 'ctype-report', '2022-11-08 09:09:22', '2022-11-08 09:09:47'),
(209, 60, 'Content Module Access', 'cmodule-access', '2022-11-08 09:11:51', '2022-11-08 09:12:54'),
(210, 60, 'Content Module Add', 'cmodule-add', '2022-11-08 09:11:51', '2022-11-08 09:12:46'),
(211, 60, 'Content Module Edit', 'cmodule-edit', '2022-11-08 09:11:51', '2022-11-08 09:12:38'),
(212, 60, 'Content Module Delete', 'cmodule-delete', '2022-11-08 09:11:51', '2022-11-08 09:12:28'),
(213, 60, 'Content Module Bulk Delete', 'cmodule-bulk-delete', '2022-11-08 09:11:51', '2022-11-08 09:12:21'),
(214, 60, 'Content Module Report', 'cmodule-report', '2022-11-08 09:11:51', '2022-11-08 09:12:14'),
(215, 61, 'Content Item Access', 'citem-access', '2022-11-10 09:16:54', NULL),
(216, 61, 'Content Item Add', 'citem-add', '2022-11-10 09:16:54', NULL),
(217, 61, 'Content Item Edit', 'citem-edit', '2022-11-10 09:16:54', NULL),
(218, 61, 'Content Item Delete', 'citem-delete', '2022-11-10 09:16:54', NULL),
(219, 61, 'Content Item Bulk Delete', 'citem-bulk-delete', '2022-11-10 09:16:54', NULL),
(220, 61, 'Content Item Report', 'citem-report', '2022-11-10 09:16:54', NULL),
(221, 63, 'Category Access', 'category-access', '2022-11-15 05:04:02', NULL),
(222, 63, 'Category Add', 'category-add', '2022-11-15 05:04:02', NULL),
(223, 63, 'Category Edit', 'category-edit', '2022-11-15 05:04:02', NULL),
(224, 63, 'Category Delete', 'category-delete', '2022-11-15 05:04:02', NULL),
(225, 63, 'Category Bulk Delete', 'category-bulk-delete', '2022-11-15 05:04:02', NULL),
(226, 63, 'Category Report', 'category-report', '2022-11-15 05:04:02', NULL),
(227, 64, 'Sub Category Access', 'scategory-access', '2022-11-15 06:03:45', NULL),
(228, 64, 'Sub Category Add', 'scategory-add', '2022-11-15 06:03:45', NULL),
(229, 64, 'Sub Category Edit', 'scategory-edit', '2022-11-15 06:03:45', NULL),
(230, 64, 'Sub Category Delete', 'scategory-delete', '2022-11-15 06:03:45', NULL),
(231, 64, 'Sub Category Bulk Delete', 'scategory-bulk-delete', '2022-11-15 06:03:45', NULL),
(232, 64, 'Sub Category Report', 'scategory-report', '2022-11-15 06:03:45', NULL),
(233, 65, 'Variant Access', 'variant-access', '2022-11-16 02:58:14', NULL),
(234, 65, 'Variant Add', 'variant-add', '2022-11-16 02:58:14', NULL),
(235, 65, 'Variant Edit', 'variant-edit', '2022-11-16 02:58:14', NULL),
(236, 65, 'Variant Delete', 'variant-delete', '2022-11-16 02:58:14', NULL),
(237, 65, 'Variant Bulk Delete', 'variant-bulk-delete', '2022-11-16 02:58:14', NULL),
(238, 65, 'Variant Report', 'variant-report', '2022-11-16 02:58:14', NULL),
(239, 66, 'Variant Option Access', 'voption-access', '2022-11-16 03:01:32', NULL),
(240, 66, 'Variant Option Add', 'voption-add', '2022-11-16 03:01:32', NULL),
(241, 66, 'Variant Option Edit', 'voption-edit', '2022-11-16 03:01:32', NULL),
(242, 66, 'Variant Option Delete', 'voption-delete', '2022-11-16 03:01:32', NULL),
(243, 66, 'Variant Option Bulk Delete', 'voption-bulk-delete', '2022-11-16 03:01:32', NULL),
(244, 66, 'Variant Option Report', 'voption-report', '2022-11-16 03:01:32', NULL),
(245, 67, 'Product Access', 'product-access', '2022-11-16 03:04:30', NULL),
(246, 67, 'Product Add', 'product-add', '2022-11-16 03:04:30', NULL),
(247, 67, 'Product Edit', 'product-edit', '2022-11-16 03:04:30', NULL),
(248, 67, 'Product Delete', 'product-delete', '2022-11-16 03:04:30', NULL),
(249, 67, 'Product Bulk Delete', 'product-bulk-delete', '2022-11-16 03:04:30', NULL),
(250, 67, 'Product Report', 'product-report', '2022-11-16 03:04:30', NULL),
(251, 68, 'Product Image  Access', 'pimage-access', '2022-11-16 03:06:38', NULL),
(252, 68, 'Product Image Add', 'pimage-add', '2022-11-16 03:06:38', NULL),
(253, 68, 'Product Image Edit', 'pimage-edit', '2022-11-16 03:06:38', NULL),
(254, 68, 'Product Image Delete', 'pimage-delete', '2022-11-16 03:06:38', NULL),
(255, 68, 'Product Image Bulk Delete', 'pimage-bulk-delete', '2022-11-16 03:06:38', NULL),
(256, 68, 'Product Image Report', 'pimage-report', '2022-11-16 03:06:38', NULL),
(257, 69, 'Segment Access', 'segment-access', '2022-11-20 06:13:53', NULL),
(258, 69, 'Segment Add', 'segment-add', '2022-11-20 06:13:53', NULL),
(259, 69, 'Segment Edit', 'segment-edit', '2022-11-20 06:13:53', NULL),
(260, 69, 'Segment Delete', 'segment-delete', '2022-11-20 06:13:53', NULL),
(261, 69, 'Segment Bulk Delete', 'segment-bulk-delete', '2022-11-20 06:13:53', NULL),
(262, 69, 'Segment Report', 'segment-report', '2022-11-20 06:13:53', NULL),
(263, 70, 'Pack Type Access', 'pack-access', '2022-11-23 03:14:02', NULL),
(264, 70, 'Pack Type Add', 'pack-add', '2022-11-23 03:14:02', NULL),
(265, 70, 'Pack Type Edit', 'pack-edit', '2022-11-23 03:14:02', NULL),
(266, 70, 'Pack Type Delete', 'pack-delete', '2022-11-23 03:14:02', NULL),
(267, 70, 'Pack Type Bulk Delete', 'pack-bulk-delete', '2022-11-23 03:14:02', NULL),
(268, 70, 'Pack Type Report', 'pack-report', '2022-11-23 03:14:02', NULL),
(269, 71, 'Document Category Access', 'dcategory-access', '2022-11-28 05:41:16', NULL),
(270, 71, 'Document Category Add', 'dcategory-add', '2022-11-28 05:41:16', NULL),
(271, 71, 'Document Category Edit', 'dcategory-edit', '2022-11-28 05:41:16', NULL),
(272, 71, 'Document Category Delete', 'dcategory-delete', '2022-11-28 05:41:16', NULL),
(273, 71, 'Document Category Bulk Delete', 'dcategory-bulk-delete', '2022-11-28 05:41:16', NULL),
(274, 71, 'Document Category Report', 'dcategory-report', '2022-11-28 05:41:16', NULL),
(275, 73, 'Document Access', 'document-access', '2022-11-28 06:50:25', NULL),
(276, 73, 'Document Add', 'document-add', '2022-11-28 06:50:25', NULL),
(277, 73, 'Document Edit', 'document-edit', '2022-11-28 06:50:25', NULL),
(278, 73, 'Document Delete', 'document-delete', '2022-11-28 06:50:25', NULL),
(279, 73, 'Document Bulk Delete', 'document-bulk-delete', '2022-11-28 06:50:25', NULL),
(280, 73, 'Document Report', 'document-report', '2022-11-28 06:50:25', NULL),
(281, 74, 'Location Access', 'location-access', '2022-11-30 08:11:38', NULL),
(282, 74, 'Location Add', 'location-add', '2022-11-30 08:11:38', NULL),
(283, 74, 'Location Edit', 'location-edit', '2022-11-30 08:11:38', NULL),
(284, 74, 'Location Delete', 'location-delete', '2022-11-30 08:11:38', NULL),
(285, 74, 'Location Bulk Delete', 'location-bulk-delete', '2022-11-30 08:11:38', NULL),
(286, 74, 'Location Report', 'location-report', '2022-11-30 08:11:38', NULL),
(287, 75, 'Location Import File', 'file-import', '2022-12-04 05:53:22', NULL),
(288, 75, 'Location Import File', 'file-export', '2022-12-04 05:53:22', NULL),
(289, 77, 'Product Lifestyle Image Access', 'limage-access', '2022-12-06 05:34:52', NULL),
(290, 77, 'Product Lifestyle Image Add', 'limage-add', '2022-12-06 05:34:52', NULL),
(291, 77, 'Product Lifestyle Image Edit', 'limage-edit', '2022-12-06 05:34:52', NULL),
(292, 77, 'Product Lifestyle Image Delete', 'limage-delete', '2022-12-06 05:34:52', NULL),
(293, 77, 'Product Lifestyle Image Bulk Delete', 'limage-bulk-delete', '2022-12-06 05:34:52', NULL),
(294, 77, 'Product Lifestyle Image Report', 'limage-report', '2022-12-06 05:34:52', NULL),
(295, 79, 'Blog Category Access', 'bcategory-access', '2022-12-18 11:13:57', NULL),
(296, 79, 'Blog Category Add', 'bcategory-add', '2022-12-18 11:13:57', NULL),
(297, 79, 'Blog Category Edit', 'bcategory-edit', '2022-12-18 11:13:57', NULL),
(298, 79, 'Blog Category Delete', 'bcategory-delete', '2022-12-18 11:13:57', NULL),
(299, 79, 'Blog Category Bulk Delete', 'bcategory-bulk-delete', '2022-12-18 11:13:57', NULL),
(300, 79, 'Blog Category Report', 'bcategory-report', '2022-12-18 11:13:57', NULL),
(301, 80, 'Blog Access', 'blog-access', '2022-12-18 11:15:27', NULL),
(302, 80, 'Blog Add', 'blog-add', '2022-12-18 11:15:27', NULL),
(303, 80, 'Blog Edit', 'blog-edit', '2022-12-18 11:15:27', NULL),
(304, 80, 'Blog Delete', 'blog-delete', '2022-12-18 11:15:27', NULL),
(305, 80, 'Blog Bulk Delete', 'blog-bulk-delete', '2022-12-18 11:15:27', NULL),
(306, 80, 'Blog Report', 'blog-report', '2022-12-18 11:15:27', NULL),
(307, 81, 'Picture Access', 'picture-access', '2022-12-18 11:17:00', NULL),
(308, 81, 'Picture Add', 'picture-add', '2022-12-18 11:17:00', NULL),
(309, 81, 'Picture Edit', 'picture-edit', '2022-12-18 11:17:00', NULL),
(310, 81, 'Picture Delete', 'picture-delete', '2022-12-18 11:17:00', NULL),
(311, 81, 'Picture Bulk Delete', 'picture-bulk-delete', '2022-12-18 11:17:00', NULL),
(312, 81, 'Picture report', 'picture-report', '2022-12-18 11:17:00', NULL),
(313, 82, 'Video Access', 'video-access', '2022-12-18 11:17:49', NULL),
(314, 82, 'Video Add', 'video-add', '2022-12-18 11:17:49', NULL),
(315, 82, 'Video Edit', 'video-edit', '2022-12-18 11:17:49', NULL),
(316, 82, 'Video Delete', 'video-delete', '2022-12-18 11:17:49', NULL),
(317, 82, 'Video Bulk Delete', 'video-bulk-delete', '2022-12-18 11:17:49', NULL),
(318, 82, 'Video Report', 'video-report', '2022-12-18 11:17:49', NULL),
(319, 83, 'Contact Access', 'contact-access', '2022-12-18 11:19:12', NULL),
(320, 83, 'Contact Add', 'contact-add', '2022-12-18 11:19:12', NULL),
(321, 83, 'Contact Edit', 'contact-edit', '2022-12-18 11:19:12', NULL),
(322, 83, 'Contact Delete', 'contact-delete', '2022-12-18 11:19:12', NULL),
(323, 83, 'Contact Bulk Delete', 'contact-bulk-delete', '2022-12-18 11:19:12', NULL),
(324, 83, 'Contact report', 'contact-report', '2022-12-18 11:19:12', NULL),
(325, 84, 'Email Access', 'email-access', '2022-12-18 15:11:30', NULL),
(326, 84, 'Email Add', 'email-add', '2022-12-18 15:11:30', NULL),
(327, 84, 'Email Edit', 'email-edit', '2022-12-18 15:11:30', NULL),
(328, 84, 'Email Delete', 'email-delete', '2022-12-18 15:11:30', NULL),
(329, 84, 'Email Bulk Delete', 'email-bulk-delete', '2022-12-18 15:11:30', NULL),
(330, 84, 'Email Report', 'email-report', '2022-12-18 15:11:30', NULL),
(331, 86, 'Gallery Category Access', 'gcategory-access', '2022-12-20 12:18:22', NULL),
(332, 86, 'Gallery Category Add', 'gcategory-add', '2022-12-20 12:18:22', NULL),
(333, 86, 'Gallery Category Edit', 'gcategory-edit', '2022-12-20 12:18:22', NULL),
(334, 86, 'Gallery Category Delete', 'gcategory-delete', '2022-12-20 12:18:22', NULL),
(335, 86, 'Gallery Category Bulk Delete', 'gcategory-bulk-delete', '2022-12-20 12:18:22', NULL),
(336, 86, 'Gallery Category Report', 'gcategory-report', '2022-12-20 12:18:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(2, 197, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(3, 198, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(4, 199, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(5, 200, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(6, 201, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(7, 202, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(8, 203, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(9, 204, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(10, 205, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(11, 206, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(12, 207, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(13, 208, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(14, 209, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(15, 210, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(16, 211, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(17, 212, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(18, 213, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(19, 214, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(20, 215, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(21, 216, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(22, 217, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(23, 218, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(24, 219, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(25, 220, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(26, 221, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(27, 222, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(28, 223, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(29, 224, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(30, 225, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(31, 226, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(32, 227, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(33, 228, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(34, 229, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(35, 230, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(36, 231, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(37, 232, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(38, 233, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(39, 234, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(40, 235, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(41, 236, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(42, 237, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(43, 238, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(44, 239, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(45, 240, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(46, 241, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(47, 242, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(48, 243, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(49, 244, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(50, 257, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(51, 258, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(52, 259, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(53, 260, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(54, 261, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(55, 262, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(56, 263, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(57, 264, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(58, 265, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(59, 266, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(60, 267, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(61, 268, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(62, 245, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(63, 246, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(64, 247, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(65, 248, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(66, 249, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(67, 250, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(68, 251, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(69, 252, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(70, 253, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(71, 254, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(72, 255, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(73, 256, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(74, 289, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(75, 290, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(76, 291, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(77, 292, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(78, 293, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(79, 294, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(80, 269, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(81, 270, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(82, 271, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(83, 272, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(84, 273, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(85, 274, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(86, 275, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(87, 276, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(88, 277, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(89, 278, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(90, 279, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(91, 280, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(92, 281, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(93, 282, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(94, 283, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(95, 284, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(96, 285, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(97, 286, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(98, 287, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(99, 288, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(100, 8, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(101, 9, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(102, 10, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(103, 11, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(104, 14, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(105, 32, 3, '2022-12-08 11:59:40', '2022-12-08 11:59:40'),
(106, 197, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(107, 198, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(108, 199, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(109, 200, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(110, 201, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(111, 202, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(112, 203, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(113, 204, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(114, 205, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(115, 206, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(116, 207, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(117, 208, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(118, 209, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(119, 210, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(120, 211, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(121, 212, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(122, 213, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(123, 214, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(124, 215, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(125, 216, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(126, 217, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(127, 218, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(128, 219, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(129, 220, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(130, 221, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(131, 222, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(132, 223, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(133, 224, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(134, 225, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(135, 226, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(136, 227, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(137, 228, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(138, 229, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(139, 230, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(140, 231, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(141, 232, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(142, 233, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(143, 234, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(144, 235, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(145, 236, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(146, 237, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(147, 238, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(148, 239, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(149, 240, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(150, 241, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(151, 242, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(152, 243, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(153, 244, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(154, 257, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(155, 258, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(156, 259, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(157, 260, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(158, 261, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(159, 262, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(160, 263, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(161, 264, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(162, 265, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(163, 266, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(164, 267, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(165, 268, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(166, 245, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(167, 246, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(168, 247, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(169, 248, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(170, 249, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(171, 250, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(172, 251, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(173, 252, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(174, 253, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(175, 254, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(176, 255, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(177, 256, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(178, 289, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(179, 290, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(180, 291, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(181, 292, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(182, 293, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(183, 294, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(184, 269, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(185, 270, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(186, 271, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(187, 272, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(188, 273, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(189, 274, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(190, 275, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(191, 276, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(192, 277, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(193, 278, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(194, 279, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(195, 280, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(211, 32, 2, '2022-12-08 12:02:31', '2022-12-08 12:02:31'),
(212, 1, 2, '2022-12-08 12:04:56', '2022-12-08 12:04:56'),
(213, 245, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(214, 246, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(215, 247, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(216, 248, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(217, 249, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(218, 250, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(219, 251, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(220, 252, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(221, 253, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(222, 254, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(223, 255, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(224, 256, 1, '2023-01-02 10:08:48', '2023-01-02 10:08:48'),
(225, 1, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(226, 197, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(227, 198, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(228, 199, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(229, 200, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(230, 201, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(231, 202, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(232, 203, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(233, 204, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(234, 205, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(235, 206, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(236, 207, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(237, 208, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(238, 209, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(239, 210, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(240, 211, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(241, 212, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(242, 213, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(243, 214, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(244, 215, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(245, 216, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(246, 217, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(247, 218, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(248, 219, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(249, 220, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(250, 221, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(251, 222, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(252, 223, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(253, 224, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(254, 225, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(255, 226, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(256, 227, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(257, 228, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(258, 229, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(259, 230, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(260, 231, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(261, 232, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(262, 233, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(263, 234, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(264, 235, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(265, 236, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(266, 237, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(267, 238, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(268, 239, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(269, 240, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(270, 241, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(271, 242, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(272, 243, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(273, 244, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(274, 257, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(275, 258, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(276, 259, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(277, 260, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(278, 261, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(279, 262, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(280, 263, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(281, 264, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(282, 265, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(283, 266, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(284, 267, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(285, 268, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(286, 245, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(287, 246, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(288, 247, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(289, 248, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(290, 249, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(291, 250, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(292, 251, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(293, 252, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(294, 253, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(295, 254, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(296, 255, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(297, 256, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(298, 289, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(299, 290, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(300, 291, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(301, 292, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(302, 293, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(303, 294, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(304, 269, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(305, 270, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(306, 271, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(307, 272, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(308, 273, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(309, 274, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(310, 275, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(311, 276, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(312, 277, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(313, 278, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(314, 279, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(315, 280, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(316, 281, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(317, 282, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(318, 283, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(319, 284, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(320, 285, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(321, 286, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(322, 287, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(323, 288, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(324, 295, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(325, 296, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(326, 297, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(327, 298, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(328, 299, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(329, 300, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(330, 301, 4, '2023-02-09 04:33:10', '2023-02-09 04:33:10'),
(331, 302, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(332, 303, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(333, 304, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(334, 305, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(335, 306, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(336, 331, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(337, 332, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(338, 333, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(339, 334, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(340, 335, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(341, 336, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(342, 307, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(343, 308, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(344, 309, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(345, 310, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(346, 311, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(347, 312, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(348, 313, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(349, 314, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(350, 315, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(351, 316, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(352, 317, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(353, 318, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(354, 319, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(355, 320, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(356, 321, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(357, 322, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(358, 323, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(359, 324, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(360, 8, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(361, 9, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(362, 10, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(363, 11, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(364, 12, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(365, 13, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(366, 14, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(367, 32, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(368, 325, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(369, 326, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(370, 327, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(371, 328, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(372, 329, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(373, 330, 4, '2023-02-09 04:33:11', '2023-02-09 04:33:11'),
(374, 295, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(375, 296, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(376, 297, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(377, 298, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(378, 299, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(379, 300, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(380, 301, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(381, 302, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(382, 303, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(383, 304, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(384, 305, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23'),
(385, 306, 2, '2023-03-29 02:54:23', '2023-03-29 02:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gallery_category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `name`, `gallery_category_id`, `image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Picture 1', 1, '2019061743logo-582686.png', '1', 'Admin', 'Admin', NULL, NULL),
(2, 'P 1', 1, '5332306-373122.png', '1', 'Admin', NULL, NULL, NULL),
(3, 'Picture', 3, '5332306-830896.png', '1', 'Admin', NULL, NULL, NULL),
(4, 'Footer BG', 4, 'Ifad-Kaju-Delight-Biscuit-715502.png', '1', 'Admin', 'Admin', NULL, NULL),
(8, 'Footer BG', 4, '0_footer1-804903.png', '1', 'Admin', NULL, NULL, NULL),
(9, 'blog bg', 4, 'blog-767167.png', '1', 'Admin', NULL, NULL, NULL),
(10, 'catalog bg', 4, 'catalog-bg-929690.png', '1', 'Admin', 'Admin', NULL, NULL),
(11, 'leader banner 1', 4, 'leader-centent-124362.png', '1', 'Admin', 'Admin', NULL, NULL),
(12, 'home page blog bg', 4, 'ezgif.com-gif-maker-(2)-460024.png', '1', 'Admin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `lifestyle_image` varchar(255) DEFAULT NULL,
  `product_brochure` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `segment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_link` varchar(255) DEFAULT NULL,
  `product_bncn` varchar(255) DEFAULT NULL,
  `product_video_path` varchar(255) DEFAULT NULL,
  `product_short_desc` text DEFAULT NULL,
  `product_long_desc` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `product_order` int(10) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `lifestyle_image`, `product_brochure`, `category_id`, `sub_category_id`, `variant_id`, `variant_option_id`, `segment_id`, `pack_id`, `product_link`, `product_bncn`, `product_video_path`, `product_short_desc`, `product_long_desc`, `status`, `product_order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(18, 'Kaju Delight', 'kaju-Delight---220gm-684083.png', 'Bisket-banner-431447.jpg', 'IFAD-Test-PDF-591125.pdf', 6, NULL, 8, NULL, 17, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', NULL, 'v11-616374.mp4', 'IFAD Kaju Delight biscuit is sweet and crispy and it is enriched with the great taste of...', 'IFAD Kaju Delight biscuit is sweet and crispy and it is enriched with the great taste of the fresh & delicious Kajus. Savour it with your dear friends and family and enjoy your tea time.', '1', 7, 'api', 'Ifadadmin', '2022-12-11 15:14:58', '2023-03-21 03:20:04'),
(19, 'Butter Delight', 'Butter-Delight---220gm-987870.png', 'Bisket-banner-204257.jpg', 'IFAD-Test-PDF-879770.pdf', 6, NULL, 8, NULL, 4, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', 'IMPL0004', 'v11-616374.mp4', 'IFAD Butter Delight biscuit is a good source of energy, especially for growing children...', 'IFAD Butter Delight biscuit is a good source of energy, especially for growing children. It brings happiness into your life.', '1', 8, 'api', 'Ifadadmin', '2022-12-11 17:13:27', '2023-03-21 03:21:16'),
(20, 'IFAD Choco Delight', 'Choco-Delight---220gm-563073.png', 'Bisket-banner-192770.jpg', 'D2022304-504445.pdf', 6, NULL, 7, NULL, 4, 4, 'https://www.youtube.com/watch?v=Evr5YmTqKJk', NULL, 'v11-616374.mp4', 'IFAD Choco delight is made from the combination of chocolate & real butter...', 'IFAD Choco delight is made from the combination of chocolate & real butter. Yummy and tasty biscuit for chocolate lovers.', '1', 9, 'api', 'Ifadadmin', '2022-12-11 17:15:30', '2023-03-21 03:21:27'),
(21, 'Pillow', 'PNEW-189380.png', 'CB1-208038.jpg', 'IFAD-Test-PDF-159479.pdf', 4, NULL, 8, NULL, 16, 4, 'https://www.youtube.com/watch?v=kb5vHBNwvu8', 'IFAD0001', 'v11-616374.mp4', 'Real Pillow shaped extruder fried chips made with finest wheat flour...', 'Real Pillow shaped extruder fried chips made with finest wheat flour. Tangy BBQ flavored enriched mouth-watering chips.', '1', 1, 'api', 'Ifadadmin', '2022-12-11 17:17:20', '2023-03-21 02:36:27'),
(22, 'Wavy', 'WNEW-973254.png', 'CB1-790832.jpg', 'IFAD-Test-PDF-310692.pdf', 4, NULL, 8, NULL, 12, 4, 'https://www.youtube.com/watch?v=NmIWQr8nICY', 'IMPL0002', 'v11-616374.mp4', 'IFAD Wavy Chips is a multigrain enriched extruder fried chips...', 'IFAD Wavy Chips is a multigrain enriched extruder fried chips. Yummy BBQ flavored wavy chips.', '1', 8, 'api', 'Ifadadmin', '2022-12-11 17:18:37', '2023-03-21 02:50:55'),
(23, 'IFAD Atta', 'ATTA-152068.png', '11-224102.jpg', 'IFAD-Test-PDF-565355.pdf', 7, NULL, 8, NULL, 25, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Atta is processed from high quality imported wheats in an automated machine...', 'IFAD Atta is processed from high quality imported wheats in an automated machine. Nutrition enriched good quality Atta.', '1', 22, 'api', 'Ifadadmin', '2022-12-11 18:18:18', '2023-03-21 04:52:59'),
(24, 'IFAD Suji', '28-180725.png', 'all-product-756567.jpg', 'IFAD-Test-PDF-804098.pdf', 7, NULL, 8, NULL, 26, NULL, NULL, NULL, 'v11-616374.mp4', 'IFAD Suji is enriched with minerals & protein as well as free from impurity...', 'IFAD Suji is enriched with minerals & protein as well as free from impurity. It also gives instant energy and supports nervous system.', '1', 24, 'api', 'Ifadadmin', '2022-12-11 18:20:39', '2023-03-21 04:53:55'),
(25, 'IFAD Moida', 'Moida---1kg-182942.png', '11-641838.jpg', 'IFAD-Test-PDF-492542.pdf', 7, NULL, 8, NULL, 25, 4, NULL, 'IMPL00016', 'v11-616374.mp4', 'IFAD Maida is super fine and enriched with high protein...', 'IFAD Maida is super fine and enriched with high protein. It is perfect for bakery, snacks & sweets products.', '1', 23, 'api', 'Ifadadmin', '2022-12-12 10:54:19', '2023-03-21 04:53:25'),
(26, 'IFAD Eggy Instant Noodles Super Chicken.', 'Noodles-(Super-Chicken)---480g-785423.png', 'NB-434000-712562.jpg', 'D2022304-559393-959004.pdf', 8, NULL, 7, NULL, 4, 4, 'https://www.youtube.com/watch?v=GMlOPbCKY_o', NULL, 'v11-736662.mp4', 'IFAD EGGY Instant Noodles is enriched with Calcium, Iron & Protein...', 'IFAD EGGY Instant Noodles is enriched with Calcium, Iron & Protein. Super chicken & tasty spice mix of IFAD EGGY Instant Noodles is an instant solution of hunger.', '1', 28, 'api', 'Ifadadmin', '2022-12-12 10:57:05', '2023-03-26 12:09:31'),
(27, 'Mustard Oil', 'IMOIL-629907.png', '44-793969.jpg', 'IFAD-Test-PDF-799318.pdf', 7, NULL, 7, NULL, 20, 6, NULL, 'IMPL00017', 'v11-616374.mp4', 'IFAD Mustard Oil is made from a high quality & finest mustard seeds...', 'IFAD Mustard Oil is made from a high quality & finest mustard seeds. It also lowers bad cholesterol and keeps coronary diseases away.', '1', 25, 'api', 'Ifadadmin', '2022-12-12 10:59:05', '2023-03-21 04:54:19'),
(29, 'IFAD Jhal Chanachur', 'Chanachur-390px-X-485px-401873.png', 'all-product-228135.jpg', 'IFAD-Test-PDF-230614.pdf', 9, NULL, 8, NULL, NULL, 4, NULL, 'IMPL00023', 'v11-736662.mp4', 'IFAD Jhal Chanachur\'s jhal magic makes snacking time even more enjoyable...', 'IFAD Jhal Chanachur\'s jhal magic makes snacking time even more enjoyable.', '1', 34, 'api', 'Ifadadmin', '2022-12-19 17:15:28', '2023-03-21 05:07:48'),
(30, 'IFAD Milk Muffin', 'Ifad-milk-cake-3D-Pack-353955.png', '1B-778975.jpg', 'IFAD-Test-PDF-189818.pdf', 9, NULL, 7, NULL, 28, NULL, 'https://www.youtube.com/watch?v=UrjqrA5lmWY', NULL, 'v11-736662.mp4', 'IFAD Muffin Cake is once in a lifetime treat for both adult and young...', 'IFAD Muffin Cake is once in a lifetime treat for both adult and young. Three variant of IFAD Muffin cake: Milk Butter, Vanilla & Strawberry', '1', 29, 'api', 'Ifadadmin', '2022-12-19 17:17:43', '2023-03-21 05:01:07'),
(31, 'IFAD Vanilla muffin', '13-747098.png', '1B-158788.jpg', 'IFAD-Test-PDF-264146.pdf', 9, NULL, 8, NULL, 28, 4, NULL, NULL, 'v11-736662.mp4', 'IFAD Vanilla Muffin is once in a lifetime treat for both adult and young...', 'IFAD Vanilla Muffin is once in a lifetime treat for both adult and young. Three variant of IFAD Muffin cake: Milk Butter, Vanilla & Strawberry.', '1', 31, 'api', 'Ifadadmin', '2022-12-19 17:19:24', '2023-03-21 05:05:40'),
(32, 'IFAD Strawberry Muffin', '12-678612.png', '1B-654797.jpg', 'IFAD-Test-PDF-162157.pdf', 9, NULL, 8, NULL, 28, 4, NULL, NULL, 'v11-736662.mp4', 'IFAD Strawberry Muffin is once in a lifetime treat for both adult and young...', 'IFAD Strawberry Cake is once in a lifetime treat for both adult and young. Three variant of IFAD Muffin cake: Milk Butter, Vanilla & Strawberry.', '1', 32, 'api', 'Ifadadmin', '2022-12-19 17:22:56', '2023-03-21 05:06:34'),
(33, 'Snacky Chocolate Muffin Cake', 'Chocolate-Muffin-cake-3D-Pack-487493.jpg', '1B-167409.jpg', 'IFAD-Test-PDF-811604.pdf', 9, NULL, 8, NULL, 23, NULL, 'https://www.youtube.com/watch?v=zm2MXsFJxE4', NULL, 'v11-736662.mp4', 'Snacky Chocolate Muffin cake is with real dark chocolate...', 'Snacky Chocolate Muffin cake is with real dark chocolate. Real chocolaty Snacky Muffin cake is the first choice for School tiffin.', '1', 30, 'api', 'Ifadadmin', '2022-12-19 17:26:14', '2023-03-21 05:03:10'),
(34, 'IFAD Glucose Biscuit', 'Glucose-670980.png', 'all-product-164072-242414.jpg', 'IFAD-Test-PDF-619515.pdf', 6, NULL, 8, NULL, 21, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Glucose Biscuit is made with refined Maida, milk & glucose...', 'IFAD Glucose Biscuit is made with refined Maida, milk & glucose. It is good with tea, hangout time, serving guest and school tiffin.', '1', 15, 'api', 'Ifadadmin', '2022-12-19 17:30:25', '2023-03-21 03:51:14'),
(35, 'IFAD Choco Star', 'Choco-Star-50gm-563387.png', 'all-product-164072-813615.jpg', 'IFAD-Test-PDF-254970.pdf', 6, NULL, 8, NULL, 22, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Choco Star made with imported cocoa powder & finest flour...', 'IFAD Choco Star made with imported cocoa powder & finest flour. Low density of IFAD Choco Star gives more volume and a lighter bite.', '1', 13, 'api', 'Ifadadmin', '2022-12-19 17:34:05', '2023-03-21 03:46:53'),
(36, 'IFAD Milk Biscuit', 'Milk-50gm-801167.png', 'all-product-164072-487806.jpg', 'IFAD-Test-PDF-267295.pdf', 6, NULL, 12, NULL, 22, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Milk Biscuit is made from milk which gives richer flavor and a softer texture...', 'IFAD Milk Biscuit is made from milk which gives richer flavor and a softer texture. It is popular to serve with tea, travelling, hangout time, serving guest and school tiffin.', '1', 14, 'api', 'Ifadadmin', '2022-12-19 17:35:38', '2023-03-21 03:50:13'),
(37, 'IFAD Dry Cake', 'Dry-Cake-402537.png', 'all-product-164072-176454.jpg', 'IFAD-Test-PDF-477012.pdf', 6, NULL, 7, NULL, 9, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', NULL, 'v11-616374.mp4', 'IFAD Dry cake Biscuit is made with flour, egg, milk and sugar...', 'IFAD Dry cake Biscuit is made with flour, egg, milk and sugar.', '1', 21, 'api', 'Ifadadmin', '2022-12-19 17:57:34', '2023-03-21 04:51:23'),
(38, 'Cheesy Bites (50Grm)', 'Cheesy-Bites-mini-50gm-745516.png', 'Cheesy-Bites-mini-50gm-318616.png', 'D2022304-559393-959004.pdf', 6, NULL, 8, NULL, 7, NULL, 'https://www.youtube.com/watch?v=Evr5YmTqKJk', NULL, 'v11-736662.mp4', 'Original Cheese Savory Biscuits Ifad Cheesy Bite Biscuits.', 'Original Cheese Savory Biscuits Ifad Cheesy Bite Biscuits.', '2', NULL, 'api', 'Admin', '2022-12-19 17:59:27', '2023-03-21 03:36:07'),
(39, 'Plain Toast', 'Plain-Toast-300-965083.png', 'all-product-164072.jpg', 'D2022304-559393-959004.pdf', 6, NULL, 8, NULL, 11, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', NULL, 'v11-736662.mp4', 'IFAD Plain Toast Biscuit is churchy and tasty...', 'IFAD Plain Toast Biscuit is churchy and tasty. It is perfect choice for morning & evening snacks for all ages.', '1', 19, 'api', 'Ifadadmin', '2022-12-19 18:01:29', '2023-03-21 04:30:46'),
(41, 'Orange Delight', 'Orange-Delight-240-520215.png', 'all-product-718106.jpg', 'D2022304-504445.pdf', 6, NULL, 8, NULL, 18, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', NULL, 'v11-616374.mp4', 'IFAD Orange Delight have a real tangy orange flavor...', 'IFAD Orange Delight have a real tangy orange flavor. It will charm you with every bite!', '1', 10, 'api', 'Ifadadmin', '2022-12-20 12:57:58', '2023-03-21 03:26:02'),
(42, 'Muri Toast', 'muri-tost-182662.png', 'all-product-997846.jpg', 'D2022304-559393-959004.pdf', 6, NULL, 8, NULL, 19, 4, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', 'IMPL0007', 'v11-736662.mp4', 'Introducing first time in Bangladesh with creamy & tasty IFAD Muri Toast...', 'Introducing first time in Bangladesh with creamy & tasty IFAD Muri Toast. Butter & sugar enrobed small bite toast. Perfect combination with tea & coffee.', '1', 17, 'api', 'Ifadadmin', '2022-12-20 13:02:53', '2023-03-21 04:27:15'),
(44, 'Cheesy Bites', 'Cheesy-Bites-240gm-196337.png', 'all-product-431930.jpg', 'IFAD-Test-PDF-565005.pdf', 6, NULL, 8, NULL, 20, 5, 'https://www.youtube.com/watch?v=2BQu2KJOtyg', 'IMPL0009', 'v11-736662.mp4', 'IFAD Cheesy Bite is made from real salty cheese...', 'IFAD Cheesy Bite is made from real salty cheese. Lovely combination of soft and crunchy textures.', '1', 12, 'api', 'Ifadadmin', '2022-12-20 13:11:03', '2023-03-21 03:35:36'),
(46, 'IFAD Eggy Instant Noodles Super Masala.', 'Noodles-720-832422.png', 'NB-434000.jpg', 'IFAD-Test-PDF-477224.pdf', 8, NULL, 8, NULL, 27, 4, NULL, 'IMPL00017', 'v11-736662.mp4', 'IFAD EGGY Instant Noodles is enriched with Calcium, Iron & Protein...', 'IFAD EGGY Instant Noodles is enriched with Calcium, Iron & Protein. Super chicken & tasty spice mix of IFAD EGGY Instant Noodles is an instant solution of hunger.', '1', 27, 'api', 'Ifadadmin', '2022-12-20 14:13:08', '2023-03-26 12:09:09'),
(48, 'Thaizzz Sweet Chilli', 'NTHAIZZ-972863.png', '22-885104.jpg', 'IFAD-Test-PDF-828262.pdf', 4, NULL, 8, NULL, 23, 4, NULL, NULL, 'v11-616374.mp4', 'Thaizzz Sweet Chilli is a healthy corn base baked chips. ..', 'Thaizzz Sweet Chilli is a healthy corn based baked chips. Sweet chili flavored crispy yummy chips.', '1', 5, 'Admin', 'Ifadadmin', '2023-01-05 03:53:50', '2023-03-21 02:41:27'),
(49, 'Ringozzz Ring Chips', 'Nringoz-558670.png', '22-521889.jpg', 'IFAD-Test-PDF-828312.pdf', 4, NULL, 8, NULL, 23, 4, NULL, 'IMPL00014', 'v11-616374.mp4', 'Ringozzz is a ring-shaped baked chip with chatpata chutney flavor...', 'Ringozzz is a ring-shaped baked chip with chatpata chutney flavor. Best choice for snacks time.', '1', 7, 'Admin', 'Ifadadmin', '2023-01-05 03:56:17', '2023-03-21 02:48:41'),
(50, 'Funzzz', 'Funzz-516902.png', '22-455212.jpg', 'IFAD-Test-PDF-506675.pdf', 4, NULL, 8, NULL, 23, 4, NULL, NULL, 'v11-616374.mp4', 'Funzzz Puffed chips comes in mast masala flavor...', 'Funzzz Puffed chips comes in mast masala flavor. Best option for your fun & masti time.', '1', 6, 'Admin', 'Ifadadmin', '2023-01-05 03:58:39', '2023-03-21 02:47:50'),
(51, 'Stix', 'STRIX-371540.png', '22-536159.jpg', 'IFAD-Test-PDF-195571.pdf', 4, NULL, 8, NULL, 23, 4, NULL, NULL, 'v11-616374.mp4', 'EGGY Stick is stick shaped extruder fried chips with real BBQ taste...', 'Eggy Stick is stick shaped extruder fried chips with real BBQ taste. It is the perfect choice for travelling, movie time & hangout with friends.', '1', 2, 'Admin', 'Ifadadmin', '2023-01-05 04:07:33', '2023-03-21 02:34:10'),
(52, 'IFAD Nutri Bite', '15-393566.png', 'all-product-164072-915128.jpg', 'IFAD-Test-PDF-828262.pdf', 6, NULL, 7, NULL, NULL, NULL, NULL, NULL, 'v11-616374.mp4', 'IFAD Nutri Bite biscuit Vitamin & Minerals fortified vegetable crackers...', 'IFAD Nutri Bite biscuit Vitamin & Minerals fortified vegetable crackers. It improve immunity and help to grow hemoglobin in blood.', '1', 11, 'Admin', 'Ifadadmin', '2023-01-19 08:07:14', '2023-03-21 03:34:32'),
(53, 'Dishoom Liquid Dishwash', '09-590932.png', '10-404169.png', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 30, NULL, NULL, NULL, 'v11-616374.mp4', 'Dishoom Liquid Dishwash removes toughest to toughest grease and oil without scratching your crockeries surfaces...', 'Dishoom Liquid Dishwash removes toughest to toughest grease and oil without scratching your crockeries surfaces. Its refreshing lemon fragrance gives you pleasant cleaning experience while keeping your crockeries shiny and germ free.', '1', 37, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:21:59', '2023-03-21 05:09:41'),
(54, 'Dishoom Dishwashing Bar', '11-691444.png', '12-196867.png', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 9, NULL, NULL, NULL, 'v11-616374.mp4', 'Dishoom Dishwashing Bar removes toughest to toughest grease and oil, leaving your utensils shiny and germs free...', 'Dishoom Dishwashing Bar removes toughest to toughest grease and oil, leaving your utensils shiny and germs free. Its refreshing lemon fragrance gives you a pleasant cleaning experience.', '1', 36, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:26:07', '2023-03-21 05:09:17'),
(55, 'Safe n Soft Handwash', '07-927715.png', 'Handwash-banner-1920X400px-483806.jpg', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 33, 7, NULL, NULL, 'v11-616374.mp4', 'Safe n Soft effectively kills 99.9% of germs, bacteria and virus while the coconut milk extract in it keeps your skin smooth...', 'Safe n Soft effectively kills 99.9% of germs, bacteria and virus while the coconut milk extract in it keeps your skin smooth.', '1', 38, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:27:53', '2023-03-21 05:10:01'),
(56, 'Pure Brite Detergent Powder', '02-834073.png', 'Pure-brite--Banner-1920X400-300220.jpg', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 26, 4, NULL, NULL, 'v11-616374.mp4', 'Pure Brite will keep your hands soft for Aloe Vera and your cloths will be protected from germs because of neem...', 'Pure Brite will keep your hands soft for Aloe Vera and your cloths will be protected from germs because of neem. Powerful enzymes will remove all tough stains from your cloths and will keep shine on your cloths.', '1', 35, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:30:45', '2023-03-21 05:08:42'),
(57, 'Uniq Floor Cleaner (Lavender, Lemongrass & Bailey flavor)', '03-607618.png', 'Uniq-Banner-1920-X400px-289346.jpg', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 30, 7, NULL, NULL, 'v11-616374.mp4', 'Uniq Floor cleaner has best Usage for your tiles, ceramics & cement floor...', 'Uniq Floor cleaner has best Usage for your tiles, ceramics & cement floor as Viro-defence formula provides 99.9% protections from germs and wipe off technology keeps your floor clean & shiny.', '1', 39, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:32:37', '2023-03-21 05:10:29'),
(58, 'Uniq Multi Surface Cleaner', '06-320390.png', '06-438326.png', 'IFAD-Test-PDF-828262.pdf', 12, NULL, 8, NULL, 30, NULL, NULL, NULL, 'v11-616374.mp4', 'Uniq Multi Surface cleaner gives you 99.9% protection from germs in all sorts of surfaces...', 'Uniq Multi Surface cleaner gives you 99.9% protection from germs in all sorts of surfaces. (Like: Tiles, wooden furniture, floor, kitchen, stove and etc)', '1', 40, 'Ifad IT', 'Ifadadmin', '2023-03-04 06:34:04', '2023-03-21 05:10:51'),
(59, 'IFAD Puffed Rice', 'Red-color-Puffed-Rice-400-524243.png', 'all-product-164072-261452.jpg', 'IFAD-Test-PDF-828262.pdf', 9, NULL, 7, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Puffed Rice is made from finest local rice...', 'IFAD Puffed Rice is made from finest local rice. UREA free IFAD Puff rice contains dietary fiber to support the digestive system.', '1', 33, 'Ifadadmin', 'Ifadadmin', '2023-03-13 07:02:13', '2023-03-21 05:07:30'),
(60, 'IFAD Chinigura Aromatic Rice', 'WhatsApp-Image-2023-03-15-at-11.45.21-384873.jpg', 'IMPL-All-Product-Banner-Design-521985.jpg', 'IFAD-Test-PDF-828262.pdf', 7, NULL, 8, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Chinigura Aromatic Rice alway carries 100% natural aroma...', 'IFAD Chinigura Aromatic Rice alway carries 100% natural aroma. It\'s tiny, needle-shaped grains remains separated and fluffy when cooked.', '2', 26, 'Ifadadmin', 'Ifadadmin', '2023-03-13 07:06:16', '2023-03-21 04:54:39'),
(61, 'IFAD Nankhatai', 'nankhatai-Biscuit-809501.png', 'all-product-164072-431519.jpg', 'IFAD-Test-PDF-828262.pdf', 6, NULL, 8, NULL, NULL, NULL, NULL, NULL, 'v11-616374.mp4', 'IFAD Nankhatai bakery biscuit represents the local heritage & tradition...', 'IFAD Nankhatai bakery biscuit represents the local heritage & tradition. It is full of creamy milk and sweetener.', '1', 20, 'Ifadadmin', 'Ifadadmin', '2023-03-13 08:01:37', '2023-03-21 04:47:58'),
(62, 'IFAD Stick Toast', 'Stick-Toast-688026.png', 'all-product-164072-785634.jpg', 'IFAD-Test-PDF-828262.pdf', 6, NULL, 7, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Stick Toast is twice baked bread like biscuit, made with mixed spice...', 'IFAD Stick Toast is twice baked bread like biscuit, made with mixed spice. Too crispy.', '1', 18, 'Ifadadmin', 'Ifadadmin', '2023-03-13 08:18:19', '2023-03-21 04:29:00'),
(63, 'IFAD Choco Cream', 'Choco-Cream-18gm-609349.png', 'all-product-164072-491078.jpg', 'IFAD-Test-PDF-828262.pdf', 6, NULL, 7, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'IFAD Choco cream is made from fine flour, sugar & melted chocolate...', 'IFAD Choco cream is made from fine flour, sugar & melted chocolate. kids love to take the parts apart, lick the cream and have the biscuits separately.', '1', 16, 'Ifadadmin', 'Ifadadmin', '2023-03-13 08:22:35', '2023-03-21 04:25:46'),
(64, 'Thaizzz Peri Peri Chicken', '13-898052.png', '22-536159-763680.jpg', 'IFAD-Test-PDF-828262.pdf', 4, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'Introducing the first ever THAIZZZ Peri peri chicken chips in Bangladesh!...', 'Introducing the first ever THAIZZZ Peri peri chicken chips in Bangladesh! The flavor of Peri peri chicken brings back the nostalgic taste of chicken but in a modern way.', '1', 3, 'Ifadadmin', 'Ifadadmin', '2023-03-13 09:04:29', '2023-03-21 02:37:30'),
(65, 'Thaizzz Teriyaki Chicken', '14-724129.png', '22-536159-906796.jpg', 'IFAD-Test-PDF-828262.pdf', 4, NULL, 8, NULL, NULL, 4, NULL, NULL, 'v11-616374.mp4', 'Introducing the first ever THAIZZZ Teriyaki chicken chips in Bangladesh!..', 'Introducing the first ever THAIZZZ Teriyaki chicken chips in Bangladesh! For Bangladesh young\'s Thaizzz Teriyaki chicken chips is companion for journey, vacation, hangout with friends and peers.', '1', 4, 'Ifadadmin', 'Ifadadmin', '2023-03-13 09:04:48', '2023-03-21 02:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 19, 'Butter-Delight---220gm-753984.png', '1', 'api', 'Admin', NULL, NULL),
(9, 21, 'PNEW-256279.png', '1', 'api', 'Admin', NULL, NULL),
(10, 21, 'PNEW-471654.png', '1', 'api', 'Admin', NULL, NULL),
(13, 22, 'WNEW-688242.png', '1', 'api', 'Admin', NULL, NULL),
(14, 22, 'WNEW-850387.png', '1', 'api', 'Admin', NULL, NULL),
(15, 23, 'Atta---2kg-589806.png', '1', 'api', 'Admin', NULL, NULL),
(16, 23, 'Atta---1kg-815296.png', '1', 'api', 'Admin', NULL, NULL),
(25, 18, 'kaju-Delight---220gm-376646.png', '1', 'Admin', NULL, NULL, NULL),
(26, 18, 'kaju-Delight---220gm-174446.png', '1', 'Admin', NULL, NULL, NULL),
(27, 19, 'Butter-Delight---220gm-926146.png', '1', 'Admin', NULL, NULL, NULL),
(28, 19, 'Butter-Delight---220gm-559132.png', '1', 'Admin', NULL, NULL, NULL),
(29, 20, 'Choco-Delight---220gm-379047.png', '1', 'Admin', NULL, NULL, NULL),
(30, 20, 'Choco-Delight---220gm-469025.png', '1', 'Admin', NULL, NULL, NULL),
(31, 23, 'Atta---1kg-841055.png', '1', 'Admin', NULL, NULL, NULL),
(32, 23, 'Atta---1kg-659621.png', '1', 'Admin', NULL, NULL, NULL),
(33, 24, '28-329390.png', '1', 'Admin', NULL, NULL, NULL),
(34, 24, '28-899411.png', '1', 'Admin', NULL, NULL, NULL),
(35, 25, 'Moida---1kg-353492.png', '1', 'Admin', NULL, NULL, NULL),
(36, 25, 'Moida---1kg-666265.png', '1', 'Admin', NULL, NULL, NULL),
(39, 27, 'IMOIL-408689.png', '1', 'Admin', 'Admin', NULL, NULL),
(40, 27, 'IMOIL-189407.png', '1', 'Admin', 'Admin', NULL, NULL),
(41, 30, 'Ifad-milk-cake-3D-Pack-757149.png', '1', 'Admin', NULL, NULL, NULL),
(42, 30, 'Ifad-milk-cake-3D-Pack-757144.png', '1', 'Admin', NULL, NULL, NULL),
(43, 31, '13-579455.png', '1', 'Admin', NULL, NULL, NULL),
(44, 31, '13-235158.png', '1', 'Admin', NULL, NULL, NULL),
(45, 32, '12-733040.png', '1', 'Admin', NULL, NULL, NULL),
(46, 32, '12-893357.png', '1', 'Admin', NULL, NULL, NULL),
(47, 33, 'Chocolate-Muffin-cake-3D-Pack-675592.jpg', '1', 'Admin', NULL, NULL, NULL),
(48, 33, 'Chocolate-Muffin-cake-3D-Pack-194245.jpg', '1', 'Admin', NULL, NULL, NULL),
(49, 35, 'Choco-Star-50gm-210992.png', '1', 'Admin', NULL, NULL, NULL),
(50, 35, 'Choco-Star-50gm-199655.png', '1', 'Admin', NULL, NULL, NULL),
(51, 36, 'Milk-50gm-437146.jpg', '1', 'Admin', NULL, NULL, NULL),
(52, 36, 'Choco-Star-50gm-350827.png', '1', 'Admin', NULL, NULL, NULL),
(53, 37, 'Dry-Cake-901682.png', '1', 'Admin', NULL, NULL, NULL),
(54, 37, 'Dry-Cake-131227.png', '1', 'Admin', NULL, NULL, NULL),
(57, 39, 'Plain-Toast-300-415593.png', '1', 'Admin', NULL, NULL, NULL),
(58, 39, 'Plain-Toast-300-419450.png', '1', 'Admin', NULL, NULL, NULL),
(59, 41, 'Orange-Delight-240-526936.png', '1', 'Admin', NULL, NULL, NULL),
(60, 41, 'Orange-Delight-240-165188.png', '1', 'Admin', NULL, NULL, NULL),
(73, 51, 'STRIX-781433.png', '1', 'Admin', NULL, NULL, NULL),
(74, 51, 'STRIX-762571.png', '1', 'Admin', NULL, NULL, NULL),
(75, 50, 'Funzz-411735.png', '1', 'Admin', NULL, NULL, NULL),
(76, 50, 'Funzz-479382.png', '1', 'Admin', NULL, NULL, NULL),
(77, 49, 'Nringoz-925328.png', '1', 'Admin', NULL, NULL, NULL),
(78, 49, 'Nringoz-211859.png', '1', 'Admin', NULL, NULL, NULL),
(79, 48, 'NTHAIZZ-927627.png', '1', 'Admin', NULL, NULL, NULL),
(80, 48, 'NTHAIZZ-573346.png', '1', 'Admin', NULL, NULL, NULL),
(81, 46, 'Noodles-(Super-Chicken)---480g-320772.png', '1', 'Admin', NULL, NULL, NULL),
(82, 46, 'Noodles-(Super-Masala)---480gm-320252.png', '1', 'Admin', NULL, NULL, NULL),
(83, 46, 'Noodles-720-533330.png', '1', 'Admin', NULL, NULL, NULL),
(84, 46, 'Noodles---240gm-649394.png', '1', 'Admin', NULL, NULL, NULL),
(85, 27, 'IMOIL-373913.png', '1', 'Admin', NULL, NULL, NULL),
(86, 27, 'IMOIL-444735.png', '1', 'Admin', NULL, NULL, NULL),
(87, 34, 'Glucose-198074.png', '1', 'Admin', NULL, NULL, NULL),
(88, 34, 'Glucose-535697.png', '1', 'Admin', NULL, NULL, NULL),
(89, 23, 'ATTA-837304.png', '1', 'Admin', NULL, NULL, NULL),
(90, 23, 'ATTA-691271.png', '1', 'Admin', NULL, NULL, NULL),
(91, 52, 'Nutri-240721.png', '1', 'Admin', NULL, NULL, NULL),
(92, 52, 'Nutri-742821.png', '1', 'Admin', NULL, NULL, NULL),
(93, 53, '10-574040.png', '1', 'Ifad IT', NULL, NULL, NULL),
(94, 53, '09-314668.png', '1', 'Ifad IT', NULL, NULL, NULL),
(95, 57, '05-404720.png', '1', 'Ifad IT', NULL, NULL, NULL),
(96, 57, '04-345634.png', '1', 'Ifad IT', NULL, NULL, NULL),
(97, 57, '03-983545.png', '1', 'Ifad IT', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_lifestyles`
--

CREATE TABLE `product_lifestyles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lifestyle_image` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_lifestyles`
--

INSERT INTO `product_lifestyles` (`id`, `product_id`, `lifestyle_image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 18, 'delight-717487.jpg', '1', 'Admin', 'api', NULL, NULL),
(2, 19, 'delight-807856.jpg', '1', 'api', NULL, NULL, NULL),
(3, 19, 'delight-756099.jpg', '1', 'api', NULL, NULL, NULL),
(4, 20, 'Chocho+butter-971572.jpg', '1', 'api', NULL, NULL, NULL),
(5, 20, 'Chocho+butter-739398.jpg', '1', 'api', NULL, NULL, NULL),
(6, 20, 'Chocho+butter-484156.jpg', '1', 'api', NULL, NULL, NULL),
(7, 20, 'Chocho+butter-566113.jpg', '1', 'api', NULL, NULL, NULL),
(8, 21, 'Pillow-chips-170360.jpg', '1', 'api', NULL, NULL, NULL),
(9, 21, 'Pillow--fun-meter-445731.jpg', '1', 'api', NULL, NULL, NULL),
(10, 22, 'Ifad-Wavy-Chips-paragliding_14.9-670153.jpg', '1', 'api', NULL, NULL, NULL),
(11, 22, 'kids-874550.jpg', '1', 'api', NULL, NULL, NULL),
(12, 26, 'Ifad-Eggi-Noodles-Half-Plate_1200-X-628-512794.jpg', '1', 'api', NULL, NULL, NULL),
(13, 26, 'Ifad-Noodles-Vegitable-686991.jpg', '1', 'api', NULL, NULL, NULL),
(14, 27, 'Mustard-oil-645449.jpg', '1', 'api', NULL, NULL, NULL),
(15, 27, 'Mustard-oil-684122.jpg', '1', 'api', NULL, NULL, NULL),
(16, 23, 'Atta-Banner-927673.jpg', '1', 'Admin', NULL, NULL, NULL),
(17, 23, 'Atta-Banner-621643.jpg', '1', 'Admin', NULL, NULL, NULL),
(18, 53, '09-302845.png', '1', 'Ifad IT', NULL, NULL, NULL),
(19, 53, '10-132469.png', '1', 'Ifad IT', NULL, NULL, NULL),
(20, 54, '11-705053.png', '1', 'Ifad IT', NULL, NULL, NULL),
(21, 54, '12-805145.png', '1', 'Ifad IT', NULL, NULL, NULL),
(22, 55, '07-162013.png', '1', 'Ifad IT', NULL, NULL, NULL),
(23, 55, '08-592674.png', '1', 'Ifad IT', NULL, NULL, NULL),
(24, 56, '02-574782.png', '1', 'Ifad IT', NULL, NULL, NULL),
(25, 56, '01-842722.png', '1', 'Ifad IT', NULL, NULL, NULL),
(26, 57, '05-588478.png', '1', 'Ifad IT', NULL, NULL, NULL),
(27, 57, '04-356533.png', '1', 'Ifad IT', NULL, NULL, NULL),
(28, 57, '03-617518.png', '1', 'Ifad IT', NULL, NULL, NULL),
(29, 58, '06-773853.png', '1', 'Ifad IT', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `deletable` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1=No,2=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2', NULL, NULL),
(2, 'Admin', '2', NULL, NULL),
(3, 'api', '2', '2022-12-08 11:59:39', '2022-12-08 11:59:39'),
(4, 'Ifad-IT', '2', '2023-02-09 04:33:10', '2023-02-09 04:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, '220gm', '1', 'Admin', 'Ifad IT', '2022-11-22 03:05:44', '2023-03-04 08:54:26'),
(5, '80gm', '1', 'Admin', 'Ifad IT', '2022-11-28 05:32:37', '2023-03-04 08:54:18'),
(7, '50gm', '1', 'api', 'Ifad IT', '2022-12-20 12:49:06', '2023-03-04 08:54:10'),
(8, '160gm', '1', 'api', 'Ifad IT', '2022-12-20 12:49:15', '2023-03-04 08:54:00'),
(9, '300gm', '1', 'api', 'Ifad IT', '2022-12-20 12:49:30', '2023-03-04 08:53:16'),
(10, '150ml', '1', 'api', 'Ifad IT', '2022-12-20 12:49:43', '2023-03-04 08:53:44'),
(11, '350gm', '1', 'api', 'Ifad IT', '2022-12-20 12:59:47', '2023-03-04 08:53:03'),
(12, '20gm', '1', 'api', 'Ifad IT', '2022-12-20 13:07:19', '2023-03-04 08:52:53'),
(13, '240gm', '1', 'api', 'Ifad IT', '2022-12-20 14:06:37', '2023-03-04 08:52:44'),
(14, '480gm', '1', 'api', 'Ifad IT', '2022-12-20 14:06:49', '2023-03-04 08:52:35'),
(15, '720gm', '1', 'api', 'Ifad IT', '2022-12-20 14:06:56', '2023-03-04 08:52:26'),
(16, '16gm,22gm', '1', 'Admin', NULL, '2023-01-05 02:25:24', '2023-01-05 02:25:24'),
(17, '80gm,220gm', '1', 'Admin', NULL, '2023-01-05 02:50:13', '2023-01-05 02:50:13'),
(18, '55gm, 160gm', '1', 'Admin', NULL, '2023-01-05 02:51:00', '2023-01-05 02:51:00'),
(19, '50gm,350gm', '1', 'Admin', NULL, '2023-01-05 02:51:48', '2023-01-05 02:51:48'),
(20, '20gm,50gm,240gm', '1', 'Admin', NULL, '2023-01-05 02:52:08', '2023-01-05 02:52:08'),
(21, '27gm', '1', 'Admin', NULL, '2023-01-05 02:52:29', '2023-01-05 02:52:29'),
(22, '45gm', '1', 'Admin', NULL, '2023-01-05 02:52:35', '2023-01-05 02:52:35'),
(23, '16gm', '1', 'Admin', NULL, '2023-01-05 02:52:52', '2023-01-05 02:52:52'),
(24, '25gm', '1', 'Admin', NULL, '2023-01-05 02:52:59', '2023-01-05 02:52:59'),
(25, '1kg, 2kg', '1', 'Admin', NULL, '2023-01-05 02:53:29', '2023-01-05 02:53:29'),
(26, '500gm', '1', 'Admin', NULL, '2023-01-05 02:53:37', '2023-01-05 02:53:37'),
(27, '240gm,480gm, 720gm', '1', 'Admin', NULL, '2023-01-05 02:54:09', '2023-01-05 02:54:09'),
(28, '11gm', '1', 'Admin', NULL, '2023-01-05 02:54:53', '2023-01-05 02:54:53'),
(29, '150gm', '1', 'Admin', NULL, '2023-01-05 02:55:02', '2023-01-05 02:55:02'),
(30, '500ml', '1', 'Ifad IT', NULL, '2023-03-04 08:54:59', '2023-03-04 08:54:59'),
(31, '300ml', '1', 'Ifad IT', NULL, '2023-03-04 08:55:06', '2023-03-04 08:55:06'),
(32, '1L', '1', 'Ifad IT', NULL, '2023-03-04 08:55:11', '2023-03-04 08:55:11'),
(33, '5L', '1', 'Ifad IT', NULL, '2023-03-04 08:55:17', '2023-03-04 08:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gGo8suGUdTtwVxyDlr1UCuSPbQV0qPg4fQi1Vtf6', NULL, '192.168.10.30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYWRIblpRcVVyUWtud01hY3oxbGEyaGFxQk5hdm80d2lVNXoyaWR1eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cDovLzE5Mi4xNjguMTAuMzA6OTk5OS9wcm9kdWN0Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjEwLjMwOjk5OTkvbG9naW4iO319', 1683543297);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('X38xwXbR6uV14bmg18bfPJQAtSyDUBLarFyyGNaN', 1, '192.168.10.30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVk9zQm1JM3dXeml2anFjR1FvQWh3ZmVWRUhhTENSYTdlUmJ5NFRmOCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTkyLjE2OC4xMC4zMDo5OTk5L3Byb2R1Y3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTA6InBlcm1pc3Npb24iO2E6MTcyOntpOjA7czoxNjoiYmNhdGVnb3J5LWFjY2VzcyI7aToxO3M6MTM6ImJjYXRlZ29yeS1hZGQiO2k6MjtzOjIxOiJiY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6MztzOjE2OiJiY2F0ZWdvcnktZGVsZXRlIjtpOjQ7czoxNDoiYmNhdGVnb3J5LWVkaXQiO2k6NTtzOjE2OiJiY2F0ZWdvcnktcmVwb3J0IjtpOjY7czoxMToiYmxvZy1hY2Nlc3MiO2k6NztzOjg6ImJsb2ctYWRkIjtpOjg7czoxNjoiYmxvZy1idWxrLWRlbGV0ZSI7aTo5O3M6MTE6ImJsb2ctZGVsZXRlIjtpOjEwO3M6OToiYmxvZy1lZGl0IjtpOjExO3M6MTE6ImJsb2ctcmVwb3J0IjtpOjEyO3M6MTU6ImNhdGVnb3J5LWFjY2VzcyI7aToxMztzOjEyOiJjYXRlZ29yeS1hZGQiO2k6MTQ7czoyMDoiY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6MTU7czoxNToiY2F0ZWdvcnktZGVsZXRlIjtpOjE2O3M6MTM6ImNhdGVnb3J5LWVkaXQiO2k6MTc7czoxNToiY2F0ZWdvcnktcmVwb3J0IjtpOjE4O3M6MTY6ImNjYXRlZ29yeS1hY2Nlc3MiO2k6MTk7czoxMzoiY2NhdGVnb3J5LWFkZCI7aToyMDtzOjIxOiJjY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6MjE7czoxNjoiY2NhdGVnb3J5LWRlbGV0ZSI7aToyMjtzOjE0OiJjY2F0ZWdvcnktZWRpdCI7aToyMztzOjE2OiJjY2F0ZWdvcnktcmVwb3J0IjtpOjI0O3M6MTI6ImNpdGVtLWFjY2VzcyI7aToyNTtzOjk6ImNpdGVtLWFkZCI7aToyNjtzOjE3OiJjaXRlbS1idWxrLWRlbGV0ZSI7aToyNztzOjEyOiJjaXRlbS1kZWxldGUiO2k6Mjg7czoxMDoiY2l0ZW0tZWRpdCI7aToyOTtzOjEyOiJjaXRlbS1yZXBvcnQiO2k6MzA7czoxNDoiY21vZHVsZS1hY2Nlc3MiO2k6MzE7czoxMToiY21vZHVsZS1hZGQiO2k6MzI7czoxOToiY21vZHVsZS1idWxrLWRlbGV0ZSI7aTozMztzOjE0OiJjbW9kdWxlLWRlbGV0ZSI7aTozNDtzOjEyOiJjbW9kdWxlLWVkaXQiO2k6MzU7czoxNDoiY21vZHVsZS1yZXBvcnQiO2k6MzY7czoxNDoiY29udGFjdC1hY2Nlc3MiO2k6Mzc7czoxMToiY29udGFjdC1hZGQiO2k6Mzg7czoxOToiY29udGFjdC1idWxrLWRlbGV0ZSI7aTozOTtzOjE0OiJjb250YWN0LWRlbGV0ZSI7aTo0MDtzOjEyOiJjb250YWN0LWVkaXQiO2k6NDE7czoxNDoiY29udGFjdC1yZXBvcnQiO2k6NDI7czoxMjoiY3R5cGUtYWNjZXNzIjtpOjQzO3M6OToiY3R5cGUtYWRkIjtpOjQ0O3M6MTc6ImN0eXBlLWJ1bGstZGVsZXRlIjtpOjQ1O3M6MTI6ImN0eXBlLWRlbGV0ZSI7aTo0NjtzOjEwOiJjdHlwZS1lZGl0IjtpOjQ3O3M6MTI6ImN0eXBlLXJlcG9ydCI7aTo0ODtzOjE2OiJkYXNoYm9hcmQtYWNjZXNzIjtpOjQ5O3M6MTY6ImRjYXRlZ29yeS1hY2Nlc3MiO2k6NTA7czoxMzoiZGNhdGVnb3J5LWFkZCI7aTo1MTtzOjIxOiJkY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6NTI7czoxNjoiZGNhdGVnb3J5LWRlbGV0ZSI7aTo1MztzOjE0OiJkY2F0ZWdvcnktZWRpdCI7aTo1NDtzOjE2OiJkY2F0ZWdvcnktcmVwb3J0IjtpOjU1O3M6MTU6ImRvY3VtZW50LWFjY2VzcyI7aTo1NjtzOjEyOiJkb2N1bWVudC1hZGQiO2k6NTc7czoyMDoiZG9jdW1lbnQtYnVsay1kZWxldGUiO2k6NTg7czoxNToiZG9jdW1lbnQtZGVsZXRlIjtpOjU5O3M6MTM6ImRvY3VtZW50LWVkaXQiO2k6NjA7czoxNToiZG9jdW1lbnQtcmVwb3J0IjtpOjYxO3M6MTI6ImVtYWlsLWFjY2VzcyI7aTo2MjtzOjk6ImVtYWlsLWFkZCI7aTo2MztzOjE3OiJlbWFpbC1idWxrLWRlbGV0ZSI7aTo2NDtzOjEyOiJlbWFpbC1kZWxldGUiO2k6NjU7czoxMDoiZW1haWwtZWRpdCI7aTo2NjtzOjEyOiJlbWFpbC1yZXBvcnQiO2k6Njc7czoxMToiZmlsZS1leHBvcnQiO2k6Njg7czoxMToiZmlsZS1pbXBvcnQiO2k6Njk7czoxNjoiZ2NhdGVnb3J5LWFjY2VzcyI7aTo3MDtzOjEzOiJnY2F0ZWdvcnktYWRkIjtpOjcxO3M6MjE6ImdjYXRlZ29yeS1idWxrLWRlbGV0ZSI7aTo3MjtzOjE2OiJnY2F0ZWdvcnktZGVsZXRlIjtpOjczO3M6MTQ6ImdjYXRlZ29yeS1lZGl0IjtpOjc0O3M6MTY6ImdjYXRlZ29yeS1yZXBvcnQiO2k6NzU7czoxMzoibGltYWdlLWFjY2VzcyI7aTo3NjtzOjEwOiJsaW1hZ2UtYWRkIjtpOjc3O3M6MTg6ImxpbWFnZS1idWxrLWRlbGV0ZSI7aTo3ODtzOjEzOiJsaW1hZ2UtZGVsZXRlIjtpOjc5O3M6MTE6ImxpbWFnZS1lZGl0IjtpOjgwO3M6MTM6ImxpbWFnZS1yZXBvcnQiO2k6ODE7czoxNToibG9jYXRpb24tYWNjZXNzIjtpOjgyO3M6MTI6ImxvY2F0aW9uLWFkZCI7aTo4MztzOjIwOiJsb2NhdGlvbi1idWxrLWRlbGV0ZSI7aTo4NDtzOjE1OiJsb2NhdGlvbi1kZWxldGUiO2k6ODU7czoxMzoibG9jYXRpb24tZWRpdCI7aTo4NjtzOjE1OiJsb2NhdGlvbi1yZXBvcnQiO2k6ODc7czoxMToibWVudS1hY2Nlc3MiO2k6ODg7czo4OiJtZW51LWFkZCI7aTo4OTtzOjEyOiJtZW51LWJ1aWxkZXIiO2k6OTA7czoxNjoibWVudS1idWxrLWRlbGV0ZSI7aTo5MTtzOjExOiJtZW51LWRlbGV0ZSI7aTo5MjtzOjk6Im1lbnUtZWRpdCI7aTo5MztzOjE1OiJtZW51LW1vZHVsZS1hZGQiO2k6OTQ7czoxODoibWVudS1tb2R1bGUtZGVsZXRlIjtpOjk1O3M6MTY6Im1lbnUtbW9kdWxlLWVkaXQiO2k6OTY7czoxMToibWVudS1yZXBvcnQiO2k6OTc7czoxMToicGFjay1hY2Nlc3MiO2k6OTg7czo4OiJwYWNrLWFkZCI7aTo5OTtzOjE2OiJwYWNrLWJ1bGstZGVsZXRlIjtpOjEwMDtzOjExOiJwYWNrLWRlbGV0ZSI7aToxMDE7czo5OiJwYWNrLWVkaXQiO2k6MTAyO3M6MTE6InBhY2stcmVwb3J0IjtpOjEwMztzOjE3OiJwZXJtaXNzaW9uLWFjY2VzcyI7aToxMDQ7czoxNDoicGVybWlzc2lvbi1hZGQiO2k6MTA1O3M6MjI6InBlcm1pc3Npb24tYnVsay1kZWxldGUiO2k6MTA2O3M6MTc6InBlcm1pc3Npb24tZGVsZXRlIjtpOjEwNztzOjE1OiJwZXJtaXNzaW9uLWVkaXQiO2k6MTA4O3M6MTc6InBlcm1pc3Npb24tcmVwb3J0IjtpOjEwOTtzOjE0OiJwaWN0dXJlLWFjY2VzcyI7aToxMTA7czoxMToicGljdHVyZS1hZGQiO2k6MTExO3M6MTk6InBpY3R1cmUtYnVsay1kZWxldGUiO2k6MTEyO3M6MTQ6InBpY3R1cmUtZGVsZXRlIjtpOjExMztzOjEyOiJwaWN0dXJlLWVkaXQiO2k6MTE0O3M6MTQ6InBpY3R1cmUtcmVwb3J0IjtpOjExNTtzOjEzOiJwaW1hZ2UtYWNjZXNzIjtpOjExNjtzOjEwOiJwaW1hZ2UtYWRkIjtpOjExNztzOjE4OiJwaW1hZ2UtYnVsay1kZWxldGUiO2k6MTE4O3M6MTM6InBpbWFnZS1kZWxldGUiO2k6MTE5O3M6MTE6InBpbWFnZS1lZGl0IjtpOjEyMDtzOjEzOiJwaW1hZ2UtcmVwb3J0IjtpOjEyMTtzOjE0OiJwcm9kdWN0LWFjY2VzcyI7aToxMjI7czoxMToicHJvZHVjdC1hZGQiO2k6MTIzO3M6MTk6InByb2R1Y3QtYnVsay1kZWxldGUiO2k6MTI0O3M6MTQ6InByb2R1Y3QtZGVsZXRlIjtpOjEyNTtzOjEyOiJwcm9kdWN0LWVkaXQiO2k6MTI2O3M6MTQ6InByb2R1Y3QtcmVwb3J0IjtpOjEyNztzOjExOiJyb2xlLWFjY2VzcyI7aToxMjg7czo4OiJyb2xlLWFkZCI7aToxMjk7czoxNjoicm9sZS1idWxrLWRlbGV0ZSI7aToxMzA7czoxMToicm9sZS1kZWxldGUiO2k6MTMxO3M6OToicm9sZS1lZGl0IjtpOjEzMjtzOjExOiJyb2xlLXJlcG9ydCI7aToxMzM7czo5OiJyb2xlLXZpZXciO2k6MTM0O3M6MTY6InNjYXRlZ29yeS1hY2Nlc3MiO2k6MTM1O3M6MTM6InNjYXRlZ29yeS1hZGQiO2k6MTM2O3M6MjE6InNjYXRlZ29yeS1idWxrLWRlbGV0ZSI7aToxMzc7czoxNjoic2NhdGVnb3J5LWRlbGV0ZSI7aToxMzg7czoxNDoic2NhdGVnb3J5LWVkaXQiO2k6MTM5O3M6MTY6InNjYXRlZ29yeS1yZXBvcnQiO2k6MTQwO3M6MTQ6InNlZ21lbnQtYWNjZXNzIjtpOjE0MTtzOjExOiJzZWdtZW50LWFkZCI7aToxNDI7czoxOToic2VnbWVudC1idWxrLWRlbGV0ZSI7aToxNDM7czoxNDoic2VnbWVudC1kZWxldGUiO2k6MTQ0O3M6MTI6InNlZ21lbnQtZWRpdCI7aToxNDU7czoxNDoic2VnbWVudC1yZXBvcnQiO2k6MTQ2O3M6MTQ6InNldHRpbmctYWNjZXNzIjtpOjE0NztzOjExOiJ1c2VyLWFjY2VzcyI7aToxNDg7czo4OiJ1c2VyLWFkZCI7aToxNDk7czoxNjoidXNlci1idWxrLWRlbGV0ZSI7aToxNTA7czoxMToidXNlci1kZWxldGUiO2k6MTUxO3M6OToidXNlci1lZGl0IjtpOjE1MjtzOjExOiJ1c2VyLXJlcG9ydCI7aToxNTM7czo5OiJ1c2VyLXZpZXciO2k6MTU0O3M6MTQ6InZhcmlhbnQtYWNjZXNzIjtpOjE1NTtzOjExOiJ2YXJpYW50LWFkZCI7aToxNTY7czoxOToidmFyaWFudC1idWxrLWRlbGV0ZSI7aToxNTc7czoxNDoidmFyaWFudC1kZWxldGUiO2k6MTU4O3M6MTI6InZhcmlhbnQtZWRpdCI7aToxNTk7czoxNDoidmFyaWFudC1yZXBvcnQiO2k6MTYwO3M6MTI6InZpZGVvLWFjY2VzcyI7aToxNjE7czo5OiJ2aWRlby1hZGQiO2k6MTYyO3M6MTc6InZpZGVvLWJ1bGstZGVsZXRlIjtpOjE2MztzOjEyOiJ2aWRlby1kZWxldGUiO2k6MTY0O3M6MTA6InZpZGVvLWVkaXQiO2k6MTY1O3M6MTI6InZpZGVvLXJlcG9ydCI7aToxNjY7czoxNDoidm9wdGlvbi1hY2Nlc3MiO2k6MTY3O3M6MTE6InZvcHRpb24tYWRkIjtpOjE2ODtzOjE5OiJ2b3B0aW9uLWJ1bGstZGVsZXRlIjtpOjE2OTtzOjE0OiJ2b3B0aW9uLWRlbGV0ZSI7aToxNzA7czoxMjoidm9wdGlvbi1lZGl0IjtpOjE3MTtzOjE0OiJ2b3B0aW9uLXJlcG9ydCI7fXM6NDoibWVudSI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjg6e3M6ODoiACoAdG90YWwiO2k6MTg7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjE4OntpOjA7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aToxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo5OiJEYXNoYm9hcmQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFzIGZhLXRhY2hvbWV0ZXItYWx0IjtzOjM6InVybCI7czoxOiIvIjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO047czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0wMSAwNzozNDoyMSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjk6IkRhc2hib2FyZCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjIxOiJmYXMgZmEtdGFjaG9tZXRlci1hbHQiO3M6MzoidXJsIjtzOjE6Ii8iO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7TjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTAxIDA3OjM0OjIxIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo4OntzOjg6IgAqAHRvdGFsIjtpOjA7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo4ODtzOjc6Im1lbnVfaWQiO2k6MjtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiUHJvZHVjdHMiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czozNDoiaHR0cDovLzEzLjIxMy4zOC4xNzQ6ODAwMS9wcm9kdWN0cyI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTA0IDA4OjE1OjQ3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTA0IDA4OjE1OjU3Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6ODg7czo3OiJtZW51X2lkIjtpOjI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjg6IlByb2R1Y3RzIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMy4yMTMuMzguMTc0OjgwMDEvcHJvZHVjdHMiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMS0wNCAwODoxNTo0NyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0wNCAwODoxNTo1NyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YToxOntzOjg6ImNoaWxkcmVuIjtPOjI2OiJUeXBpQ01TXE5lc3RhYmxlQ29sbGVjdGlvbiI6ODp7czo4OiIAKgB0b3RhbCI7aToxO3M6MTU6IgAqAHBhcmVudENvbHVtbiI7czo5OiJwYXJlbnRfaWQiO3M6MzM6IgAqAHJlbW92ZUl0ZW1zV2l0aE1pc3NpbmdBbmNlc3RvciI7YjoxO3M6MTQ6IgAqAGluZGVudENoYXJzIjtzOjg6IsKgwqDCoMKgIjtzOjE1OiIAKgBjaGlsZHJlbk5hbWUiO3M6NToiaXRlbXMiO3M6MTc6IgAqAHBhcmVudFJlbGF0aW9uIjtzOjY6InBhcmVudCI7czo4OiIAKgBpdGVtcyI7YToxOntpOjA7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo4NztzOjc6Im1lbnVfaWQiO2k6MjtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NDoiSG9tZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjI2OiJodHRwOi8vMTMuMjEzLjM4LjE3NDo4MDAxLyI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjg4O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIyIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTA0IDA4OjE0OjI5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIzLTAxLTA0IDA4OjE1OjU5Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6ODc7czo3OiJtZW51X2lkIjtpOjI7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjQ6IkhvbWUiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyNjoiaHR0cDovLzEzLjIxMy4zOC4xNzQ6ODAwMS8iO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo4ODtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMy0wMS0wNCAwODoxNDoyOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMy0wMS0wNCAwODoxNTo1OSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjEiO3M6MTE6Im1vZHVsZV9uYW1lIjtOO3M6MTM6ImRpdmlkZXJfdGl0bGUiO3M6NToiTWVudXMiO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtOO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMTggMTc6MTI6MTUiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aToyO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIxIjtzOjExOiJtb2R1bGVfbmFtZSI7TjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtzOjU6Ik1lbnVzIjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MjtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7TjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTE4IDE3OjEyOjE1Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo4OntzOjg6IgAqAHRvdGFsIjtpOjA7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjM7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo1NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IkNvbnRlbnQgTWFuYWdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE5OiJmYXIgZmEtYWRkcmVzcy1ib29rIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMDggMTU6MDM6NDAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MDg6MzMiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo1NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IkNvbnRlbnQgTWFuYWdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE5OiJmYXIgZmEtYWRkcmVzcy1ib29rIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMDggMTU6MDM6NDAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MDg6MzMiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo4OiJjaGlsZHJlbiI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjg6e3M6ODoiACoAdG90YWwiO2k6NDtzOjE1OiIAKgBwYXJlbnRDb2x1bW4iO3M6OToicGFyZW50X2lkIjtzOjMzOiIAKgByZW1vdmVJdGVtc1dpdGhNaXNzaW5nQW5jZXN0b3IiO2I6MTtzOjE0OiIAKgBpbmRlbnRDaGFycyI7czo4OiLCoMKgwqDCoCI7czoxNToiACoAY2hpbGRyZW5OYW1lIjtzOjU6Iml0ZW1zIjtzOjE3OiIAKgBwYXJlbnRSZWxhdGlvbiI7czo2OiJwYXJlbnQiO3M6ODoiACoAaXRlbXMiO2E6NDp7aTowO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjozMDp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTM6e3M6MjoiaWQiO2k6NTg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDb250ZW50IENhdGVnb3J5IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjM6ImZhYiBmYS1idXJvbW9iZWxleHBlcnRlIjtzOjM6InVybCI7czo5OiJjY2F0ZWdvcnkiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo1NztzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0wOCAxNTowNDozMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzoxMjoyOSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjU4O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiQ29udGVudCBDYXRlZ29yeSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjIzOiJmYWIgZmEtYnVyb21vYmVsZXhwZXJ0ZSI7czozOiJ1cmwiO3M6OToiY2NhdGVnb3J5IjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6NTc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMDggMTU6MDQ6MzMiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MTI6MjkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjU5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMjoiQ29udGVudCBUeXBlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjA6ImZhYiBmYS10dW1ibHItc3F1YXJlIjtzOjM6InVybCI7czo1OiJjdHlwZSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjU3O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTA4IDE1OjA1OjA4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE2IDExOjU5OjE0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6NTk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEyOiJDb250ZW50IFR5cGUiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMDoiZmFiIGZhLXR1bWJsci1zcXVhcmUiO3M6MzoidXJsIjtzOjU6ImN0eXBlIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NTc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMDggMTU6MDU6MDgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTYgMTE6NTk6MTQiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjYwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiQ29udGVudCBNb2R1bGUiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNToiZmFzIGZhLWJveC1vcGVuIjtzOjM6InVybCI7czo3OiJjbW9kdWxlIjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NTc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMDggMTU6MDU6MzciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MTg6MTciO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo2MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTQ6IkNvbnRlbnQgTW9kdWxlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTU6ImZhcyBmYS1ib3gtb3BlbiI7czozOiJ1cmwiO3M6NzoiY21vZHVsZSI7czo1OiJvcmRlciI7aTozO3M6OToicGFyZW50X2lkIjtpOjU3O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTA4IDE1OjA1OjM3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE3OjE4OjE3Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjM7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo2MTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTI6IkNvbnRlbnQgSXRlbSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE1OiJmYSBmYS1jYXJ0LXBsdXMiO3M6MzoidXJsIjtzOjU6ImNpdGVtIjtzOjU6Im9yZGVyIjtpOjQ7czo5OiJwYXJlbnRfaWQiO2k6NTc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTAgMDk6MDk6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MTk6MTkiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo2MTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTI6IkNvbnRlbnQgSXRlbSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE1OiJmYSBmYS1jYXJ0LXBsdXMiO3M6MzoidXJsIjtzOjU6ImNpdGVtIjtzOjU6Im9yZGVyIjtpOjQ7czo5OiJwYXJlbnRfaWQiO2k6NTc7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTAgMDk6MDk6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6MTk6MTkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjQ7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo2MjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IlByb2R1Y3QgTWFuYWdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEyOiJmYXMgZmEtZG9sbHkiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxMDo1Mjo0NSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0xOCAxNzoxMjoxNSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjYyO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNToiUHJvZHVjdCBNYW5hZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTI6ImZhcyBmYS1kb2xseSI7czozOiJ1cmwiO047czo1OiJvcmRlciI7aTo0O3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE1IDEwOjUyOjQ1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTE4IDE3OjEyOjE1Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo4OntzOjg6IgAqAHRvdGFsIjtpOjk7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjk6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjYzO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo4OiJDYXRlZ3JveSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE1OiJmYXMgZmEtbGlzdC1hbHQiO3M6MzoidXJsIjtzOjg6ImNhdGVnb3J5IjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTUgMTA6NTc6NDEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTYgMTI6MDU6NDIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo2MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiQ2F0ZWdyb3kiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNToiZmFzIGZhLWxpc3QtYWx0IjtzOjM6InVybCI7czo4OiJjYXRlZ29yeSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE1IDEwOjU3OjQxIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE2IDEyOjA1OjQyIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo2NDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTI6IlN1YiBDYXRlZ29yeSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjIyOiJmYXMgZmEtcHJvamVjdC1kaWFncmFtIjtzOjM6InVybCI7czo5OiJzY2F0ZWdvcnkiO3M6NToib3JkZXIiO2k6MjtzOjk6InBhcmVudF9pZCI7aTo2MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxMjowMDowNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzoyMjowOSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjY0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMjoiU3ViIENhdGVnb3J5IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjI6ImZhcyBmYS1wcm9qZWN0LWRpYWdyYW0iO3M6MzoidXJsIjtzOjk6InNjYXRlZ29yeSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE1IDEyOjAwOjA3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE3OjIyOjA5Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo2NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NzoiVmFyaWFudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEzOiJmYXMgZmEtcXJjb2RlIjtzOjM6InVybCI7czo3OiJ2YXJpYW50IjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTUgMTU6NTM6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6Mjc6MTUiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo2NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NzoiVmFyaWFudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEzOiJmYXMgZmEtcXJjb2RlIjtzOjM6InVybCI7czo3OiJ2YXJpYW50IjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTUgMTU6NTM6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6Mjc6MTUiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjY2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiVmFyaWFudCBPcHRpb24iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXNpdGVtYXAiO3M6MzoidXJsIjtzOjc6InZvcHRpb24iO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo2MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxNTo1Mzo1NSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzoyNzo1MSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjY2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiVmFyaWFudCBPcHRpb24iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXNpdGVtYXAiO3M6MzoidXJsIjtzOjc6InZvcHRpb24iO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo2MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxNTo1Mzo1NSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzoyNzo1MSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aTo0O086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjozMDp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTM6e3M6MjoiaWQiO2k6Njk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjc6IlNlZ21lbnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNjoiZmFzIGZhLWNoYXJ0LXBpZSI7czozOiJ1cmwiO3M6Nzoic2VnbWVudCI7czo1OiJvcmRlciI7aTo1O3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTIwIDEyOjA0OjM2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE3OjMwOjUwIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6Njk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjc6IlNlZ21lbnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNjoiZmFzIGZhLWNoYXJ0LXBpZSI7czozOiJ1cmwiO3M6Nzoic2VnbWVudCI7czo1OiJvcmRlciI7aTo1O3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTIwIDEyOjA0OjM2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE3OjMwOjUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjU7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjMwOntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo3MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6OToiUGFjayBUeXBlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTc6ImZhcyBmYS10aWNrZXQtYWx0IjtzOjM6InVybCI7czo0OiJwYWNrIjtzOjU6Im9yZGVyIjtpOjY7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMjMgMDk6MTI6MjUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6NDU6NTQiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo3MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6OToiUGFjayBUeXBlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTc6ImZhcyBmYS10aWNrZXQtYWx0IjtzOjM6InVybCI7czo0OiJwYWNrIjtzOjU6Im9yZGVyIjtpOjY7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMjMgMDk6MTI6MjUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6NDU6NTQiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6NjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjY3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo3OiJQcm9kdWN0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjE6ImZhcyBmYS13ZWlnaHQtaGFuZ2luZyI7czozOiJ1cmwiO3M6NzoicHJvZHVjdCI7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTE1IDE1OjU0OjQ2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE3OjQ1OjM0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6Njc7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjc6IlByb2R1Y3QiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFzIGZhLXdlaWdodC1oYW5naW5nIjtzOjM6InVybCI7czo3OiJwcm9kdWN0IjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTEtMTUgMTU6NTQ6NDYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMjAgMTc6NDU6MzQiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6NztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjY4O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMjoiUHJvZHVjdCBNdWx0aXBsZSBJbWFnZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEzOiJmYXMgZmEtaW1hZ2VzIjtzOjM6InVybCI7czo2OiJwaW1hZ2UiO3M6NToib3JkZXIiO2k6ODtzOjk6InBhcmVudF9pZCI7aTo2MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxNTo1NToyMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzo1MzowOCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjY4O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMjoiUHJvZHVjdCBNdWx0aXBsZSBJbWFnZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEzOiJmYXMgZmEtaW1hZ2VzIjtzOjM6InVybCI7czo2OiJwaW1hZ2UiO3M6NToib3JkZXIiO2k6ODtzOjk6InBhcmVudF9pZCI7aTo2MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0xNSAxNTo1NToyMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxNzo1MzowOCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0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IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo3MTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTc6IkRvY3VtZW50IENhdGVnb3J5IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTQ6ImZhcyBmYS10aC1saXN0IjtzOjM6InVybCI7czo5OiJkY2F0ZWdvcnkiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo3MjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0yOCAxMTozNjo1MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMS0yOCAxMTozOTowNSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjcxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNzoiRG9jdW1lbnQgQ2F0ZWdvcnkiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXRoLWxpc3QiO3M6MzoidXJsIjtzOjk6ImRjYXRlZ29yeSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjcyO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTI4IDExOjM2OjUzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTExLTI4IDExOjM5OjA1Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4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O2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo3NjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTY6IkxvY2F0aW9uIE1hbmFnZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXRoLWxpc3QiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6NjtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMi0wNCAxNjoxNzowMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0xOCAxNzoxMjoxNSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjc2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiTG9jYXRpb24gTWFuYWdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE0OiJmYXMgZmEtdGgtbGlzdCI7czozOiJ1cmwiO047czo1OiJvcmRlciI7aTo2O3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTA0IDE2OjE3OjAzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTE4IDE3OjEyOjE1Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo4OntzOjg6IgAqAHRvdGFsIjtpOjI7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjI6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6MzA6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjc0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo4OiJMb2NhdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE0OiJmYXMgZmEtdGgtbGlzdCI7czozOiJ1cmwiO3M6ODoibG9jYXRpb24iO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo3NjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0zMCAxNDowODo1NyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0wNCAxNjoxNzoyMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEzOntzOjI6ImlkIjtpOjc0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo4OiJMb2NhdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE0OiJmYXMgZmEtdGgtbGlzdCI7czozOiJ1cmwiO3M6ODoibG9jYXRpb24iO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo3NjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMS0zMCAxNDowODo1NyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0wNCAxNjoxNzoyMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjozMDp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTM6e3M6MjoiaWQiO2k6NzU7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJMb2NhdGlvbiBJbXBvcnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxODoiZmFzIGZhLWZpbGUtaW1wb3J0IjtzOjM6InVybCI7czo0OiJmaWxlIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NzY7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMDQgMTE6NTA6MjYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMDQgMTY6MTc6MjQiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo3NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IkxvY2F0aW9uIEltcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE4OiJmYXMgZmEtZmlsZS1pbXBvcnQiO3M6MzoidXJsIjtzOjQ6ImZpbGUiO3M6NToib3JkZXIiO2k6MjtzOjk6InBhcmVudF9pZCI7aTo3NjtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMi0wNCAxMTo1MDoyNiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0wNCAxNjoxNzoyNCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUi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IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEzOntzOjI6ImlkIjtpOjc5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMzoiQmxvZyBDYXRlZ29yeSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE0OiJmYXMgZmEtdGgtbGlzdCI7czozOiJ1cmwiO3M6OToiYmNhdGVnb3J5IjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6Nzg7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6Njoic3RhdHVzIjtzOjE6IjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMTggMTc6MDc6MTQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMTItMTggMTc6MDk6MTMiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMzp7czoyOiJpZCI7aTo3OTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTM6IkJsb2cgQ2F0ZWdvcnkiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXRoLWxpc3QiO3M6MzoidXJsIjtzOjk6ImJjYXRlZ29yeSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjc4O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTE4IDE3OjA3OjE0IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTE4IDE3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dCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMzp7czoyOiJpZCI7aTo4NjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiQ2F0ZWdvcnkiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNDoiZmFzIGZhLXRoLWxpc3QiO3M6MzoidXJsIjtzOjk6ImdjYXRlZ29yeSI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjg1O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjY6InN0YXR1cyI7czoxOiIxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE4OjE2OjM3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTEyLTIwIDE4OjE2OjUwIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTM6e3M6MjoiaWQiO2k6ODY7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjg6IkNhdGVnb3J5IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTQ6ImZhcyBmYS10aC1saXN0IjtzOjM6InVybCI7czo5OiJnY2F0ZWdvcnkiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo4NTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czo2OiJzdGF0dXMiO3M6MToiMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxODoxNjozNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMi0xMi0yMCAxODoxNjo1MCI7fXM6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', 1683532468);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'Ifad', NULL, NULL),
(2, 'address', 'Address', NULL, NULL),
(3, 'copyright', '@ API 2022', NULL, NULL),
(4, 'email', 'api@gmail.com', NULL, NULL),
(5, 'phone', '0000000', NULL, NULL),
(6, 'hotnumber', '09612114444', NULL, NULL),
(8, 'logo', '2019061743logo-320014.png', NULL, NULL),
(9, 'favicon', 'faveicon64x64-881682.png', NULL, NULL),
(10, 'footerlogo', '5332306-655197.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sub_category_description` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `image`, `sub_category_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(8, 'Pillow', 4, 'Ifad-Pillow-Mockup-final--22gm-307736.png', 'Pillow', '1', 'api', 'api', '2022-12-14 11:37:40', '2022-12-14 11:39:39'),
(9, 'Wavy', 4, 'Wavy-Chips-25gm-504186.png', 'Wavy', '1', 'api', 'api', '2022-12-14 11:38:23', '2022-12-14 11:39:14'),
(10, 'Ata', 7, 'ata-753963.png', 'Ata', '1', 'api', 'api', '2022-12-14 11:46:57', '2022-12-14 11:47:11'),
(11, 'Moida', 7, 'Moida-325636.png', 'Moida', '1', 'api', 'api', '2022-12-14 11:49:04', '2022-12-14 11:49:18'),
(12, 'Suzi', 7, 'suzi-754464.png', 'Suzi', '1', 'api', 'api', '2022-12-14 11:49:52', '2022-12-14 11:50:04'),
(13, 'Mustard Oil', 7, 'mnew-906224.jpg', 'Mustard Oil', '1', 'api', 'api', '2022-12-14 12:04:47', '2022-12-14 12:20:30'),
(14, 'Eggy Noodles Chicken & Masala Flavored', 8, 'No-new-278316.jpg', 'Eggy Noodles Chicken & Masala Flavored', '1', 'api', 'api', '2022-12-14 12:24:41', '2022-12-14 12:25:13'),
(15, 'Cake', 9, 'Chocolate-Muffin-cake-3D-Pack-176453.png', 'Cake', '1', 'api', NULL, '2022-12-14 16:07:39', '2022-12-14 16:07:39'),
(16, 'Chanachur', 9, '17-821651.png', 'Chanachur', '1', 'api', 'Ifad IT', '2022-12-19 15:16:31', '2023-03-04 07:32:42'),
(19, 'AMS', 7, NULL, 'AMS', '1', 'Admin', NULL, '2023-01-04 07:50:16', '2023-01-04 07:50:16'),
(20, 'Dishoom Liquid Dishwash', 12, '09-116428.png', 'Dishoom Liquid Dishwash', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 04:09:40', '2023-03-04 06:12:55'),
(21, 'Dishoom Dishwashing Bar', 12, '11-250468.png', 'Dishoom Dishwashing Bar', '1', 'Ifad IT', NULL, '2023-03-04 06:12:09', '2023-03-04 06:12:09'),
(22, 'Safe n Soft Handwash', 12, '07-158211.png', 'Safe n Soft Handwash', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 06:14:14', '2023-03-04 06:14:51'),
(23, 'Pure Brite Detergent Powder', 12, '02-386360.png', 'Pure Brite Detergent Powder', '1', 'Ifad IT', NULL, '2023-03-04 06:15:38', '2023-03-04 06:15:38'),
(24, 'Uniq Floor Cleaner (Lavender, Lemongrass & Bailey flavor)', 12, '05-811320.png', 'Uniq Floor Cleaner\r\n(Lavender, Lemongrass & Bailey flavor)', '1', 'Ifad IT', NULL, '2023-03-04 06:18:04', '2023-03-04 06:18:04'),
(25, 'Uniq Multi Surface Cleaner', 12, '06-964000.png', 'Uniq Multi Surface Cleaner', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 06:18:34', '2023-03-04 07:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_code` varchar(255) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `base_unit` int(10) UNSIGNED DEFAULT NULL,
  `operator` varchar(255) DEFAULT '*',
  `operation_value` varchar(255) DEFAULT '1',
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` int(3) NOT NULL,
  `district_id` int(2) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `district_id`, `name`, `bn_name`, `url`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd'),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd'),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd'),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd'),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd'),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd'),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd'),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd'),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd'),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd'),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd'),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd'),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd'),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd'),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd'),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd'),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd'),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd'),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd'),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd'),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd'),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd'),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd'),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd'),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd'),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd'),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd'),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd'),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd'),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd'),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    '),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd'),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd'),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd'),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd'),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd'),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd'),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd'),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd'),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd'),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd'),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd'),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd'),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd'),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd'),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd'),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd'),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd'),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd'),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd'),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd'),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd'),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd'),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd'),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd'),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd'),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd'),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd'),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd'),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd'),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd'),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd'),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd'),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd'),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd'),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd'),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd'),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd'),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd'),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd'),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd'),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd'),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd'),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd'),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd'),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd'),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd'),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd'),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd'),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd'),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd'),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd'),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd'),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd'),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd'),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd'),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd'),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd'),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd'),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd'),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd'),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd'),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd'),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd'),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd'),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd'),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd'),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd'),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd'),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd'),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd'),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd'),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd'),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd'),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd'),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd'),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd'),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd'),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd'),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd'),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd'),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd'),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd'),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd'),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd'),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd'),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd'),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd'),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd'),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd'),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd'),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd'),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd'),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd'),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd'),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd'),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd'),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd'),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd'),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd'),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd'),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd'),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd'),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd'),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd'),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd'),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd'),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd'),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd'),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd'),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd'),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd'),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd'),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd'),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd'),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd'),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd'),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd'),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd'),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd'),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd'),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd'),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd'),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd'),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd'),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd'),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd'),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd'),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd'),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd'),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd'),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd'),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd'),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd'),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd'),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd'),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd'),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd'),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd'),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd'),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd'),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd'),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd'),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd'),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd'),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd'),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd'),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd'),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd'),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd'),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd'),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd'),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd'),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd'),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd'),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd'),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd'),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd'),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd'),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd'),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd'),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd'),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd'),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd'),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd'),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd'),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd'),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd'),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd'),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd'),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd'),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd'),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd'),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd'),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd'),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd'),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd'),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd'),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd'),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd'),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd'),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd'),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd'),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd'),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd'),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd'),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd'),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd'),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd'),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd'),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd'),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd'),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd'),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd'),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd'),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd'),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd'),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd'),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd'),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd'),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd'),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd'),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd'),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd'),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd'),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd'),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd'),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd'),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd'),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd'),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd'),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd'),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd'),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd'),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd'),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd'),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd'),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd'),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd'),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd'),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd'),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd'),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd'),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd'),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd'),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd'),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd'),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd'),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd'),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd'),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd'),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd'),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd'),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd'),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd'),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd'),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd'),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd'),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd'),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd'),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd'),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd'),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd'),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd'),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd'),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd'),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd'),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd'),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd'),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd'),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd'),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd'),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd'),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd'),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd'),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd'),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd'),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd'),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd'),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd'),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd'),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd'),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd'),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd'),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd'),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd'),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd'),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd'),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd'),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd'),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd'),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd'),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd'),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd'),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd'),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd'),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd'),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd'),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd'),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd'),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd'),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd'),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd'),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd'),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd'),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd'),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd'),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd'),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd'),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd'),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd'),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd'),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd'),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd'),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd'),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd'),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd'),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd'),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd'),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd'),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd'),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd'),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd'),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd'),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd'),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd'),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd'),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd'),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd'),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd'),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd'),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd'),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd'),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd'),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd'),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd'),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd'),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd'),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd'),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd'),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd'),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd'),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd'),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd'),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd'),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd'),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd'),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd'),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd'),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd'),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd'),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd'),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd'),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd'),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd'),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd'),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd'),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd'),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd'),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd'),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd'),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd'),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd'),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd'),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd'),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd'),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd'),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd'),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd'),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd'),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd'),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd'),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd'),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd'),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd'),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd'),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd'),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd'),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd'),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd'),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd'),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd'),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd'),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd'),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd'),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd'),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd'),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd'),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd'),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd'),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd'),
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd'),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd'),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd'),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd'),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd'),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd'),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd'),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd'),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd'),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd'),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd'),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd'),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd'),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd'),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd'),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd'),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd'),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd'),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd'),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd'),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd'),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd'),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd'),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd'),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd'),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd'),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd'),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd'),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd'),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd'),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd'),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd'),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd'),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd'),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd'),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd'),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd'),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd'),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd'),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd'),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd'),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd'),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd'),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd'),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd'),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd'),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd'),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd'),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd'),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd'),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd'),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd'),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd'),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd'),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd'),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd'),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd'),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd'),
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd'),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd'),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd'),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd'),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd'),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd'),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd'),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd'),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd'),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd'),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd'),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd'),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd'),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd'),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd'),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd'),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd'),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd'),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd'),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd'),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd'),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd'),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd'),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd'),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd'),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd'),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd'),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd'),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd'),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd'),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `gender` enum('1','2') NOT NULL COMMENT '1=Male,2=Female',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `mobile_no`, `gender`, `email_verified_at`, `password`, `status`, `remember_token`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@mail.com', NULL, '01521225987', '1', NULL, '$2y$10$5K.y7qLyFTqAhIaAtjl3kun9HNgKygEVz0BlPLm7UNCrvs3vstwsO', '1', NULL, NULL, NULL, '2020-11-14 11:27:29', '2021-02-24 11:17:30'),
(2, 2, 'Ifadadmin', 'ifad@gmail.com', NULL, '01980-002073', '1', NULL, '$2y$10$yq9uYMf/D..Q.DmX3dzOdOCRSWC0njEDtX4MXJK0kLF61pVnamhJ6', '1', NULL, 'Super Admin', 'Admin', '2020-11-14 12:25:53', '2023-02-08 02:38:45'),
(3, 4, 'Ifad IT', 'ifadit@mail.com', NULL, '2457819876', '1', NULL, '$2y$10$0QNab5EVbTjN5hR99WsY3O30hjWbHpruKiORG2nqypZTwEzIIiW9S', '1', NULL, 'Admin', NULL, '2023-02-09 04:59:44', '2023-02-09 04:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(6, 'Color', '1', 'Admin', NULL, '2022-11-16 05:04:27', '2022-11-16 05:04:27'),
(7, 'Size', '1', 'Admin', NULL, '2022-11-16 05:04:33', '2022-11-16 05:04:33'),
(8, 'Weight', '1', 'Admin', NULL, '2022-11-16 05:04:42', '2022-11-16 05:04:42'),
(10, 'KG', '1', 'Admin', 'Admin', '2022-11-28 05:32:05', '2022-11-28 05:32:14'),
(12, 'gm', '1', 'api', 'Ifad IT', '2022-12-15 09:26:24', '2023-03-04 08:37:31'),
(13, 'ml', '1', 'Admin', 'Ifad IT', '2023-02-08 08:55:29', '2023-03-04 08:37:21'),
(14, 'L', '1', 'Ifad IT', NULL, '2023-03-04 08:37:49', '2023-03-04 08:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `variant_options`
--

CREATE TABLE `variant_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variant_options`
--

INSERT INTO `variant_options` (`id`, `variant_id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 6, 'Red', '1', 'Admin', 'Admin', '2022-11-16 05:42:33', '2022-11-16 05:42:44'),
(5, 8, '220gm', '1', 'Admin', NULL, '2023-01-04 08:08:31', '2023-01-04 08:08:31'),
(6, 8, '80gm', '1', 'Admin', NULL, '2023-01-04 08:08:50', '2023-01-04 08:08:50'),
(7, 8, '160gm', '1', 'Admin', NULL, '2023-01-04 08:09:15', '2023-01-04 08:09:15'),
(8, 8, '55gm', '1', 'Admin', NULL, '2023-01-04 08:09:26', '2023-01-04 08:09:26'),
(9, 8, '350gm', '1', 'Admin', NULL, '2023-01-04 08:09:52', '2023-01-04 08:09:52'),
(10, 8, '50gm', '1', 'Admin', NULL, '2023-01-04 08:10:13', '2023-01-04 08:10:13'),
(11, 8, '20gm', '1', 'Admin', NULL, '2023-01-04 08:10:37', '2023-01-04 08:10:37'),
(12, 8, '45gm', '1', 'Admin', NULL, '2023-01-04 08:11:17', '2023-01-04 08:11:17'),
(13, 8, '300gm', '1', 'Admin', NULL, '2023-01-04 08:11:28', '2023-01-04 08:11:28'),
(14, 8, '16gm', '1', 'Admin', NULL, '2023-01-04 08:12:17', '2023-01-04 08:12:17'),
(15, 8, '27gm', '1', 'Admin', NULL, '2023-01-04 08:12:38', '2023-01-04 08:12:38'),
(16, 8, '22gm', '1', 'Admin', NULL, '2023-01-04 08:13:30', '2023-01-04 08:13:30'),
(17, 8, '220gm,80gm', '1', 'Admin', NULL, '2023-01-04 08:25:16', '2023-01-04 08:25:16'),
(18, 8, '350gm,50gm', '1', 'Admin', NULL, '2023-01-04 08:27:07', '2023-01-04 08:27:07'),
(19, 8, '160gm,55gm', '1', 'Admin', NULL, '2023-01-04 08:38:07', '2023-01-04 08:38:07'),
(20, 8, '20gm,50gm,240gm', '1', 'Admin', NULL, '2023-01-04 08:42:38', '2023-01-04 08:42:38'),
(21, 8, '16gm,22gm', '1', 'Admin', NULL, '2023-01-04 08:43:41', '2023-01-04 08:43:41'),
(22, 8, '1kg, 2kg', '1', 'Admin', NULL, '2023-01-04 08:54:25', '2023-01-04 08:54:25'),
(23, 8, '500gm', '1', 'Admin', NULL, '2023-01-04 08:54:36', '2023-01-04 08:54:36'),
(24, 8, '80gm,250gm,500gm & 1Liter', '1', 'Admin', NULL, '2023-01-04 08:55:57', '2023-01-04 08:55:57'),
(25, 8, '240gm,480gm &720gm', '1', 'Admin', NULL, '2023-01-04 08:56:47', '2023-01-04 08:56:47'),
(26, 8, '11gm', '1', 'Admin', NULL, '2023-01-04 08:57:13', '2023-01-04 08:57:13'),
(27, 8, '15gm', '1', 'Admin', NULL, '2023-01-04 08:57:21', '2023-01-04 08:57:21'),
(28, 8, '150gm', '1', 'Admin', NULL, '2023-01-04 08:57:38', '2023-01-04 08:57:38'),
(30, 8, '300ml', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 04:27:05', '2023-03-04 08:48:56'),
(31, 8, '500ml', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 04:28:18', '2023-03-04 08:48:47'),
(32, 8, '75gm', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:43:34', '2023-03-04 08:48:39'),
(33, 8, '125gm', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:43:44', '2023-03-04 08:48:32'),
(34, 8, '180ml', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:44:03', '2023-03-04 08:48:25'),
(35, 8, '200ml', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:44:14', '2023-03-04 08:48:17'),
(36, 8, '5L', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:44:25', '2023-03-04 08:47:50'),
(37, 8, '1KG', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:45:13', '2023-03-04 08:47:29'),
(38, 8, '1000gm', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:45:39', '2023-03-04 08:47:38'),
(39, 8, '1L', '1', 'Ifad IT', 'Ifad IT', '2023-03-04 08:45:58', '2023-03-04 08:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gallery_category_id` bigint(20) UNSIGNED NOT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`, `gallery_category_id`, `video_link`, `video`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'video 1', 2, '#', 'v11-410304.mp4', '1', 'Admin', 'Admin', NULL, NULL),
(2, 'Video', 3, '#', 'v11-738317.mp4', '1', 'Admin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_name_unique` (`name`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categorys`
--
ALTER TABLE `blog_categorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categorys_name_unique` (`name`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_title_unique` (`title`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_name_unique` (`name`);

--
-- Indexes for table `content_categorys`
--
ALTER TABLE `content_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_items`
--
ALTER TABLE `content_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_items_category_id_foreign` (`category_id`),
  ADD KEY `content_items_type_id_foreign` (`type_id`),
  ADD KEY `content_items_module_id_foreign` (`module_id`);

--
-- Indexes for table `content_modules`
--
ALTER TABLE `content_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_types`
--
ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_types_name_unique` (`name`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_name_unique` (`name`);

--
-- Indexes for table `document_categories`
--
ALTER TABLE `document_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_categorys`
--
ALTER TABLE `gallery_categorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gallery_categorys_name_unique` (`name`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_settings_name_unique` (`name`),
  ADD UNIQUE KEY `mail_settings_mail_address_unique` (`mail_address`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_menu_name_unique` (`menu_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `module_role`
--
ALTER TABLE `module_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_role_module_id_foreign` (`module_id`),
  ADD KEY `module_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pack_types`
--
ALTER TABLE `pack_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pack_types_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_gallery_category_id_foreign` (`gallery_category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_variant_id_foreign` (`variant_id`),
  ADD KEY `products_variant_option_id_foreign` (`variant_option_id`),
  ADD KEY `products_segment_id_foreign` (`segment_id`),
  ADD KEY `products_pack_id_foreign` (`pack_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_lifestyles`
--
ALTER TABLE `product_lifestyles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_lifestyles_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `segments_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_name_unique` (`name`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_name_unique` (`name`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variants_name_unique` (`name`);

--
-- Indexes for table `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_options_name_unique` (`name`),
  ADD KEY `variant_options_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_gallery_category_id_foreign` (`gallery_category_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_categorys`
--
ALTER TABLE `blog_categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `content_categorys`
--
ALTER TABLE `content_categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `content_items`
--
ALTER TABLE `content_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `content_modules`
--
ALTER TABLE `content_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `document_categories`
--
ALTER TABLE `document_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_categorys`
--
ALTER TABLE `gallery_categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `module_role`
--
ALTER TABLE `module_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `pack_types`
--
ALTER TABLE `pack_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `product_lifestyles`
--
ALTER TABLE `product_lifestyles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `variant_options`
--
ALTER TABLE `variant_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_items`
--
ALTER TABLE `content_items`
  ADD CONSTRAINT `content_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `content_categorys` (`id`),
  ADD CONSTRAINT `content_items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `content_modules` (`id`),
  ADD CONSTRAINT `content_items_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `content_types` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_gallery_category_id_foreign` FOREIGN KEY (`gallery_category_id`) REFERENCES `gallery_categorys` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_types` (`id`),
  ADD CONSTRAINT `products_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`id`),
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`),
  ADD CONSTRAINT `products_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`),
  ADD CONSTRAINT `products_variant_option_id_foreign` FOREIGN KEY (`variant_option_id`) REFERENCES `variant_options` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_lifestyles`
--
ALTER TABLE `product_lifestyles`
  ADD CONSTRAINT `product_lifestyles_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD CONSTRAINT `upazilas_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `variant_options_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_gallery_category_id_foreign` FOREIGN KEY (`gallery_category_id`) REFERENCES `gallery_categorys` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
