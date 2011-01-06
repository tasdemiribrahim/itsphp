-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: sql307.0fees.net
-- Generation Time: Nov 24, 2010 at 01:49 PM
-- Server version: 5.0.87
-- PHP Version: 5.2.6-1+lenny9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fees0_6133083_itsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `aile_agaci`
--

CREATE TABLE IF NOT EXISTS `aile_agaci` (
  `aileID` int(11) NOT NULL auto_increment,
  `aileAd` varchar(50) collate utf8_unicode_ci NOT NULL,
  `ebeveynID` int(11) NOT NULL,
  `keyHash` char(40) collate utf8_unicode_ci default NULL,
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  `slug` varchar(255) collate utf8_unicode_ci default NULL,
  `deleted_at` timestamp NULL default NULL,
  PRIMARY KEY  (`aileID`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=64 ;

--
-- Dumping data for table `aile_agaci`
--

INSERT INTO `aile_agaci` (`aileID`, `aileAd`, `ebeveynID`, `keyHash`, `created_at`, `updated_at`, `slug`, `deleted_at`) VALUES
(3, 'Ömer Taşdemir', 1, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(10, 'Ömer Taşdemir', 9, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(9, 'Rafet Taşdemir', 3, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(11, 'İbrahim Taşdemir', 10, '7e155c40d14a0b6a25f250ed61bb9b4139006c82', '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(12, 'Mehmet Ali Taşdemir', 10, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(13, 'Şakir Taşdemir', 9, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(14, 'Ali Taşdemir', 9, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(15, 'Fatma Taşdemir', 9, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(16, 'Rabia Taşdemir', 9, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(17, 'Ömer Ka', 32, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(32, 'Bilinmiyor', 0, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(20, 'Gökşen Ka', 32, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(21, 'Mıstık Ka', 32, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(22, 'Çolak Osman', 17, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(23, 'Hacı Ka', 17, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(24, 'Halil Gökşen', 20, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(25, 'Arif Gökşen', 20, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(26, 'Mehmet Özcan', 21, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(27, 'Gülistan Özcan', 26, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(28, 'Saliha Özcan', 26, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(29, 'Yeter Özcan', 26, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(30, 'Mustafa Özcan', 26, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(44, 'Sevde Ceren Taşdemir', 13, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(43, 'Enes Arda Taşdemir', 13, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(1, 'Bekir', 17, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(49, 'Hümeyra Çiftçi', 16, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(50, 'Furkan Çiftçi', 16, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(54, 'Fadime Taşdemir', 3, NULL, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL, NULL),
(59, 'Refika İfakat Taşdemir', 3, NULL, '2010-10-25 22:03:23', '2010-10-25 22:03:23', 'refika-ifakat-tasdemir', NULL),
(60, 'Handan Özcan', 30, NULL, '2010-11-12 21:19:43', '2010-11-12 21:19:43', 'handan-oezcan', NULL),
(62, 'Rabia Özcan', 30, NULL, '2010-11-20 23:11:05', '2010-11-20 23:11:05', 'rabia-oezcan', NULL),
(63, 'Abdullah Aydın', 62, NULL, '2010-11-20 23:12:41', '2010-11-20 23:12:41', 'abdullah-aydin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aile_agaci_detay`
--

CREATE TABLE IF NOT EXISTS `aile_agaci_detay` (
  `aileID` int(11) NOT NULL,
  `aileTanim` text collate utf8_unicode_ci,
  `aileDogum` date default NULL,
  `aileOlum` date default '0000-00-00',
  `aileBireyEs` varchar(50) collate utf8_unicode_ci default NULL,
  `aileBireyAdres` text collate utf8_unicode_ci,
  `aileBireyMail` varchar(50) collate utf8_unicode_ci default NULL,
  `aileBireyTel` bigint(20) default NULL,
  `aileBireyMSN` varchar(50) collate utf8_unicode_ci default NULL,
  `aileBireyTwitter` varchar(15) collate utf8_unicode_ci default NULL,
  `aileBireyFlickr` varchar(15) collate utf8_unicode_ci default NULL,
  `version` bigint(20) default '1',
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL default NULL,
  PRIMARY KEY  (`aileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aile_agaci_detay`
--

INSERT INTO `aile_agaci_detay` (`aileID`, `aileTanim`, `aileDogum`, `aileOlum`, `aileBireyEs`, `aileBireyAdres`, `aileBireyMail`, `aileBireyTel`, `aileBireyMSN`, `aileBireyTwitter`, `aileBireyFlickr`, `version`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Parça treni', '1894-12-12', '1957-01-01', 'Pembe Üstündağ', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(49, 'Hümoş - Çiftçi ailesinin son ferdi.', '2005-10-27', '0000-00-00', '', '', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-10-02 18:46:46', NULL),
(13, '1964 kozaklı da doğdum.İlk ve orta öğretimimi kozaklıda tamamladım. Üniversiteyi İzmir 9 Eylül Jeoloji bölümünde tamamladım.1997 yılında sınıf öğretmeni olarak atandım. Hala Kayseri Ahmet Eski Yapan İÖ de görevliyim.', '1964-01-01', '0000-00-00', 'Nuray Akgün', 'Abı Hayat Apt. Kat:9 Barbaros Mah. Kaldırım Cad. Kayseri', 'sakir_tasdemir@hotmail.com', 5324282285, 'sakir_tasdemir@hotmail.com', '', '', 1, '2010-09-26 18:03:10', '2010-11-04 16:49:10', NULL),
(9, '1967 Van-Başkale''de Jandarma olarak askerliğini yaptı.', '1947-01-01', '0000-00-00', 'Saliha Özcan', 'Kozaklı', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(10, 'Banka müdürü.', '1963-10-05', '0000-00-00', 'Fatma Murat', 'Ziraat Bankası Lojmanı Pınarbaşı Kayseri', 'omtasdemir@ziraatbank.gov.tr', 5326324435, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(11, 'Pamukkale Üniversitesi bilgisayar mühendisliği bölümünden 2009 yılında mezun oldum. Amasya/Taşova/Destek belediyesinde jandarma olarak askerliğimi yaptım.', '1986-12-08', '0000-00-00', '', 'Kelebek Sokak Köşk Mah. Melikgazi/Kayseri', 'tasdemiribrahim@mynet.com', 5546719441, 'tasdemiribrahim@hotmail.com.tr', 'itasdemir86', '48895808@N03', 1, '2010-09-26 18:03:10', '2010-11-04 16:38:04', NULL),
(12, 'Doktor', '1984-07-24', '0000-00-00', '', 'Şener Sokak Köşk Mah. Melikgazi/Kayseri', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-11-04 16:42:14', NULL),
(14, 'İstanbulda yaşıyor', '1970-01-01', '0000-00-00', 'Meral Değirmenci', 'İstanbul', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(15, 'Öğretmen', '1966-01-01', '0000-00-00', 'Orhan Ünlü', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(16, 'Pınarbaşı çerkezi.', '1978-01-01', '0000-00-00', 'Aytekin Çiftçi', '', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-10-13 09:41:34', NULL),
(17, 'Öz geçmiş yok', '1880-01-01', '1900-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(20, 'Öz geçmiş yok', '1850-01-01', '1880-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(21, 'Öz geçmiş yok', '1850-01-01', '1880-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(22, 'Kız Alinin atası.', '1880-01-01', '1920-01-01', '', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(23, 'Demirtaş sülalesinin atası', '1880-01-01', '1920-01-01', '', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(24, 'İbrahimin babası', '1916-01-01', '1973-01-01', 'Fatma', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(25, 'Konyaya taşındılar.', '1921-01-01', '1983-01-01', '', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(26, 'Deli Ba derler.', '1917-01-01', '1996-01-01', 'Döndü', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(27, 'Herifine Piriç derler.', '1940-01-01', '0000-00-00', 'Turap Değirmenci', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(28, 'Taşdemir ağacından eşinin altında devam ediyor.', '1947-01-01', '0000-00-00', 'Rifat (Rafet) Taşdemir', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(29, 'Kozaklıdan İstanbula göç ettiler.Ticaretle uğraşıyorlar.', '1949-01-01', '0000-00-00', 'Faik Solakoğlu', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(30, 'Bankadan emekli', '1950-01-01', '0000-00-00', 'RefikaTaşdemir-Tekmile', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(32, 'öz geçmiş yok', '1800-01-01', '1801-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(1, 'Ömer(Omuk) Taşdemirin babası', '1880-01-01', '1910-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(43, 'Özgeçmiş yok', '1995-06-12', '0000-00-00', '', '', '', 0, '', '', '', 0, '2010-09-26 18:03:10', '0000-00-00 00:00:00', NULL),
(44, 'Özgeçmiş yok!', '1993-06-18', '0000-00-00', '', '', '', 0, '', '', '', 2, '2010-09-26 18:03:10', '2010-10-13 11:09:23', NULL),
(50, 'yok', '2000-08-05', '0000-00-00', '', '', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-10-13 09:52:08', NULL),
(54, 'Kanserden öldü.', '1937-01-01', '2003-01-01', 'Mehmet Ali', '', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-10-11 13:19:55', NULL),
(59, 'Nesli kocasının ağacından devam ediyor', '1948-01-01', '1984-01-01', 'Mustafa Özcan', '', '', 0, '', '', '', 1, '2010-10-25 22:03:24', '2010-10-25 22:03:24', NULL),
(60, 'Niğde Üniversitesi İşletme bölümden sonra Nevşehir Üniversitesi İşletme yüksek lisansı yaptı.', '1986-10-30', '0000-00-00', '', 'Kozaklı', '', 0, '', '', '', 2, '2010-11-12 21:19:43', '2010-11-12 21:23:39', NULL),
(62, 'Ankarada oturuyor', '1982-06-13', '0000-00-00', 'ünal Aydın', 'Ankara', '', 0, '', '', '', 2, '2010-11-20 23:11:06', '2010-11-24 10:52:58', NULL),
(63, 'Her ne kadar çok akıllı bir çocuk olsa da bazı cadıların oyununa gelebiliyor. Tatlıya ve arabalara zaafı var.', '2008-07-04', '0000-00-00', '', 'Ankara', '', 0, '', '', '', 2, '2010-11-20 23:12:41', '2010-11-24 10:54:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aile_agaci_detay_version`
--

CREATE TABLE IF NOT EXISTS `aile_agaci_detay_version` (
  `aileid` int(11) NOT NULL default '0',
  `ailetanim` text collate utf8_unicode_ci,
  `ailedogum` date default NULL,
  `aileolum` date default '0000-00-00',
  `ailebireyes` varchar(50) collate utf8_unicode_ci default NULL,
  `ailebireyadres` text collate utf8_unicode_ci,
  `ailebireymail` varchar(50) collate utf8_unicode_ci default NULL,
  `ailebireytel` bigint(20) default NULL,
  `ailebireymsn` varchar(50) collate utf8_unicode_ci default NULL,
  `ailebireytwitter` varchar(15) collate utf8_unicode_ci default NULL,
  `ailebireyflickr` varchar(15) collate utf8_unicode_ci default NULL,
  `version` bigint(20) NOT NULL default '0',
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`aileid`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aile_agaci_detay_version`
--

INSERT INTO `aile_agaci_detay_version` (`aileid`, `ailetanim`, `ailedogum`, `aileolum`, `ailebireyes`, `ailebireyadres`, `ailebireymail`, `ailebireytel`, `ailebireymsn`, `ailebireytwitter`, `ailebireyflickr`, `version`, `created_at`, `updated_at`) VALUES
(11, 'Pamukkale Üniversitesi bilgisayar mühendisliği bölümünden 2009 yılında mezun oldum. Amasya/Taşova/Destek belediyesinde jandarma olarak askerliğimi yaptım.', '1986-12-08', '0000-00-00', '', 'Kelebek Sokak Köşk Mah. Melikgazi/Kayseri', 'tasdemiribrahim@mynet.com', 5546719441, 'tasdemiribrahim@hotmail.com.tr', 'itasdemir86', '48895808@N03', 1, '2010-09-26 18:03:10', '2010-11-04 16:38:04'),
(59, 'Nesli kocasının ağacından devam ediyor', '1948-01-01', '1984-01-01', 'Mustafa Özcan', '', '', 0, '', '', '', 1, '2010-10-25 22:03:24', '2010-10-25 22:03:24'),
(12, 'Doktor', '1984-07-24', '0000-00-00', '', 'Şener Sokak Köşk Mah. Melikgazi/Kayseri', '', 0, '', '', '', 1, '2010-09-26 18:03:10', '2010-11-04 16:42:14'),
(13, '1964 kozaklı da doğdum.İlk ve orta öğretimimi kozaklıda tamamladım. Üniversiteyi İzmir 9 Eylül Jeoloji bölümünde tamamladım.1997 yılında sınıf öğretmeni olarak atandım. Hala Kayseri Ahmet Eski Yapan İÖ de görevliyim.', '1964-01-01', '0000-00-00', 'Nuray Akgün', 'Abı Hayat Apt. Kat:9 Barbaros Mah. Kaldırım Cad. Kayseri', 'sakir_tasdemir@hotmail.com', 5324282285, 'sakir_tasdemir@hotmail.com', '', '', 1, '2010-09-26 18:03:10', '2010-11-04 16:49:10'),
(60, 'Niğde Üniversitesi İşletme bölümden sonra Nevşehir Üniversitesi İşletme yüksek lisansı yaptı.', '1986-10-30', '2010-11-12', '', 'Kozaklı', '', 0, '', '', '', 1, '2010-11-12 21:19:43', '2010-11-12 21:19:43'),
(60, 'Niğde Üniversitesi İşletme bölümden sonra Nevşehir Üniversitesi İşletme yüksek lisansı yaptı.', '1986-10-30', '2010-11-12', '', 'Kozaklı', '', 0, '', '', '', 2, '2010-11-12 21:19:43', '2010-11-12 21:23:39'),
(62, '', '1982-06-13', '0000-00-00', 'ünal aydın', '', '', 0, '', '', '', 1, '2010-11-20 23:11:06', '2010-11-20 23:11:06'),
(63, '', '2008-07-04', '0000-00-00', '', '', '', 0, '', '', '', 1, '2010-11-20 23:12:41', '2010-11-20 23:12:41'),
(62, 'Ankarada oturuyor', '1982-06-13', '0000-00-00', 'ünal Aydın', 'Ankara', '', 0, '', '', '', 2, '2010-11-20 23:11:06', '2010-11-24 10:52:58'),
(63, 'Her ne kadar çok akıllı bir çocuk olsa da bazı cadıların oyununa gelebiliyor. Tatlıya ve arabalara zaafı var.', '2008-07-04', '0000-00-00', '', 'Ankara', '', 0, '', '', '', 2, '2010-11-20 23:12:41', '2010-11-24 10:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `aile_agaci_oy`
--

CREATE TABLE IF NOT EXISTS `aile_agaci_oy` (
  `aileID` int(11) NOT NULL,
  `toplamPuan` int(11) NOT NULL default '0',
  `ortNorm` int(11) NOT NULL default '0',
  `toplamOy` int(11) NOT NULL default '0',
  `ort` float NOT NULL default '0',
  PRIMARY KEY  (`aileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aile_agaci_oy`
--

INSERT INTO `aile_agaci_oy` (`aileID`, `toplamPuan`, `ortNorm`, `toplamOy`, `ort`) VALUES
(49, 7, 2, 3, 2.3),
(3, 5, 5, 1, 5),
(9, 5, 5, 1, 5),
(10, 5, 5, 1, 5),
(11, 11, 4, 3, 3.7),
(12, 66, 4, 16, 4.1),
(13, 59, 4, 15, 3.9),
(14, 0, 5, 1, 5),
(15, 0, 0, 0, 0),
(17, 0, 0, 0, 0),
(20, 0, 0, 0, 0),
(21, 0, 0, 0, 0),
(30, 0, 0, 0, 0),
(16, 5, 5, 1, 5),
(22, 0, 0, 0, 0),
(23, 0, 0, 0, 0),
(24, 0, 0, 0, 0),
(25, 0, 0, 0, 0),
(26, 0, 0, 0, 0),
(27, 0, 0, 0, 0),
(28, 0, 0, 0, 0),
(29, 0, 0, 0, 0),
(32, 0, 0, 0, 0),
(43, 1, 1, 1, 1),
(44, 3, 2, 2, 1.5),
(1, 0, 0, 0, 0),
(50, 3, 3, 1, 3),
(54, 0, 0, 0, 0),
(59, 0, 0, 0, 0),
(60, 5, 5, 1, 5),
(62, 0, 0, 0, 0),
(63, 5, 5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `aile_agaci_rss_items`
--

CREATE TABLE IF NOT EXISTS `aile_agaci_rss_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` text collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `link` text collate utf8_unicode_ci,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `aile_agaci_rss_items`
--

INSERT INTO `aile_agaci_rss_items` (`id`, `title`, `description`, `link`, `date`) VALUES
(1, 'Aile Ağacı Açıldı.', 'Aile ağacı sayfası sadece ''Taşdemir'' sülalesi için açıldı. İsteyen herkes yeni birey ekleyebilir, bilgilerini güncelleyebilir, yıldız oy verebilir, hakkında yorum yazabilir, flickr fotolarına bakabilir, twitter mesajlarını takip edebilir ...', 'http://tasdemir.0fees.net/main/aile', '2010-08-29 20:27:16'),
(5, 'Hümeyra Çiftçi Aile Ağacına eklendi', '2005-01-01 doğumlu Hümeyra Çiftçi - 49 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-09-06 07:44:13'),
(8, 'Furkan Çiftçi Aile Ağacına eklendi', '2001-01-01 doğumlu Furkan Çiftçi - 50 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-09-12 07:26:56'),
(11, 'Fadime Taşdemir Aile Ağacına eklendi', '1937-01-01 doğumlu Fadime Taşdemir - 54 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-09-22 10:44:39'),
(13, 'Refika İfakat Taşdemir Aile Agacina eklendi', '1948-01-01 doğumlu Refika İfakat Taşdemir - 59 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-10-25 19:03:24'),
(14, 'Handan Özcan Aile ağacına eklendi', '1986-10-30 doğumlu Handan Özcan - 60 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-11-12 19:19:43'),
(16, 'rabia özcan Aile ağacına eklendi', '1982-06-13 doğumlu rabia özcan - 62 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-11-20 21:11:05'),
(17, 'abdullah aydın Aile ağacına eklendi', '2008-07-04 doğumlu abdullah aydın - 63 numarasıyla aile ağacına eklendi.', 'http://tasdemir.0fees.net/main/aile', '2010-11-20 21:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `albumID` int(11) NOT NULL auto_increment,
  `albumAd` varchar(255) collate utf8_unicode_ci NOT NULL,
  `albumYil` int(11) NOT NULL,
  `grupID` int(11) NOT NULL,
  PRIMARY KEY  (`albumID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=465 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumID`, `albumAd`, `albumYil`, `grupID`) VALUES
(464, 'Sorrow Throughout the Nine Worlds', 1996, 58),
(78, 'Once Sent From the Golden Hall', 1998, 58),
(79, 'Avenger', 1999, 58),
(80, 'The Crusher', 2001, 58),
(81, 'Versus The World', 2002, 58),
(82, 'Fate of Norns', 2004, 58),
(83, 'With Oden On Our Side', 2006, 58),
(84, 'Twilight of the Thunder God', 2008, 58),
(85, 'Skydancer', 1993, 59),
(86, 'The Gallery', 1995, 59),
(87, 'The Mind''s I', 1997, 59),
(88, 'Projector', 1999, 59),
(89, 'Haven', 2000, 59),
(90, 'Damage Done', 2002, 59),
(91, 'Character', 2005, 59),
(92, 'Fiction', 2007, 59),
(93, 'We Are the Void', 2010, 59),
(94, 'Scream Bloody Gore', 1987, 60),
(95, 'Leprosy', 1988, 60),
(96, 'Spiritual Healing', 1990, 60),
(97, 'Human', 1991, 60),
(98, 'Individual Thought Patterns', 1993, 60),
(99, 'Symbolic', 1995, 60),
(100, 'The Sound of Perseverance', 1998, 60),
(101, 'Lunar Strain', 1993, 61),
(102, 'The Jester Race', 1996, 61),
(103, 'Whoracle', 1997, 61),
(104, 'Colony', 1999, 61),
(105, 'Clayman', 2000, 61),
(106, 'Reroute to Remain', 2002, 61),
(107, 'Soundtrack to Your Escape', 2004, 61),
(108, 'Come Clarity', 2006, 61),
(109, 'A Sense of Purpose', 2008, 61),
(110, 'Onset of Putrefaction', 1999, 62),
(111, 'Epitaph', 2004, 62),
(112, 'Somnium Obmutum ', 1996, 63),
(113, 'A Sombre Dance', 1999, 63),
(114, 'As the Flower Withers', 1992, 64),
(115, 'Turn Loose the Swans', 1993, 64),
(116, 'The Angel and the Dark River', 1995, 64),
(117, 'Like Gods of the Sun', 1996, 64),
(118, '34.788%... Complete', 1998, 64),
(119, 'The Light at the End of the World', 1999, 64),
(120, 'The Dreadful Hours', 2001, 64),
(121, 'Songs of Darkness, Words of Light', 2004, 64),
(122, 'A Line of Deathless Kings', 2006, 64),
(123, 'For Lies I Sire', 2009, 64),
(124, 'Zero Order Phase ', 2008, 65),
(125, 'New American Gospel', 2000, 66),
(126, 'As The Palaces Burn', 2003, 66),
(127, 'Ashes of the Wake', 2004, 66),
(128, 'Sacrament', 2006, 66),
(129, 'Wrath', 2009, 66),
(130, 'Nevermore', 1995, 67),
(131, 'The Politics of Ecstasy', 1996, 67),
(132, 'Dreaming Neon Black', 1999, 67),
(133, 'Dead Heart in a Dead World', 2000, 67),
(134, 'Enemies of Reality', 2003, 67),
(135, 'This Godless Endeavor', 2005, 67),
(136, 'The Obsidian Conspiracy', 2010, 67),
(137, 'Metal Magic', 1983, 68),
(138, 'Projects in the Jungle', 1984, 68),
(139, 'I Am the Night', 1985, 68),
(140, 'Power Metal', 1988, 68),
(141, 'Cowboys from Hell', 1990, 68),
(142, 'Vulgar Display of Power', 1992, 68),
(143, 'Far Beyond Driven', 1994, 68),
(144, 'The Great Southern Trendkill', 1996, 68),
(145, 'Reinventing the Steel', 2000, 68),
(146, 'Praises to the War Machine ', 2008, 69),
(147, 'Mer de Noms', 2000, 70),
(148, 'Thirteenth Step', 2003, 70),
(149, 'eMOTIVe', 2004, 70),
(150, 'T.N.T. ', 1975, 71),
(151, 'Dirty Deeds Done Dirt Cheap', 1976, 71),
(152, 'High Voltage', 1976, 71),
(153, 'Let There Be Rock', 1977, 71),
(154, 'Powerage', 1978, 71),
(155, 'Highway to Hell', 1979, 71),
(156, 'Back in Black', 1980, 71),
(157, 'For Those About to Rock We Salute You', 1981, 71),
(158, 'Flick of the Switch', 1983, 71),
(159, 'Fly on the Wall', 1985, 71),
(160, 'Who Made Who', 1986, 71),
(161, 'Blow Up Your Video', 1988, 71),
(162, 'The Razors Edge', 1990, 71),
(163, 'Ballbreaker', 1995, 71),
(164, 'Stiff Upper Lip', 2000, 71),
(165, 'Black Ice', 2008, 71),
(166, 'Motörhead', 1977, 72),
(167, 'Overkill', 1979, 72),
(168, 'Bomber', 1979, 72),
(169, 'On Parole', 1979, 72),
(170, 'Ace of Spades', 1980, 72),
(171, 'Iron Fist', 1982, 72),
(172, 'Another Perfect Day', 1983, 72),
(173, 'Orgasmatron', 1986, 72),
(174, 'Rock ''n'' Roll', 1987, 72),
(175, '1916', 1991, 72),
(176, 'March or Die', 1992, 72),
(177, 'Bastards', 1993, 72),
(178, 'Sacrifice', 1995, 72),
(179, 'Overnight Sensation', 1996, 72),
(180, 'Snake Bite Love', 1998, 72),
(181, 'We Are Motörhead', 2000, 72),
(182, 'Hammered', 2002, 72),
(183, 'Inferno', 2004, 72),
(184, 'Kiss of Death', 2006, 72),
(185, 'Motörizer', 2008, 72),
(186, 'Black Sabbath', 1970, 73),
(187, 'Paranoid', 1970, 73),
(188, 'Master of Reality', 1971, 73),
(189, 'Black Sabbath Vol. 4', 1972, 73),
(190, 'Sabbath Bloody Sabbath', 1973, 73),
(191, 'Sabotage', 1975, 73),
(192, 'Technical Ecstasy', 1976, 73),
(193, 'Never Say Die!', 1978, 73),
(194, 'Heaven and Hell', 1980, 73),
(195, 'Mob Rules', 1981, 73),
(196, 'Born Again', 1983, 73),
(197, 'Seventh Star', 1986, 73),
(198, 'The Eternal Idol', 1987, 73),
(199, 'Headless Cross', 1989, 73),
(200, 'Tyr', 1990, 73),
(201, 'Dehumanizer', 1992, 73),
(202, 'Cross Purposes', 1994, 73),
(203, 'Forbidden', 1995, 73),
(204, 'Silicon Messiah', 2000, 74),
(205, 'Tenth Dimension', 2002, 74),
(206, 'Blood ', 2004, 74),
(207, 'The Man Who Would Not Die', 2008, 74),
(208, 'Promise and Terror', 2010, 74),
(209, 'Tattooed Millionaire', 1990, 75),
(210, 'Balls to Picasso', 1994, 75),
(211, 'Skunkworks', 1996, 75),
(212, 'Accident of Birth', 1997, 75),
(213, 'The Chemical Wedding', 1998, 75),
(214, 'Iron Maiden', 1980, 76),
(215, 'Killers', 1981, 76),
(216, 'The Number of the Beast', 1982, 76),
(217, 'Piece of Mind', 1983, 76),
(218, 'Powerslave', 1984, 76),
(219, 'Somewhere in Time', 1986, 76),
(220, 'Seventh Son of a Seventh Son', 1988, 76),
(221, 'No Prayer for the Dying', 1990, 76),
(222, 'Fear of the Dark', 1992, 76),
(223, 'The X Factor', 1995, 76),
(224, 'Virtual XI', 1998, 76),
(225, 'Brave New World', 2000, 76),
(226, 'Dance of Death', 2003, 76),
(227, 'A Matter of Life and Death', 2006, 76),
(228, 'The Final Frontier', 2010, 76),
(229, 'Rocka Rolla', 1974, 78),
(230, 'Sad Wings of Destiny', 1976, 78),
(231, 'Sin After Sin', 1977, 78),
(232, 'Stained Class', 1978, 78),
(233, 'Hell Bent for Leather', 1978, 78),
(234, 'British Steel', 1980, 78),
(235, 'Point of Entry', 1981, 78),
(236, 'Screaming for Vengeance', 1982, 78),
(237, 'Defenders of the Faith', 1984, 78),
(238, 'Turbo', 1986, 78),
(239, 'Ram It Down', 1988, 78),
(240, 'Painkiller', 1990, 78),
(241, 'Jugulator', 1997, 78),
(242, 'Demolition', 2001, 78),
(243, 'Angel of Retribution', 2005, 78),
(244, 'Nostradamus', 2008, 78),
(245, 'Herzeleid', 1995, 79),
(246, 'Sehnsucht', 1997, 79),
(247, 'Mutter', 2001, 79),
(248, 'Reise, Reise', 2004, 79),
(249, 'Rosenrot', 2005, 79),
(250, 'Liebe ist für alle da', 2009, 79),
(251, 'Inflikted', 2008, 80),
(252, 'Fallen', 2003, 81),
(253, 'The Open Door', 2006, 81),
(254, 'Hybrid Theory ', 2000, 82),
(255, 'Meteora', 2003, 82),
(256, 'Minutes to Midnight', 2007, 82),
(257, 'A Thousand Suns', 2010, 82),
(258, 'Point Blank ', 1994, 83),
(259, 'Soulfly', 1998, 84),
(260, 'Primitive', 2000, 84),
(261, '3', 2002, 84),
(262, 'Prophecy', 2004, 84),
(263, 'Dark Ages', 2005, 84),
(264, 'Conquer', 2008, 84),
(265, 'Omen', 2010, 84),
(266, 'Battalions of Fear', 1988, 85),
(267, 'Follow the Blind', 1989, 85),
(268, 'Tales from the Twilight World', 1990, 85),
(269, 'Somewhere Far Beyond', 1992, 85),
(270, 'Imaginations from the Other Side', 1995, 85),
(271, 'Nightfall in Middle-Earth', 1998, 85),
(272, 'A Night at the Opera', 2002, 85),
(273, 'A Twist in the Myth', 2006, 85),
(274, 'At the Edge of Time', 2010, 85),
(275, 'Demons ', 1999, 86),
(276, 'Touched by the Crimson King', 2005, 86),
(277, 'Glory to the Brave ', 1997, 87),
(278, 'Legacy of Kings', 1998, 87),
(279, 'Renegade', 2000, 87),
(280, 'Crimson Thunder', 2002, 87),
(281, 'Chapter V : Unbent, Unbowed, Unbroken', 2005, 87),
(282, 'Threshold', 2006, 87),
(283, 'No Sacrifice, No Victory', 2009, 87),
(284, 'Iced Earth', 1990, 88),
(285, 'Night of the Stormrider', 1991, 88),
(286, 'Burnt Offerings', 1995, 88),
(287, 'The Dark Saga', 1996, 88),
(288, 'Something Wicked This Way Comes', 1998, 88),
(289, 'Horror Show', 2001, 88),
(290, 'Tribute to the Gods', 2002, 88),
(291, 'The Glorious Burden', 2004, 88),
(292, 'Framing Armageddon', 2007, 88),
(293, 'The Crucible of Man', 2008, 88),
(294, 'Angels Fall First', 1997, 89),
(295, 'Oceanborn', 1998, 89),
(296, 'Wishmaster', 2000, 89),
(297, 'Century Child', 2002, 89),
(298, 'Once', 2004, 89),
(299, 'Dark Passion Play', 2007, 89),
(300, 'Enter', 1997, 90),
(301, 'Mother Earth', 2000, 90),
(302, 'The Silent Force', 2004, 90),
(303, 'The Heart of Everything', 2007, 90),
(304, 'The Fragile Art of Existence', 1999, 91),
(305, 'When Dream and Day Unite', 1989, 92),
(306, 'Images and Words', 1992, 92),
(307, 'Awake', 1994, 92),
(308, 'Falling Into Infinity', 1997, 92),
(309, 'Metropolis Pt. 2: Scenes from a Memory', 1999, 92),
(310, 'Six Degrees of Inner Turbulence', 2002, 92),
(311, 'Train of Thought', 2003, 92),
(312, 'Octavarium', 2005, 92),
(313, 'Systematic Chaos', 2007, 92),
(314, 'Black Clouds ', 2009, 92),
(315, 'Liquid Tension Experiment', 1998, 93),
(316, 'Liquid Tension Experiment 2', 1999, 93),
(317, 'Contradictions Collapse', 1991, 94),
(318, 'Destroy Erase Improve', 1995, 94),
(319, 'Chaosphere', 1998, 94),
(320, 'Nothing', 2002, 94),
(321, 'Catch Thirtythree', 2005, 94),
(322, 'ObZen', 2008, 94),
(323, 'Orchid', 1995, 95),
(324, 'Morningrise', 1996, 95),
(325, 'My Arms, Your Hearse', 1998, 95),
(326, 'Still Life', 1999, 95),
(327, 'Blackwater Park', 2001, 95),
(328, 'Deliverance', 2002, 95),
(329, 'Damnation', 2003, 95),
(330, 'Ghost Reveries', 2005, 95),
(331, 'Watershed', 2008, 95),
(332, 'Undertow', 1993, 96),
(333, 'Ænima ', 1996, 96),
(334, 'Lateralus', 2001, 96),
(335, '10,000 Days', 2006, 96),
(336, 'Plays Metallica by Four Cellos', 1996, 97),
(337, 'Inquisition Symphony', 1998, 97),
(338, 'Cult', 2000, 97),
(339, 'Reflections', 2003, 97),
(340, 'Apocalyptica', 2005, 97),
(341, 'Worlds Collide', 2007, 97),
(342, '7th Symphony', 2010, 97),
(343, 'The Phantom Agony', 2003, 98),
(344, 'Consign to Oblivion', 2005, 98),
(345, 'The Score - An Epic Journey', 2005, 98),
(346, 'The Divine Conspiracy', 2007, 98),
(347, 'Design Your Universe', 2009, 98),
(348, 'Alice in Hell', 1989, 99),
(349, 'Never, Neverland', 1990, 99),
(350, 'Set the World on Fire', 1993, 99),
(351, 'King of the Kill', 1994, 99),
(352, 'Refresh the Demon', 1996, 99),
(353, 'Remains', 1997, 99),
(354, 'Criteria for a Black Widow', 1999, 99),
(355, 'Carnival Diablos', 2001, 99),
(356, 'Waking the Fury', 2002, 99),
(357, 'All for You', 2004, 99),
(358, 'Schizo Deluxe', 2005, 99),
(359, 'Metal', 2007, 99),
(360, 'Annihilator', 2010, 99),
(361, 'Fistful of Metal', 1984, 100),
(362, 'Spreading the Disease', 1985, 100),
(363, 'Among the Living', 1987, 100),
(364, 'State of Euphoria', 1988, 100),
(365, 'Persistence of Time', 1990, 100),
(366, 'Sound of White Noise', 1993, 100),
(367, 'Stomp 442', 1995, 100),
(368, 'Volume 8 - The Threat Is Real', 1998, 100),
(369, 'We''ve Come for You All', 2003, 100),
(371, 'Terror Squad', 1987, 101),
(372, 'Fear Of Tomorrow', 1985, 101),
(373, 'By Inheritance', 1990, 101),
(374, 'B.A.C.K.', 1999, 101),
(375, 'When Death Comes', 2009, 101),
(376, 'The Ultra-Violence', 1987, 102),
(377, 'Frolic Through the Park', 1988, 102),
(378, 'Act III', 1990, 102),
(379, 'The Art of Dying', 2004, 102),
(380, 'Killing Season', 2008, 102),
(381, 'Relentless Retribution', 2010, 102),
(382, 'DDP 4 Life', 2007, 103),
(383, 'A Drug for All Seasons  ', 2005, 104),
(384, 'The Reckoning', 2008, 104),
(385, 'Power of Inner Strength  ', 1995, 105),
(386, 'Nemesis', 1997, 105),
(387, 'Solidify', 1999, 105),
(388, 'Incorporated', 2004, 105),
(389, 'Endless Pain', 1985, 106),
(390, 'Pleasure to Kill', 1986, 106),
(391, 'Terrible Certainty', 1987, 106),
(392, 'Extreme Aggression', 1989, 106),
(393, 'Coma of Souls', 1990, 106),
(394, 'Renewal', 1992, 106),
(395, 'Cause for Conflict', 1995, 106),
(396, 'Outcast', 1997, 106),
(397, 'Endorama', 1999, 106),
(398, 'Violent Revolution', 2001, 106),
(399, 'Enemy of God', 2005, 106),
(400, 'Hordes of Chaos', 2009, 106),
(401, 'Burn My Eyes', 1994, 107),
(402, 'The More Things Change...', 1997, 107),
(403, 'The Burning Red', 1999, 107),
(404, 'Supercharger', 2001, 107),
(405, 'Through the Ashes of Empires', 2004, 107),
(406, 'The Blackening', 2007, 107),
(407, 'Killing Is My Business...and Business Is Good!', 1985, 108),
(408, 'Peace Sells... But Who''s Buying?', 1986, 108),
(409, 'So Far, So Good...So What!', 1988, 108),
(410, 'Rust in Peace', 1990, 108),
(411, 'Countdown to Extinction', 1992, 108),
(412, 'Youthanasia', 1994, 108),
(413, 'Cryptic Writings', 1997, 108),
(414, 'Risk', 1999, 108),
(415, 'The World Needs a Hero', 2001, 108),
(416, 'The System Has Failed', 2004, 108),
(417, 'United Abominations', 2005, 108),
(418, 'Endgame', 2009, 108),
(419, 'Kill ''Em All', 1983, 109),
(420, 'Ride the Lightning', 1984, 109),
(421, 'Master of Puppets', 1986, 109),
(422, '...And Justice for All', 1988, 109),
(423, 'Metallica', 1991, 109),
(424, 'Load', 1996, 109),
(425, 'Reload', 1997, 109),
(426, 'St. Anger', 2003, 109),
(427, 'Death Magnetic', 2008, 109),
(428, 'The All-Star Sessions', 2005, 110),
(429, 'Show No Mercy', 1983, 111),
(430, 'Hell Awaits', 1985, 111),
(431, 'Reign in Blood', 1986, 111),
(432, 'South of Heaven', 1988, 111),
(433, 'Seasons in the Abyss', 1990, 111),
(434, 'Divine Intervention', 1994, 111),
(435, 'Undisputed Attitude', 1996, 111),
(436, 'Diabolus in Musica', 1998, 111),
(437, 'God Hates Us All', 2001, 111),
(438, 'Christ Illusion', 2006, 111),
(439, 'World Painted Blood', 2009, 111),
(440, 'Morbid Visions', 1986, 112),
(441, 'Schizophrenia', 1987, 112),
(442, 'Beneath the Remains', 1989, 112),
(443, 'Arise', 1991, 112),
(444, 'Chaos A.D.', 1993, 112),
(445, 'Roots', 1996, 112),
(446, 'Against', 1998, 112),
(447, 'Nation', 2001, 112),
(448, 'Roorback', 2003, 112),
(449, 'Dante XXI', 2006, 112),
(450, 'A-Lex', 2009, 112),
(451, 'The Legacy', 1987, 113),
(452, 'The New Order', 1988, 113),
(453, 'Practice What You Preach', 1989, 113),
(454, 'Souls of Black', 1990, 113),
(455, 'The Ritual', 1992, 113),
(456, 'Low', 1994, 113),
(457, 'Demonic', 1997, 113),
(458, 'The Gathering', 1999, 113),
(459, 'The Formation of Damnation', 2008, 113),
(460, 'Ember to Inferno', 2003, 114),
(461, 'Ascendancy', 2005, 114),
(462, 'The Crusade', 2006, 114),
(463, 'Shogun', 2008, 114);

-- --------------------------------------------------------

--
-- Table structure for table `appreciate_pages`
--

CREATE TABLE IF NOT EXISTS `appreciate_pages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hash` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `url` text collate utf8_unicode_ci NOT NULL,
  `appreciated` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `appreciate_pages`
--

INSERT INTO `appreciate_pages` (`id`, `hash`, `url`, `appreciated`) VALUES
(1, '9c00400e6582b2dde39c3063af4df035', 'http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Fana', 5),
(2, '5b33d7f68483a4e90d6c4317a5d63370', 'http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Fdinle%2Fmetal', 1),
(3, '81f94c3682e8bd9b4c6200b714f05573', 'http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama', 2),
(4, 'd27e8e767cec9be3317ad4ca79fe8e49', 'http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Faile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appreciate_votes`
--

CREATE TABLE IF NOT EXISTS `appreciate_votes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip` int(10) unsigned NOT NULL default '0',
  `pageid` int(10) unsigned NOT NULL default '0',
  `dt` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `vote` (`ip`,`pageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `appreciate_votes`
--

INSERT INTO `appreciate_votes` (`id`, `ip`, `pageid`, `dt`) VALUES
(1, 1594311675, 1, '2010-11-08 18:18:48'),
(2, 1594311676, 1, '2010-11-08 18:23:13'),
(3, 1594311676, 2, '2010-11-08 18:24:07'),
(4, 1319136649, 1, '2010-11-10 07:38:50'),
(5, 1319136649, 3, '2010-11-10 11:09:48'),
(6, 1305859282, 1, '2010-11-10 22:25:49'),
(7, 1319690661, 1, '2010-11-20 10:22:23'),
(8, 1491372404, 3, '2010-11-24 09:57:15'),
(9, 1491372404, 4, '2010-11-24 13:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `ayarlar`
--

CREATE TABLE IF NOT EXISTS `ayarlar` (
  `yoneticiAd` varchar(25) collate utf8_unicode_ci NOT NULL,
  `sifre` varchar(50) collate utf8_unicode_ci NOT NULL,
  `gizliAnahtar` varchar(25) collate utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ayarlar`
--

INSERT INTO `ayarlar` (`yoneticiAd`, `sifre`, `gizliAnahtar`, `id`) VALUES
('ibrahim tasdemir', 'e91d116807e9beca099a62a9f2a2bf45ab929848', 'elendil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `day` date NOT NULL,
  `downloads` int(11) default NULL,
  PRIMARY KEY  (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `download`
--


-- --------------------------------------------------------

--
-- Table structure for table `eleman`
--

CREATE TABLE IF NOT EXISTS `eleman` (
  `elemanID` int(11) NOT NULL auto_increment,
  `elemanAd` varchar(255) collate utf8_unicode_ci NOT NULL,
  `enstruman` varchar(255) collate utf8_unicode_ci NOT NULL,
  `grupID` int(11) NOT NULL,
  PRIMARY KEY  (`elemanID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=288 ;

--
-- Dumping data for table `eleman`
--

INSERT INTO `eleman` (`elemanID`, `elemanAd`, `enstruman`, `grupID`) VALUES
(35, 'Johan Hegg', 'Vokal', 58),
(36, 'Olavi Mikkonen', 'Gitar', 58),
(37, 'Johan Söderberg', 'Gitar', 58),
(38, 'Ted Lundström', 'Bas', 58),
(39, 'Fredrik Andersson', 'Davul', 58),
(40, 'Mikael Stanne', 'Vokal', 59),
(41, 'Niklas Sundin ', 'Gitar', 59),
(42, 'Martin Henriksson', 'Gitar', 59),
(43, 'Daniel Antonsson', 'Bas', 59),
(44, 'Martin Brändström ', 'Klavye', 59),
(45, 'Anders Jivarp', 'Davul', 59),
(46, 'Chuck "Evil Chuck" Schuldiner ', 'Gitar-Vokal', 60),
(47, 'Shannon Hamm ', 'Gitar', 60),
(48, 'Scott Clendenin ', 'Bas', 60),
(49, 'Richard Christy', 'Davul', 60),
(50, 'Anders Fridén', 'Vokal', 61),
(51, 'Björn Gelotte', 'Gitar', 61),
(52, 'Peter Iwers', 'Bas', 61),
(53, 'Daniel Svensson', 'Davul', 61),
(54, 'Muhammed Suiçmez', 'Gitar-Vokal', 62),
(55, 'Sami Raatikainen', 'Gitar', 62),
(56, 'Stefan Fimmers', 'Bas', 62),
(57, 'Romain Goulon', 'Davul', 62),
(58, 'Jürgen "Jay" Lalik', 'Vokal', 63),
(59, 'Thomas Hirtenkauf', 'Vokal', 63),
(60, 'Claudia Schöftner', 'Vokal', 63),
(61, 'Matthias Kogler', 'Gitar-Piyano', 63),
(62, 'Markus Miesbauer', 'Bas-Vokal', 63),
(63, 'Klaus Kogler', 'Lavta', 63),
(64, 'Bernhard Vath', 'Çello', 63),
(65, 'Franz Hageneder ', 'Fülüt', 63),
(66, 'Milan ''Astaroth Magus'' Pejak', 'Davul', 63),
(67, 'Aaron Stainthorpe', 'Vokal', 64),
(68, 'Andrew Craighan', 'Gitar', 64),
(69, 'Hamish Hamilton Glencross', 'Gitar', 64),
(70, 'Lena Abé', 'Bas', 64),
(71, 'Shaun Macgowan', 'Klavye-Vayolin', 64),
(72, 'Dan "Storm" Mullins', 'Davul', 64),
(73, 'Jeff Loomis', 'Gitar-Bas', 65),
(74, 'Mark Arrington ', 'Davul', 65),
(75, 'D. Randall ''Randy'' Blythe', 'Vokal', 66),
(76, 'Mark ''Duane'' Morton', 'Gitar', 66),
(77, 'Willie Adler', 'Gitar', 66),
(78, 'John Campbell ', 'Bas', 66),
(79, 'Chris Adler', 'Davul', 66),
(80, 'Warrel Dane', 'Vokal', 67),
(81, 'Jeff Loomis', 'Gitar', 67),
(82, 'Jim Sheppard', 'Bas', 67),
(83, 'Van Williams', 'Davul', 67),
(84, 'Philip Anselmo', 'Vokal', 68),
(85, '"Dimebag" Darrell Abbott', 'Gitar', 68),
(86, 'Rex Brown', 'Bas', 68),
(87, 'Vinnie Paul Abbott', 'Davul', 68),
(88, 'Warrel Dane', 'Vokal', 69),
(89, 'Peter Wichers', 'Gitar', 69),
(90, 'Matt Wicklund', 'Bas', 69),
(91, 'Dirk Verbeuren', 'Davul', 69),
(92, 'Billy Howerdel', 'Gitar', 70),
(93, 'Maynard James Keenan', 'Vokal', 70),
(94, 'Josh Freese', 'Davul', 70),
(95, 'Jeordie White', 'Bas', 70),
(96, 'James Iha', 'Gitar', 70),
(97, 'Brian Johnson', 'Vokal', 71),
(98, 'Angus Young', 'Gitar', 71),
(99, 'Malcolm Young', 'Gitar', 71),
(100, 'Cliff Williams ', 'Bas', 71),
(101, 'Phil Rudd', 'Davul', 71),
(102, 'Ian "Lemmy" Kilmister ', 'Vokal-Bas', 72),
(103, 'Phil Campbell ', 'Gitar', 72),
(104, 'Mikkey Dee ', 'Davul', 72),
(105, 'Ozzy Osbourne', 'Vokal', 73),
(106, 'Tony Iommi', 'Gitar', 73),
(107, 'Terence "Geezer" Butler ', 'Bas', 73),
(108, 'Bill Ward', 'Davul', 73),
(109, '"Blaze" Bayley Cook', 'Vokal', 74),
(110, 'Nicolas Bermudez', 'Gitar', 74),
(111, 'Jay Walsh', 'Gitar', 74),
(112, 'David Bermudez ', 'Bas', 74),
(113, 'Claudio Tirincanti', 'Davul', 74),
(114, 'Paul Bruce Dickinson ', 'Vokal', 75),
(115, 'Roy "Z." Ramirez ', 'Gitar-Bas', 75),
(116, 'Bruce Dickinson', 'Vokal', 76),
(117, 'Dave Murray ', 'Gitar', 76),
(118, 'Adrian Smith ', 'Gitar', 76),
(119, 'Janick Gers', 'Gitar', 76),
(120, 'Steve Harris', 'Bas', 76),
(121, 'Michael "Nicko" McBrain', 'Davul', 76),
(122, 'Rob Halford', 'Vokal', 78),
(123, 'Glenn Tipton ', 'Gitar', 78),
(124, 'Kenneth ''K.K.'' Downing ', 'Gitar', 78),
(125, 'Ian Hill', 'Bas', 78),
(126, 'Scott Travis', 'Davul', 78),
(127, 'Till Lindemann', 'Vokal', 79),
(128, 'Richard Z. Kruspe', 'Gitar', 79),
(129, 'Paul H. Landers ', 'Gitar', 79),
(130, 'Oliver "Ollie" Riedel', 'Bas', 79),
(131, 'Christoph "Doom" Schneider', 'Davul', 79),
(132, 'Christian "Flake" Lorenz', 'Klavye', 79),
(133, 'Max Cavalera', 'Vokal-Gitar', 80),
(134, 'Marc Rizzo ', 'Gitar', 80),
(135, 'Johny Chow', 'Bas', 80),
(136, 'Igor "Iggor" Cavalera', 'Davul', 80),
(137, 'Amy Lee', 'Vokal-Piyano', 81),
(138, 'Terry Balsamo', 'Gitar', 81),
(139, 'Tim McCord', 'Bas', 81),
(140, 'Will "Science" Hunt ', 'Davul', 81),
(141, 'Chester Bennington', 'Vokal', 82),
(142, 'Rob Bourdon', 'Davul', 82),
(143, 'Brad Delson', 'Gitar', 82),
(144, 'David "Phoenix" Farrell', 'Bas', 82),
(145, 'Joseph "Mr." Hahn', 'DJ Masası', 82),
(146, 'Mike Shinoda', 'Vokal-Klavye', 82),
(147, 'Max Cavalera', 'Vokal-Gitar-Bas', 83),
(148, 'Alex Newport', 'Vokal-Gitar-Bas', 83),
(149, 'Max Cavalera', 'Gitar-Vokal', 84),
(150, 'Marc Rizzo', 'Gitar', 84),
(151, 'Joe Nunez', 'Davul', 84),
(152, 'Glen Benton', 'Bas', 84),
(153, 'Hansi Kürsch', 'Vokal', 85),
(154, 'André Olbrich', 'Gitar', 85),
(155, 'Marcus Siepen', 'Gitar', 85),
(156, 'Frederik Ehmke', 'Davul', 85),
(157, 'Hansi Kürsch', 'Vokal', 86),
(158, 'Jon Schaffer', 'Gitar-Bas', 86),
(159, 'Joacim Cans', 'Vokal', 87),
(160, 'Oscar Dronjak ', 'Gitar', 87),
(161, 'Pontus Norgren', 'Gitar', 87),
(162, 'Fredrik Larsson', 'Bas', 87),
(163, 'Anders Johansson ', 'Davul', 87),
(164, 'Matt Barlow', 'Vokal', 88),
(165, 'Troy Seele', 'Gitar', 88),
(166, 'Jon Schaffer', 'Gitar', 88),
(167, 'Freddie Vidales', 'Bas', 88),
(168, 'Brent Smedley', 'Davul', 88),
(169, 'Anette Olzon Blyckert', 'Vokal', 89),
(170, 'Tuomas Holopainen', 'Klavye', 89),
(171, 'Erno ''''Emppu'''' Vuorinen ', 'Gitar', 89),
(172, 'Marco Hietala', 'Bas', 89),
(173, 'Jukka "Julius" Nevalainen', 'Davul', 89),
(174, 'Sharon Den Adel', 'Vokal', 90),
(175, 'Robert Westerholt', 'Gitar', 90),
(176, 'Ruud Jolie', 'Gitar', 90),
(177, 'Martijn Spierenburg', 'Klavye', 90),
(178, 'Jeroen Van Veen', 'Bas', 90),
(179, 'Charles "Chuck" Schuldiner', 'Gitar', 91),
(180, 'Tim Aymar ', 'Vokal', 91),
(181, 'Richard Christy ', 'Davul', 91),
(182, 'Steve DiGiorgio', 'Bas', 91),
(183, 'Shannon Hamm', 'Gitar', 91),
(184, 'James LaBrie', 'Vokal', 92),
(185, 'John Myung', 'Bas', 92),
(186, 'John Petrucci', 'Gitar', 92),
(187, 'Mike Portnoy', 'Davul', 92),
(188, 'Jordan Rudess', 'Klavye', 92),
(189, 'John Petrucci ', 'Gitar', 93),
(190, 'Tony Levin', 'Bas', 93),
(191, 'Jordan Rudess', 'Klavye', 93),
(192, 'Mike Portnoy ', 'Davul', 93),
(193, 'Jens Kidman', 'Vokal', 94),
(194, 'Fredrik Thordendal', 'Gitar', 94),
(195, 'Mårten Hagström', 'Gitar', 94),
(196, 'Tomas Haake', 'Davul', 94),
(197, 'Dick Lövgren', 'Bas', 94),
(198, 'Mikael Åkerfeldt', 'Vokal-Gitar', 95),
(199, 'Fredrik Åkesson', 'Gitar', 95),
(200, 'Martin Mendez', 'Bas', 95),
(201, 'Martin Axenrot ', 'Davul', 95),
(202, 'Per Wiberg', 'Klavye', 95),
(203, 'Maynard James Keenan', 'Vokal', 96),
(204, 'justin chancellor', 'Bas', 96),
(205, 'Adam Jones ', 'Gitar', 96),
(206, 'Danny Caey', 'Davul', 96),
(207, 'Eicca Toppinen', 'Çello', 97),
(208, 'Paavo Lötjönen', 'Çello', 97),
(209, 'Perttu Kivilaakso', 'Çello', 97),
(210, 'Mikko Siren', 'Davul', 97),
(211, 'Simone Simons', 'Vokal', 98),
(212, 'Mark Jansen', 'Vokal-Gitar', 98),
(213, 'Isaac Delahaye', 'Gitar', 98),
(214, 'Yves Huts', 'Bas', 98),
(215, 'Ariën Van Weesenbeek', 'Davul', 98),
(216, 'Coen Jansen', 'Klavye', 98),
(217, 'Dave Padden', 'Gitar-Vokal', 99),
(218, 'Jeff Waters', 'Gitar-Bas-Vokal', 99),
(219, 'Joey Belladonna ', 'Vokal', 100),
(220, 'Rob Caggiano', 'Gitar', 100),
(221, 'Scott Ian Rosenfeld', 'Gitar', 100),
(222, 'Frank Bello ', 'Bas', 100),
(223, 'Charlie Benante', 'Davul', 100),
(224, 'Michael Stützer ', 'Gitar', 101),
(225, 'Morten Stützer', 'Gitar', 101),
(226, 'Peter Thorslund', 'Bas', 101),
(227, 'Carsten Nielsen', 'Davul', 101),
(228, 'Mark Osegueda ', 'Vokal', 102),
(229, 'Ted Aguilar', 'Gitar', 102),
(230, 'Rob Cavestany', 'Gitar', 102),
(231, 'Damien Sisson', 'Bas', 102),
(232, 'Will Carroll', 'Davul', 102),
(233, 'Chuck Billy ', 'Vokal', 103),
(234, 'Steve "Zetro" Souza', 'Vokal', 103),
(235, 'Andy Billy', 'Gitar', 103),
(236, 'Steve Robello', 'Gitar', 103),
(237, 'Greg Bustamante', 'Gitar', 103),
(238, 'John Hartsinck ', 'Gitar', 103),
(239, 'Willy Lange ', 'Bas', 103),
(240, 'John Souza', 'Bas', 103),
(241, 'Eddie Billy ', 'Bas', 103),
(242, 'Danny Cunningham', 'Davul', 103),
(243, 'Troy Luccketta', 'Davul', 103),
(244, 'Dale Steele ', 'Vokal', 104),
(245, 'John Davis', 'Gitar', 104),
(246, 'Steve Conley ', 'Gitar', 104),
(247, 'David Ellefson', 'Bas', 104),
(248, 'Jimmy DeGrasso', 'Davul', 104),
(249, 'Waldemar Sorychta', 'Gitar', 105),
(250, 'Dave Lombardo', 'Davul', 105),
(251, 'Miland "Mille" Petrozza ', 'Vokal-Gitar', 106),
(252, 'Sami Yli-Sirniö', 'Gitar', 106),
(253, 'Christian "Speesy" Giesler', 'Bas', 106),
(254, 'Jürgen "Ventor" Reil ', 'Davul', 106),
(255, 'Robb Flynn ', 'Vokal-Gitar', 107),
(256, 'Phil Demmel ', 'Gitar', 107),
(257, 'Adam Duce', 'Bas', 107),
(258, 'Dave McClain', 'Davul', 107),
(259, 'Dave Mustaine', 'Vokal-Gitar', 108),
(260, 'Chris Broderick ', 'Gitar', 108),
(261, 'David Ellefson ', 'Bas', 108),
(262, 'Shawn Drover', 'Davul', 108),
(263, 'James Hetfield', 'Gitar-Vokal', 109),
(264, 'Kirk Hammett', 'Gitar', 109),
(265, 'Robert Trujillo ', 'Bas', 109),
(266, 'Lars Ulrich', 'Davul', 109),
(267, 'Joey Jordison', 'Davul', 110),
(268, 'Matthew Heafy', 'Vokal-Gitar', 110),
(269, 'Dino Cazares', 'Gitar', 110),
(270, 'Robert Flynn', 'Vokal', 110),
(271, 'Tom Araya', 'Vokal', 111),
(272, 'Jeff Hanneman', 'Gitar', 111),
(273, 'Kerry King', 'Gitar', 111),
(274, 'Dave Lombardo', 'Davul', 111),
(275, 'Derrick Green', 'Vokal', 112),
(276, 'Andreas Kisser ', 'Gitar', 112),
(277, 'Paulo "Destructor" Xisto Pinto Jr.', 'Bas', 112),
(278, 'Jean Dolabella', 'Davul', 112),
(279, 'Chuck Billy ', 'Vokal', 113),
(280, 'Eric Peterson', 'Gitar', 113),
(281, 'Alex Skolnick', 'Gitar', 113),
(282, 'Greg Christian', 'Bas', 113),
(283, 'Paul Bostaph ', 'Davul', 113),
(284, 'Matt Heafy', 'Vokal-Gitar', 114),
(285, 'Corey Beaulieu', 'Vokal-Gitar', 114),
(286, 'Paolo Gregoletto', 'Vokal-Bas', 114),
(287, 'Nick Augusto', 'Davul', 114);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `uzunluk` time NOT NULL,
  `mp4` varchar(250) collate utf8_unicode_ci default NULL,
  `ogg` varchar(250) collate utf8_unicode_ci default NULL,
  `webm` varchar(250) collate utf8_unicode_ci default NULL,
  `h264` varchar(250) collate utf8_unicode_ci default NULL,
  `film_ad` varchar(250) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `uzunluk`, `mp4`, `ogg`, `webm`, `h264`, `film_ad`) VALUES
(1, '00:09:56', 'http://ibrahimtasdemir.mysites.com/get_file/big-buck-bunny-480-p-surround-f.mp4', 'ftp://video.blendertestbuilds.de/download/bigbuckbunny_movies/big_buck_bunny_1080p_stereo.ogg', 'http://ibrahimtasdemir.mysites.com/get_file/big-buck-bunny-480-p-surround-f.webm', 'http://mirrorblender.top-ix.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_h264.mov', 'Big Buck Bunny'),
(2, '00:07:12', 'http://ibrahimtasdemir.mysites.com/get_file/foutaises.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/foutaises.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/foutaises.webm', '', 'Foutaises'),
(3, '00:12:41', 'http://ibrahimtasdemir.mysites.com/get_file/jojo-in-the-stars-dvdrip-2003.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/jojo-in-the-stars-dvdrip-2003.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/jojo-in-the-stars-dvdrip-2003.webm', '', 'Jojo in the Stars'),
(4, '00:01:42', 'http://ibrahimtasdemir.mysites.com/get_file/theadventuresofandr-andwallyb.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/theadventuresofandr-andwallyb-2.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/theadventuresofandr-andwallyb.webm', '', 'The Adventures of Andre and Wally B'),
(5, '00:05:27', 'http://ibrahimtasdemir.mysites.com/get_file/thechubbchubbs.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/thechubbchubbs.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/thechubbchubbs.webm', '', 'The Chubbchubbs'),
(6, '00:04:30', 'http://ibrahimtasdemir.mysites.com/get_file/boundin.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/boundin.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/boundin.webm', '', 'Boundin'),
(7, '00:03:14', 'http://ibrahimtasdemir.mysites.com/get_file/for-the-birds.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/for-the-birds.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/for-the-birds.webm', '', 'For the Birds'),
(13, '00:02:04', 'http://ibrahimtasdemir.mysites.com/get_file/luxo-jr.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/luxo-jr.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/luxo-jr.webm', '', 'Luxo Jr'),
(9, '00:04:40', 'http://ibrahimtasdemir.mysites.com/get_file/geris-game.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/geris-game.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/geris-game.webm', '', 'Geris Game'),
(10, '00:04:31', 'http://ibrahimtasdemir.mysites.com/get_file/jack-jack-attack.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/jack-jack-attack.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/jack-jack-attack.webm', '', 'Jack Jack Attack'),
(11, '00:03:26', 'http://ibrahimtasdemir.mysites.com/get_file/knick-knack.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/knick-knack.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/knick-knack.webm', '', 'Knick Knack'),
(12, '00:04:49', 'http://ibrahimtasdemir.mysites.com/get_file/lifted.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/lifted.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/lifted.webm', '', 'Lifted'),
(14, '00:06:51', 'http://ibrahimtasdemir.mysites.com/get_file/mater-and-the-ghostlight.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/mater-and-the-ghostlight.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/mater-and-the-ghostlight.webm', '', 'Mater and the Ghostlight'),
(15, '00:03:39', 'http://ibrahimtasdemir.mysites.com/get_file/mikes-new-car.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/mikes-new-car.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/mikes-new-car.webm', '', 'Mikes New Car'),
(16, '00:04:21', 'http://ibrahimtasdemir.mysites.com/get_file/one-man-band.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/one-man-band.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/one-man-band.webm', '', 'One Man Band'),
(17, '00:04:02', 'http://ibrahimtasdemir.mysites.com/get_file/reds-dream.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/reds-dream.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/reds-dream.webm', '', 'Reds Dream'),
(18, '00:04:57', 'http://ibrahimtasdemir.mysites.com/get_file/tin-toy.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/tin-toy.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/tin-toy.webm', '', 'Tin Toy'),
(19, '00:03:31', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cat-with-hands.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cat-with-hands.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cat-with-hands.webm', '', 'The Cat With Hands'),
(20, '00:10:34', 'http://ibrahimtasdemir.mysites.com/get_file/dokuz/9-2005.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/dokuz/9-2005.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/dokuz/9-2005.webm', '', '9(2005)'),
(21, '00:08:00', 'http://ibrahimtasdemir.mysites.com/get_file/ark/ark.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/ark/ark.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/ark/ark.webm', '', 'Ark'),
(22, '00:21:51', 'http://ibrahimtasdemir.mysites.com/get_file/ark/amazing-screw-on-head.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/ark/amazing-screw-on-head.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/ark/amazing-screw-on-head.webm', '', 'Amazing Screw-on Head'),
(23, '00:05:41', 'http://ibrahimtasdemir.mysites.com/get_file/ark/fallen-art.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/ark/fallen-art.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/ark/fallen-art.webm', '', 'Fallen Art'),
(24, '00:03:12', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/rain.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/rain.ogv', '', '', 'Rain'),
(25, '00:28:26', 'http://ibrahimtasdemir.mysites.com/get_file/ark/flatworld.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/ark/flatworld.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/ark/flatworld.webm', '', 'Flatworld'),
(26, '00:03:24', 'http://ibrahimtasdemir.mysites.com/get_file/ark/hitchhiker.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/ark/hitchhiker.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/ark/hitchhiker.webm', '', 'Hirtchhiker'),
(27, '00:02:49', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/undo.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/undo.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/undo.webm', '', 'Undo'),
(28, '00:03:16', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/lotr.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/lotr.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/lotr-ogv.webm', '', 'Jack Black in the Lord of the Rings'),
(29, '00:39:06', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-hunt-for-gollum.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-hunt-for-gollum.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-hunt-for-gollum.webm', '', 'The Hunt for Gollum'),
(30, '00:06:27', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cathedral-2.mp4', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cathedral-2.ogv', 'http://ibrahimtasdemir.mysites.com/get_file/cat-with.hands/the-cathedral-2.webm', '', 'Katedra');

-- --------------------------------------------------------

--
-- Table structure for table `film_istek`
--

CREATE TABLE IF NOT EXISTS `film_istek` (
  `film_ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  `istek` int(11) NOT NULL default '1',
  PRIMARY KEY  (`film_ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `film_istek`
--

INSERT INTO `film_istek` (`film_ad`, `istek`) VALUES
('Iron Monkey', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotspot`
--

CREATE TABLE IF NOT EXISTS `hotspot` (
  `id` bigint(20) NOT NULL auto_increment,
  `src` varchar(255) collate utf8_unicode_ci NOT NULL,
  `spot` int(11) NOT NULL,
  `val` varchar(255) collate utf8_unicode_ci NOT NULL,
  `x` bigint(20) NOT NULL,
  `y` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=100 ;

--
-- Dumping data for table `hotspot`
--

INSERT INTO `hotspot` (`id`, `src`, `spot`, `val`, `x`, `y`) VALUES
(94, 'http://farm5.static.flickr.com/4118/4757836515_bae11d3f60.jpg', 0, 'Rabia &Ccedil;ift&ccedil;i', 62, 58),
(95, 'http://farm5.static.flickr.com/4118/4757836515_bae11d3f60.jpg', 1, 'Furkan &Ccedil;ift&ccedil;i', 287, 103),
(96, 'http://farm5.static.flickr.com/4118/4757836515_bae11d3f60.jpg', 2, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 374, 108),
(97, 'http://farm5.static.flickr.com/4116/4757837669_972c9ca791.jpg', 0, 'Furkan &Ccedil;ift&ccedil;i', 306, 129),
(93, 'http://farm5.static.flickr.com/4099/4757835811_78162f2c05.jpg', 1, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 250, 162),
(92, 'http://farm5.static.flickr.com/4099/4757835811_78162f2c05.jpg', 0, 'Rabia &Ccedil;ift&ccedil;i', 129, 28),
(91, 'http://farm5.static.flickr.com/4080/4758474954_801bd14a38.jpg', 0, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 46, 183),
(90, 'http://farm5.static.flickr.com/4138/4758474300_f683d28e24.jpg', 0, 'Furkan &Ccedil;ift&ccedil;i', 378, 165),
(89, 'http://farm5.static.flickr.com/4075/4757834939_9cd8722959.jpg', 2, 'Rabia &Ccedil;ift&ccedil;i', 40, 131),
(88, 'http://farm5.static.flickr.com/4075/4757834939_9cd8722959.jpg', 1, 'Furkan &Ccedil;ift&ccedil;i', 344, 94),
(87, 'http://farm5.static.flickr.com/4075/4757834939_9cd8722959.jpg', 0, 'Aytekin &Ccedil;ift&ccedil;i', 417, 126),
(86, 'http://farm5.static.flickr.com/4081/4758473486_1b726f546f.jpg', 2, '&Ouml;mer Tasdemir', 75, 111),
(85, 'http://farm5.static.flickr.com/4081/4758473486_1b726f546f.jpg', 1, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 192, 141),
(84, 'http://farm5.static.flickr.com/4081/4758473486_1b726f546f.jpg', 0, 'Fatma Tasdemir', 298, 100),
(83, 'http://farm5.static.flickr.com/4139/4757833827_7e4ccfbb8d.jpg', 0, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 259, 103),
(82, 'http://farm5.static.flickr.com/4134/4758472722_6d69259c01.jpg', 1, 'G&uuml;ldeste', 75, 74),
(81, 'http://farm5.static.flickr.com/4134/4758472722_6d69259c01.jpg', 0, 'Gamze', 338, 22),
(80, 'http://farm5.static.flickr.com/4078/4757832605_8e6fd38ab8.jpg', 0, 'Gamze', 177, 109),
(79, 'http://farm5.static.flickr.com/4120/4757831973_d52b3e8337.jpg', 0, 'Akg&uuml;l Murat', 256, 55),
(78, 'http://farm5.static.flickr.com/4117/4758470604_04eb343f5c.jpg', 2, 'Mehmet Ali Tasdemir', -45, 126),
(77, 'http://farm5.static.flickr.com/4117/4758470604_04eb343f5c.jpg', 1, 'Fatma Tasdemir', 58, 128),
(76, 'http://farm5.static.flickr.com/4117/4758470604_04eb343f5c.jpg', 0, 'Saliha Tasdemir', 378, 127),
(75, 'http://farm5.static.flickr.com/4134/4758470002_7b965b99e0.jpg', 1, 'Fatma Tasdemir', 96, 57),
(74, 'http://farm5.static.flickr.com/4134/4758470002_7b965b99e0.jpg', 0, '&Ouml;mer Tasdemir', 297, 28),
(73, 'http://farm5.static.flickr.com/4081/4758469310_26019c9dc5.jpg', 0, 'Fatma Tasdemir', 217, 131),
(72, 'http://farm5.static.flickr.com/4117/4757829253_33f88d8741.jpg', 1, 'G&uuml;ldeste', 167, 105),
(66, 'http://farm5.static.flickr.com/4082/4758467508_3510ce683e.jpg', 1, '&Ouml;mer Tasdemir', 174, 138),
(67, 'http://farm5.static.flickr.com/4082/4758467508_3510ce683e.jpg', 2, 'Sakir Tasdemir', 307, 120),
(68, 'http://farm5.static.flickr.com/4101/4758467154_444e462948.jpg', 0, 'Sevde Ceren Tasdemir', 204, 25),
(69, 'http://farm5.static.flickr.com/4123/4757828915_e5b4d52b38.jpg', 0, '&Ouml;mer Tasdemir', 434, 114),
(70, 'http://farm5.static.flickr.com/4123/4757828915_e5b4d52b38.jpg', 1, 'Rafet Tasdemir', 23, 138),
(71, 'http://farm5.static.flickr.com/4117/4757829253_33f88d8741.jpg', 0, 'Fatma Tasdemir', 375, 60),
(98, 'http://farm5.static.flickr.com/4116/4757837669_972c9ca791.jpg', 1, '&Ouml;mer Tasdemir', 171, 33),
(99, 'http://farm5.static.flickr.com/4116/4757837669_972c9ca791.jpg', 2, 'H&uuml;meyra &Ccedil;ift&ccedil;i', 101, 165);

-- --------------------------------------------------------

--
-- Table structure for table `main__models__aile_agaci_index`
--

CREATE TABLE IF NOT EXISTS `main__models__aile_agaci_index` (
  `aileID` bigint(20) NOT NULL default '0',
  `keyword` varchar(200) collate utf8_unicode_ci NOT NULL default '',
  `field` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `position` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`aileID`,`keyword`,`field`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `main__models__aile_agaci_index`
--

INSERT INTO `main__models__aile_agaci_index` (`aileID`, `keyword`, `field`, `position`) VALUES
(59, 'ifakat', 'aileAd', 1),
(59, 'refika', 'aileAd', 0),
(59, 'tasdemir', 'aileAd', 2),
(60, 'handan', 'aileAd', 0),
(60, 'oezcan', 'aileAd', 1),
(62, 'oezcan', 'aileAd', 1),
(62, 'rabia', 'aileAd', 0),
(63, 'abdullah', 'aileAd', 0),
(63, 'aydin', 'aileAd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `muzik`
--

CREATE TABLE IF NOT EXISTS `muzik` (
  `grupID` int(11) NOT NULL auto_increment,
  `grupAd` varchar(50) collate utf8_unicode_ci NOT NULL,
  `tur` varchar(25) collate utf8_unicode_ci NOT NULL,
  `memleket` varchar(25) collate utf8_unicode_ci NOT NULL,
  `tanim` text collate utf8_unicode_ci NOT NULL,
  `grupClip` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`grupID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=115 ;

--
-- Dumping data for table `muzik`
--

INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(58, 'Amon Amarth', 'Viking Death Metal', 'Isvec', 'Amon Amarth, 1992 yılında kurulmuş İsveçli melodik death metal grubu. İsmini J.R.R. Tolkien''in Yüzüklerin Efendisi serisinde yer alan Hüküm Dağı''ndan (Amon Amarth, ingilizce Mount Doom) alırlar.İlginçtir ki grup üyeleri aslında Yüzüklerin Efendisi hayranı değildir ama grubun vokalisti ve şarkı sözü yazarı Johan Hegg "Amon Amarth" ismi bizim savunduğumuz şeyleri temsil ediyor demiştir. Şarkı sözleri Viking efsaneleri temalıdır. Bu sebeple yaptıkları death metal müziği Viking metal olarak da adlandırırlar. Şarkılarında İskandinav mitolojisinin etkileri rahatlıkla gözlenebilir. Ayrıca grubun 2008 de çıkardığı Twilight of the Thunder God adlı albümünde bulunan Varyags 0f Miklagaard adlı şarkı Bizansın çok eski zamanlarında İstanbul''a gelmiş vikingleri anlatmaktadır. Varyags 0f Miklagaard büyük bahçenin varyagları anlamına gelir. Gördükleri en büyük bahçelerle kaplı olan İstanbula Varyaglar (görevi imparatoru korumak olan vikingler) adeta hayran kalmıştır. Amon Amarthın da İstanbul hayranı olduğu bilinmektedir.', 'e-UbViuK4fY'),
(59, 'Dark Tranquillity', 'Melodic Death Metal', 'Isvec', '1989 yılının başlarında vokalist Anders Friden, gitarist Niklas Sundin, ritim gitarist Mikael Stanne, bas gitarist Martin Henriksson ve baterist Anders Jivarp bir araya gelip ?Septic Broiler? adında bir thrash metal grubu kurdu. 1990 yılında ?Enfeebled Earth? adlı bir demo kaset hazırladıkları sırada grup aninden fikir değiştirip demo çalışmasını bıraktı. Adını ?Dark Tranquillity? olarak değiştirdi ve death metale geçti.\r\n\r\n1991 yılında grup ilk çalışmaları olan ?Trail of Life Decayed?ı çıkardı. 1992?de ise ?A Moonclad Reflection? adını verdikleri bir EP hazırlayıp bunu da çıkardı. Bu EP 1500 sattı. Grubun müziği, her ne kadar death metal yapsalar da, 80?lerden gelen klasik thrash müziğinin öğeleriyle gitar harmonilerinin bir karışımı gibiydi.\r\n\r\n1993 senesinde grup ?Skydancer? albümünü hazırlayıp piyasaya sürdü. Bu albümde misafir sanatçı olarak Anna Kajsa Avehall vokalde gruba yardım etti. İki sene sonra yeni albüm ?Of Chaos And Eternal Night? geldi. Albüm çıktıktan sonra Anders Friden gruptan ayrıldı ve Mikael Stanne vokalist rolünü üstlendi. Gitar boşluğunu da Friedrik Johansson?u gruplarına alarak kapattılar. Yeni kadroyla ?The Gallery? albümünü yaptılar. Albüm beğeni topladı ve gruba büyük bir başarı kazandırdı.\r\n\r\nÇıkışını sürdüren Dark Tranquillity 1996 senesinde yeni bir albüm için kolları sıvadı ve ?The Mind?s I? isimli albümü yaptı. Bu albümde Andres Friden, Michael Nicklasson ve Sara Svensson misafir vokalist olarak yer aldı. Albüm özellikle güçlü vokal kadrosuyla gruba yine başarı getirdi. Üç senelik bir aradan sonra ise ?Projector? isimli yeni albüm çıktı. Bu albümde grup tarzını biraz değiştirip sound?una elektronik müzikler kattı ve melodik death stilinden biraz uzaklaştı. Albüm, grubun hayranları tarafından biraz kuşkuyla karşılansa da yine istenilen başarıyı gösterdi ve dinleyenleri tatmin etti. Grup bu albümden yine bir kadro değişikliğine gitti. Johansson gruptan ayrıldı. Michael Nicklasson bas gitarist, Martin Brändström klavyeci olarak gruba katıldı. Martin Henriksson ise gitara geçti. Ve yepyeni kadroyla 2000?de ?Haven? albümü çıktı. Bu albümde de grup elektronik öğeler kullanmaya ve klasik death metal tarzından uzaklaşmaya devam etti. Bu yeni albüm de rahat rahat hem basından hem dinleyenlerden geçer not aldı.\r\n\r\nBir sonraki albüm 2002 senesinde çıktı. Adı ?Damage Done? olan bu albümde grup tam olarak köklü bir geri dönüş olmasa da eski müziklerini anımsatan bir tarz kullandı.\r\n\r\nGrup 24 Mayıs 2004?te piyasaya çıkan ?Exposures In Retrospect And Denial?i piyasaya sürdü. İlk dönemlerinde çıkardıkları demo ve EP parçalarının bulunduğu bu albümde grubun ?Trail Of Life Decayed" (demo-1991) ve "A Moonclad Reflection" (EP-2002) gibi eski çalışmalarının yeni düzenlemeleri bulunuyor.\r\n\r\nDark Tranquillity sonraki süreçte; 2005 yılında Character ve 2007 yılında Fiction isimli albümleri çıkardı.\r\n\r\n2008 Ağustos ayında grubun 1998 yılından bu yana Bass gitaristi olan Martin Henriksson gruptan ayrıldığını açıkladı, 2008 eylül ayına kadar bass çı arayışını sürdüren grup Eylül ayında Soilwork grubunun eski gitaristi Daniel Antonsson ile anlaşarak gruba dahil etti.\r\n\r\nYine 2008 sonlarında yeni albüm çalışmalarına başladığını duyuran grup, 2009 temmuz ayında ön hazırlıklarının tamamlandığını ve eylül- ekim aylarında yeni albüm kayıtları için stüdyoya gireceklerini sevenlerine resmi sitelerinden duyurdu. Yine aynı açıklamada 2010 yılının başında albümün piyasaya sürüleceğini belirten grubun yeni albümü de Century Media etiketini taşıyacak.', '3F1W8HJLV5s'),
(60, 'Death', 'Death Metal', 'Amerika', 'Death 1983 yılında 16 yaşındaki gitarist/vokalist Chuck Schuldiner, gitarist Rick Rozz ve baterist Barney `Kam` Lee önderliğinde Florida, Amerika''da kuruldu. Gurubun ilk adı Mantas idi ama daha sonra DEATH adını aldılar. Grup Venom ve Slayer`dan etkilenmişti ama farklı birşey yapmak niyetindeydiler ve Chuck`ın sert vokalini kullanmaya karar verdiler. 1987 yılında çıkardıkları "Scream Bloody Gore" albümü ile bütün metal müzik piyasasını yerinden salladılar. Bu kadar sert, keskin ritmleri ve vokali olan bir müziğe insanlar alışık değillerdi ama ardından pek çok vokalist Chuck`in stilini taklit edip death metal yapmaya karar verdiler.\r\n\r\n1989 yılında efsanevi "Leprosy" albümünü çıkardıklarında bütün dünya tarafından tanınmışlardı. İlk defa Amerika dışına çıkıp Avrupa turnesine çıktılar. Albüm müthiş sansasyon yaratmıştı. Bütün müzik piyasası bu yeni müzik stilini ve yaratıcılarını hayranlıkla izliyordu. 1990 tarihli "Spiritual Healing" ve 1991 tarihli "Human" albümleri ile yerlerini iyice sağlamlaştırmışlardı. Artık turnelerde ana grup olarak sahneye çıkıyorlar, festivallere onur konuğu olarak davet ediliyorlardı. Steve Digiorgio ve James Murphy`nin katılımı ile grup sertliğine teknik ekleyince grubun müziğindeki kalite de iyice yükselmişti. Bu 1993 yılında çıkan muhteşem "Individual Thought Patterns" albümünde çok net olarak görülebiliyor. Bu albüm pek çok metal dergisinde death metal müzik tarihinde yapılan en iyi albüm seçildi.\r\n\r\n1995 yılında "Symbolic" albümü çıktıktan sonra James Murphy ve Steve DiGiorgio gruptan ayrıldılar bu grubun bir süre müzikten uzak kalmasına yol açtı. Konserlere çıkmaya devam ettilar fakat 3 sene albüm çıkarmadılar. Ta ki 1998 yılında çıkardıkları "The Sound of Perseverance" albümüne kadar. Bu albümden sonra Unleashed, Carcass ve Entombed ile bir Avrupa turnesine çıktılar. 2000 yılıda vokalist Chuck Schuldiner sağlığını kaybetmeye başladı buna rağmen müzik çalışmalarına ara vermeden devam ettiler ve aynı yıl Hollanda konserlerini "Live in Eindhoven ''98" ve muhtesem 2001 Los Angeles konserlerini hem CD hemde DVD formatında "Live in L.A.: Death & Raw" adı ile piyasaya sürdüler. Ve ardından Chuck 1 aylık bir komaya girdikten sonra 13 Aralik 2001 tarihinde beyin tümörü sebebi ile hayatını kaybetti. Bu bir anlamda Death grubunun da sonu olmuştu.', 'xu9ZQtzKeik'),
(61, 'In Flames', 'Melodic Death Metal', 'Isvec', ' In Flames İsveçli bir Melodik Death Metal grubudur. 1990 yılında grubun kurucusu Jasper Strömblad o zaman üyesi olduğu Ceremonial Oath grubundan, Anders Fridén ile ayrılmaya karar verir. Farklı bir müzik türü yapmaya karar verip Johan Larsson ve Glenn Ljungström?ün katılımıyla In Flames?i kurarlar. İlk demolarını Wrong Again plak şirketine yolladılar. Plak şirketinin sahibi bu demoyu oldukça beğenir ve ertesi gün telefon açar. Bunun üzerine grup kısa sürede patlayacak Lunar Strain adlı albümlerini hazırlamaya başlar.In Flames, pek çok grupta olduğu gibi, ayrılan ve sonradan dahil olan üyelere sahiptir. Bunlardan bazıları Mikael Stanne ve Anders Jivarp (Dark Tranquillity), Anders Iwers (Tiamat), Henke Forss (Dawn) ve Daniel Erlandsson?dur (Eucharist, Arch Enemy)\r\n\r\nGrup daha sonra Subterranean isimli bir CD yayımlar. Bu yayım onlar için bir dönüm noktasıdır. Bu albümle beraber dikkatleri üzerine çeken In Flames, bir Alman plak şirketi olan Nuclear Blast ile masaya oturur. Bu başarıdan kısa bir süre sonra, canlı gösteriler ve albüm yapımları için sürekli dışarıdan çağırmaktan bıktıkları Anders Fridén ve Björn Gelotte?u gruba davet ederler ve kabul görürler.\r\n\r\nPeşinden The Jester Race ismindeki albümlerini de yayımlayıp, özellikle Avrupa ve Japonya?da büyük bir başarıya ulaşırlar. Aynı ve bir sonraki yılda olan bazı olaylar sebebiyle Johan ve Glenn önceliklerinin ne olduğunu düşünmeye başladılar ve üzücü bir şekilde, artık In Flames üyesi olmamayı seçtiler. İkisi de, Whoracle adlı albümün kaydı sırasında beklenmedik bir şekilde ayrılacaklarını duyurdular ve Björn, Jesper ve Anders?ı yarım bir grup ve albümle başbaşa bıraktılar. Neyse ki Peter Iwers ve Niklas Engelin ismindeki arkadaşları ayrılanların yerini albümün kaydının tamamlanmasına kadar doldurdular. Daha sonra bu iki kişi de grupla çalışmaktan hoşlandıklarını ve grubun bir parçası olmayı istediklerini söylediler ve derhal kabul edildiler. Birlikte Avrupa ve Japonya?da başarılı bir turneye çıktılar. Bu turnenin sonunda İsveç?e döndüklerinde Niklas bazı özel sebeplerden dolayı gruptan ayrılmak zorunda kaldı. Bu durum grubun tarihindeki en önemli dönüm noktası olarak belirtilir. Niklas?ın ayrılmasından sonra, o zamana kadar davulu kullanan ama aslen bir gitarist olan Björn?ü gitaristliğe, davula da Daniel Svensson?u getirirler.\r\n\r\nBu değişiklik işe yarar ve The Colony isimli albümlerini çıkarttıklarında istediklerini alırlar ve Amerika, Avrupa ve Japonya?da çıktıkları sahnelerde konser alanlarını tamamen doldururlar.\r\n\r\nBir kaç yıl süren başarılı turnelerinden sonra Ağustos 2000?de, yaklaşık 3 aylık bir stüdyo çalışmasından sonra The Clayman?ı çıkartırlar ve birkaç ay içinde önceki albümlerinin satış rekorunu bile kırarlar. Dream Theater, Slipknot, Testament, Methods of Mayhem ile festivallere katıldıktan sonra ufukta bir turne daha görünüyordu. İki Amerika turnesi arasına bir de Avrupa ile Japonya turnelerini kattılar. Jester, Japonya?da en iyi şarkı yazarı olarak BURRN! ödülünü aldı. Japonya turnesine katılamayan Peter Iwers grupla tekrar İskandinavya turnesinde buluştu. Bu süre içinde Armageddon grubundan Dick Löwgren onun yerine sahne aldı. 2000 yılında yaklaşık 150 kez sahneye çıktılar.\r\n\r\n2001 yılında Peter?ın tekrar katılmasıyla İsveç?te, dört ayrı televizyon kanalı ve radyodan canlı yayınlanan bazı gösterilerde yer aldılar. «Only for the weak» adlı kliplerinin yayınlanmaya başlamasıyla Avrupa?da 20.000 kişiye konser verdi. Bir sonraki yazda Wacken Open Air ve Rock Machin gösterilerinden sonra, Amerika turnesine başlamadan önce, yeni albümleri olan The Tokyo Showdown?ı çıkardılar.\r\n\r\nDaha sonra Daniel Bergstrand ile Dug-Out stüdyolarında çalışmaya başlayıp «Reroute To Remain» albümünü hazırladılar. Yine birçok turneye ve gösteriye, Slipknot, Mudvayne, Soulfly ve Slayer ile katılmaları onlara müziklerini farklı izleyicilere de göstermelerini sağladı. Kendi ülkelerinde Linkin Park?ın yerini alarak Hultsfred festivaline katıldılar.\r\n\r\nBu gösteriden bir sonraki gün, Metallica?nın Madrid?deki konserinde ön grup olarak çıkma teklifini aldılar ve yaklaşık 30.000 kişinin önünde ki bu onların tek seferde karşılarına çıktığı en büyük kalabalıktı, sahne aldılar. Bir sonraki albümleri olan Soundtrack to Your Escape için Danimarka?da bir ev kiralayıp bunu tamamen bir stüdyoya çevirdiler ve bu albümleri ile yine bir başarı yakalayıp sayısız konserler verdiler.\r\n\r\nGrubun 2005 yılı sonunda tamamlanıp 2006 içersinde piyasaya sunulan Come Clarity albümleri bugüne yaptıkları en başarılı albüm olmuş ve pek çokları tarafından grubun yeniden doğuş albümü olarak nitelendirilmiştir. Çıktığı hafta içersinde tüm albüm satışları listesinde İsveç ve Finlandiya? da bir numaradan listelere girmiştir. Bütün bu başarıların yanında önemli bir hayran kitlesi tarafından grup müzik çizgisini ve ana felsefesini daha ticari bir tarza taşıdığı için eleştirilmektedir.', 'jJP5MqniJZo'),
(62, 'Necrophagist', 'Death Metal', 'Almanya', 'Grup, Almanya''da yaşayan gitar/vokal Muhammed Suiçmez tarafından kurulmuştur. 1992 yılında Almanya''nın Karlsruhe şehrinde müzik piyasasına giriş yapmıştır... 2 adet demo 2 de stüdyo albümleri bulunmaktadır.\r\n\r\nGrup elemanları bir araya geldikten kısa bir süre sonra stüdyoya kapanıp ilk demo kasetleri ?Requiems of Festered Gore?u kaydetti. Fakat bu demo hiç yayınlanmadı, sadece promosyon amacı ile gerekli yerlere gönderildi.', 'gA4oq7DBU8E'),
(63, 'Estatic Fear', 'Doom Metal', 'Avusturya', ' Avusturyalı grup Estatic Fear 1994 yılında kuruldu.Geleneksel doom/gothic melodileri ile klasik melodileri kaynaştırmasını çok iyi bilen grup ,aşırı karamsar melankolik doom- metal ile orkestra düzenlemeleri ve ud gibi otantik enstrumanları birleştirme yollarlı,flüt ve akustik gitralar ile kesinlikle çok çekici hoş bir hal almıştır.İkinci albümleri ile grup tamamen Matthias Kogler projesine dönüşmüştür.Bu albüm için bir çok müzisyen kiralanmış ve A Sombre Danse albümü çok özlü bir albüm olarak piyasaya çıkmasına çalışılmıştır.Grubun vokalleri death,black,clean,dişi ve piyano,flüt ve çello gibi ensturmanlardan oluşması tam manasıyla sek bir doom metal grubu değil birçok farklı tarzı harmanlamasını ve kaynaştırmasını bilen bir grup olarak ön plana çıkmıştır.Albümlerinin akustik ve atmosferik olmssı ise doom yanını vurgulamaktadır. Şarkı sözlerinde latince de kullanan grup ölü bir dil olan latinceyi tarzlarıyla bütünleştirmiştir...Somnium Obmutum albümünden sonra grup müzik faaliyetlerini bitirmiştir...', 'vNoAZbbw3cE'),
(64, 'My Dying Bride', 'Doom Metal', 'ingiltere', '1990 yılında İngiltere''de My Dying Bride''ın temelleri atıldı. Aaron, Rick, Andy ve Calvin uzun bir süre çalıştıktan sonra ilk demoları olan "Towards The Sinister" ı çıkardılar.25 Kasım 1990 yılında çıkan demo''da 4 şarkı olmak üzere 25 dakikadan oluşuyordu. Revolver Stüdyolarında kaydedilen demo Tim Walker tarafından kaydedilmişti.\r\n\r\nKlavye ve gitar görevini Andy''nin üstlendiği, Aaron''un vokallik yaptığı, Rick''in davula geçtiği, Calvin''in ise gitarda görev aldığı ve kadronun yavaş yavaş oturduğu demo''dan sonra The God Is Alone isimli single piyasaya sürüldü.\r\n\r\nÇalışmaların ardından beğenilen grup, başarısından dolayı Peaceville Records''un dikkatini çekti ve yeni bir albüm için bu şirket ile anlaşma yapıldı.\r\n\r\nGrup, ilk albümleri "As The Flower Withers" için Academy Stüdyolarına kapattılar kendilerini ve çalışmalarına hız verdiler. Sonunda ilk albümleri 1992 yılında Peaceville Records tarafından sürüldü. Grubun ilk albümü olmasına rağmen, albüm büyük bir ilgi gördü ve başarı elde etti. Ortalama 50 dakika süren albümde inişli çıkışlı notalar, duygu patlamaları grubun fan kitlesinin oluşmasına neden oldu.\r\n\r\nBütün grupların yapamayacağı birşey vardırki, My Dying Bride bunu ilk albümlerinde hissettirmişti; sözlerini notalar üzerinde yüzdürmek ve o harikulade sesle bunu yaşatmak... Kuşkusuz Aaron''un sesinin mükemmelliği diğer albümlerde daha da belirginleşecekti..\r\n\r\nAlbümde; Silent dance, Sear me, The forever people, The bitterness and the bereavemen, Vast choirs, The return of the beautiful, Erotic literature olmak üzere 7 şarkı bulunuyordu.\r\n\r\nGrup yeni albümleriyle birlikte Avrupa turnesine çıktı ve turnelerin ardından diğer Ep''leri olan "The Thrash Of Naked Limbs" i 1993 yılında kaydettiler. Kayıtlar sonrasında gruba o efsanevi kemancı olan Martin katıldı.\r\n\r\nEp''nin ardından grup tekrar Avrupa turnesine çıktı. Turneler oldukça başarılıydı fakat havanın soğuk olması hastalıklara neden oldu, bu da konserlerin gecikmesine ve turnelerin uzaması için iyi bir sebepti.\r\n\r\nTurnelerden dönen grup tekrar kendini stüdyolara kapattı ve "Turn Loose The Swans" albümü bu zamanda piyasaya sürüldü. Albümk kapak tarasımı grubun vokali Aaron Stainthorpeun tarafından hazırlandı. 1993 yılının Haziran ayında İngiltere''de, Peaceville Records imzası taşıyan albüm diğer albümler gibi My Dying Bride''ın tarzını açık bir şekilde ortaya koyduğunu gösteriyordu. Melodiler ve sözler bütünlüğü sağlarken, doom çevresi tarafından ilgi gören My Dying Bride yeni albüm için tekrar çalışmalara başladı. Stüdyo çalışmalarına başlamadan önce grup konserler verdi, yol durumu yüzünden birkaç küçük kaza yaşayan grup üyeleri diğer albüm için tekrar Stüdyo''ya girdi...\r\n\r\nBir sene boyunca kendini çalışmalara veren grup o güzel albümlerden biri "The Angel And The Dark River" ı yayınladı. 1995 yılının Şubat ayında çıkan albüm gene Peaceville imzasını taşıyordu ve Academy Stüdyolarında kaydedilmişti.\r\n\r\nAlbüm şaşırtacak kadar başarılı 6 şarkıdan oluşuyordu ve şu ana kadar yapılmış en güzel My Dying Bride albümlerinden biriydi. Keman ve Aaron''un sesi birleşince harika bir albüm ortaya çıkmıştı. Doom çevresi tarafından çok beğenilen albüm iyi bir ilgi gördü, melankoli sonuna kadar yaşanıyordu ve taşıdığı sözler ritimler keman ve o kendine has güzelliğiyle Aaron''un içinden çıkılmaz sesi müziğin insanı ne derece etkileyebileceğini anlatıyordu.\r\n\r\nAlbümde; The Cry of Mankind, From Darkest Skies, Black Voyage, A Sea To Suffer in, Two Winters Only, Your Shameful Heaven ve The Sexuality of Bereavement adında 6 şarkı bulunuyordu.\r\n\r\nBu başarılı yapının ardından bir Avrupa Turnesine çıkıldı. Albümün başarısı konserlere yansıyor, canlı performansları fanları büyülüyordu. 1995 yılının sonunda "Trinity" çıktı karşımıza.. Albüm İngilterede kaydedilmişti ve dokuz şarkı bulunuyordu; Symphonaire Infernus Et Spera Empyrium, God Is Alone, De Sade Soliloquay, The Thrash Of Naked Limbs, Le Cerf Malade, Gather Me Up Forever, I Am The Bloody Earth, The Sexuality Of Bereavement, Crown Of Sympathy (Remix).. Kuşkusuz mükemmel bir albüm olduğu söylenemezdi, fakat inişli çıkışlı melodiler, gitarlardaki agresif tonlar ve o keman sesi albümün iyi bir satış elde etmesini sağladı. Aaron''un clean vokal yaparak söylediği bir şarkı vardıki 2000 yılında en iyi My Dying Bride şarkısı olarak seçildi "The Crown Of Sympathy" .\r\n\r\n1996 yılında grup bir sessizliğe büründü ve biraz daha çalışarak biraz daha para ödeyerek "Like Gods Of The Sun" ı yayınladı bizlere.. Peaceville Records imzasını yaşıyan albümün editörlüğü Andy Green tarafından yapılmıştı. Albümde 9 şarkı vardı; Like Gods Of The Sun, The Dark Caress, Grace Unhearing, A Kiss To Remember, All Swept Away, For You, It Will Come, Here In The Throat ve For My Fallen Angel ...For My Fallen Angel kemanın ağladığı bir şarkıdır. Derinden hissedilir doom''un etkisi.. Bir çok yerde Aaron''un ölen sevgilisine karşı yazdığı ağıt olarak geçer.\r\n\r\nTurlara yolunda başarılı olan bir diğer grup "Cathedral" ile birlikte devam edildi. Herşey bu kadar güzel gitmeyecekti kuşkusuz. Davulcu Rick turneler sırasında sakatlandı ve uzun bir süre çalamadı bunun sonucunda gruptan ayrıldı ve My Dying Bride yeni bir davulcu aramaya başladı. Rick''in yerine Dominion grubundan Bill Law geldi ve Rick''in yerine çalan Martin gruptan ayrıldı. Grup yeni düzene alışmakta pek fazla zorlanmadı ve çalışmalara ara vermemek istercesine yeni bir albüm ile karşımıza çıktı; "34.788% ..." Albüm çıkışından sonra gruba geçici olarak katılan davulcu Bill Law yerini Anathema''dan tanıdığımız Shaun Steels aldı. 34.788% albümü müzikal açıdan birçok eleştiri görsede olumlu tarafları olmuştur elbette. 1998 yılında çıkan albümün imzasını yine Peaceville yaşıyor. Martin''in eksikliği albümde hissediliyordu ve fanlar tarafından diğer My Dying Bride albümlerine göre az ilgi gördü.\r\n\r\nAlbümün ardından verilen konserler sonrasında Johnny Maudlin klavyeye geçti ve 1999 yılının Kasım ayında "The Light At The End of the World" yayınlandı. Her albümde olduğu gibi bu albümde de Peaceville imzası vardı. 9 şarkıdan oluşan albüm; She Is The Dark, Edenbeast, The Night He Died, The Light At The End Of The World, The Fever Sea, Into The Lake Of Ghosts, The Isis Script, Christliar ve Searme III''den oluşuyordu.\r\n\r\nKuşkusuz bir sevgiliye yazılabilecek aşkı anlatabilecek en güzel doom şarkılarından birisiydi Searme ve My Dying Bride bu şarkıyı ne zaman, nerede kullanacağını çok iyi biliyordu. Albümün geneline bakıldığında her albümde yakaladığı başarıyı devam ettiren grubun, bu albümde de başarılı olduğu söylenebilir ki bir çok My Dying Bride fan''ları tarafından çok beğenilir. Bu albümde gruba Hamish Glenncross gitar''da katılmıştı.\r\n\r\n2000 yılında grup 10. yılını tamamlamıştı bunun ürünü olarak 2001 yılında "The Dreadful Hours" çıktı karşımıza.. Andrew Craighan editörlüğünü yapmıştır. Grup üyelerinin röportajlarındaki yorumlarına göre en çok sevdikleri albümleridir "The Dreadful Hours".. ve aynı melankoliyi hissettirir. Kuşkusuz diğer albümlerinden pek bir farkı yoktu ama dinledikçe şarkı başlıkları, sözlerdeki duygunluk bu albümü biraz daha estetik gösteriyordu. The Dreadful Hours, The Raven and the Rose, Le Figlie della Tempesta, Black Heart Romance, A Cruel Taste of Winter, My Hope the Destroyer, The Deepest of all Hearts, The Return To The Beatiful albümde yer alan parçalardır.\r\n\r\n2001 yılında verdiği konserlerden sonra grup, "Voice Of The Wretched" adıyla Hollanda''da verdikleri konseri DVD formatında yayınladı. Aynı yıl bir diğer DVD "For Darkest Eyes" ı piyasaya sürdüler.\r\n\r\n2004 yılına geldiğimizde My Dying Bride''ı "Songs Of Darkness, Words Of Light" isimli çalışmalarıyla gördük. Albümde The Wreckage Of My Flesh, The Scarlet Garden, Catherine Blake, My Wine In Silence, The Prize Of Beauty, The Blue Lotus, And My Fury Stands Ready ve A Dommed Lover adında 8 şarkı var.Daha iyi bir albüm olabilirmiş çünkü geçmişteki albümlere bakıldığında beyninizi sarsacak kadar başarılı olan çalışmalar var. Albümde dikkatleri üzerine çeken şarkılardan birisidir ki "My Wine In Silence" fanları tarafından yapılan anketlerde en iyi My Dying Bride şarkısı sıralamasında "For My Fallen Angel" dan sonra gelir..\r\n\r\nDiğer albümleriyle kıyaslanırsa çok iyi bir yapıt olduğu söylenemez. Bir çok grupta da olduğu gibi My Dying Bride zamanla değişmiş tarzını oturtmuş ve bu tarz üzerinde yeni yapıtlar üretmeye devam etmiştir. Son olarak 2005 yılının Ağustos ayında "Sinamorata" adlı DVD sini piyasaya sunmuştur. Fanları tarafından çekilmiş oldukça iyi sahneler var içinde. ', 'UUZPaC2CEsQ'),
(65, 'Jeff Loomis', 'Groove Metal', 'Amerika', 'Jeff Loomis; 14 Eylül 1971 tarihinde doğmuştur ve Seattle, A.B.D. kökenli Progressive/Thrash Metal grubu Nevermore''un lead gitaristidir.Kuruluşundan beri (1991) kadrosunda bulunduğu Nevermore ile çıkardığı 7 stüdyo albümünün yanı sıra 2008 yılında "Zero Order Phase" isimli solo albümünü de piyasaya sunmuştur.Metal dünyasının en yetenekli gitaristleri arasında gösterilmektedir.', '9Vwk3-a0k7c'),
(66, 'Lamb Of God', 'Groove Metal', 'Amerika', 'Lamb of God, 5 kişiden oluşan eski adıyla Burn The Priest olarak bilinen Amerikalı Metalcore grubudur. Kendi müziklerine verdikleri isim ise "Pure American Metal"''dir. Grup hızlı gitar riffleri, farklı davul partisyonları, Brutal ve Scream vokalleri ile bilinmektedir. Grubun kökenleri 1990 yılına, Mark Morton, Chris Adler ve John Campbell''ın Virginia Commonwealth Üniversitesindeki ev arkadaşlıklarına kadar uzanmaktadır. Chris Adler''ın da Mark Morton''un da Bass çalması ilk aşamada problem olsa da bu sorun aşılmış ve Chris Adler 22 Yaşında Davula başlamıştır. Mezuniyetten sonra Morton Yüksek Lisans eğitimi için Chicago'' ya gitmesine rağmen grup çalışmalarına devam etmiştir. Bir süreliğine Morton yerine yeni gitarist Abe Spear gruba katılmıştır. Grup enstrümantal müziklerinin ötesine geçmeye karar verdiklerinde, Randy Blythe aralarına katılmıştır.\r\n\r\nKariyerlerinin bu noktasında grup Burn the Priest olarak bilinmekteydi. Morton''un aralarına tekrar katılmasından kısa bir süre sonra Burn the Priest kendi adıyla ilk albümünü çıkarttı. Daha sonra Abe''nin gruptan ayrılmasıyla boşalan yere Chris Adler''in kardeşi Willie Adler geldi.\r\n\r\nGrubun tarzı genel olarak Death Metal etkileşimli Thrash Metal ya da Post-Thrash olarak kabul edilmesine rağmen, "gerçek metal" hayranları grubun tarzını Metalcore olarak kabul ederler. Grubun çalış sitili standart olmayan müzik yapısıyla donatılmış çok teknik ve hızlı çalınan enstrümantal öğelere dayanır. Gitar rifflerinde doğu gamları ve hicaz makamı kullanılır.\r\n\r\nŞarkı sözlerinin temaları temel olarak, politika, kapitalizm ("As the Palaces Burn","Vigil"), Amerikan tarihi ("In Defense of Our Good Name"), savaş ("Ashes of the Wake"), din ("Ruin"), madde bağımlılığı ("11th Hour", "Pariah") ve diğer çeşitli konuları içermektedir.\r\n\r\nCampbell tarzlarını, "Yaptığımız müzik progressive ve geleneksel rock arasındaki çizgide dolaşıyor." şeklinde ifade ediyor. "Progressive rock'' ı kendi öz temasını ucuzlatmadan daha dinlenebilir bir şekilde yaptığımızı düşünüyorum. Müziğimizin karmaşıklığı teknik çalınan müzikten hoşlanan dinleyicilere hitap etmekle birlikte aranjmanlarımız, ortalama bir dinleyiciye hitap etmekten daha ileride değil. Bu gerçekten iyi bir denge."\r\n\r\nProsthetic Records'' dan çıkarılan iki iyi albüm ve bir DVD (Terror and Hubris)'' den sonra, grup 2003 yılının sonunda Epic Records ile yeni bir kayıt anlaşması imzaladı. "Ashes Of The Wake" etiketiyle çıkan ilk albümleri A.B.D'' de bugüne kadar 250,000 kopya sattı ve Billboard Top 200 listesinde 27. sıraya kadar yükseldi.\r\n\r\n29 Ağustos 2005 tarhinide grup, Killadelphia isimli DVD'' sini duyurdu. DVD grubun Ekim 2004'' de Philadelphia'' daki canlı performanslarıyla birlikte, 3 video klip ve grup ile ilgili pek çok görsel materyal içermekte. Ocak 2006 tarihinde grubun son albümü Sacrament piyasaya çıktı.\r\n\r\nWalk With me In Hell Dvd''si de piyasaya çıkmış ve büyük başarı toplamıştır.\r\n\r\nÖlüm Duvarı\r\n\r\nÖlüm Duvarı (Wall of Death) Lamb of God konserlerinde genellikle son şarkı olarak seslendirilen Black Label'' da gerçekleştirilen çılgın bir olay. Kalabalık, şarkının baslamasıyla birlikte sahnenin dibine kadar yaklaşıp geniş bir çember oluşturuyor ve Randy'' nin işaretiyle birlikte vahşi ve saldırgan bir biçimde ortaya doğru koşuyorlar (moshing).\r\n\r\nKonserdeki izleyicilerin yaralanmasından dolayı Randy Blythe artık Black Label boyunca Ölüm Duvarını (The Wall Of Death) idare etmiyor. ', 'yM-qr0cSdfo'),
(67, 'Nevermore', 'Groove Metal', 'Amerika', ' Sanctuary''den ayrılan Warrel Dane ve Jim Sheppard''ın 1990'' ların başında temellerini attığı Seattle / Amerika kökenli progressive/thrash metal grubudur.\r\n\r\nGenelde Power Metal yaptığı düşünülse de, grubun tarzını kategorize etmek biraz zor olabilir zira soundları Power metal, Thrash metal, Progressive metal, Traditional heavy metal''den elementler içermektedir. Bunun yanısıra, "This Godless Endeavor" albümünde kullandıkları kalın akort edilmiş, hızlı yürüyen gitar riffleri ile Death Metal karakteristiğini kullandıkları da söylenebilir. Grup bunların dışında; Groove metal, Technical Speed metal, Technical Thrash metal, Progressive Power/Thrash metal, Death/Thrash metal, ve Melodic Thrash metal gibi birçok farkı tarzdan öğeler barındırmaktadır. Buna ek olarak 2006 yılında Warrel Dane ile yapılan bir röportajda; Dane tüm bu görüşlere açıkça karşı çıkmamakla beraber, "Şunu söyleyebilirim ki; Power Metal yaptığımızı sanmıyorum." demiştir.', 'vjQ63uB__OA'),
(68, 'Pantera', 'Groove Metal', 'Amerika', 'Pantera, 1981 yılında Teksas''ta kurulan bir heavy metal grubudur. Klasik thrash metal gruplarından Slayer, Metallica, Megadeth ve Anthrax ile birlikte heavy metal tarihinin çok önemli gruplarındandır.Pantera sözcüğü birkaç dilde panter anlamına gelmektedir,fakat Pantera isminin kendisi grubun memleketi olan Pantego, Teksas''tan üretilmiştir. Pantera, 1981 yılında davulda Vinnie Paul Abbott, gitarda kardeşi Dimebag Darrell Abbott, bas gitarda Tommy Bradford, vokalde Donnie Hart ve gitarda Terry Glaze kadrosu ile kuruldu. Grup, ilk başlarda yerel klüplerde sahne alıyor ve etkilendikleri gruplardan(Kiss ve Van Halen gibi) parçalar çalıyordu. Öte yandan glam metal türünde kendi parçalarını da yazıyorlardı. 1982 yılında vokalist Donnie Hart''ın ayrılmasıyla vokali Terry Glaze devraldı. Daha sonra basçı Tommy Bradford yerine de, Abbott kardeşler gibi grubun dağılışına kadar kalacak olan Rex Brown kadroya dâhil oldu.\r\n\r\nGlam dönemleri\r\n\r\n1983''ten itibaren vokalist Terry Glaze ile üç albüm yayınladılar(Metal Magic,Projects in the Jungle ve I Am the Night). Terry Glaze kendi grubu Lord Tracy''yi kurmak için Pantera''dan ayrılınca yerine Phil Anselmo gruba katıldı. Phil Anselmo ile yine glam metal tarzında olan Power Metal adlı albüm kaydedildi. Daha sonraları grup bu dört albümü kendileri bile görmezden geliyorlardı ki resmi sitelerinde bile bu dört albüm yer almamaktadır.\r\n\r\nYeni Bir Tarz ve Efsanenin Doğuşu\r\n\r\nGlam Metal tarzındaki 4 albümden sonra grubun asıl çıkışı 1990 tarihli Cowboys From Hell albümüyle oldu. Bu albümde Pantera''nın müziği belirgin olarak klasik heavy metal etkilenimlerine sahipti ve vokalde de Rob Halford stili dikkat çekiyordu. Gitarist Dimebag Darrell''ın riffleri ve soloları da önceki albümlerden farklı olarak oldukça keskin ve karmaşıktı. Grubun yeni tarzı power groove olarak da anıldı. Birçok fan ve hatta Pantera''nın kendisi bile Cowboys From Hell''i ilk resmi albümleri olarak kabul ediyordu. Bu albüm ayrıca grubun popüler hitleri Cemetery Gates ve çoğu kişi tarafından bir groove metal marşı olarak görülen Cowboys From Hell''i de içeriyordu.\r\n\r\nGrubun en önemli patlaması 1992 tarihli Vulgar Display of Power''la oldu. Bu albümden eleştirmenler ve fanlar arasında sık sık grubun en önemli işi olarak bahsedildi. Açılış şarkısı "Mouth for War", hızlı ve agresif "Fucking Hostile", ana riffi çok ünlü olan "Walk" albümdeki en popüler parçalar olarak yerini aldı.\r\n\r\n90''ların başında fırtına gibi esen Pantera''nın başarısı 1994''te çıkar çıkmaz Amerikan listelerine bir numara olarak giren ve bu başarıya ulaşan ilk metal albümü olan Far Beyond Driven ile devam etti. Albümün en tanınmış hiti I''m Broken ve bir diğer klibi Five Minutes Alone, MTV müzik kanalında sık sık kendine yer buldu. Far Beyond Driven, "En İyi Metal Performansı" dalında 37.Grammy Ödülleri ne aday oldu.\r\n\r\nPantera''nın sonraki albümü, The Great Southern Trendkill, 1996 yılında, grunge''ın yükselişi ve rap metal''in doğuşu sırasında piyasaya sürüldü. Bu albüm, çıkarıldığı zamanın da etkisiyle orta derecede ilgi gördü ve sık sık Pantera''nın "gözden kaçan" albümü olarak nitelendi. Vokalist Phil Anselmo bu albümün vokallerini Nine Inch Nails grubunun vokalisti Trent Reznor''ın stüdyosunda kaydetti. The Great Southern Trendkill, grubun diğer albümlerine göre daha karanlık ve sert bir atmosfere sahipti. Sözlerde, vokalist Phil Anselmo''nun bu albümden önce uyuşturucu sebebiyle yaşadığı sorunlar(aşırı dozda uyuşturucudan yaklaşık 4 dakikalığına kalbi durmuştur) ve etkileri, özellikle "Suicide Note pt.1,pt.2" ve "Living Through Me(Hell''s Wrath)" adlı parçalarda açıkça görülebilmektedir. Bu albümün en beğenilen parçasının, albümde klibe sahip olan tek şarkı olan "Drag the Waters" olduğu söylenebilir.\r\n\r\nGrubun canlı performanslarından bazıları, 1997 tarihli Official Live:101 Proof adlı albümde toplanmıştır. Albümde 14 canlı parçanın yanında daha önce yayınlanmamış 2 parça("Where You Come From" ve "I Can''t Hide") yer alır.', 'WyczwqRD2NI'),
(69, 'Warrel Dane', 'Groove Metal', 'Amerika', 'Warrel Dane, (7 Nisan 1961), progressive/thrash metal grubu Nevermore''un vokalidir. Daha önce Sanctuary''de vokal yapmıştır. 5 sene opera eğitimi almıştır ve çok geniş bir ses aralığını kullanmaktadır (Hocasının dediğine göre 5-6 oktav arası).Ayrıca Warrel, sertifikalı bir aşçıdır ve Seattle, A.B.D.''de bir restoranı vardır.İlk solo albümünü 13 Mayıs 2008 de "Praises to the War Machine" ismiyle çıkarmıştır.', 'tz0yhRIySAA'),
(70, 'A Perfect Circle', 'Hard Rock', 'Amerika', 'A Perfect Circle (APC olarak da kısaltılır, anlamı "kusursuz çember"), gitarist Billy Howerdel tarafından kurulmuş alternatif rock yapan bir müzik grubu.\r\n\r\nBilly Howerdel Nine Inch Nails, The Smashing Pumpkins, Fishbone ve Tool gibi gruplarda gitar teknisyeni olarak çalışmıştır. Kendi müziğinin demolarını Tool grubunun vokalisti Maynard James Keenan''a dinlettiğinde, Keenan''dan vokalisti olacağı bir grup kurması teklifini almıştır. Howerdel ilk başlarda bir kadın vokal düşündüğü için kararsız kalmış, ancak daha sonra teklifi kabul etmiş ve 1999''da A Perfect Circle kurulmuştur. Tool''daki karakterinden ayrılmak için Keenan, APC''nin tüm kliplerinde, fotoğraf çekimlerinde ve canlı performanslarında diğer zamanlarda saçsız olan başına uzun peruklar takmıştır.\r\n\r\nA Perfect Circle isminin kaynağına ilişkin iki tahmin vardır. İlki, Orta Çağ''da müziğin notalara dökülmesi konusunda tek otorite olan rahip sınıfının, Hıristiyan inancındaki üçlemeye gönderme olarak, üç parçalık müziği mükemmel olarak kabul etmesi ve nota yazımının başına bu üçlü mükemmelliğin simgesi olan bir daire koymasıdır. Diğer tahmin ise, ismin Mer de Noms albümünde yer alan, Yunan mitolojisindeki Agememnon''un oğlu Orestes''in hikayesine göndermeler içeren Orestes parçasında yer alan "Pull me into your perfect circle" (beni mükemmel dairenin içine çek) satırlarından geldiğidir. Ancak bu iki teori de yanlış çıkmış, Maynard Keenan yaptığı bir açıklamada "A Perfect Cirle" isminin grup üyeleri arasındaki arkadaşlıktan geldiğini, grubun "mükemmel bir arkadaşlık çemberi" (a perfect circle of friendship) olduğunu söylemiştir.', 'O5xuY3OFHvA'),
(71, 'AC DC', 'Hard Rock', 'Avustralya', 'AC/DC Angus and Malcolm Young kardeşler tarafından 1973 yılında Sydney?de kurulmuş Avustralyalı hard rock grubudur. Her ne kadar grup hard rock ve heavy metalin öncülerinden kabul edilse de grup üyeleri yaptıkları müziği rock and roll olarak tanımlamaktadır.\r\n\r\nGrubun ilk albümü High Voltage 1975 yılında yayımlayana kadar kadrosunda birçok değişiklik yaşadı. 1977 yılında basçı Mark Evans?ın yerine Cliff Williams?ın geldi. 1979 yılında grup büyük başarı sağlayan Highway to Hell adlı albümünü yayımladı. 19 Şubat 1980 günü grubun solisti Bon Scott yüksek miktarda alkol aldıktan sonra öldü. Grup kısa bir süre müziği bırakmayı düşündüyse de sonunda Scott?ın yerine Geordie grubundan Brian Johnson?ı kadrosuna katarak yoluna devam etti. Aynı yıl grup bugüne kadar en fazla satış yapan Back in Black albümünü yayımladı.\r\n\r\nGrubun bir sonraki albümü For Those About to Rock We Salute You da büyük başarı sağladı ve grup bu albümle ilk defa ABD?de bir numaraya yükseldi. Grubun popülaritesi 1983 yılında davulcu Phil Rudd?ın gruptan ayrılmasının ardından azalmaya başladı. 1990 yılında çıkan The Razors Edge albümüne kadar grubun albüm satışları düşük kaldı. Phil Rudd 1994 yılında gruba döndü ve 1995 yılında çıkan Ballbreaker albümünde yer aldı. 2000 yılında Stiff Upper Lip piyasaya çıktı ve eleştirmenler tarafından beğenildi. Grubun son albümü Black Ice 20 Ekim 2008 tarihinde piyasaya çıkmış ve bu albümle grup Back in Black?ten bu yana Birleşik Krallık?ta ilk defa bir numaraya yükselmiştir.\r\n\r\nAC/DC bugüne kadar 69 milyonu ABD?de olmak üzere dünya çapında 200 milyonun üzerinde albüm satmıştır. Back in Black albümünün dünya çapında 42 milyon sattığı tahmin edilmektedir. Albüm ABD?de 22 milyon adet satarak bu ülkede en fazla satış yapan beşinci albüm olmuştur. AC/DC VH1 müzik kanalının «Hard Rock?ın en büyük 100 sanatçısı» sıralamasından dördüncü sırada ve MTV?nin «Tüm zamanların en büyük heavy metal grupları» listesinde de yedinci sırada yer almıştır. 2004 yılında ise grup Rolling Stone dergisinin «Tüm zamanların en büyük 100 sanatçısı» listesinde 72. sırada yer almıştır.\r\n\r\n(Dave Evans dönemi)\r\n\r\n1973?ün Kasım ayında AC/DC?yi kuran Malcolm ve Angus Young kadroya ilk olarak basçı Larry Van Kriedt, solist Dave Evans ve davulcu Colin Burgess?i aldılar. Grup ilk konserini 1973?ün yılbaşı gecesi Sydney?deki Chequers adlı klüpte verdi. Daha sonra Albert Productions ile Avustralya ve Yeni Zelanda?yı kapsayan bir plak anlaşması yaptılar. İlk kadro sık sık değişikliğe uğradı. Colin Burgess gruptan ilk kovulan eleman oldu. Sonraki bir yıl boyunca bir dizi basçı ve davulcu kadroda yeraldı.\r\n\r\nBu dönemde Angus Young kendisiyle özdeşleşen okul formasıyla sahneye çıkmaya başlamıştı. Rivayete göre sahnede başlangıçta Sydney?de gittiği okulu Ashfield Boys High School?un formasını giyiyordu. Angus okul forması dışında Örümcek Adam, Zorro, gorilla ve Süpermen?in parodisi Super-Ang kostümleriyle de sahneye çıkmıştı. İlk dönemlerde grubun diğer üyeleri de sahneye farklı saten kıyafetlerle sahneye çıkıyorlardı. Ancak Melbourne?lu grup Skyhooks?un da benzer şekilde sahneye çıkıyor olmasından dolayı bir süre sonra bundan vazgeçildi.\r\n\r\nYoung kardeşler Dave Evans?ın daha ziyade Gary Glitter benzeri bir glam rockçı olmasından ötürü grup için uygun bir solist olmadığına karar verdiler. Zaman zaman Evans?ın yerini grubun ilk menajeri Dave Laughlin alıyordu. Evans?ın Laughlin ile kişisel sorunları grupla zaten sorunlu ilişkisini daha da kötü hale getirdi. Diğer taraftan George Young?ın arkadaşı solist Bon Scott gruba katılmak istiyordu.\r\n\r\nBon Scott dönemi: 1974-1980\r\n\r\n1974?ün Eylül ayında Dave Evans?ın yerine Bon Scott geldi. Grup Evans ile yalnızca «Can I Sit Next to You, Girl» / «Rockin? in the Parlour» bir tekli kaydedilmişti. Şarkı daha sonra Bon Scott ile birlikte «Can I Sit Next to You Girl» adıyla yeniden kaydedildi.\r\n\r\n1975?in Ocak ayında yalnızca Avustralya?da yayımlanan High Voltage kaydedildi. On günde kaydedilen albüm Young kardeşlerin enstrümental bestelerinin üzerine Bon Scott?un sözlerini yazdığı şarkılardan oluşuyordu. Birkaç ay sonunda grup basçı Mark Evans ve davulcu Phil Rudd?ın katılımıyla istikrarlı bir kadroya kavuştu. Aynı yıl «It?s a Long Way to the Top (If You Wanna Rock ?n? Roll)» adlı tekli yayımlandı. Şarkı grubun yine sadece Avustralya ve Yeni Zelanda?da yayımlanan ikinci albümü T.N.T.?de yeraldı.\r\n\r\n1974 ve 1977 yılları arasında Molly Meldrum?un Avustralya televizyonundaki Countdown adlı müzik programında sık sık yerlan AC/DC ülkedeki en popüler ve başarılı gruplardan biri haline geldi. 3 Nisan 1977 günkü performanslarının ardından grup sonraki yirmi yıl boyunca televizyonda çalmadı.\r\n\r\n1977-1980\r\n\r\n1976 yılında grup Atlantic Plak ile uluslararası bir plak anlaşması yaptı ve Avrupa?yı kapsayan bir turneye çıktı. Black Sabbath, Aerosmith, Kiss, Styx ve Blue Öyster Cult gibi önde gelen hard rock gruplarının önünde çaldıkları stadyum konserlerinde büyük tecrübe kazandılar.\r\n\r\nTüm dünyada dağıtımı yapılan ilk AC/DC albümü High Voltage ve T.N.T. albümlerindeki parçalardan derlenmişti. 1976 yılında Atlantic Records?dan çıkan ve yine High Voltage adını taşıyan albüm Britanya?daki punk dinleyicileri arasındaki popüleritesinin de etkisiyle tüm dünyada üç milyon adet sattı. Albümdeki parçalar ağırlıklı Avustralya?da çıkan ikinci albümleri T.N.T. albümünden seçilmişti. Grubun bir sonraki albümü Dirty Deeds Done Dirt Cheap Avustralya?da ve dünyanın geri kalanında iki farklı versiyonla yayımlandı. Albüm ABD?de 1981 yılına kadar yayımlanmadı.\r\n\r\n1977?de piyasaya çıkan Let There Be Rock adlı albümün ardından basçı Mark Evans Angus Young ile yaşadığı kişisel uyuşmazlıklar yüzünden gruptan atıldı. Yerine Cliff Williams geldi. Young kardeşlerin ikisi de Evans?ın gidişine fazla bir açıklık getirmezken Epic Records?un CEO?su Richard Griffiths sonradan «Mark Evans?ın çok dayanmayacağı belliydi. Gereğinden fazla kibar biriydi.» şeklinde yorumda bulunmuştu.\r\n\r\nAC/DC?nin ABD?ye ilk kez açılması 1977?de Michigan?daki radyo istasyonu AM 600 WTAC vasıtasıyla oldu. İstasyonun yöneticisi Peter C. Cavanaugh gruba Flint şehrindeki Capitol Theater?da bir konser ayarladı. Ön grubun MC5 olduğu gecede AC/DC «Live Wire» adlı parçayla başladığı konseri «It?s a Long Way to the Top (If You Wanna Rock ?n? Roll)» ile bitirdi.\r\n\r\nGrup Britanya basını tarafından punk rock ile özdeşleştirilmişse de 1970?lerin sonunda punk rock?ta yaşanan büyük değişikliklerin üstesinden bu ülkede edindikleri sadık dinleyici kitlesi sayesinde gelmeyi başardı.\r\n\r\nGrubun 1978 yılında basçı Cliff Williams ile ilk albümü Powerage?i yayımladı. Albümden çıkan «Rock ?n? Roll Damnation» 24 numaraya kadar yükselerek grubun o güne kadar listelerde en yukarı çıkan parçası oldu. Albümün ardından çıkılan turne sırasında Glasgow?daki Apollo Theatre?da verilen konserin kayıtları If You Want Blood You?ve Got It adıyla yayımlandı. Bu aynı zamanda Bon Scott?un solistliği döneminde Harry Vanda ve George Young?ın prodüktörlüğünü yaptığı son albümdü.\r\n\r\nProdüktörlüğünü Robert Lange?ın yaptığı grubun altıncı albümü Highway to Hell 1979 yılında yayımlandı. ABD?de 17 numaraya kadar yükselen albümle AC/DC önde gelen hard rock grupları arasına girdi. Geri vokallere her zamankinden daha fazla önem verilmekle birlikte albüm grubun müziğinin kendine has özelliklerini barındırıyordu.\r\n\r\nBon Scott?un ölümü: 1980\r\n\r\n19 Şubat 1980 günü Bon Scott Londra?da yüksek miktarda alkol aldıktan sonra arkadaşı Alistair Kinnear?ın arabasında sızdı. Ertesi sabah Kinnear Scott?u Camberwell?deki King?s College hastanesine götürdü ancak Scott hastaneye vardığında ölmüştü. Ölüm raporuna göre alkol zehirlenmesinden ölmüştü. Bon Scott ailesi tarafından Scott?un çocukluğunda göç ettikleri Batı Avustralya?daki Fremantle kasabasında defnedildi.\r\n\r\nÖlümüyle ilgili resmî açıklamalardaki tutarsızlıklar Scott?un aşırı dozda eroinden veya egzos zehirlenmesinden öldüğü ya da Kinnear diye birinin olmadığını öne süren komplo teorilerinde dile getirilmiştir. Ayrıca Scott astım hastasıydı ve öldüğü sabah hava sıcaklığı sıfırın altındaydı.\r\n\r\nBrian Johnson dönemi: 1980?den bugüne\r\n\r\nBon Scott?un ölümünün ardından grup elemanları bir ara müziği bırakmayı düşündüylerse de sonunda yola devam etme kararı aldılar. Scott?un yerine düşünülen solistlerden eski Moxy grubu üyesi Buzz Sherman sesindeki sorunlar nedeniyle gruba katılamadı. Back Street Crawler grubunun eski üyesi Terry Slesser ise kendini ispatlamış bir gruba katılmaktansa kariyerine solo olarak devam etmek istediğini söyleyerek yapılan teklifi reddetti. Grup üyeleri sonunda yeni solist olarak Geordie grubunun eski üyesi Brian Johnson üzerinde uzlaştı.\r\n\r\nDeneme provasında Johnson Let There Be Rock albümünden «Whole Lotta Rosie» ve Ike ve Tina Turner?dan «Nutbush City Limits» adlı parçaları seslendirdi. Johnson provadan birkaç gün sonra kadroya dahil edildi.\r\n\r\nGrup Back in Black albümü için Bon Scott ile başladığı sarkı yazma sürecini Brian Johnson ile tamamladı. Albümün kaydı Bahamalar?daki Compass Point Stüdyoları?nda yapıldı. Prodüktörlüğü Mutt Lange, kaydı da Tony Platt tarafından yapılan albüm grubun bugüne kadar en fazla satış yapan albümü oldu. Yayınlanmasından bir yıl sonra platin plak kazanan albüm 2006 yılı itibariyle ABD?de 22 milyondan fazla satış yaptı. Birleşik Krallık?ta bir numaraya yükselen albüm ABD?de de 4 numaraya kadar yükselip 131 hafta ilk onda yer alarak bu ülkede en fazla satan beşinci albüm oldu.\r\n\r\n1981 yılında yayımlanan bir sonraki albüm For Those About to Rock We Salute You da oldukça iyi satış yaptı ve eleştirmenlerden olumlu yorumlar aldı. Albümden çıkan «Let?s Get It Up» ve albümle aynı ismi taşıyan «For Those About to Rock» adlı tekliler Birleşik Krallık?ta sırasıyla 13 ve 15 numaralara kadar yükseldi. Grup üyeleri 1983 yılında çıkan Flick of the Switch adlı albümlerinde ilk yıllarındaki saf ve basit tarzı yakalamak için prodüktör Lange ile yollarını ayırarak albümün prodüktörlüğünü kendileri yaptılar.', 'X80Qjh9Yivs');
INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(72, 'Motörhead', 'Hard Rock', 'ingiltere', '24 Aralık 1945?te dünyaya gelen Ian Fraster, yani bizim tanıdığımız adıyla Lemmy Kilmister, müzikle ilk tanıştığında henüz dokuz yaşındaydı. Bundan üç dört yıl sonra Lemmy gitarını kaptığı gibi ilk grubu Rainmakers and Motown ile çalışmalara başladı. ?Black&The Rock in Vicars? veya sonraki adıyla ?Vicars? adlı ikinci grubunu kurduğunda ise henüz 19 yaşındaydı. Daha sonra sırasıyla ?Sam Gopal?s Dream? ve ?Raga Rock? adlı gruplarda çalan, ?Raga Rock? grubuyla bir de ?Opal Butterfly? adlı albüm çıkaran Lemmy?nin bir sonraki durağı ünlü grup Hawkwind olacaktı. Basçı eksikliği yüzünden gruba misafir sanatçı olarak alınan Lemmy, Hawkwind?in beş albümüne imza atmış ve grubun vazgeçilmez elemanlarından biri olmuştu.\r\n\r\nFakat Lemmy?nin Amerika - Kanada sınırında üzerinde uyuşturucu yakalatması Hawkwind?den atılmasına neden oldu. Kötü gibi görünen bu olay aslında bir efsanenin, Motörhead?in temellerinin atılmasıydu.\r\n\r\nLemmy bu gelişmeden sonra Bastards adinda bir grup kurdu. Menejerinin önerisiyle grubun ismi Lemmy''nin henüz Hawkwind?deyken yazdigi şarkinin adiyla degiştirilerek Motörhead oldu. Lemmy yanina Phlilty Animal Taylor ve Larry Wallis''i de alarak Motörhead''in ilk albümü On Parole''u 1976''da kaydetti. Ne var ki bu albüm ancak 1979''da yayınlanabilecekti. On Parole ile gördüğümüz kadarıyla grubun soundu klasik rock''n''roll temelleri üzerine oturmuştu ama klasik rock?n?rolldan çok daha hızlıydı.\r\n\r\nDaha sonra Fast Eddie Clark?ın gitarın başına geçip, Larry ile yolların ayrılmasıyla Motörhead?in efsanevi triosu oluşmuş oldu. Bu üçlü arka arkaya OverKill, Bomber, Ace of Spades ve Iron Fist adlı dört albümü yaptı. Sonuç tek kelimeyle mükemmeldi. Motörhead bu dört albümle ortalığı kasıp kavurdu. Bu dört ayrı klasik albümü birer veye birer buçuk yıllık aralıklarla yapmıştı grup, ve perfromansının en üst seviyelerindeydi. Grup bu albümlerle saf rock?n?roll?dan daha farklı bir tarza kaymıştı. Rock?n?roll?dan hard rock?a uzanan bir tarzdı bu. Ayrıca grup sadece stüdyoda değil, sahnede de başarılıydı ve şu anda bile en iyi live albümlerinden biri olarak gösterilen ?No Sleep ?til Hammersmith? 1981?de yayınlanmıştı. Bu, kesinlikle mükemmel bir konser albümüydü. Zaten benim Motörhead ile tanışmam da bu albümle olmuştu. 1981?de henüz hayatta değildim ama 1996?da albümü tesadüfen edinip dinlediğimde bu albüm beni fazlasıyla etkilemiş ve bir Motörhead fanı yapmaya yetmişti.\r\n\r\nİşte tam grubun bu en verimli çağında Fast Eddie grubu bıraktı. Eddie?siz çıkan Another Perfect Day albümü yine aynı sounddaydı ama vasatı aşamamış bir albüm olarak çıktı fanların karşısına. Üstelik Fast Eddie''nin yerine Thin Lizzy''den gelen gitarist Brian Robertson konserlerde Motörhead klasiklerini çalmayarak fanların büyük tepkisini toplamıştı. Suyu iyiden iyiye ısınan Robertson, gruptan kısa sürede ayrılacaktı. Ama bundan sonra çıkan Orgasmatron ve Rock?n?roll albümleri Another Perfect Day kadar başarısız değildi. İşte OverKill''den Rock''n''roll albümüne kadar olan bölümü Motörhead?in orta evresi olarak tanımlayabiliriz.\r\n\r\nAlbümler arasında küçük farklar olmasına rağmen genelde bu yedi albümlük seride Motörhead?in tarzı rock?n?roll ve hard rock arasında gidip geldi. Sound rock?n?roll olmasına rağmen ilk iki albümde bile Motörhead klasik bir rock?n?roll grubu değildi. Bunda en büyük faktör ise tabii ki Lemmy?nin o eşi benzeri bulunmayan vokaliydi. Enstrümanlar klasik rock kalıplarında olmasına rağmen Lemmy?nin vokali müziği çok farklı noktalara götürüyordu. Zaten daha sonra Phill Taylor?un dediği gibi Motörhead ne hard rock, ne death metal, ne black, ne white metal değildi, heavy metal hiç değildi. Grup soundunu heavy rock olarak tanımlıyordu.\r\n\r\nMotörhead''te köklü değişimler oluyordu. Another Perfect Day sonrası grubu bırakan Phill Taylor Orgasmatron albümünde Pete Gill''e ödünç verdiği bagetlerini Rock?n?roll albümünde geri alacaktı. Ayrıca Orgasmatron albümünde Motörhead bir geleneğini bozuyor, grup ilk kez üç kişiden dört kişiye çıkartılıyordu. Another Perfect Day?deki performans ve tavırlarıyla hem Lemmy?nin hem de fanların sabrını taşıran Brian Robertson yerine gruba iki yeni gitarist dahil olmuştu. Phill Campbell ve Wurzel adlı iki yeni gitaristin etkileri Orgasmatron''da pek belli olmasa da, Rock''n''roll albümünde kendini göstermeye başlamıştı. Rock?n''roll albümünü eline alan fanlar Orgasmatron albümünde yer almayan Phill Taylor''un gruba gelmesini büyük bir sevinçle karşıladılar. Grubun efsanevi bateristi yeniden evindeydi artık. Ve artık bence grubun en verimli kadrosu kurulmuş oldu. Oldu olmasına ama Rock''n''roll albümü yine o eski sounddaydı. Kimsenin buna itirazı yoktu aslına bakarsanız; ama ikinci gitar gereksizdi bu tarz için. Tek gitarla da çok rahat yapılabilirdi bu müzik, ikinci gitar çok fazla katkı sağlayamıyordu.\r\n\r\nLemmy de aynı şeyi düşünmüş olacak ki Rock?nroll albümünden tam dört yıl sonra çıkan 1916 albümüyle birlikte fanlarına çok büyük bir sürpriz yapmıştı. Artık Motörhead orta evresini tamamlamış, bir sonraki evreye geçmişti 1916 albümüyle. Eski Motörhead''ten çok aşırı farklı olmasa da yine de farklıydı bu tarz. Bir kere ikinci gitar çok güzel oturtulmuştu artık sounda. Motörhead?in heavy rock tanımlaması da işte tam bu sırada geldi Phill Taylor?dan. Son derece melodik bir hard?n?heavy albümüydü karşımızdaki. İçinde rock''n''roll''dan heavy metale, blues''dan hard rock''a kadar birçok öğe taşıyordu bu albüm ve sonuç tek kelimeyle mükemmel olmuştu. Benim en sevdiğim Motörhead albümü olan 1916?da eskiden farklı olarak bir de baladlar vardı, Motörhead ilk kez balad deniyordu ve sonuç son derece başarılıydı. Love Me Forever ve epik bir yapıda olan ve albümle aynı adı taşıyan 1916 fanlar tarafından da beğeniyle karşılanmıştı.\r\n\r\n1916''dan sonra çıkan March ör Die ve Bastards albümleri (Lemmy''nin içinde kalmış olacak ki albümün adını Bastards koydu) Philty Animal Taylor''un 1916''dan sonra gruptan geri dönmemek üzere tekrar ayrılmasına rağmen aynı başarıyı devam ettirdi. Bu üç albümlük seri gerçekten geçmişteki dört albümlük seri kadar başarılı olmasa da yine de bayağı başarılıydı.\r\n\r\nHer çıkışın bir inişi vardır. Motörhead yine üç albümlük bir seriye giriyordu. Grubun dördüncü evresi, Sacrifice albümüyle birlikte başlamış oldu. Sacrifice, diğer albümler kadar başarılı değildi, ayrıca grup o melodik soundunu terkediyordu yavaş yavaş. Kısacası Sacrifice albümü vasatı aşamadı. Sacrifice?dan sonra gelen Overnight Sensation ve Snake Bite Love da Motörhead''in eski günlerini çok ama çok aratıyordu fanlarına. Bu arada Overnight Sensation?da Wurzel?in ayrılmasıyla grup yine üç kişi kaldı. Kaldı kalmasına ama Motörhead''in müziği iyice monotonlaştı. Melodi kayboldu. Fanlar arasında Fast Eddie ve Phill Taylor?u gruba geri isteyenlerin sayısı giderek çoğalmaya başladı. Snake Bite Love yine de çok kötü değildi ama dediğim gibi, eski Motörhead''i aratıyordu. Bu arada özeleştiri yapmam gerekirse, Shit?zine?in ilk sayısında kritiğini yaptığım bu albümü, bir Motörhead fanı olarak, subjektif bir biçimde, Motörhead?e toz kondurmadan kritiklemiştim, gerçekten de toz konduramıyordum. Bence çok felaket bir albüm değildi ama ortada bir gerçek vardı ki Motörhead eski halinden çok uzaklardaydı. Bu üç albümlük evrede rock''n''roll ve blues etkileri kaybolmaya yüz tutmuş, dolayısıyla da ortaya sert ama yavan bir sound çıkmıştı. Melodik parçalar azınlıktaydı ve açıkçası grubu sadece Lemmy?nin o efsanevi sesi , bası ve karizması götürüyordu. ', '9e5cqe_JE0Q'),
(73, 'Black Sabbath', 'Heavy Metal', 'ingiltere', 'Black Sabbath`in elemanları bir işçi şehri olan Aston''da (Birmingham, İngiltere) birbirlerinden bir mil uzaklıkta yetiştiler. Genç John Michael ''Ozzy'' Osbourne (3 Aralık 1948) mahallenin kabadayısı Frank Anthony ''Tony'' Iommi (19 Şubat 1948) tarafından eziyet görüyordu. Öte yandan Terrance ''Geezer'' Butler (17 Temmuz 1949) ise gizem ve fanteziye kurulu bir dünyada yaşayan fazlasıyla asi bir serseriydi. Üçü de müziğe birbirlerinden habersiz başladılar ve farklı gruplarda çaldılar, ama çaldıkları gruplar çabucak sönüyordu. Sonunda kendilerini davulcu William Bill Ward''la ( 5 Mayıs 1948 ) birlikte aynı grupta buldular. 1967''de `Polka Turk`u oluşturdular. (Vokalde Osborne ,Iommi gitarda, bassta Butler, davulda Wards , ritmik gitarda Jimmy Philips ve saksofonda Acker.) Philips ve Acker sonradan atıldılar. Ve dörtlü kendisini Earth |Blues Company| olarak adlandırdı. Bu adı daha sonra kısaltarak `Earth` yaptılar. Blues ve rock müziği yapan grup bir çok yerel klüpte çalmaya başladılar ve hatta kendilerine küçük bir izleyici kesimi edindiler.\r\n\r\n1969 `da Iommi Jethro Tull ile birlikte çalmak için gruptan ayrılmasına rağmen birkaç ay sonra yeni bir fikirle eski grubuna geri döndü. İnsanların korkmak için korku filmlerine para verdiren fenomenden etkilenen Iommi korkunç müzik yapmaya karar verdi. Tarihin değişimi başlıyordu. Butler''in gizeme olan ilgisi ile gazlanan grup esrarlı ve düşündürücü sözleri olan şarkılar müziği insana korku veren şarkılar bestelemeye başladılar. Wicked World ve efsanevi şarkılarından biri olan Black Sabbath ''ıda içeren Black Sabbath albümünü 1930''ların Boris Karloff filmlerinden esinlenerek yine aynı isimle Black Sabbath olarak çıkarttılar. Kaderin tuhaf bir oyunu grubun gelişmekte olan kariyerini nerdeyse durduracak bir olay tam tersine çevirdi, grubu kendilerine özgün bir yere kavuşturdu. 1970''de daha kendi isimlerini taşıyan albümlerini çıkarmadan kısa bir süre önce Iommi bir iş kazası sonucu sağ elinin parmak uçlarını yitirdi. Solak gitarist hassas parmaklarıyla gitarin perdesine basmayı çok acı verici bulduğundan geçiçi olarak plastik parmaklık takmaya başladı, ayrıca daha alçak bir ses tonu vermek ve daha kolay çalmak için gitarin akordunu değiştirdi. Sonuç şarkılarının sözlerini yakalayan kasvetli, blues esintili temalarla birleşen derin, çamurlu ve boğuk bir sesti. Çoğunluğu Butler tarafından bestelenen şarkılar kötülük, şeytan, büyücülük ve savaş temalarına dayanıyordu. Black Sabbath 1970 de piyasaya çıktı ve İngiliz listelerinde 13. sıraya girdi. Arkasından 1971 de bunu gercek bir Heavy Metal albümü olan Paranoid izledi. Bu albümde Osbourne`un feryat eden vokellerinin dehşetli karışımı Iommi''nin akıcı, sürükleyici gitar rifleri Butler''ın gümbürdeyen bası ve Ward''ın coşkulu davulu albümü büyük bir ticari başarıya ulaştırırken War Pigs, Paranoid ve 99''da Grammy de "Best Metal Perfermance" alan Iron Man gibi heavy metal klasiklerini çıkarttılar. Paranoid isimli şarkı aslında Iommy''nin albümün sonunda kalan boşluğu kapatmak için aklındakı bir melodiyi diğer elemanlara söylemesiyle ortaya çıkmıştı.Parçaları gönderdikleri plak şirketi Paranoid''i o kadar beğendiki gruba bile haber vermeden albümün ismini Paranoid olarak değiştirdi. Paranoid İngiltere listelerinde 1 numara olurken, Amerika listelerinde 8 numaraya kadar çıktı. Takribi 1 sene listelerde yer alan albümle grup hem Atlantik''in iki yakasında mükemmel ve ateşli bir hayran kitlesi kazandı hemde platin plak aldı.\r\n\r\nGrubun müziği ve yaşam tarzları tutucu organizasyonlar ve aile grupları tarafından nefretle izlenmeleri sonucunu doğurdu. Bugüne kadar tüm üyelerinin çoğunluğunun sadık katolikler olmasına rağmen şeytanın kilisesi (Church of Satan) Black Sabbath''ın müziğini kucakladı ve grup üyeleri kendi bağlı oldukları kilise tarafından şeytana tapmakla suçlandı. Alkol ve uyuşturucuya dayalı çılgın yaşantıları haklarındakı söylentileri iyice arttırdı ve grup dünyadaki milyonlarca anne ve babanın korkulu rüyası oldu. Daha sonra aynı yıl Sweet Leaf adlı haşhaş taraftarı Into The Void ve Children Of The Grave destanlarından oluşan Master of Reality adlı albumu 1971''in Ağustosunda çıkardılar. Master Of Reality Amerikan listelerinde ilk ona girdi ve neredeyse bir sene bestseller olarak kalmayı basardı. `Volume 4` 1972''de yayınlandı. Los Angeles''taki Record Plant''ta kaydedilen albümdeki şarkı sözleri haşhaşin faziletlerini sürmekten kokainin yol açtığı deliliği anlatmaya dönüştü. Aslında bu grubun bir bakımada kendini anlatmasıydı. Bu albümde Supernaut ve Under The Sun gibi orjinal ötesi, güçlü sözlü şarkılara extra olarak melodik yönü ağır basan ve grubun müziksel simgelerinden biri haline gelen Laguna Sunrise ve Cornucopia enstrümentalleri yer alıyordu.\r\n\r\nHeavy Metal''in onaylı klasiklerinden birisi 1973''de yayınlanan Sabbath Bloody Sabbath, Killing Yourself To Live , Looking For Today ve en son Metallica tarafından coverlanan Sabbra Cadabra gibi tamamen aşmış şarkıları ile Sabbath''ın artık bir firma olduğunun kanıtı olup grup tarihinin zirve noktalarından biridir. Ancak şunu da söyleyebiliriz, bu Sabbath''ın son orjinal albümü ve son klasiğidir. 1975''deki Sabotage yarı istekli bir çaba olmasına rağmen grubun düzenleyiciliği , söz yazarlığındaki ustalıklarını ve yapımcılığını bir kez daha tüm dünyaya gösterdi. Synthesizers dünyasına talihsiz bir elektronik seyahatti, Techical Ecstasy( 1976) ve grubunda çöküş dönemiydi. Bir yandan grup üyelerinin kişisel yasantıları kontrolden çıkarken diğer taraftan iç gerginlik 8. albümü yazarken dayanılmaz bir hale gelmisşti. 1977''de Ozzy gruptan ayrıldı ve yerine eski Savoy Brown şarkıcısı Dane Walker getirildi. Never Say Die (1978) şarkısından kısa bir sure önce Ozzy gruba geri döndü ve bir sene sonra grubu temelli terk ederek 80 ve 90''larda basarılı bir şekilde tek başına kariyerini sürdürdü. (Kim ne derse desin harika bir solo kariyeri vardır.) Black Sabbath''ın geleceği pek de pembe gözükmüyordu. Eski Rainbow''un solisti Ronni James Dio''yu alan grup 80''lere Heaven and Hell ile ümit verici başladı. Ama Dio''nun 1982''de ayrılmasıyla vokalist pozisyonu bir döner kapıya benzemeye başladı. (eski Deep Purple Ian Gillan, Glenn Hughes ve Tony Martin) 1986''da Butler ve Ward dahi Black Sabbath terk etmişti. Sadece tek orjinal üye kalan lommi 1990''lara kadar albüm çıkarmaya devam etti. 1997''de Osborne, lommi ve Butler Ozzy nin Ozzfest Summer Fest turunda davulda Faith No More dan Mike Bordin''le tekrar sahnedeydiler. 4 Aralık 1997''de Ward Birmingham''daki NEC Konser Salonunda onlara katıldı. (1985''deki Live Aid de bir defalık şov ve 1992''deki kısa bir araya geliş sayılmazsa) bu 20 yıldan beri ilk kez orjinal Black Sabbath tarafından yapılan gercek bir şovdu. Bu şovda önemli noktalardan birisi de Sabbath''in ilk günkü gibi heyecan ve istekle çalmasının yanısıra Iommy''nin gözlerindeki gurur parıltısıydi. Şov sonunda yıkılmamış bir komutan edasıyla Iommy, davulunun önünde eğilen Wards ve Ward''in elini öpen bir Ozzy dikkatlerden kaçmayacaktı. Şovdan seçilen ve canlı parçalardan oluşan album 1998''de piyasaya çıkarıldı (Reunion) ve bunu dünya çapında bir tur izledi. Grubun Reunion''da yer alan ve bonus olarak düşünülmüş Psycho Man artık ellili yaşlarını aşmış bu dinazorlarin son hitleri idi. Black Sabbath günümüzde hâlâ yaşanan geri kafalılığa bundan tam 30 yıl öncesinden seslenmiş bir gruptur. Şarki sözleri aşktan sevgiden bahsetmeyebilir, kabul belki çok agresiftirler ama onların çocuklukları, yaşamları, hayatın bu agresifliği içinde geçmiştir. Ozzy 8 kardesiyle aynı odada yaşayan, çocukluğunu aynı pantalonla tamamlamış okula gitmesi gereken yaşta Birmigham''in demir madenlerinde, şehir mezbahasında çalışmıştır. Onların hiç bir zaman konserlerinde civcivleri ezdikleri, inekleri patlattıkları görülmemiştir. Bu konuda kayda geçen tek olay Ozzy''nin bir turne dönüşü sabah öten bir horozu tekmelemesi ve bir konserde sahneye atılan bir yarasayı Ozzy''nin oyuncak zannedip ısırmasından ibarettir.', 'NZyVZFJGX5g'),
(74, 'Blaze Bayley', 'Heavy Metal', 'ingiltere', 'Kendi adını taşıyan grubun solisti.Bir dönem Iron Maiden solistliği de yaptı.', 'qwAcnm46aZU'),
(75, 'Bruce Dickinson', 'Heavy Metal', 'ingiltere', 'Bruce Dickinson (d. 7 Ağustos 1958, İngiltere) Iron Maiden''ın vokalistidir ve solo albümler de yapmaktadır. Güçlü sesi ile dünyanın en önemli heavy metal vokallerinden biri olarak görülmektedir.\r\n\r\nDeep Purple''dan çok etkilenmiş olan Bruce ilk grubuna 1976''da girer. Grubunun adı önce Paradox sonra da Styx olmuştur. Ancak grup çok uzun süreli olmaz, dağılır ve Dickinson bir koleje yazılır.\r\n\r\n1977''de de Speed adını verdiği bir grup kurar. Bu grupta Bruce gitar da çalmaktadır. Man On The Streets adlı bir albüm yayınlarlar. Bir kaç konser verirler ama bu grubun da ömrü uzun olmaz.\r\n\r\nBu gruptan hemen sonra da Shots adlı bir gruba girer. Grup üyeleri onun vokalistliğine hayran kalmışlardı. Barlarda konser verirler ancak yeterli ilgili göremezler. Bir gün barda onu İzleyen daha ünlü bir İngiliz heavy metal grubu Samson''dan teklif alır ve daha büyük yerlerde çalma fırsatını kazandığı için hemen kabul eder.\r\n\r\nSamson yıllarında Bruce Dickinson, Bruce Bruce sahne adını kullanır. Grupla Head On ve Shock Tactics albümlerini yapar ve büyük turnelere çıkarlar. 1981''de verdikleri konser de Live at Reading ''81 adıyla yayımlanır ancak bu konser Dickinson''ın grupla son konseri olacaktır; çünkü Paul Di''Anno''nun gruptan çıkarılması sonrasında Steve Harris kendisine teklif götürür.\r\n\r\nIron Maiden dönemi Samson''da geçirdiği sorunlu dönemlerden sonra Bruce Dickinson rahatlamıştı. Eski grubuyla yaşadığı bir takım sorunlar nedeniyle yazım aşamasına katılamasa da Iron Maiden ile ilk albümü The Number Of The Beast büyük bir başarı kazandırdı. Sesinin gücü nedeniyle kendisine de The Air Raid Siren lakabı takıldı. 1982''te çıkan bu albümü birer seneyle takip eden albümler Piece Of Mind ve Powerslave de aynı başarıyı devam ettirdiler. Gitarist Adrian Smith ile birlikte Bruce Dickinson şarkılar yazmaya ve şarkıları Steve Harris''e kabul ettirmeye çalışıyorlardı. Powerslave turuyla birlikte teatral sahne şovları başladı ve başrol vokalist Bruce Dickinson''ındı.\r\n\r\nAncak çok yoğun giden arka arkaya konserler ve albümler grubu da yormuş ve sorunlar yaratmıştı. Grubun beyni Steve Harris ile Bruce Dickinson birçok kere fikir çatışması yaşıyorlardı. Örneğin Bruce Dickinson bir sonraki albümün tamamen akustik olması önerisini getirmiş ancak bu önerisi kabul görmemişti. Bu yüzden de yeni albümde şarkı yazımına katılmadı. 1986 tarihli Somewhere In Time yine de eski Maiden albümlerinden farklı bir yöndeydi. Bu arada Bruce, The Adventures Of Lord Iffy Boatrace adlı bir roman yayınladı.\r\n\r\nYeni albüm hazırlıkları devam ederken Bruce Dickinson bir yandan çok başarılı olduğu eskrim sporuna da devam ediyordu. İngiltere''de kendi dalında 7.ciliğe kadar çıkmıştı. 1988''de Seventh Son Of A Seventh Son albümü yayınlandı. Bruce albüm konusunda çok heyecanlıydı çünkü tek bir konuya odaklanmıştı; kehanet.\r\n\r\n1989''da Elm Sokağı Kabusu 5 filmi için arkadaşı Janick Gers''in katkısıyle Bring Your Daughter... To The Slaughter şarkısını yazdı. Bu şarkının etkisiyle de Iron Maiden tarzından farklı, Samson dönemlerindeki hard rock tarzına yakın bir solo albüm üzerinde çalışmaya başladı. 1990''da ''Tattooed Millionare'' albümü yayınlandı. Büyük bir turne ve hit single''lar çıkararak Bruce Dickinson''ın solo olarak da başarılı olabileceğini gösterdi.\r\n\r\nBu sırada Adrian Smith anlaşmazlıklar nedeniyle Iron Maiden''dan ayrılınca yerine Bruce''un solo albümünde çalıştı Janick Gers gruba girdi. Yeni albüm No Prayer For The Dying de 1990''da yayınlandı. Bruce bu albümden hiç memnun kalmadı çünkü Steve Harris, güçlü, keyboardlarla desteklenmiş ve epik konular anlatan şarkılar değil Iron Maiden''ın ilk dönemki basit tarzına dönmek istemişti. Bu Bruce''a göre büyük bir geri adımdı. Albüm mobil stüdyoda kaydedilip yayınlanmıştı.\r\n\r\n1992''de Bruce Dickinson ikinci romanı The Missionary Positionı yayınladı. Bu arada Fear Of The Dark albümü de yayınlandı. Bir yandan albümün turnesi devam ederken bir yandan da Bruce Dickinson solo albümleri için çalışıyordu. Bruce Dickinson kendine vakit ayırmadağı düşüncesiyle 1993''te gruptan ayrılma kararı verdi.\r\n\r\nSolo Yılları [değiştir]İkinci solo albümü için yaptığı çalışmaları beğenmeyen Bruce Dickinson, gitarist Roy Z''den yardım istedi ve uzun süreli müzikal bir birliktelik başladı. Yeniden yapılan kayıtlardan sonra Balls To Picasso albümü yayınladı.\r\n\r\nZaman kaybetmeden yeni albümü için çalışmaya başlayan Bruce Dickison, yanına yepyeni müzisyenler alarak önce 1995''te bir konser albümü olan Alive In Studio A ve 1996''da yepyeni bir albüm Skunkworksü çıkardı. Zamana uygun olarak albümde daha grunge ve daha kısa şarkılar ve sololar bulunuyordu.\r\n\r\nBruce Dickinson yeni albümünün daha heavy metal olmasını istediği için Roy Z ile tekrar ortaklık kurdu ve 1997''de Accident Of Birth albümü yayınladı. Eski Maiden gitarist Adrian Smith de albümde ve turnede Dickinson''a eşlik etti ve albüm herkes tarafından çok beğenildi. Bir sene sonra aynı ekiple The Chemical Wedding yayınlandı ve daha da büyük bir başarı kazandı. 1999''da Scream For Me Brazil adlı konser albümü de yayınlandı.\r\n\r\n1999''da Blaze Bailey''in gruptan ayrılmasıyla Bruce Dickinson ve Adrian Smith, Iron Maiden grubuna tekrar katıldı. Böylece Dennis Stratton, Paul DiAnno ile Clive Burr''den sonraki orijinal kadro bir fazla ile (Janick Gers) 6 kişi olarak tekrar biraraya geldi ve 2000 yılında Brave New World, 2003''te Dance Of The Death albümleri yayınlandı. Bu arada Brezilya''nın Rio kentinde "Rock In Rio" etkinlikleri kapsamında 254.000 kişiye unutulmayacak ve dillere destan bir konser verdiler.\r\n\r\nBruce ayrıca 2001''de bir best of albümü yayınladı. 2 CD''lik bu albümün 2. CD''sinde yayınlanmamış, akustik ve eski Bruce Dickinson şarkıları bulunmaktaydı. Bu arada iyi de bir pilot olan Bruce Dickinson, Discovery Channel''da uçaklarla ilgili bir belgesel olan Flying Heavy Metal adlı programı da sunmuştur. 2005''te yine Roy Z ile birlikte Tyranny Of Souls adlı solo albümü çıktı. 2006''da da konser görüntüleri ve Samson da dahil olmak üzere eski görüntülerinin bulunduğu Anthology adlı DVD''yi yayınladı.', 'shfZzTJYZWs'),
(76, 'Iron Maiden', 'Heavy Metal', 'ingiltere', 'Iron Maiden, bir ingiliz Heavy Metal grubudur. Heavy Metal müziğinin ve bir alt dalı olan New Wave Of British Heavy Metal''in önemli temsilcilerindendir. West Ham United taraftarı olup futbol oynamak isteyen Steve Harris daha sonra aldığı bas gitarı ile müzik yapmaya karar verir. 1973''te Gypsy''s Kiss ve 1974''te Smiler adlı gruplarda çalan Harris daha sonra müzikal farklılıklar nedeniyle kendi grubunu kurmak ister. 1975''te Iron Maiden kurulmuştur. Bir çok kadro değişikliğinden sonra 1978''te Steve Harris (Bas gitar), Dave Murray (Gitar), Doug Sampson (Bateri) ve Paul Di''Anno (Vokal) olarak çekirdek kadroyu oluştururlar. Bu sırada da konserler vermeye devam etmektedirler. New Wave Of British Heavy Metal yani "İngiliz Heavy Metali''nin Yeni Dalgası"nın en önemli temsilcisi oldular. Punk altyapısı altında ürettiği mistik metalle kısa sürede başarılı oldular. O yıllarda patlayan punk fırtınası nedeniyle, plak şirketleri Iron Maiden''ın müziğine müdahale etmek istemiş, ancak başarılı olamamıştır. Topluluk 1979''da kendi olanaklarıyla hazırladığı The Soundhouse Tapes'' adlı EP''yi satışa sundu ve 5000 kopya sattı. İlk 5000''lik satışın ardından Century Media''dan gelen 20.000 kopyalık ikinci baskı teklifini reddetmişlerdir. İkinci gitar arayışlarına devam eden grup Dennis Stratton ile anlaştılar. Davula ise Clive Burr geldi.\r\n\r\nPaul Di''Anno dönemi\r\n\r\n1980''de kendi adlarını taşıyan ilk albümleri Iron Maiden piyasaya sürüldü. Kapağında Derek Riggs tarafından herhangi bir punk albümü için çizilmiş bir karakter vardır. Bu daha sonra grubun maskotu Eddie olacaktı. Albüm Harris''in bestelediği melodik gitar yürüyüşleriyle ve Paul Di''Anno''nun "serseri" vokali ile dikkat çekmiştir. İlk şarkı Prowler, Di''Annonu sözlerini yazdığı duygusal Remember Tomorrow ve bir hayat kadının anlatıldığı Charlotte The Harlot albümde dikkat çekmekteydi. Turne esnasında yine müzikal farklılıklar yüzünden Dennis Stratton gruptan ayrılıp Dave Murray''nin eski grup arkadaşı Adrian Smith, Maiden''e katıldı. 1981''de Killers albümünü çıkaran grup ilki kadar büyük bir başarı sağlayamadı. Yine de konserlerin vazgeçilmez şarkısı Wrathchild, Edgar Allan Poe''dan etkilenerek yazdıkları Murders In The Rue Morgue dikkat çekiyordu. Turnede ise kendini iyice alkole veren Paul Di''Anno grupla anlaşamayıp ayrıldı. Yerine ise Samson grubunda Bruce Bruce adı ile şarkı söyleyen Bruce Dickinson alındı.\r\n\r\nEfsane Dönem\r\n\r\n1982''de Heavy Metal''in en önemli albümlerinden biri olan The Number of the Beast piyasaya sürüldü. Grup bir anda satanizm suçlamalarıyla medyanın ilgisini topladı. Ancak Harris bu şarkıyı gördüğü rüyalar hakkında yazmıştı. Bruce Dickinson''ın çok ince tonlara çıkabilen muhteşem sesi sayesinde -ki bu ses yüzünden kendisine "air raid siren" (hava saldırı alarmı) denilmiştir- ve grup içindeki uyumun artmış olması sonucu büyük bir başarıya ulaştılar. Bu albümden sonra Clive Burr yerini Nicko McBrain''e bıraktı ve grup uzun süre bu kadroyu korudu. 1983''te dördüncü albüm Piece of Mind çıktı. Albümdeki The Trooper adlı parça büyük ilgi topladı ancak İngiliz Milliyetçiliği suçlamalarını da beraberinde getirdi. Ancak şarkının asıl teması savaşın anlamsızlığıydı. Maiden hiç durmadan 1984''te Powerslavei yayınladı. Bu albümden de Aces High ve 2 Minutes To Midnight gibi hitler çıkmıştır. Bir turne - bir albüm diye devam eden Maiden 1985 yılında tüm zamanların en iyi konser albümlerinden biri olarak gösterilen Live After Death''i piyasaya sürdü. 1986''da Somewhere in Time albümü geldi ve bu albüm büyük tartışmalara yol açtı. Albüme önce Bruce Dickinson akustik bir albüm önerisi getirdi ancak bu Steve Harris tarafından kabul edilmedi. O yüzden Dickinson hiçbir şarkı yazımına katılmadı. Ayrıca ilk kez Iron Maiden tarihinde (1977''de yapılan bir konser dışında) keyboard kullanıldı ve Maiden fanatiklerinin pek hoşuna gitmedi. 2 sene sonra 1988''de Seventh Son of a Seventh Son adlı konsept albüm çıktı. Rock müziğinde popülerliğinin en üst döneminde piyasaya sürülen bir albüm birçok kişinin Maiden ile tanışmasının yanısıra çok büyük satış rakamları yakaladı. Ancak Bruce Dickinson, yapmak istedikleri konsepti tam anlamı ile başaramadıklarını, aynı sene çıkan, Queensryche''ın Operation Mindcrime adlı konsept albümünün çok daha başarılı olduğunu söylemiştir.\r\n\r\nDeğişim\r\n\r\nSteve Harris büyük başarının ardından köklere dönüp Killers tarzı bir albüm yapmak istiyordu ancak gitarist Adrian Smith geri dönüşün gereksiz olduğunu düşünmüştü ve gruptan ayrıldı. Yerine Bruce Dickinson ile çalışan Janick Gers geldi. 1990''da çıkan No Prayer for the Dying albümü diğer albümlere göre zayıf kaldı. Buna rağmen Bring Your Daughter... To The Slaughter single''ı büyük başarı elde etti. İki sene sonra ise Fear of the Dark bu albümün daha üstünde bir başarı sergiledi ve albümle aynı ada sahip şarkı bir Maiden klasiği oldu. Ancak sorunlar bitmiyordu. Solo kariyerine ağırlık vermek isteyen Bruce Dickinson, Steve Harris ile bitmeyen tartışmalar yaşıyordu ve gruptan ayrıldı. Yeni vokalist ise Blaze Bayley olmuştu. Blaze iyi bir vokalist olmasına karşın, Bruce Dickinson gibi bir efsanenin yerini doldurmak zorundaydı ve hep bu yüzden fanlar tarafından önyargı ile yaklaşıldı. 1995''te çıkan The X Factor yine iyi bir başarı kazandı. Steve Harris''in ruh hali yüzünden çok karanlık bestelerden oluşmuştu. 1996''de Best Of The Beast adlı toplama çıkaran grup yeni bir şarkı olan Virus''ü grubu hep eleştiren basına armağan ettiler. 1998''te grubun satışlar bakımından o güne kadarki en başarısız albümü olan Virtual XI piyasaya çıktı. Bu albümün ardından çıkılan Virtual XI dünya turnesi kapsamında Iron Maiden İstanbul''da Cemil Topuzlu Açıkhava Tiyatrosu''nda 7 ve 8 Eylül 1998 tarihlerinde iki konser vermiştir. 1999''da Bruce Dickinson''ın gruba dönmesi üzerine Blaze Bayley gruptan ayrıldı. Bruce Dickinson ile birlikte Adrian Smith de gruba geri geldi.\r\n\r\nSon Dönem\r\n\r\nBu kadroyla olan ilk albüm Brave New World 2000''de çıktı ve büyük bir ilgi ile karşılandı. Maiden hiç durmadan konserler verdi. Daha sonra Best Of''lar, Box Set''ler, Konser CD''leri ve DVD''ler piyasa sürdüler. Bu sırada da 2003 tarihli Dance of Death albümü çıktı ve bu albüm de ötekiler gibi büyük bir başarı kazandı. Grup Ekim 2004 ve Eylül 2005 tarihleri arasında yalnızca ilk dört albümlerinden şarkılar çaldıkları Early Years adında bir turneye çıktı. Topluluk, 2006 yılında The Reincarnation of Benjamin Breeg single''ını ve ardından da A Matter of Life and Death albümünü yayınladı ve ardından da başarılı bir Avrupa turnesine çıktı. Avrupa turnesinin ardından Iron Maiden, 9 Mart 2007''de Birleşik Arap Emirlikleri''nde dördüncüsü düzenlenen Dubai Desert Rock Festivali''nde esas grup olarak sahne aldı. Ayrıca 17 Mart 2007 tarihinde Hindistan''ın Bangalore şehrinde verdikleri konserle de Hindistan''da konser veren ilk heavy metal grubu oldular. ', 'enTPV_wkKbA'),
(78, 'Judas Priest', 'Heavy Metal', 'ingiltere', ' 1970?te KK Downing ve Ian Hill tarafından kurulan «Metal Gods» lakaplı İngiliz Heavy Metal grubu. Gruba gitarist Glenn Tipton?ın sonradan katılımıyla birlikte tarihte bir dönüm noktası yaşanmış ve çift gitarlı ilk Heavy Metal grubu kurulmuş oldu. NWOBHM?in temelini atan Judas Priest?in ilk vokalisti Al Atkins?tir. Fakat grup , resmi albüm kayıtlarına Rob Halford ( The Metal God ) ile başlamıştır. Grubun Al Atkins ile herhangi bir albümü yoktur.Gruba «Metal Gods» lakabını kazandıran olay ise 1980 yıllarında çıkan British Steel albümündeki «Metal Gods» parçasıdır.1974-1992 yılları arasında grubun vokalisti olarak görev yapan Rob Halford , Painkiller albümü sonrası artık farklı şeyler yapmak istediğini açıklayıp gruptan ayrılmıştır. Rob Halford, gruptan ayrıldıktan sonra solo grubu olan FIGHT?ı kurarak daha farklı bir müzik yapmıştır. Judas Priest?in tüm albümleri Altın Plak ödülü almıştır. Müzikal olarak birçok gruba öncülük eden Judas Priest , Heavy Metal?in en büyük grubu olarak birçok müzik türlerini de keşfetmiştir. Power Metal ve Speed Metal tarzları ilk kez Judas Priest albümlerinde hayat bulmuştur. ( Bkz: Ram It Down , Screaming For Vengeance )\r\n\r\n1970?lerin doom , karanlık Black Sabbath tarzından tamamen ayrı olarak kendine özgü bir çizgiyle müzik dünyasına giren Judas Priest ilk albümünden yaptığı son albüme kadar Heavy Metal icra etmiş ve NWOBHM?in temel taşlarını yerine oturtmuştur. Bununla ilgili bir röportajında KK Downing şöyle diyor : «Sabbath is heavy but Priest is metal» ?\r\n\r\n1980?de konserlerde Iron Maiden , Judas Priest?in açılış grubu olarak sahne almıştır. Böylelikle Iron Maiden efsanesi de dünyaca ünlü bir grup haline gelmeye başlamıştır.\r\n\r\n4 oktav ses aralığına sahip Rob Halford ve çift lead gitarlar ile Heavy Metal?in en büyük grubunun en çok sükse yapan albümü Painkiller?dır. Bu albüm ile birlikte artık doruğa ulaşan Judas Priest bir gerileme dönemine de başlamıştır. Rob Halford?un ayrılmasıyla birlikte grup bir süre bocalamış , 1997 - Jugulator albümüne dek bir kayıt yapmamıştır.\r\n\r\nBaterist Scott Travis?in bir akşam barda izlediği Tim Owens?ı keşfetmesiyle 2. Priest dönemi başlamış olur. Tim , bir Judas Priest Tribute grubunun vokalistidir. 1993 tarihinden itibaren ise artık Judas Priest?in vokalistidir. Hayali gerçek olmuş , tribute yaptığı grubun vokaline geçmiştir. Yüksek aralıklı çığlıkları ve vokal tarzı ile Rob Halford?u örnek alan Tim , kısa sürede fanlar tarafından benimsenir.\r\n\r\nRob Halford?un olmadığı sürede , Judas Priest?i ayakta tutan Tim Owens?tır. Fanlar artık onu Tim ?Ripper? Owens olarak tanıyordur. Judas Priest?in en ünlü şarkılarından olan ?Ripper? parçasını ona ithaf etmişlerdir.\r\n\r\nTim Owens ile birlikte 2 stüdyo 2 live albüme imza atan Judas Priest , 2003 yılında Rob Halford ile bir re-union gerçekleştirir ve grup eski efsane kadrosunu tekrar oluşturur. Rob Halford?un gruba dönmesi ile ilgili hiçbir sorun çıkarmayan Tim Owens, sessiz sedasız Iced Earth ile anlaşır ve orada vokal yapmaya başlar.\r\n\r\nRob Halford ile 2004 Yılında başlayan Reunion konserleri tüm dünyada büyük yankı uyandırır ve ardından 2005 senesinde Angel Of Retribution albümü ile dünya sarsılmıştır. Rob Halford , Judas Priest ile birlikte 15 senenin ardından ilk kez albüm yapmıştır. Böylelikle Priest eski dünlerine tekrar dönmüş olur.\r\n\r\nAyrıca Priest 13 Temmuz 2008''de ülkemizi ziyarete gelmiştir.\r\n\r\nSon stüdyo albümleri ise Nostradamus oldu.\r\n\r\n"NOSTRADAMUS" isimli albüm Priest tarihindeki ilk konsept çalışma ve tam tamına 1 buçuk saat.\r\n\r\n2010 yılı Judas Priest için daha çok "tur" yılıydı ve grup British Steel albümü şerefine düzenlediği konserlerin Florida ayağını kaydedip DVD ve Live albüm olarak piyasaya sürdü. DVD ve konser albümü olarak piyasaya sürülen boxset , Haziran 2010''da çıktı.', 'BNGlrRrjlHw'),
(79, 'Rammstein', 'Industrial Metal', 'Almanya', '1994 yılında gitarist Richard Kruspe o zamanki grubu "Orgasm Death Gimmicks"ten sıkılır ve aklına yeni bir fikir gelir. Bol distortionlı, sert, tekdüze gitar riffleri ile müzik yapan, heyecanlı, sert, bazen hüzünlü hatta zaman zaman da sıkıcı müzikler yapmak. Berlin duvarı yıkıldıktan sonra evine yani Schwerin?e dönen Richard bu fikri önce arkadaşı Christoph Schneider?le paylaşır ve daha sonra Oliver Riedel?ı da gruba dahil eder. Vokal için de o zamanki grubu First Arsch? ta davul çalan Till Lindemann ikna edilince Rammstein rüyası "kısmen" başlar. Grup Berlin?de yapılan "Metro Beat" müzik ödülleri için bir kaç parça kaydeder ve yarışmayı kazanır. Ödül olarak da daha profesyonel bir stüdyoda kayıt imkanı kazanırlar. Stüdyoya girmeden önce "Feeling B" grubunun gitaristi Paul kadroya dahil edilir. Hiç de melodik olmayan sert "Rammstein soundu"nun değişmesi gerektiğini düşünen topluluk, daha önce Paul?un da birlikte çalıştığı Christian "Flake" Lorenz?e teklif götürür. Daha klasik bir müzik anlayışına sahip olan Flake bu teklife sıcak bakmaz. Fakat grup büyük ısrarlar sonucu -tabi Paul?ün de ev arkadaşı ve de daha önce aynı grupta çalıyor olmasının avantajlarından faydalanarak- Flake?i ikna etmeyi başarır. Aslında Flake bugün bile yapılan müziği pek sevmez. Grupta hoşuna giden şeyi bir röportajında şöyle belirtir Flake: "Onlar sevmediğim müziği yapıyolar. Ben ise klavyemle onların müziğine tecavüz ediyorum. Bu çok hoşuma gidiyor". Flake?in de katılımıyla bugüne kadar hiç değişmeyen Rammstein kadrosu tamamlanır. Trent Renzor?ın öncülüğünde endüstriyel müzik daha yeni doğmuş kabul edilirken (hatta adı bile henüz tam konmamışken) dünya bu tarzın efsanesiyle tanışır. Fakat grup, röportajlarında endüstriyel müzik yaptıklarını hiç bir zaman belirtmeyip "müziğimize istedikleri ismi verebilirler" der.\r\n\r\nGrup adını 1988 yılında Almanya?nın Ramstein kasabası yakınlarında "Ramstein" isimli Amerikan Hava Üssü?nde gerçekleşen trajik kaza için yazdığı şarkıdan alır. Gösteri uçuşu yapan jetlerden ikisi birbirine çarpar ve birinin seyircilerin üzerine düşmesi sonucu 80?in üzerinde insan hayatını kaybeder. Rammstein tam altı yıl sonra dizelerinde bu olayı tekrar canlandırır. Albümleri çıkmadan önce verdikleri küçük konserlerde parça o kadar sevilir ki gruba bu ismi verirler. Ayrıca grubun karanlık tarafını da bu şarkının iyi yansıttığını düşünürler. Fakat o kaza üzerinden bir reklam izlenimi vereceği endişesini taşıyan grup, ismine bir "m" ekleyerek, kelime anlamı "kuvvetlice çarpan taş" olan -ayrıca Berlin duvarının inşası sırasında kontrol ve güvenlik için kullanılan taşların da ismi olan- "Rammstein" olarak değiştirir.\r\n\r\n1994 yılında 5 parçadan oluşan (Hallo Hallo, Weisses Fleisch, Rammstein, Schwarzes Glas, Seemann) bir demo kaydı hazırlayan grup bu kayıtla yapımcıların kapılarını aşındırmaya başlar. Bazı yarışmalarda da dereceler alan Rammstein bir dolu aksaklığa rağmen 1995?te Motor Music / PolyGram (Universal) ile kontrata imza atmayı başarır ve Mart 95?te ilk Rammstein albümü "Herzeleid" İsveç?li grup Clawfinger?in de prodüktörü olan "Jacob Hellner" ve "Carl-Michael Herlöffson" la birlikte, Stockholm Polar Studio?da kaydedilir. 17 Ağustos 1995?te ilk single "Du Riechst so Gut" ve 24 Eylül 1995?te de albüm yayınlanır. Albüm kapağındaki resimleri yüzünden grup Neo-Nazi olmakla suçlanır. Tek sebep bu değildir aslında. Vokalist Till Lindemann?ın "R" harflerinin üzerine basa basa söylemesi (ki bu aşırı sağcıların konuşmalarında görülürdü. Adolf Hitler?de "R" harfinin üzerine basa basa konuşurdu) ve konserlerinde gösteri yapan Neo-Nazi?ler için de "kimseye konserimize gelmeyin diyemeyiz" demeleri bir anda şimşekleri grubun üzerine çeker. Grup üyeleri bu soruyla her karşılaştıklarında Nazi yanlısı olmadıklarını ne kadar söyleseler de, insanları bugün bile bu konuda tam olarak ikna edememişlerdir. Zamanla grup bu eleştirilere alışır ve pek de umursamamaya başlar (Müzikleri Columbine katliamını gerçekleştiren çocuğa ilham vermekle bile suçlanmıştı). 14 Ekim 1995?te Project Pitchfork ile beraber 15 konserlik bir turneye çıkan Rammstein büyük ilgi görür. Daha sonra 27-29 Kasım?da Clawfinger?in alt grubu olarak Varşova ve Prag?da konser veren grup, 2 Aralık 1995?te Almanya?da tek başına 17 konserlik ilk turnesine başladı. 1996 yılında konserlerini devam ettiren Rammstein 27 Mart 1996?da Londra?da "MTV Hanging Out" programına, 2 Mayıs 1996?da da Hong Kong?da Polygram Dünya Kurultayına çıkarak kendisini dünyaya tanıttı.\r\n\r\nAmerika?lı yönetmen David Lynch?in büyük hayranı olan grup bir videolarını çekmesi için Lynch?e albümlerini gönderirler. Albümden çok etkilendiğini söyleyen Lynch, zamanı olmadığı için teklifi kibarca geri çevirir. Ancak her filminin soundtrack albümüne girecek parçaları bizzat kendi seçen Lynch, Rammstein?ın iki parçasını (Rammstein, Heirate Mich) Lost Highway filminde ve soundtrack albümünde kullanmaya karar verir. Soundtrack albümü için "Rammstein" parçasına da bir video çekilir ve Amerika dahil dünyadaki tüm müzik kanallarında dönmeye başlar. David Lynch?in bu seçimi, dünyayı sarmak üzere olan Rammstein fırtınasına hız verir.\r\n\r\nRammstein sahnede ilk ışık gösterisini Gert Hof sorumluluğunda Berlin Arena?da yıldönümü konserinde kullanır. Bu konserde ayrıca "Moby" ve Bobo & Berlin Üniversite orkestrası?da yer alır. Işıkla mükemmel uyum sağlayan Rammstein müziği, daha sonraki konserlerinde alev ve ışıkla inanılmaz hale gelecektir.\r\n\r\nYeni albümleri Sehnsucht Kasım 1996?da tamamlanır ve albümün ilk single?ı "Engel" 1 Nisan 1997?de yayınlanır. Listelere 12. sıradan giriş yapan, "Bobo"nun da vokaliyle eşlik ettiği parçanın single?ı Haziran ayında 250.000 satış rakamını aşıp 3.lüğe ulaşır. Daha sonra 21 Temmuz 1997?de ikinci single "Du Hast" yayınlanır ve ağustos ayında listelerde 5. sıraya yerleşir. 2. Rammstein albümü "Sehnsucht" ise 22 Ağustos 1997?de yayınlanır. Albüm sadece iki hafta sonunda listelerde 1 numaraya yerleşir. Bu şekilde "Herzeleid" albümü ve "Sehnsucht" albümünden yayınlanan iki single "Engel" ve "Du Hast" la birlikte, Almanya Top 20 listesinde aynı anda dört Ramms+ein kaydı yer alır. 15 Kasım 1997?de geniş çaptaki ilk Avrupa turnesine çıkan grup 8 ülkede toplam 10 konser verir. 21 Kasım 1997?de ise Kraftwerk?in ünlü parçası "Das Modell"i coverlayan grup bir de single yayınlar.\r\n\r\n1998 yılının hemen başında Depeche Mode gruptan tribute albümlerinde yer almak üzere bir cover ister. Bu teklif üzerine çok mutlu olan Rammstein (her biri birer Depeche Mode hayranıdır) "Stripped" parçasını yorumlar. Till bir röportajında şöyle diyor: "Biyografilerinde en iyi coverlarının bu olduğunu söylediler. Gurur duyduk". Ayrıca parça için 27 Temmuz 1998?de bir de single yayınlanır.\r\n\r\nKonser performansları dilden dile dolaşan ve bir efsane haline gelen grup 14 Ağustos 98?de "en iyi canlı performans" dalında Comet ödülü kazanır. Daha sonra 22 Ağustos?u 23?üne bağlayan gece unutulmaz bir Rammstein konseri gerçekleşir. Berlin Wuhlheide?de "Danzig", "Nina Hagen", "Joachim Witt" ve "Alaska"nın alt grup olarak sahne aldığı 17.000?den fazla Rammstein hayranının tanık olduğu bu unutulmaz konser ayrıca profesyonel olarak kayda alınır. Daha sonra 30 Ağustos 1999?da konser kaydı albüm olarak yayınlanır ve iki hafta içinde bir numaraya yükselir. Konserin görüntülü kaydı ise 13 Eylül 99?da VHS formatında 26 Kasım?da da DVD formatında yayınlanır.\r\n\r\nRammstein 22 Eylül 98?de "Korn", "Ice Cube", "Orgy", ve "Limp Bizkit"in yer aldığı "Family Values" turnesine katılır böylece Amerika?da da belli bir fan kitlesi kazanır. 12 Kasım 98?de ise Rammstein "En iyi Rock Performansı" dalında MTV Avrupa müzik ödüllerinde aday gösterilir ve Milano?da ödül gecesi "Du Hast" parçasını canlı olarak yorumlar. Şubat 99?da 42. Grammy ödüllerinde "En iyi Metal Performansı" dalında aday gösterilen grup Nisan 99?da "En Başarılı Alman Grup" dalında Echo ödülünün sahibi olur.\r\n\r\n2 Nisan 2001?de grup sessizliğini bozar ve 3. stüdyo albümü Mutter?i yayınlar. Bu albümden çıkan 3. single Ich Will için grup 8 kasım 2001?de MTV Avrupa Müzik Ödüllerinde inanılmaz bir canlı performans gerçekleştirir. Ekim 2002?de ise Rammstein "xXx" filminin hemen girişinde "Feuer Frei" parçasıyla görülür.\r\n\r\n"Mutter" fırtınasının dinmesinin ardından grup iç sorunlarla uğraşmaya başlar. Dağılma kararının eşiğine gelen grup 1 yıl ayrı kalma kararı alır. Bir yılın sonunda tekrar biraraya gelir grup ve buzları eritir. Çünkü Rammstein?ın diğer gruplardan farklı bir yanı iş arkadaşı olmamalarıdır. Zaten grup ortada yokken de iyi arkadaştır grup üyeleri. Örneğin Oliver bir röportajında şöyle diyor: "Aslında ben her zaman tatilde olduğumu düşünüyorum. Sevdiğim, yapmak istediğim işi, yapmak istediğim kişilerle ve istediğim ortamda yapıyorum".\r\n\r\nMerakla beklenen 4. Stüdyo albümleri "Reise, Reise"yı 27 Eylül 2004?te yayınlar grup. Albümün ilk single?ı "Mein Teil" içerdiği "gerçek" yamyam hikayesiyle bir kez daha tüm şimşeklerin "Rammstein" üzerine çekilmesine sebep olur. İkinci single "Amerika"da ise Rammstein o güne kadar hiç yapmadığı bir şeyi yapar ve politik bir şarkı yazar. Paul Landers bu konuyla ilgili bir röportajında şöyle der: "Biz kesin bir mesajı olan bir grup değiliz. Fakat burda bir istisna yapmak zorundaydık. Çünkü biz albümü hazırlarken Amerika çok fazla can sıkmaya başlamıştı." Daha sonra yayınladıkları diğer single?lar "Ohne Dich" ve "Keine Lust" ile yine ses getiren grup "Reise, Reise" albümü ile "uluslararası en iyi Rock grubu" dalında "Echo" ödülünü kazanır.\r\n\r\nGrup "Reise, Reise" fırtınası daha dinmemişken sıradaki albümün müjdesini verir. 28 Ekim 2005?te çıkaracakları albümün adı "Rosenrot" olacaktır. Bu kadar kısa bir zaman sonra yeni albümün çıkmasının sebebi ise parçaların zaten hazır olmasıdır. "Reise, Reise" albümünün çalışmaları esnasında ortaya o kadar çok parça çıkmıştır ki albüme girmeyen parçaların kaybolmasını istemez grup üyeleri. Ve bu parçalarla birlikte 4 yeni parça daha hazırlayarak, önce adının "Reise, Reise (vol.2)" olarak duyurulduğu fakat daha sonra değiştirildiği "Rosenrot" albümünü çıkarmaya karar verir. 3 Kasım 2005?te "en iyi Alman grup" ödülünü MTV müzik ödüllerinde alan grup ayrıca Grammy ödüllerine ikinci kez "En İyi Metal Performansı" dalında "Mein Teil" ile aday gösterilir. Yine hemen ardından 12 Mart 2006?da "en iyi rock/alternative" kategorisinde bir kez daha "Echo" ödülü kazanır Rammstein.\r\n\r\nDünya çapında toplam 10 milyonun üzerinde kopya satan Rammstein, endüstriyel metalin gereklerini tam olarak yerine getirdiği için her zaman dinleyicisine gereken atmosferi, enerjiyi ve sound?larındaki yürekliliği ulaştıracaktır. Endüstriyel metal, deneysel ve elektronik bir alt-yapıya sahip endüstriyel müzik tarzının aksine elektro gitar, yoğun bir müzik ve keskin riff?ler içeriyor. Metal müziğin agresif yapısını, karanlık şarkı sözlerini yansıtmayı da ihmal etmiyor. Aslında şarkı sözlerinin yorumlanması hakkında çok çekmiş bir grup Rammstein. Paul?un de belirttiği gibi "Amerika" dışında şarkılarında hiçbir zaman kesin bir şeyi anlatmıyorlar. "Daha belirsiz olan bazı şeyler ise insanlara kendi düşüncelerini uygulayabilecekleri kadar şans verilmemesi. Kesin bir fikir ortaya koyduğunuz zaman, hayaller için yeterli boşluk kalmaz" diyor Paul röportajın devamında.\r\n\r\nBugün endüstriyel müziğin en güçlü ismi "Rammstein". Bunun nedenleri aslında çok ta somut değil aslında. Baktığımız zaman somut görünen tek sebep tamamiyle "özgün, farklı" olmaları. En büyük farklılıkları "Alman" olmaları. Belki de hiçbir müzik türüne yakışmayan almanca dili, Rammstein?ın müziğinin adeta temel taşlarından biri. Alman olmaları müziklerinin karanlık yönüne de katkıda bulunuyor. Alman vatandaşlarının kimliksizlik sorunu son bir yüzyıldır her türlü Alman sanat akımını şekillendiren bir faktör. Rammstein üyelerinin de bu atmosferden nasibini alması müzikerinin koyu ve agresif yönünü, sert ve kasvetli tınlayışını diğer gruplardan daha keskin hale getiriyor. Amerikan gruplarının öfkeli sahne şovlarının yanında Rammstein?ın sahne şovlarının daha "gerçek" durması belki de bunun bir sonucu diyebiliriz.', 'KrV2YpRZXRs'),
(80, 'Cavalera Conspiracy', 'Nu Metal', 'Amerika', 'Brezilyalı Igor ve Max Cavalera kardeşlerin yeniden birleşerek oluşturduğu yeni bir proje. Onlar Sepultura''da başlayan yolculuğu araya giren bazı sorunlar ve olaylardan sonra yeniden sevdikleri işin başına geçti. Grubun diğer elemanları ise Soulfly''dan Marc Rizzo(Gitar) ve Gojira''dan Joe Duplantier(Bass)\r\n\r\nInflikted, 24 Mart 2008''de raflarda yerini aldı. Kayıtlar 2007 yazında Los Angeles''taki Undercity Studios''ta, zamanında Soulfly ve Machine Head''de çalmış olan Logan Mader ile beraber yapıldı. Albümün misafir sanatçıları arasında Pantera ve Down''dan tanıdığımız Rex Brown ile Max Cavalera''nın üvey evladı Ritchie Cavalera bulunuyor.', 'rIj3kpPYh1M');
INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(81, 'Evanescence', 'Nu Metal', 'Amerika', 'Evanescence, Amerikalı rock grubudur. 1995 yılında piyanist/vokalist Amy Lee ve gitarist Ben Moody tarafından Little Rock, Arkansas''ta kurulmuştur.\r\n\r\nİki özel EP ve Origin adlı demo CD''nin kaydedilmesinin ardından, grup ilk uzunçalar albümü olan Fallen''ı Wind-up Records üzerinden satışa sundu. Dünya çapında 15 milyondan fazla kopyası satan Fallen albümü sayesinde grup iki Grammy Ödülü kazandı. Bir sene sonra Evanescence''in ilk konser albümü olan Anywhere But Home piyasaya sürüldüğünde 1 milyondan fazla kopyası satıldı. 2006''da grup 4 milyondan fazla satan ikinci stüdyo albümü The Open Door''u satışa çıkardı.\r\n\r\nEvanescence''te birkaç eleman değişikliği yaşandı. 2003''te grubun kurucularından Moody grubu bırakmaya karar verdi. Onu Rocky Gray ve John LeCompt''ın ayrılığı izledi. Lee şu anda grubun tek orijinal üyesidir.\r\n\r\nEvanescence grubu vokalist, piyanist ve şarkı yazarı Amy Lee ile eski gitarist ve şarkı yazarı Ben Moody tarafından 1995 yılında kuruldu. İkisi 1994''te Little Rock''taki bir gençlik kampında; Moody''nin, Lee''yi Meat Loaf''ın "I''d Do Anything for Love (But I Won''t Do That)" adlı parçasını piyanoda çalarken duymasıyla tanışmıştı. Birlikte aranje ettikleri, Lee tarafından yazılan "Solitude" ve "Give Unto Me" ile Moody tarafından yazılan "Understanding" ve "My Immortal" parçaları onların ilk şarkıları oldu.\r\n\r\nGrubun adı için Childish Intentions ve Stricken isimleri denendikten sonra, "yok olmak" "buhar olup uçmak" anlamına gelen Evanescence adında karar kıldılar. Lee, "gizemli, karanlık ve dinleyicinin aklında kalıcı" olduğundan bu adı sevdiğini söylemiştir.\r\n\r\nFinansal zorluklar yüzünden gruba eleman alamayan ve bu yüzden de canlı konser performanslarına çıkamayan grup , beraber şarkı yazarak ilk albümleri ?Origin? i demo albüm olarak 2000 yılında piyasaya çıkardı. Grup ilk çıkışını 2003 yılında ?Daredevil? adlı filmin soundtrack?ine verdikleri ?Bring Me To Life? ve ?My Immortal? adlı parçalarla yaptı. Ardından ilk resmi albümleri ?Fallen? piyasaya çıktı. Albümde yer alan ?Bring Me To Life? Amerika listelerinde 5. sırayı alırken, Ingiltere listelerinde birinci sırada yer aldı. Aynı şekilde ?My Immortal? Amerika?da 7. sıraya yükselirken, Ingiltere?de 9. sıraya kadar yükseldi. Aynı yıl grubun kurucularından olan Ben Moody gruptan ayrıldı ve yerine Cold grubunun gitaristi Terry Balsamo geldi.\r\n\r\nEvanescence 2004 yılında ?En İyi Hard Rock Performansı? ve ?En İyi Yeni Artist? dallarında Grammy Ödülü kazandı. Aynı yıl ?My Immortal? adlı parça ?MTV Video Müzik Ödülleri?nde ?En İyi Rock Video? ödülüne aday gösterildi. Grup ?Anywhere But Home? adlı CD/DVD?yi piyasaya çıkardı. 2004 yılı sonunda ?6 tane pilatin plak ödülünü kazanan ?Fallen? Amerika?da 2.7 milyon satarak 8. en çok satan albüm statüsüne ulaştı.\r\n\r\n3 Ekim 2006''da grubun sonraki albümü ?The Open Door? çıktı. İlk haftasında 500.000''e yakın satan albüm, listelerde de şimdiye kadarki en iyi dereceyi yakaladı. İlk single "Call Me When You''re Sober" 21 Temmuz''da çıkarken, ikinci single "Lithium" 27 Kasım''da yayınlandı.\r\n\r\n2006''da bas gitarist Will Boyd, uzun süren turnelere çıkmak istemeyip ailesine zaman ayırmayı tercih ettiğini söyleyerek gruptan ayrıldı. Ağustos 2006''da yapılan bir röportajda Will''in yerine Tim McCord''un geçtiği haberini veren grup, 2007''de 2 eleman değişikliği daha yaşadı. Gruptan atıldığını ileri süren John LeCompt''un ardından davulcu Rocky Gray de grubu bırakmaya karar verdiğini açıkladı. Turne sırasında davulu Will Hunt ve gitarı Troy McLawhorn devraldı. Amy Lee, bu iki elemanın Family Values turnesinin sonuna kadar grupla birlikte çalacağını belirtmişti; fakat müzisyenler The Open Door turnesinde de grupla birlikte sahnede yer aldılar.', 'tCoDtqZo14'),
(82, 'Linkin Park', 'Nu Metal', 'Amerika', 'Linkin Park, bir Amerika kökenli rock grubudur. 1996''da "Xero" adıyla kurulduğundan beri 50 milyondan fazla albüm satmayı ve iki Grammy ödülü kazanmayı başarmıştır. MTV ödülleri ile de ünlüdür. İlk albümleri Hybrid Theory ile büyük bir başarı kaydetmişlerdir. Bu albüm dünyada 21. yüzyılın en fazla satan albümü olarak bilinir. 2005 yılında Gold CD ile bu başarıları belgelenmiştir. İkinci albümleri Meteora ile ise bu ünlerini devam ettirdiler ve Billboard 200''de ilk sırayı 2003''te aldılar. Bu başarıları onların albüm turneleri ve dernek konserlerini de başlatıyordu. Linkin Park konser şovlarıyla da ünlü bir gruptur."Meteora" ve "Hybrid Theory" albümleri ile daha çok nu metal tarzını icra eden grup, daha sonra, 2007 yılında çıkardıkları Minutes to Midnight ile bu türden uzaklaşıp alternatif rock türünde çalışmalar vermeye başlamışlardır. Billboard 200 listesinde bu albümle yeniden ilk sırayı alarak piyasa sürülmesinin ilk haftasında bu listeye oturma başarısını göstermiştir. Grup dünyanın en fazla satan nu metal grubudur ve bu başarısıyla Korn''u geride bırakmıştır.Linkin Park kendi çıkardıkları bu albümlerin yanı sıra yaptıkları düetlerle de dikkat çekmişlerdir. Bunlardan en kayda değerleri Jay-Z ve Busta Rhymes ile yaptıkları düetlerdir. Bu düetlerin başlıcaları; "Numb/Encore" (Jay-Z), "We Made İt" (Busta Rhymes) şarkılarıdır.', 'Gd9OhYroLN0'),
(83, 'Nailbomb', 'Nu Metal', 'Brezilya', 'Nailbomb Max Cavalera (Soulfly, Sepultura) ve Alex Newport''un (Fudge Tunnel elemanı) beraber yaptıkları bir proje grubuydu. Grup dağılmadan önce sadece 2 canlı performans sergiledi. İkili misafir sanatçı olarak D.H. Peligro (Dead Kennedys) ve Igor Cavalera (Sepultura) ile de çalıştı.Nailbomb''un ikinci albümü [album]Proud to Commit Commercial Suicide 1995''de Eindhoven/Hollanda''da çıktıkları Dynamo Open Air Festival''deki canlı performanslarının kayıdı olarak çıktı. ', 'ZgBBK9UKkPE'),
(84, 'Soulfly', 'Nu Metal', 'Brezilya', 'Soulfly, vokalist/gitarist/söz yazarı Max Cavalera'' nın 1996 yılında Sepultura'' dan ayrılmasının ardından kurduğu dünyaca tanınan bir Metal grubudur. Max Cavalera, 80''lerin başında kurucularından biri olduğu dünyanın en popüler Heavy Metal gruplarından biri olan Sepultura'' yı bırakmak zorunda kalışının yanı sıra üvey kardeşi ve aynı zamanda en yakın arkadaşı Dana Wells'' in bilinmeyen cinayetiyle de uğraşmak zorunda kalmıştı. Müziği yaşadığı depresyonun üstesinden gelmek için bir terapi olarak kullanan Max Cavalera, davulda Roy Mayorga, ikinci gitarda Jackson Bandeira ve bass''da Marcelo Dias''dan oluşan bir grup toparladı.Kendi isimlerini taşıyan ilk albümlerini 1998 baharında çıkardılar. Albümün piyasaya çıkmasının ardından Jackson gruptan ayrıldı ve ondan boşalan yeri Machine Head''in eski gitaristi Logan Made aldı. Soulfly'' daki sahne kimliğinin yanısıra, Max Cavalera genelde Heavy Metal müzisyenleri ile bağdaştırılmayan çeşitli alanlara yönlendi. New York'' daki CMJ''s New Music Marathon ve Hollanda'' nın Crossing Boarder Festivalleri Max Cavalera''nın önemli müzik organizasyonlarının aranılan konuşmacılarından biri olduğunun kanıtıydı. Cavalera aynı zamanda Deftones'' un en önemli albümü olan Around the Fur'' da konuk sanatçı olarak katkıda bulunmuştu. Bunun yanı sıra kendi ülkesi Brezilya'' da Sprite'' ın bir TV reklamı için şarkıda söylemişti.İkinci albümleri Primitive 2000 kışında piyasaya sürüldü. Yeni albümde Mayorga ve Mader gruptan ayrıldıkları için yer almadılar. Gruba daha sonra gitar için Mike Dolling katıldı ve onu takiben Slayer''dan Kerry King'' in tavsiyesiyle Joe Nunez davul için gruba alındı. 2001''de üçüncü albümün başlanılmasıyla bearber, Joe farklı müzik alanlarıyla uğraşmak için gruptan ayrıldı. Joe''nun ayrılmasından 1 ay sonra eski davulcuları Roy gruba geri dönmesi için ikna edildi. Yeni albüm 3 ismiyle 25 Haziran 2002''de marketteki yerini aldı. 3 çıkışından 1 yıl sonra yeni albüm hazırlıklarına başlayacak olan grupta bir takım önemli değişiklikler yaşandı. Gitarist Mikey Dling, bassist Marcelo Dias, ve davulcu Roy Mayorga gruptan ayrıldı. Max kısa süre içersinde gruba gitar için Marc Rizzo (Ill Nino''dan) ve bass içinde Bobby Burns (Primer 55'' den) aldı. Eski Soulfly davulcusu, Joe Nunez'' de 4. albümün kayıtları için gruba getirdi. Grup 4. albümleri Prophecy''nin çıkışına kadar turnelerine devam etti. 2004 yılında Prophecy''nin çıkışından sonra, 2005 yılında ilk DVD'' lerini piyasaya sürdüler.Grup 2005 yılında çıkardıkları yeni albümleri Dark Ages tanıtımı kapsamındaki dünya turnesinde 25 Şubat 2006 tarihinde İstanbul''da Türk hayranlarıyla buluştu. Konser''de Dark Ages''deki yeni şarkılarına ek olarak Soulfly''ın en sevilen şarkıları ve Max''ın eski grubu Sepultura''daki yazdığı ve çok sevilen şarkılarıda izleyiciler için seslendirildi.', 'VZ3TmZslLQ8'),
(85, 'Blind Guardian', 'Power Metal', 'Almanya', 'Krefeld, Almanya çıkışlı olan power metal grubu Blind Guardian, 80''lerin ortalarında André Olbrich (gitar), Hansi Kürsch (vokal, bas), Marcus Siepen (gitar) ve (2005''te ayrılan ve yerine Frederik Ehmke''nin getirildiği) Thomas "Thomen" Stauch (bateri) tarafından kuruldu. "Blind Guardian" adıyla tanınmadan önce grup, Lucifer''s Heritage adıyla 1985 ve 1986 yıllarında iki demo albümü çıkardı.\r\n\r\nBlind Guardian her zaman J.R.R. Tolkien, Michael Moorcock, Margaret Weis, Tracy Hickman, Alfred Hitchcock gibi fantazi yazarlarının kurgusal dünyalarından, bir o kadar da geleneksel efsanelerden ve destanlardan esinlenmiştir. Stephen King''in Kara Kule (Dark Tower) serisinin de, sayısız Demon''s and Wizards şarkısında olduğu gibi, grup üzerinde büyük etkisi olduğu Somewhere Far Beyond şarkısından da açıkça anlaşılıyor. Yıllar geçtikçe süregelen bir izlenim, grup üyelerini "gezgin ozanlar" olarak bir arada tuttu.\r\n\r\nGrup üyeleri 1988 yılından, 2005''te baterist, Thomas Stauch, gruptan ayrılana kadar değişmedi. Frederik Ehmke''nin yerini aldığı Stauch''un ayrılma nedeni, grubun son albümleri Nightfall in Middle-Earth ve A Night at the Opera''yla birlikte aldığı yeni yöndü.\r\n\r\n2006 yılında, Blind Guardian A Twist in the Myth isimli yeni bir albüm çıkardı. Grup oldukça sıradışı olan bu albümleriyle sınırları zorlamaya devam ediyor. Albümün ilk videosu da Another Stranger Me parçasına çekildi.\r\n\r\n10 ekim 2009''da Hansi yeni albüm çıkaracaklarını Bllind Guardian''ın internet sitesinde açıkladı. At the Edge of Time isimli 11 şarkıdan oluşan bu abüm 30 temmuz 2010''da Avrupa''da çıkmıştır. Bu albümde Blind Guardian''ın müziği hala büyüleyici bir şekilde ilerlerken, bir çok hayranı tarafından en iyi albümleri olarak kabul edilen Imagination From The Other Side ve Nightfall In The Middle-Earth albümlerindeki tadı yakaladıkları görülür.', 'Zklqr1xj32Q'),
(86, 'Demons And Wizards', 'Power Metal', 'Almanya', 'Blind Guardian ve Iced Earth gruplarının oluşturduğu projedir. Şarkılar power metal ağırlıklıdır. İki grubun ortak projesi olduğundan şarkılarda çift bateri ve bol koro kullanılmıştır.Demons and Wizards, Blind Guardian vokalisti Hansi Kürsch ve Iced Earth gitaristi Jon Schaffer''ın müzikal düşüncelerini birleştirmeleriyle kuruldu. Hansi Blind Guardian''ın Nightfall In The Middle-Earth albümü ile uğraşırken, Jon Schaffer''ın aklında bir fikir belirdi. 1997 sonbaharında Hansi''ye düşüncesini açıp olumlu yanıt alan Schaffer, Amerika''da bu proje üzerinde çalışmaya başladı. Hansi 98''de NIME''nin kayıtları bittikten sonra Amerika''ya giderek çalışmalara ortak oldu. Kayıtlar için Jim Morris''in ünlü Morrisound stüdyosunu kullanan ikili, Bobby Jarzombek, Rubin Drake ve Jim Morris''i de gruba alarak, ilk albümleri olan ''Demons and Wizards''ı 99 ağustosunda tamamladılar. Albümün başarısı üzerine turne düzenleyen grup, çalışmalarına Hansi''nin ve Schaffer''ın ana projelerine dönmeleriyle bir süreliğine ara verdi.Blind Guardian A Night At The Opera''yı, Iced Earth de Glorius Burden''ı tamamladıktan sonra tekrar bir araya gelen grup, ikinci albümleri ''Touched By The Crimson King''i 30 Temmuz 2005''te piyasaya sürerek geri döndü.', 'N1ZVN2Z2uzo'),
(87, 'Hammerfall', 'Power Metal', 'Isvec', 'Gitarist Oscar Dronjak, 1993te başka bir death metal grubu olan Ceremonial Oathtan ayrılıp yanına Jesper Strömbladı da alarak HammerFallı kurdu. Bu fikir Oscarın aklına düştüğünde aslında grubun tüm altyapısı hazırdı; grubun adı, yapısı hatta birkaç parça.. Fakat Jesper ve Oscar çaldıkları diğer gruplar Crystal Age ve In Flamese duydukları saygıdan ötürü bu projeyi daha ileri bir tarihe ertelediler. İkilinin en büyük avantajı ise death metal aleminin büyükleriyle zamanında çok yakın arkadaş olmalarıydı ki, ilk kurdukları kadro içerisinde Niklas Sundin, Mikael Stanne ve Johan Larsson gibi isimler vardı.Bu ekip her sene iki kere bir araya gelip bölgesel bir yarışma olan Rockslagete katıldılar. Zaman ilerlerken Niklas ve Johan yerlerini, Glenn Ljungström(In Flames) ve Fredrik Larssona bıraktı. Steel Meets Steel ve HammerFall gibi HammerFall ezgilerinden çok uzak oalrak grup Alice Cooperın Red, Hot and Heavysini de çaldı.1996ya zıplayalım hemen. Grup, Steel Meets Steel, Unchained ve Judas Priest milli marşı haline gelen Breaking The Law ile Rockslagette ilk defa yarı finale kaldı. Kutlamaların ortasında vokalist Mikaelin artık grupta kalmayacağı anlaşıldı ve bu nedenle gerçekleşen küçük bir araştırma sonucu gruba yeni vokalist olarak Joacim Cans getirildi.Yarışmada çok başarılı performans göstermelerine karşın, HammerFall asla finallere ulaşamadı ki bu da jürinin son dakikada HammerFallı elemesiyle gerçekleşti. Belki de Heavy Metalin dünyada tekrar yükselişinden korktular.Herneyse, grup iki canlı performansının görüntülerini Hollandalı müzik şirketi Vic Recordsa gönderdi. Firma HammerFallın performansından oldukça etkilendi ve akabinde hemen kontrat imzaladılar. Yılın yaz ve sonbahar ayları, parça yazarak, prova yaparak ve müzik kalitesini arttırmaya çalışarak geçirildi. Nihayetinde grubun çıkış albümü olan Glory To The Brave 1997 başlarında piyasaya çıktı.', 'vkmlujV-TvU'),
(88, 'Iced Earth', 'Power Metal', 'Amerika', ' Purgatory adında ufak çaplı bir grup kuruldu Florida?da, tarih 20 Ocak 1985?i gösteriyordu. Heavy Metalin hızla değişime uğradığı bir döneme denk gelen grup, Jon?un Iron Maiden fanı olmasına rağmen, ilk demolarını gayet özgün bir şekilde kaydetmeyi başarmıştı. Nitekim bu ilk üç demo: 85?te ?Burning Oasis? , 86?da ?Horror Show? ve ?Psychotic Dreams? idi. Bu demolar Jon?un kardeşi gibi sevdiği Bill Blackmoon?un ölümünden sonra onun eşyaları ile kaydedilmişti.\r\n\r\nBill ile Jon gerçekten çok samimi dostlardı. Bill grup isminin Iced Earth olmasıkonusunda Jon?a fikir vermişti. Jon, Bill öldükten sonra bu ismi gruba onun için verdi. Bir gece Bill ve Jon dostlar bir partiye giderler ve sarhoş olurlar. Bill bir motorsiklet ile eve gitmek ister ancak Jon onu bu şekilde gitmemesi konusunda uyarır. Bill Jon?u dinlemez ve o motorsiklet üzerinde o gece trafik kazasında ölür. [Jon?un ileride besteleyeceği Watching Over Me şarkısının sebebidir ve bu parça Bill Blackmoon''a yazılmıştır.]\r\n\r\nBu ayrılıktan sonra Jon, Iced Earth ismi ile ilk ciddi demosunu kaydetmişti: Enter The Realm. Bu kayıtta Jon Schaffer (Gitar-Vokal), Randy Shawver (Lead Gitar), Gene Adam (Vokal), Dave Abell (Bas) ve Mike McGill (Davul) elemanları yer almıştı. İlk kadro bu şekilde idi.\r\n\r\nEnter The Realm, Rock Hard tarafından yılın en iyi demosu olarak ilan edilmesi ile grubu bir anda piyasanın içine soktu. Elbetteki dönemim o sabit kuralı gibi görünen ?başarılı bir demodan sonra gelen sözleşme? gerçekleşti ve grup Tom Morris?in de yardımlarda bulunduğu demodan sonra Century Media ile sponsorluk anlaşması imzaladı.\r\n\r\nVe tarih 91?i gösterdiğinde, Heavy Metal büyük değişim içine girdiği bir dönemde, bu değişimden nasibin alan gruplardan birisi de Iced Earth oldu. Ancak elbetteki bu değişim kötü yönde bir değişim değildi. Aslında şunu kullanırsak daha doğru olur; albüm zaten Iced Earth''ün ilk albümüydü. Piyasaya direk değişik bir sound ile girdiler.?Iced Earth? adındaki ilk albüm, Jon?un büyük bir Maiden fanı olmasından etkilenmemiş olsa gerek ki, gayet özgün, karanlık, ürkütücü bir sound elde etmeyi başarmıştı.\r\n\r\nBir takım eleman değişikliğinden sonra [Gene Adam ve Mike McGill yerine vokale John Greely, davula da Richey Secchiari geldi] 92?de gayet karanlık, gayet epik ve gayet hızlı parçalardan oluşan 2.albüm ?Night Of The Stormrider? dünyaya geldi.\r\n\r\nIced Earth albümünden sonra piyasadan aldığı olumlu tepkiler ile Jon, Night Of The Stormrider?ı da aynı içerikte ve tarzda çıkarmaya karar verdi. Ve Jon?un o epiksel hikayeler anlatma yeteneği açığa çıktı ki ileride nelere imza atacaktı nelere? Hayatının en önemli epik parçası da bu albümde idi : Travel In Stygian.\r\n\r\nGrup yükselişe geçmesi gereken bir dönemde düşüş yaşamaya başlamıştı. Elemanlar kırık dökük bir kamyonet ile konserler vermeye devam ediyorlardı. Yeni albümün bir türlü oluşturulamaması onları maddi açıdan da sıkıntıya sokmuştu. Çoğu grup gibi albümden elde ettikleri gelir ile konserlere çıkıyorlardı. Ancak yeni albüm çıkartamadıkları için paranın da sonu yaklaşıyordu. Çoğu zaman Jon bir otelde kalmak ya da araba ile evine gitmek yerine arabada geceliyordu. Bu sıkıntılı dönem zor da olsa 3 yıl sonra 95?te sona eriyor ve 3.albüm olan ?Burnt Offerings? nihayetinde hayranları ile buluşuyordu. Ama ne buluşma! İçinde Dante?s Inferno gibi tarihi, bilimsel, mistik, devrimsel ve müzikal açıdan da bir o kadar özgün ve komplike bir şarkıya imza atmışlardı. Henüz 3.albüm olmasına rağmen Jon?un o hikaye anlatma yeteneği aşırı derecede belli oluyor ve şarkılara yansıyordu. Aynı albümde efsane diğer şarkı hiç şüphesiz Burning Oasis tir.\r\n\r\nGrup hiç vakit kaybetmeden 4. albüm olan ?The Dark Saga? 96?da piyasaya sürüldü. İşte Iced Earth?ün soundunun bariz oluştuğu bir albüm.\r\n\r\nTDS, gerçekten olgun, düzenli, müzikal açıdan mükemmeliyete yakın, içerik açısından da alışılmışın dışında bir albümdü. Uzun yıllar içinde birçok konsere konuk olacak parçaları barındıran bir albümdü. Bu albümün çıkması ile turnelere hız kazandıran grup, bir dönem Jon?un sakatlığı ile gündeme oturdu. Boynundan sakatlanan Jon birçok konsere bandajlı çıkmak zorunda kaldı. Şu an boyun sorunu hala devam etmektedir eskisi kadar olmasa da.\r\n\r\nPurgatory döneminde herhangi sponsorluğu bulunmadan çekilen kayıtları daha güçlü bir ekipman ve stüdyo kaydı ile tekrar çalmıştır grup. Tabi albümlerdeki bazı parçalar da bu şekilde yeniden çalınmıştır. Bu albümde heavy metal camiasının ünlü ve güçlü sesi Matthew Barlow yer almıştır. Gitara Larry Tarnovski ve davula da bir zamanlar Death?te de çalan Richard Christy getirilmiştir.\r\n\r\n98?de ise ileride Alive In Athens konserine birçok parça verecek albüm piyasa sürüldü : Something Wicked This Way Comes. 1999 yılında sadece ABD için "The Melancholy" EP?si çıkmış ve 2 yıl sonra da Avrupa?da yayınlanmıştır. ABD için basılan EP?de ?Melancholy? , ?Watching Over Me? , ?I Died For You?, Bad Company grubundan ?Shooting Star? ve Black Sabbath grubundan da ?Electric Funeral? coverı yer alıyordu. 2001 yılında Avrupa için çıkarılan EP?de de bu parçalara ek olarak, ?Colors? parçasının canlı formatı ve Judas Priest?den ?The Ripper? coverı yer alıyordu. 2001?de tema albüm niteliğinde ?Horror Show? albümü çıkarılmıştı. Bu albüm sadece ?insan korkuları?nı ele alan konularla dolu parçalardan oluşuyordu. Damien, Frankenstein, Dracula, Jekyl&Hyde, Jack, Kurt adam yani Wolf ve vampir ülkesi Transylvania bunlara en güzel örneklerdi.\r\n\r\n2002?de ortaya çıkan Tribute To The Gods albümü, isminden anlaşılacağı gibi Metal Tanrıları?nın parçalarının coverlarından oluşuyordu. Ve 2004? gelindiğinde, Malt gitmiş, grup birçok eleman değişiminden sonra vokale Tim Owens?ın da geçmesi ile The Glorius Burden albümü piyasa sürülmüştür. Bu albüm ileride Jon?un ve hayranlarının başını çok ağrıtacaktır. Nitekim bu albümle Jon birçok kesimden ?aşırı? milliyetçi olarak ilan edilmişti. Bu patlama etkisi yapan dönemden sonra çoğu hayranın 98?de hayran kaldığı ?Wicked Trilojisi? şuan, şu zamanda ?Framing Armageddon? ile tekrar gündeme geldi. Daha öncesinde 2006?da bu albümden parça olan Ten Thousand Strong single olarak tanıtım için konsept albüm olan ?Overture Of The wicked? ile piyasa sürüldü. Bu parçanın dışında albümde triloji yer alıyordu : Prophecy ? Birth Of Te Wicked ? The coming Curse. Jon?un hem prodüktörlükte, hem müzikalitede, hem şarkı sözü yazmasında, hem müzisyenlik kariyerinde en tepeye çıktığı bir albümdü Framing Armageddon. Sadece kendisi değil, elemanlarına yaptığı direktiflerde elemanlar da zirve yapmış, albüm 10 Eylül Avrupa?da ilk haftada listelerde 78.sırada yerini almıştı.\r\n\r\n12 Aralık 2007 tarihinde Jon Schaffer tarafından yapılan açıklama ile fanatiklerin uzun yıllar beklediği efsanevi Iced Earth vokalisti Matthew Barlow Iced Earth''e geri dönmüştür.Bundan dolayı gruptan ayrılan Tim Owens yanında Beyond Fear adlı solo grubunun bassisti olan Dennis Hayes''i de yanında götürmüş, şu an için Iced Earth''ün basistliğini kimin üstleneceği konusunda bizi soru işaretlerine bırakmıştır.Matthew Barlow Something Wicked Part 2 albümü olan Revelation Abomination''da söyleyecek olup, söz verdiği gibi 2008 yılında Pyramaze''in albümünde vokalliği de üstlenecektir.', 'LGzmXUCnxrE'),
(89, 'Nightwish', 'Power Metal', 'Finlandiya', 'Nightwish, Finlandiyalı müzik grubudur. 1996 yılında Kitee?de kurulmuş olan grup; 1997-2001 yılları arasındaki çalışmalarında power metal türünün örneklerini verirken, 2002 ve sonrası albümlerde müziğine senfoniyi de katarak sonradan senfonik power metal olarak anılacak türe öncülük etmiştir. Günümüze kadar 4 milyondan fazla albüm satan Nightwish, kurulduğu günden beri 40?ı aşkın sayıda ülkeyi ziyaret etmiştir.\r\n\r\nGrup başlangıçta akustik gitar, klavye ve vokalden oluşan bir kamp müziği grubu olarak tasarlandı. Tuomas Holopainen?ın uğraşlarıyla 1996 senesinde çalışmalara başlayan grubun kadrosuna ilk olarak gitarist Erno ?Emppu? Vuorinen ve vokalist Tarja Turunen dahil edildi. Tam istedikleri tarzdaki müziği ortaya koydukları bir demo hazırlayan ve buna ?Nightwish? adını veren grup üyeleri, bir süre sonra Turunen?in vokalinin akustik müzik için fazla güçlü olduğu gerekçesiyle müziğe heavy metal elementleri eklemeye karar verdiler.\r\n\r\n?Nightwish? adını taşıyan demonun yayımlanmasından sonra davulcu Jukka ?Julius? Nevalainen grubun kadrosuna dahil oldu. Ardından akustik gitarın yerini elektro gitar aldı. Grubun hali hazırdaki deneysel sound?una metal tınıları da eklenmeye başladığında grubu günümüzde diğer power metal gruplarından ayıran eşsiz sound da yavaş yavaş şekillenmeye başlamıştı. 1997?nin Nisan ayında 7 şakıdan oluşan bir demo kaydetmek için stüdyoya giren grup, ?Angels Fall First? adını verdikleri bu demoyu Spinefarm Records?un yetkililerine dinletmeyi başardı. Plak şirketiyle iki albümlük bir anlaşma için masaya oturuldu ve ardından demoda yer alan parçaları tekrar kaydetmek için stüdyoya girildi. 1997?nin Kasım ayında grubun ilk stüdyo albümü "Angels Fall First" müzikseverlerin beğenisine sunuldu. Yakaladığı başarı ilk albüm için iyi sayılan albüm, Finlandiya listelerinde 31 numaraya kadar çıkarken, albümden çıkan ilk single ?The Carpenter? da single listesinde 3 numaraya kadar yükselmeyi başardı. Single, aynı plak şirketine mensup olan Children of Bodom ve Thy Serpent gruplarının da yer aldığı bir Split şeklinde piyasaya sürüldü. Grup, aynı senenin Aralık ayında ilk canlı performansını verdi. Sonraki sene içerisinde ise sadece 7 konser verebildi, çünkü Nevalainen ile Vuorinen?in askere gitmesi ve Turunen?in de okulla meşgul olması grubun çalışmalarını kısa süre için yavaşlatmıştı. Bu arada yaşanan en olumlu gelişme, Spinefarm şirketinin grubun potansiyelinin farkına varıp anlaşmayı 3 albümlük şeklinde değiştirmesi oldu.\r\n\r\n1998?in Nisan ayında ?The Carpenter? single?ına bir video çekildi. Yaz ayına gelindiğinde grupta eksik kalan son bir halka vardı. O da basçı Sami Vänskä?nın kadroya eklenmesiyle yerini bulmuş oldu. Ağustos ayında tekrar stüdyo yolları aşındırılmaya başlandı. Sonuç olarak grubun ikinci albümü Oceanborn? ortaya çıktı. Sadece Finlandiya?da yayınlanan bu albüm, Turunen?in yanında Tapio Wilska?nın vokallerine de ev sahipliği yaptı. Ambient ve folk elementlerin bir kenara bırakıldığı albüm, ilkine göre daha progresif ve teknik bir sound?a sahipti. All Music Guide, grubun ilk albümü için pek de olumlu şeyler söylememişti. Bu sefer durum farklı oldu. Albüm, Finlandiya?da 5. sıraya yükselirken, ilk single olarak seçilen "Sacrament of Wilderness" 1 numaraya çıkmayı başardı. Albümün başarısından etkilenen Spinefarm, 1999?un sonlarına doğru albümü yurt dışında da piyasaya sürdü. Aynı senenin Mayıs ayında ?Sleeping Sun (Four Ballads of the Eclipse)? adını taşıyan bir single kaydedildi. Single, ilk ayında yalnızca Almanya?da 15.000 kopyalık satış elde etti. Ardından grup, Rage ile birlikte Avrupa turnesine çıktı.\r\n\r\n2000 senesi geldiğinde Nightwish yeni albüm için kolları sıvadı. Albümün çalışmaları devam ederken ?Sleepwalker? ile Eurovision Şarkı Yarışması elemelerine katılan grup, halk oylaması sonucu birinci oldu; fakat jürinin müdahelesiyle elemeleri ikinci olarak tamamladı. Grubun üçüncü stüdyo albümü olan ?Wishmaster?, aynı sene çıktı ve çıkar çıkmaz da Finlandiya albüm listesine zirveden giriş yaptı. Albümün başarısı sadece Finlandiya?yla sınırlı kalmadı. Almanya ve Fransa?daki albüm listelerinde de gözle görülür bir başarısı oldu. Albüme yöneltilen eleştiriler genellikle şarkılarının birbirini tekrar edip durduğu yönündeydi. Bunun yanında gayet olumlu yorumlar da bulunuyordu. Albümün ardından grup, Sinergy ve Eternal Tears Of Sorrow ile birlikte turneye çıktı. 29 Aralık 2000''de Finlandiya''da verilen final konseri "From Wishes To Eternity" adını taşıyan bir DVD ile Nightwish hayranlarına sunuldu.\r\n\r\n2001 senesinde grubun ?Over the Hills and Far Away? adını taşıyan ep?si piyasaya sürüldü. Ep, Gary Moore?un ?Over the Hills and Far Away? şarkısının cover?ı, ?Astral Romance? parçasının yeni yorumu ve iki yeni şarkıdan oluşuyordu. Ep?de ayrıca Tony Kakko ve Tapio Wilska konuk sanatçı olarak yer aldılar. Bundan kısa bir süre sonra grubun bas gitaristi Sami Vänskä?nın gruptan ayrılmasına karar verildi. Onun yerine Sinergy grubundan Marco Hietala geldi. 2002 senesinde grubun ?Century Child? adını taşıyan albümü ?Ever Dream? ve ?Bless the Child? single?larıyla birlikte müzikseverlerin beğenisine sunuldu. Albümdeki en belirgin özellik özel bir orkestranın kullanılmış olmasıydı. Bu sayede grup, çoğu parçasında klasik müziği kendi sound?unun içinde eritmesine rağmen aynı zamanda onu belirgin olarak dışa vurabiliyordu. Ünlü müzisyen Andrew Lloyd Webber?in ?Phantom of the Opera? adını taşıyan eserini yorumlayan grup, bu parçayı Tarja Turunen gruptan ayrılana kadar canlı performanslarında seslendirmeye devam etti. Albüm Finlandiya''da satış rekorları kırdı. Bu sırada Nightwish, Finlandiya''da hem single hem albüm listelerine birinci sıradan girerken, Almanya''da 5, Avusturya''da ise 15 numaradan listeye girdi.\r\n\r\n2002 senesinde grubun ikinvi DVD?si olan ?End of Innocence? yayımlandı. Bundan bir sene sonra vokalist Tarja Turunen evlendi. Evliliğin ardından grubun dağılacağı yönünde haberler çıktı; fakat grup sürekli olarak bu dedikoduları yalanladı ve yeni albüm için çalışmalarını hızla devam ettirdi. Nitekim, Tarja?nın birkaç sene sonra gruptan atılmasında evliliğinin büyük payı olacaktı.\r\n\r\nYeni albüm ?Once?, 7 Haziran 2004?te piyasaya sürüldü. Albümle birlikte piyasaya sürülen ve ?Nemo? adını taşıyan single, üç ülkede zirveye yerleşirken, birçok ülkede de listelerin üst sıralarında yer aldı. Bu albümde Nightwish, parçaların orkestra versiyonlarını yapmaya başladı. 11 şarkının 9?u ?Londra Filarmoni Orkestra? ile birlikte yorumlandı. Bunun yanında, albüm, ilk albümden beri ilk defa Fince bir şarkı içeriyordu. ?Wish I Had an Angel?, ?Kuolema Tekee Taiteilijan? ve ?The Siren? parçaları sonraki single?lar olarak belirlendi. Albüm hem ticari olarak büyük bir başarıya imza attı, hem de eleştirmenlerden tam not almayı başardı. Bu sayede büyük bir dünya turnesine çıkan grup, bir de Best of albümü piyasaya sürdü. Ardından ?End of an Era? dvd?si hayranlara ulaştırıldı.\r\n\r\n2005 senesinde Nightwish elemanları grubun bütün hayranlarını yasa boğacak bir karar verdiler. Grubun yoluna Tarja Turunen olmadan devam etmesi gerektiğini düşünen grup elemanları, kararı bir konser sonrası hayata geçirdiler. Önce Tuomas Holopainen, konserden sonra grup üyelerinin hepsinin imzasını taşıyan veda mektubunu Tarja?ya verdi. Ardından da mektup, grubun web sayfasına koyularak bütün dünyayla paylaşıldı. Grubun gösterdiği gerekçe Tarja?nın evlendikten sonra parasal konulara ve gruba bakışını değiştirmesiydi. Olaydan sonra iki basın toplantısı düzenleyen Tarja, bu haberin onda şok etkisi yarattığını belirtti; çünkü mektup ona verilmeden önce ortada olacaklara dair bir tek ipucu bile yoktu. Yanıtını aynı şekilde, yani halka açık bir şekilde sunan sanatçı, yöneltilen suçlamaların asılsız olduğunu düşündüğünü ve olayın web sitesinden halka açık bir şekilde lanse edilmesinin zalimce bir tutum olduğunu belirterek üzüntüsünün ne denli derin olduğunu açıkladı.\r\n\r\nTarja gruptan ayrıldıktan sonra herkesin gözü Nightwish?in üzerindeydi. Herkes yeni vokalistin kim olacağı sorusunun cevabını bekliyordu. Bu arada grup elemanları vokalist pozisyonuyla ilgilenenlerin gönderdikleri demo?ları değerlendirdi. Sonunda İsveçli Anette Olzon?un gruba katıldığı açıklandı. Grubun altıncı stüdyo albümü ?Dark Passion Play?in kayıtlarına başlanmıştı. Son olarak vokaller kaydedildikten sonra yepyeni bir single dijital ortamda hayranların beğenisine sunuldu. ?Eva? adını taşıyan bu single, daha sonra 25 Mayıs?ta cd olarak piyasaya sürüldü. 13 Haziran?da ise ?Dark Passion Play? albümü müzik marketlerdeki yerini aldı. 22 Ağustos 2007?de yayımlanan ?Amaranth? single?ı While Your Lips Are Still Red? adını taşıyan yeni bir şarkı içeriyordu. Bu şarkı aynı zamanda ?Lieksa!? adındaki filmin müziği olarak kullanılacaktı. Albüm, 3 farklı versiyonuyla satışa sunuldu. İlki standart versiyon, ikincisi bonus şarkı ve albümdeki şarkıların orkestra versiyonlarını da içeren 2 cd?lik özel baskı, üçüncüsü de 2 cd?lik özel baskıya ek olarak bonus ve demolar içeren 3 cd?lik versiyondu. Ayrıca bu albümde Marco Hietala?nın vokalleri önceki albümlere göre daha ön planda yer aldı.\r\n\r\nAlbümden seçilen 3. single ?Erämaan Viimeinen?ın ardından 15 Şubat 2008?de ?Bye Bye Beautiful? şarkısı da single olarak piyasaya sürüldü. Beşinci single olarak ?The Islander? seçildi. Korkulan olmadı ve eleştirmenlerin albümle ilgili yorumları gayet olumlu oldu. Bu yorumların en baskın olanı ise grubun Tarja?dan sonra zincirlerini kırıp özgür kaldığı yönündeydi.\r\n\r\n22 Eylül 2007?de Olzon ile verilen ilk konser, gizli olarak Estonya?da ?Nightwish cover grubu Nachtwasser? adı ile gerçekleştirildi. İlk resmi konser ise 6 Ekim 2007 tarihinde İsrail?de hayata geçti. "Dark Passion Play" turnesinin ilk ayağında ABD, Kanada ve Avrupa?nın tamamına yakınını ziyaret eden grup; 18 Aralık 2007?den itibaren başlayan ikinci bölümde ise Asya ile Avustralya?ya uğradıktan sonra Kuzey Amerika ve Avrupa?ya başka konserler için geri döndü. Üç yıl süren turne "End Of An Era"nın da çekildiği Hartwall Arena''da ünlü çello rock grubu Apocalyptica ile birlikte 19 Eylül 2009 tarihli bir konserle sonlandırılacak.\r\n\r\nGrup, 2009''un Mart''ında "Made In Hong Kong (And In Various Other Places)" adını taşıyan bir mini konser albümü yayınladı. Bu mini albüm; Dark Passion Play 2007-2008 Dünya Turnesi esnasında kaydedilmiş sekiz canlı performans, "Bye Bye Beautiful" teklisinin b-tarafları, "Cadence Of Her Last Breath" adlı parçanın daha önce yayınlanmamış demo kaydı ve "Back In The Day... Is Now" adını taşıyan 37 dakikalık bir belgeselden oluşmaktaydı.\r\n\r\nGrubun beyni Holopainen''ın, yeni albüm hakkındaki demeçleri: ?2010''un baharında iki ay sürecek olan provalara başlayacağız. Yeni albüm için kafamda o kadar çok fikir var ki, neredeyse kafam patlayacak. Hemen şimdi stüdyoya gitmeyi isterim. Şimdiden iki-üç şarkı hazır ve yeni albümün nasıl olacağını da az-çok görebiliyorum. Yeni albümün tarzı hakkında çok şey söyleyemem çünkü halen plan aşamasındayız; ama duygunun Dark Passion Play?de olduğu gibi güçlü ancak olayın öbür tarafında olacağını umuyorum. Bir önceki albüm keder, acı ve ıstırap ile ilgiliyse bu albüm tünelin sonundaki ışıkla alakalı olabilir. Bu çok iyi olurdu; çünkü daha fazla inlemek istemiyorum?\r\n\r\nHolopainen aynı zamanda bas gitarist/vokalist Marco Hietala''nın tek başına kaleme aldığı ve baş vokalini üstlendiği en az bir şarkının da albümde bulunacağını açıkladı. Hietala''nın en az "Dark Passion Play"deki kadar ön planda olacağını belirten Holopainen, erkek vokallerin bir önceki albümden daha melodik biçimde olacağını da belirtti.\r\n\r\nHietala ise söyle demiştir: ?Yeni albümle ilgili pek çok fikrim ve şarkım var; ama önce Tuomas''ın süzgecinden geçmeli.?', 'p6xaIPszwpo'),
(90, 'Within Temptation', 'Power Metal', 'Hollanda', 'Within Temptation 1996 yılında kuruldu. Kurucu üye Robert Westerholt vokalistlerini bulmuştu bile sevgilisi Sharon Den Adel... 2 ay gibi kısa bir süre sonra değişik firmalardan teklifler aldılar ve sonunda DSFA Record ile anlaştılar ...\r\n\r\nGrup için DSFA ile anlaşmalarından sonra herşey yoluna girmişti. İlk albümleri "Enter" nisan 1997 yılında yayınlandı ve kısa bir süre sonra Dynamo festivalinde çaldılar (1997). Bu onların 5. konser deneyimleriydi... Dynamo Festivalindan sonra pek çok konser teklifi aldılar ve 1997 Kasım ayında 2 haftalık Almanya ve Avusturya turnesine çıktılar... Pek çok konser bunu takip etti. Grup 1998 yılında Dynamo''da ana sahnede performanslarını gösterdikten sonra "The Dance" adlı EP''lerini yayınladılar. Enter''dan sonra grup çalışmak için bir süre boş zaman buldu kendisine... 1999 Yılında W.T. üyeleri işlerini biraz yavaştan almaya karar verdiler. 2 senelik yoğun koşturmaca konserlerden sonra bir süre kendilerine zaman ayırmaya karar verdiler. Öğrenimlerini tamamladılar ve kendi stüdyolarını kurdular.\r\n\r\n2000 yılı onların büyük değişiklikleri yaptıkları yıldır. Grup Hollanda, Belçika gibi Benelux ülkelerindeki en büyük festivallere davet edildi ve Aralık ayında "Mother Earth" albümleri yayınlandı. Pek çok Hollanda müzik dergisi bu albümü ayın albümü olarak seçti. Değişik müzik listelerinde en üstlere kadar çıktı ve sevenlerinin sayısı hızla arttı.\r\n\r\n2001 yılında W.T. Hollanda içinde ve dışında pek çok turneye katıldı (Paris, Mexico City, Belçika''da 40 konserinin biletlerinin tamamı satıldı). Ve iki Cd-Single yayınladılar: "Our Farewell" ve "Ice Queen". 2002 yılında Ice Queen single çalışması Hollanda ve Belçika''da pek çok müzik listesinde 1. sıraya kadar çıktı. Mother Earth albümleri altın plak kazandı, pek çok radyo ve tv kuruluşu grubun şarkılarını yayınladı. Fransa turnesi haricinde grup sadece Belçika, Hollanda ve Almanya''daki belli başlı festivallere katıldı.\r\n\r\nGrup 2004 yılında "The Silent Force" isimli albümlerini çıkardı ve bir çok ülkede Platinium plaklar aldılar. Albüm satışları 1,000,000''u buldu. Albümden 3 adet single çıktı: Stand My Ground, Memories ve Angels.\r\n\r\nAlbüm turnesine devam ederken 2005 yılının sonlarında özel olarak verdikleri Java Eiland konserini 2-DVD şeklinde piyasaya sürdü.\r\n\r\n2006''da Sharon Den Adel''in hamileliği nedeniyle kısa bir ara vermek durumunda kalan grup bu süre zarfında yeni albüm çalışmalarına başladı.\r\n\r\n2007''de "What Have You Done" isimli Keith Caputo düetiyle grup yeni albümlerinin müjdesini verdi. "The Heart of Everything" albümü 10 Mart''ta piyasaya sürüldü.\r\n\r\nBu albümden çıkan son single "Frozen"ın satışlarından elden edilen gelirin çocukları korumak için kurulmuş bir kuruma bağışlanacağı açıklandı.\r\n\r\nGrup şu anda turnesine devam etmekte.', 'bhzJO34SCoc'),
(91, 'Control Denied', 'Progressive Metal', 'Amerika', 'Dünyanın en büyük death metal gruplarından biri olan "Death" grubunun beyni Chuck Schuldiner tarafından hayata geçirilen proje..96 yılında çıkardıkları "a moment of clarity" isimli demo ile death çizgisinden farklı bir yapıya sahip türde müzik inşa edeceklerinin sinyallerini önceden vermişlerdir..Klasik Death soundundan apayrı bir soundla kaydettikleri "The Fragile art Of Existence" alternatif vokal ve progresif power metale kayan yapıdaydı..kadroyu; vokalde "Tim Aymar" gitarda "Chuck Schuldiner" basta "Steve Digiorgio" ritim gitarda "Shannon Hamm" ve davulda "Richard Christy" oluşturmaktadır..Albümün çıktığı 99 yılında, birçok müzik otoritesince Chuck Schuldiner''ın yaptığı en iyi albüm olarak gösterilmiştir..2001 yılına kadar hiçbir şekilde faal olmayan grup 13 Aralik, 2001''de Chuck Schuldiner''ın ölümüyle tek albümlük proje olarak kalmıştır...', 'anczqsRxgik'),
(92, 'Dream Theater', 'Progressive Metal', 'Amerika', ' Dream Theater, Amerika/New York''tan çıkmış Progresif Metal grubudur. 90''ların başında Amerika''da başlayan progressive metal hareketinin Queensryche ve Fates Warning ile beraber en büyük grubudur. Grup müziğinde progresif rock ve heavy metali, jazz temelleri ile birleştirmiştir. Hayat ve felsefe gibi derin konulardan etkilenen şarkı sözleri ile progressive metal''de yeni bir yol açmış, birçok grubun müziklerini etkilemişlerdir.\r\n\r\nYaklaşık 25 yıldır resmi olarak müzik yapan Dream Theater, Berklee''de okuyan bas gitarist John Myung, gitarist John Petrucci ve davulcu Mike Portnoy tarafından kurulmuştur. Daha sonra Petrucci''nin çocukluk arkadaşı Kevin Moore''un da katılımıyla grup "Majesty" adını aldı. Yaptıkları ilk deneme albümün başarıya ulaşması sonucu "Majesty" isminin başka bir grup tarafından kullanıldığını öğrenip, Mike Portnoy''un babasının tavsiyesiyle grubun adı eski bir sinemadan esinlenerek "Dream Theater" olarak ilk ve son kez değiştirmişlerdir. Grubun ilk albümü (When Dream and Day Unite) 1989 yılında piyasaya sürüldü. Bu albümden sonra müzikal farklılıklar yüzünden vokalist Charlie Dominici gruptan ayıldı ve onun yerine Kanadalı James LaBrie gruba katıldı. En büyük çıkışı 1992''de ikinci albümleri "Images and Words" albümüyle gerçekleştirdiler. İlk konserlerini Iron Maiden''ın katkısıyla gerçekleştirdiler. 1994''te Awake albümünü çıkaran gruptan Kevin Moore ayrıldı ve yerine Derek Sherinian geldi. 1995''te A Change Of Seasons albümünü 1997''de çıkan Falling From Infinity albümü izledi. Daha sonra gruba Jordan Rudess girdi ve 1999''da Metropolis Part 2 yan başlıklı Scenes From A Memory adlı konsept albüm çıktı. Bu albümde Nicholas diye biri hipnoz ile geçmiş yaşantısına döndürülür ve geçmiş hayatında Victoria adlı bir kadın olduğunu ve iki erkek kardeşin ona aşık olması sonucu yaşanan sorunları görür (Bu hikâyenin başı da Images and Words albümünde Metropolis Part 1 olarak anlatılmıştır). Daha sonra deneysel albümler yapan grup 2002''deki 6 Degrees Of Inner Turbulence adlı 2 CDlik bir albüm yaptılar. 2003''te ise kariyerlerinin en sert albümü olan Train Of Thought piyasaya sürüldü. Bu albümü 2005 yılında Octavarium izledi. John Petrucci bu albümü en iyi albümleri olarak düşündüğünü "Score" adlı DVD lerinde belirtmiştir ve son albümleri olan Systematic Chaos ise 2007 yazında piyasaya sürüldü.2008 Nisan ayında ise best of albüm tadında olan ve grubun eski şarkılarını stüdyoya girip tekrar coverlayarak piyasaya sürdüğü Greatest Hit albümü piyasaya sürüldü. Ve son albümleri "Black Clouds and Silver Linings" 23 Haziran 2009 tarihinde piyasaya çıkacak. Mike Portnoy''a göre albüm bir çok karanlık temayı, sert bir üslupla işliyor, fakat bu karanlık ve ağır havanın yanında iyimser bir çizgi de çiziyor, hem müzikal hem tematik anlamda. Bu açıdan albüm ismi keşiyor, Mike Portnoy''a göre. Grup, sonuncusu Haziran 2007 olmak üzere 3 kere Türkiye''ye konser verdi. İlki 6 Degrees turnesinde, ikincisi Octavarium turnesinde gerçekleşti. Train Of Thought turnesinde de gelmek istemelerine rağmen, konser daha sonra iptal edildi. Bu yaz grup Türkiye''de 4 Temmuz 2009 günü Maçka Küçükçiftlik Park''ta bir konser verdi. Grup üyelerinin hepsi birçok albümde değişik müzisyenlerle çalışmış, değişik projeler dahil olmuştur. Gitarist John Petrucci 2005 yılında Steve Vai ve Joe Satriani ile beraber G3''te çalmış ve G3 Live in Tokyo isimli albümde yer almıştır. Ayrıca kendisinin Suspended Animation adında solo albümü de vardır. Mike Portnoy da defalarca Dünyanın en ünlü davul dergilerine kapak konusu olmuş , dünyanın en iyi davulcularından biridir. Rudees gruba katılmadan önce ünlü basçı Tony Levin, Petrucci, Rudess ve Portnoy Liquid Tension Experiment adı altında iki albüm çıkarmıştır. John Petrucci nin "Rock Discipline", Mike Portnoy''un "Progressive Drum Concepts", "Liquid Drum Theater", "in Constant Motion", John Myung''un "Progressive Bass Concepts" isimli eğitim videoları vardır.', 'EkF4JD2rO3Q'),
(93, 'Liquid Tension Experiment', 'Progressive Metal', 'Amerika', ' Liquid Tension Experiment, Dream Theater üyelerinden John Petrucci (gitar), Jordan Rudess (klavye), Mike Portnoy (bateri) ve King Crimsondan progresif rock ikonu Tony Levin (bass, Chapman Stick) tarafından kurulan enstrümantal rock projesiydi. Grup, Dream Theaterın yan projesi olarak 1998de kuruldu. Liquid Tension Experimentın başarısından dolayı Rudesstan sık sık gruba katılması istenmişti. Mike Portnoy "Liquid Drum Theater" DVDsinde ve Score Documentaryde bundan bahsetti. Jordan Rudess 1994te katılma önerisini aynı zamanda Dixie Dregs üyesi olması nedeniyle reddetti.Daha sonra Rudess Metropolis Pt.II : Scenes From a Memory adlı albümle Dream Theater''a katılmış olarak karşımıza çıktı.Ve günümüze kadar Dream Theater ile birlikte gelmeyi,uyum içinde çalışmayı başardılar.Liquid Tension Experiment, Magna Carta recordstan Liquid Tension Experiment (1998) ve Liquid Tension Experiment 2 (1999) isimli iki albüm kaydetti. Ayrıca New York,Philedelphia ve Los Angelesta konserler verdi. Mike Portnoy, üçüncü bir LTE albümü olmayacağını açıkladı. Ancak, birkaç şarkı ve riff Dream Theater konserlerinde çalınmakta; Live at Budokan (2004)dan Instrumedleyde olduğu gibi.Fakat daha fazla ayrı kalamayan Liquid Tension Experiment ekibi yeni bir proje için 2006 yılında kollarını sıvadılar.Fakat John Petrucci''nin karısı erken doğum yapınca projeden ayrıldı ve ekip Portnoy,Levin ve Rudess olarak çalışmalarına devam etti.Bunun üzerine Liquid Trio Experiment adı altında Spontaneous Combustion albümü 2007 yılında piyasaya sürüldü.', 'edqH0ofRQrM');
INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(94, 'Meshuggah', 'Progressive Metal', 'Isvec', 'Meshuggah 1987 yılında Umea, İsveç?te kuruldu. Gitarist Fredrik Thordendal, bas gitarist Peter Nordin ve vokalist Jens Kidman 1989 bir çıkış EP?si kaydettiler? Umea bu müziğin yükselişi için güzel bir bölgeydi çünkü hemen herkes rock müzikle iç içeydi. Jens Kidman?a göre Umea?dan bir sürü iyi grup çıkıyordu çünkü başka yapacak bir şey yoktu. Umea?yı müzik açısından asıl güçlendiren ise üniversiteydi. Hemen herkes bir grupta çalıyordu ama sadece birkaç tanesinin ismi şehir dışına çıkabilmişti. ?Herkesin amacı yaptıkları müzikle şehirden kurtulmaktı, o yüzden buradan bir çok müzisyen çıkıyor? diyor Marten Hagstrom?\r\n\r\nMeshuggah?ın 1989?da piyasaya çıkan ilk EP ?Psykisk Testbild?i dinlediğinizde zaten genel etkilenimleri görebilirsiniz ki en büyük etkilenim kesinlikle Metallica idi? EP?nin tarzı o dümdüz bir çizgide ilerlese de daha sonraki dönemlerde grubun müziği, eklenen progresif öğeler ve Fredrik Thordendal?ın gitar soloları ile yepyeni bir kimlik kazanacaktı.\r\n\r\nGrup ilk albümü ?Contradictions Collapse?i 1991?de piyasaya çıkardıktan sonra baterist Tomas Hake gruba katıldı. Grubun ilk sözleşmesi ise Alman firma Nuclear Blast ile oldu? Albümdeki şarkılar EP?ye göre daha komplike ve süre olarak da daha uzundu? Firma albümün promosyonu adına hiçbir harekette bulunmayınca ilk albümün satışı oldukça kötü oldu. Bu albümün sonrası ve ikinci albümün çıkışı arası, grubun gitaristi Jens Kidman bütün konsantresini vokale vermeye karar verince, gitar misyonunu, Tomas Haake?nin altıncı sınıftan beri arkadaşı olan, Marten Hagstrom üstlendi. Hagstrom; ?Building a Big Building? şarkısının grubun karakterini anlattığını savunuyor.\r\n\r\nGrup bu yeni kadrosuyla kaydettiği ilk EP ?None?ı 1994?te piyasaya çıkardı ki bu EP, firmanın gruptaki potansiyeli görmesini sağlıyordu. Lakin yaşanan talihsizliklerin ardından grup senenin geri kalanını sessiz geçirdi; marangoz olan Frederik Thordendal sol parmağını kesmişti. Tam parmak iyileşti derken bu sefer de Tomas Haake elini makineye kaptırınca, geri kalan aylar provasız geçiyordu. ?Selfcaged? EP?si 1994 senesinin baharında kaydedilmesine rağmen yaşanan aksilikler nedeniyle bir sene sonra piyasaya çıkabildi?\r\n\r\nTarih Ocak 1995?i gösterirken firma, Avrupa kadrosundan grubu çıkarınca grup tekrar halk arasına karıştı? Eve dönen Meshuggah, ?Destroy, Erase, Improve? albümünü kaydedip, Machine Head ile Avrupa turnesine çıktı. Turun yarısında bas gitarist Peter Nordin hastalandı? Orta kulak problemi yaşayan Nordin, İsveç?e geri döndü? Machine Head bas gitaristi Adam Duce yardım teklif etse de grup Machine Head?in performansını etkilememek için tura 4 kişi devam etme kararı aldı? Bazı konserlerde Fredrik bas gitar çalarken, bazı konserlerde ise Marten gitarını bir oktav düşürerek şovun devam etmesini sağlıyordu. ?Destroy, Erase, Improve? Mayıs 1995?te piyasaya çıkarken, albümün pazarlamasını bu sefer Nuclear Blast üstlendi? Grup, 1995?in kış aylarında Clawfinger?la küçük bir İskandinavya ve Almanya turuna çıkarken, Peter Nordin yine kadroda yoktu ki kısa bir süre sonra da gruptan ayrıldı? Nordin?den doğan boşluğu Gustaf Hielm doldurken aynı senenin sonbaharında Hypocrisy ile bir ay sürecek bir turneye çıkıyorlardı.\r\n\r\n1996 yılında Fredrik kendi solo albümü üzerinde çalışmasının yanı sıra İsveç?in süper ikilisi Mats & Morgan?ın ilk albümünde de yer aldı? Bu arada Meshuggah yaz aylarına doğru bir de demo kaydetti fakat demo bir şekilde kayboldu? 1997 yılının Mart ayında Fredrik?in solo albümü piyasaya çıktı? Mayıs ayında grup, finans işlerini daha rahat halledebilmek için Stockholm?e taşındı?\r\n\r\nBu arada grup yeni bir EP hazırladı. EP?de yeni bir şarkı ?Sane? ve son albümün açılış şarkısı ?Future Breed Machine?nin 3 ayrı versiyonu bulunuyordu. ?The True Human Design? adlı EP, firmanın sayısız ertelemelerinden sonra nihayet sonbaharda piyasaya çıkabildi. Yıl sona ererken yeni albümün hazırlıkları ise başlamıştı.\r\n\r\nOcak 1998?de, Gustaf Helm grubun daimi üyesi oldu. Grubun İsviçreli hayranı Peter Stöckli?nin kurduğu fan club, grup hakkında 36 sayfalık bir booklet yayınladı? Maalesef fan club, finansal problemler nedeniyle uzun süre tutunamadı ve kapandı. Şubat ayında Nuclear Blast, ?Contradictions Collapse? albümünü makyajladıktan sonra 4 yayınlanmamış şarkı ekleyerek tekrar piyasaya çıkardı? Grup bunu gereksiz görse de en azından grubun ilk zamanlarını dinleyemeyenler için faydalı olmuştu. Yeni albüme dair dedikodular sürekli ortaya atılırken, yeni albüm ?Chaosphere?in kayıtlarına Mayıs ayında başlandı? Albümün kaydından hemen sonra Mesuggah ufak bir Amerika turuna çıktı? Birkaç ertelemenin ardından albüm, Kasım ayında nihayet gün ışığı görürken Tomas Haake?nin albüm hakkındaki yorumu ise oldukça ilginçti; ?Destroy Erase Improve güzel ama gay bir albümdü, Chaosphere ise bambaşka!?? Bazıları grubun barındırdığı progresif öğelerin yok olduğunu söylese de grup gayet doğal bir gelişim süreci içerisinde kendini bulmaya devam ediyordu.\r\n\r\n1999 senesi konser iptalleri ile başlasa da işler, Slayer?la çıkılan dünya turuyla yoluna girmeye başlamıştı. Yeni albümleri ve konser performansları Amerikan medyasının dikkatini çekmeyi başarmıştı? Gitar, bateri ve metal dergileri Meshuggah hakkında yazılar yazmaya başladılar. Grup, aynı senenin yaz aylarında İsveç?te de birkaç konser verdi? 2000 senesiyle beraber tekrardan yeni albüm dedikoduları yayılmaya başladı. Grup şarkı yazımında yavaş yavaş ilerlerken, bekleyen hayranlarına ise ?Rare Trax? adlı bir albüm piyasaya çıkardı? Albümde eski demolar ve hiç yayınlanmamış şarkılar mevcuttu. Yeni albümün piyasayı çıkması 2001 yılının sonbaharı olarak belirlenmesine rağmen albüm bir türlü çıkamadı. Nuclear Blast yine grubu ihmal ediyor ve albüm söz verilen videolar olmadan piyasaya çıktı.\r\n\r\n2001 yılının Haziran ayında Gustaf Hielm gruptan ayrıldı. Neden ayrıldığı veya gruptan atılıp atılmadığı ise muallak ama görünen o ki bu ayrılık grup içerisinde bir rahatsızlık yaratmadı? Gustaf yine de grubun etrafında dolanıyor, bazı işlerde yardım ediyordu. Meshuggah, Tool?a katılarak büyük bir Amerika turnesi gerçekleştirirken toplam 10.000 kişiye çaldılar? 2002?nin Mart ayında yeni albüm söylentileri dolanmaya başlamıştı? Demo için kaydedilen üç şarkı Meshuggah?ın müzikal evriminde ulaştığı yeni boyutu gösteriyordu. Asıl albümün kayıtları Mayıs?ta başlarken, 5-6 hafta sonra tamamlanıyordu. Grup, tekrar Amerika?nın yolunu tuttu ve Ozzfest?e katılarak belki de hayatının en sağlam sahne performansını gerçekleştirdi?\r\n\r\n?Nothing? albümünün internete düşmesi grupta şok etkisi yaratsa da linkin fazla bilinmemesi gruba bir zarar vermedi? Birkaç ay sonra piyasaya çıkan albüm, daha önce hiç duyulmamış kalitede hem temiz hem brutal vokaliyle eşsizdi? Grup her albümde gelişirken hayranları, ikiye bölünmüştü? Bir kısım grubun geldiği yeni noktayı inanılmaz bulurken, bir kısım da hayal kırıklığı yaşıyordu? 2002 senesinin sonunda, albümün piyasaya çıkışının hemen ardından grup tekrar Tool ile Amerika turnesine çıkıyordu?', 'y6VerKdcrOQ'),
(95, 'Opeth', 'Progressive Metal', 'Isvec', 'David Isberg ve Mikael Åkerfeldt tarafından 1990 yılında Stockholm?de kurulan Opeth-okunuşu "Opeh"-, Death Metal''e progresif tarz sesler ve akustik öğeler kattı. Namları yükseldikçe, müzikte kategori sınırı tanımayan bir grup olarak bilinmeye başlandı.\r\n\r\n1992 yılında David Isberg''in ayrılmasının ardından vokale geçen Mikael Åkerfeldt, çıkardıkları demolardan sonra gruba katılan yeni üyelerle nihayet ilk albümleri ?Orchid?''i, gruptaki cevheri gören Candlelight Records şirketi 1995 yılında piyasaya sürdü. Bu albümde gitarda Peter Lindgren, bas gitarda Johan De Farfalla, bateride ise Anders Nordin gruba katıldı. Albüm başarılı oldu ve Opeth metal camiasına girişini yaptı.\r\n\r\nBu albümün ardından grup 1995 ilkbaharında İngiltere?de, birinin London?s Astoria olduğu, iki büyük organizasyona katıldı. Konserlerden sonra Stockholm?e geri döndüklerinde hemen ikinci albümleri ?Morningrise? için çalışmalara başladılar. Albümü 1996 ilkbaharında doldurdular. Albüm piyasaya çıkmadan önce grup Morbid Angel ve The Blood Divine?la İngiltere?ye ikinci bir turneye çıktı. Senenin sonunda çıkan ?Morningrise?, metal hayranları ve eleştirmenlerden tam not aldı. Grup adını dağa taşa duyurdu, İngiliz black metalin tanrısı Cradle of Filth?le Avrupa turuna çıkma şansı buldu.\r\n\r\nGrup bundan sonraki iki sene boyunca çalışmalarını sürdürüp boş durmasa da albüm çıkarmadı. Bu arada baterist Anders Nordin Brezilya''ya taşınarak grubu terkeder. Opeth kadrolarına eleman aramaya başladı. Bunun için ?Biz çok büyük bir grup olucaz. Bu fırsatı kaçırmak aptallıktır, meşhur olacaksın!? şeklinde ilanlar verdiler. Ummadıkları kadar başvuru aldılar. Ve nihayet Uruguay doğumlu, eski Amon Amarth?lı Martin Lopez?i kadrolarına dahil ettiler. Bu arada bas gitarist John De Farfalla da gruptan atılır. Martin Lopez, en iyi arkadaşı olan basist Martin Mendez?i gruba önerdi. Grup -daha sonraları onları bugünlere getiren en önemli kişilerden biri olacak olan- Martin Mendez?i de gruba aldı. Yeni kadroyla 1998 yılında daha karanlık, daha agresif olan ?My Arms, Your Hearse? konsept albümü çıktı ve grup ününe ün kattı.\r\n\r\nOpeth?in bir sonraki albümü, İngiltere?nin en büyük metal plak şirketi Peaceville etiketiyle çıkan Still Life (1999) oldu. Albüm kapağıyla da dikkat çeken bu konsept albüm grubun dinleyici kitlesini daha da artırdı.\r\n\r\nGrup bir sene sonra yeni albümleri ?Blackwater Park? için Gothenburg?da stüdyoya girdi. Steven Wilson''ın (Porcupine Tree) prodüktörlüğünde 2001 yılında piyasaya çıkan albüm Opeth?e dünya arenasında daha da büyük bir şöhret kazandırdı. Grup bu albümden sonra ilk kez Amerika?da, Malwaukee Metalfest için Amorphis ve Nevermore ile turneye çıktı ve Avrupa?da çeşitli büyük etkinliklere katıldı.\r\n\r\nBundan sonra grup ?kardeş? olarak adlandırılan iki albüm daha çıkardı. Bunlardan birincisi Deliverance ve ikincisi Damnation?dı. İki albüm de aynı anda hazırlandı. Stüdyoya kapanıp iki albüm birden hazırlayan grubun vokali Akerfeldt o günler için ?Bir daha cüret edemeyeceğimiz, kabus gibi günlerdi.? diyordu. Deliverance brutal, kapkara ve karanlığa gömülmüş bir konsepte sahipken Damnation, içerdiği progresif ve klasik rock sesiyle, o karanlığı dengeleyen bir ışık gibiydi. İki albüm kontrast ama uyumlu, dengeleyici bir halde hazırlanmıştı. Böylece Deliverance 2002 sonbaharında, Damnation ise 2003 ilkbaharında çıkmış oldu.\r\n\r\nDamnation turneleri sırasında klavyede olan Per Wiberg, artık grubun bir üyesi olmuştur. Üst üstte başarılarla ilerleyen kariyerlerine artık beş kişiyle devam eden grup, Ağustos 2005''de piyasaya çıkardıkları vurucu sözlere sahip son albümleri Ghost Reveries ile Progressive Metal müziğinde en iyi albümlerine imza attılar. Ghost Reveries''in özel baskısı Ekim 2006''da, bonus olarak Deep Purple''ın "Soldier Of Fortune" parçasının yorumu eklenerek yeniden piyasaya çıktı.\r\n\r\nSon albümün turneleri sırasında nadir bir kan hastalığı teşhisi konulan başarılı bateristleri Martin Lopez tedavisi için 12 Mayıs 2006''da ayrılarak, Mikael Åkerfeldt''ın da yer aldığı Bloodbath ve Witchery gibi SuperGroup''ların bateristliğini yapan Martin Axenrot kadroya dahil olmuştur. Başarı albümlere imza atan grupta Lopez''in ayrılmasından tam bir yıl sonra, üzücü bir ayrılık haberi daha gelir. Ailesine ve kendisine uzun yıllardır vakit ayıramadığı için ayrılma kararı alan gitarist Peter Lindgren, ilk albümden itibaren 15 yıl boyunca Mikael Åkerfeldt ile birlikte ilerledikleri yoldan çekilerek, tüm Opeth sevenlerini yıkan bir açıklamayla 17 Mayıs 2007 tarihinde Opeth kadrosundan çıktı. Açıklamasının yayınlandığı aynı gün Mikael Åkerfeldt de bildiri yaparak Peter''ın yerine eski Arch Enemy gitaristi Fredrik Akesson''ın geçtiğini duyurdu. Fredrik Akesson ile bir kez daha değişen kadrosuyla Opeth, yeni albümleri Watershed''i 26 Nisan 2008''de piyasaya sürdü.Bu albümün Special Edition''unda Derelict Herds(Japon Bonusu) ,Bridge Of Sighs(Robin Trower Coveri) ,Den Standiga Resan(Marie Fredriksson Coveri) ve Mellotron Heart(Porcelain Heart''ın Mellotron eşliğinde düzenlenmiş hali) bulunmaktadır.\r\n\r\nProgresif death metal tarzıyla Opeth, şu anda en büyük hayran kitlesine sahip metal grupları arasında...', 'wxaFANthouM'),
(96, 'Tool', 'Progressive Metal', 'Amerika', ' 1990 yılında Los Angeles?ta kurulan progressive rock grubu tool, kompleks ritim değişimleri, etkileyici vokalleri ve şarkı sözlerindeki sıradışı konularla tanınmaktadır. Grup;Maynard James Keenan (vokal), Paul D?Amour (bass) (1995 yılında yerini peach''in eski basçısı justin chancellor''e bırakır) (bas gitar, gitar) ve Adam Jones (gitar)?dan oluşmaktadır. Sonradan kadrosuna Rage Against The Machine ''in gitaristi Tom Morello?nun aracılığıyla eklediği Carole King, the wild blue yonder, Green Jelly ve Pigmy Love Circus gruplarının davulcusu Danny Carey ile ilk gerçek kadrosunu oluşturmuştur.\r\n\r\n1991 senesinde kendi isimleriyle aynı adı taşıyan ilk demoyu sınırlı sayıda basan ve çevreye dağıtmaya başlayan tool, aynı sene Rage Against The Machine, Rollins Band, Skitzo ve Fishbone gruplarıyla konserler vermeye başlamıştır.\r\n\r\n1992 yılında yayınlanan ?Opiate? adlı EP ile ismini duyurmayı başaran tool, albümün ismini Karl Marx?ın ?toplumların en önemli uyuşturucusu dindir? sözünden etkilenerek koymuştur. EP?de sosyolojik problemleri dile getiren grup üyeleri, enstrümanların üzerindeki yetenekleriyle oldukça sert ve karmaşık bir sound yakalamıştır. Albümden ?Hush? ve ?Opiate? single olarak yayınlanmıştır.\r\n\r\n1993 senesinde ?Undertow? adlı ilk albümünü Zoo Entertainment etiketiyle piyasaya sürülmüştür. Kapağıyla ve içindeki kitabıyla dikkat çeken albüm, ne var ki içerdiği bazı resimlerden dolayı bazı müzik dükkanlarında satışa sansürlü olarak sunulmuştur. (örn. Albümün kapağındaki domuz, hayvansever olarak tanınan Adam Jones''un beslediği domuzdur.)\r\n\r\n1996''da yayınlanan Ænima, ismini Carl Gustav Jung''ın arketip teorisinde geçen anima ve animus kavramıyla birleştirilmiş lavman (enema) tedavisiniden almıştır.\r\n\r\nBu albümde eski peach basçısı Justin Chancellor bas gitar çalmış olsa da albümdeki 4 parçanın bestecileri arasında Paul D''amour yer almaktadır.\r\n\r\nBu albümde yer alan ænema, 1998 yılında "En iyi metal performansı" dalında Grammy kazanmıştır.\r\n\r\n2000 yılında, Maynard James Keenan yan grubu A Perfect Circle ile turnede olduğundan grup üçüncü stüdyo albümünü ertelemiş, bunun yerine DVD formatında bir live albüm yayınlamıştır: Salival\r\n\r\nBu albümde, o tarihe kadar çekilmiş tool kliplerinin sansürsüz versiyonları ile canlı olarak çalınmış 5 parça dışında, Peach''den You Lied ve Led Zeppelin''den No Quarter adlı parçaların cover''ları da yer almaktadır.\r\n\r\n2001 yılına geldiğimizde tool, Lateralus ile bir kez daha karşımıza çıkmakta. Bu albümde bütünlük ve yaratıcılık anlamında maksimum üretimde bulunan grup, müzik tarihindeki yerini sağlamlaştırmıştır. Hatta bir ara, o tarihlerde İkiz Kulelere yapılan saldırıdan sonra bir süreliğine yasaklanan schism adlı parça ile müzikleri dışında da gündemde yer aldılar.\r\n\r\nBu albümde yer alan schism, 2001 yılında "En iyi metal performansı" dalında Grammy kazanmıştır.\r\n\r\n2006 Mayıs ayında ?10,000 Days? adlı 4. albümünü piyasaya süren tool, albümün tüm prodüksiyonunu üstlenmiştir.Albümün soundunda diğer albümlere göre gücü düşük olarak gözlemlenirken, grup albümün sözlerinde farklı kültürlere göndermede bulunuyordu. Tasarımını Adam Jones''un yaptığı albüm 2006 yılının Grammy?lerinden ?En İyi Albüm Kapağı? ödülünü kazanmıştır.\r\n\r\nAyrıca bu albüm Maynard James Keenan`ın tam 10000 gün bitkisel hayatta yaşadıktan sonra 2003 yılında vefat eden annesi Judith Marie Keenan`a ithaf edilmiştir.\r\n\r\nGrup 7 eylül''de İstanbul''da verdikleri muhteşem konserle Avrupa turnesini tamamlamış, son olarak ülkelerine dönerek bir turne daha gerçekleştirdikten sonra kısa bir ara vereceğini belirtmiştir.\r\n\r\nBu ara, Maynard James Keenan''ın Danny Lohner ile birlikte yürüttüğü Puscifer adlı projesinin yakında çıkacak olan albümü ve tool''dan merakla beklenen bir klip için yeterli zamanın kazanılmasını sağlayacaktır.', 'RiV_ue-PbL4'),
(97, 'Apocalyptica ', 'Symphonic Metal', 'Finlandiya', 'Finlandiya?daki Sibelius Akademisi?nin çello bölümü öğrencileri olan Eicca Toppinen, Max Lilja, Paavo Lotjonen ve Antero Mannien?den oluşan ve müziğiyle, klasik müzik ve heavy metal arasındaki sınırın sanılanın aksine çok ince olduğunu düşündüren Apocalyptica grubu, dört gencin, yakın çevrelerine çaldıkları Metallica yorumlarıyla müzik çalışmalarına başladı. Esin kaynaklarının ünlü Rus klasik müzik bestecisi Dmitri Shostakovich olduğunu her fırsatta dile getiren grup elemanları, bu çalışmalarını mezuniyet törenlerinde sergilediklerinde ise tam anlamıyla kıyamet kopmuştu. Grup, Metallica parçalarını ezbere bilen seyircilerin de eşliğiyle öyle başarılı bir performans sergiledi ki, büyük plak şirketlerinden biriyle anlaşma başarısını gösterdiklerinde bu olayın üzerinden henüz bir hafta bile geçmemişti.\r\n\r\nMetallica?nın "Enter Sandman", "The Unforgiven", "Wherever I May Roam", "Master of Puppets", "Harvester of Sorrow" gibi parçalarını dört çelloyla yorumladıkları ilk albümleri "Plays Metallica By Four Cellos", 1996 yılında piyasaya çıkarak tüm dünyada 250.000 adetlik satışla metal müzik dinleyicilerinin yanı sıra klasik müzik severlerin de arşivlerinde yer almayı başardı. Çellolarını amfiye bağlayarak oldukça ilginç ve bir o kadar da üstün işler yaratan grup üyeleri, bu albümle Metallica?dan da övgü almayı başardılar.\r\n\r\nMtv Avrupa ve Amerika haber bültenlerinde yer almaya başlayan Apocalyptica, Sex Pistols, Sepultura ve Bad Religion gibi gruplarla aynı sahneyi paylaştı. Daha sonra Metallica?nın alt grubu olarak sahne alan topluluk geniş kitlelerin beğenisini kazandı. İlgi öylesine büyüktü ki, diğer birçok Metallica konseri öncesinde Apocalyptica eserleri, dinleyenlere banttan sunulmaya başlandı.\r\n\r\nGrup 1997 yılında, ülkemizdeki dinleyenleriyle buluşmak üzere Cemal Reşit Rey 2. Uluslararası Gençlik Festivali kapsamında sahneye çıkmış ve inanılmaz bir ilgiyle karşılaşmıştı.\r\n\r\nTopluluğun; Sepultura, Pantera, Metallica, Faith No More yorumlarının yanısıra, içerisinde grup üyelerinden Eicca Toppinen?in bestelerinin de bulunduğu bir albümle hayranlarının karşısına çıktılar. Bu çalışma, Apocalyptica?nın sadece diğer grupların eserlerini yorumlarken değil, özgün çalışmalarıyla da ne kadar başarılı olabileceklerinin bir kanıtı niteliğindeydi. 1998 yılında piyasaya çıkan "Inquisition Symphony" adlı bu albüm, öncekinden sert bir tarza sahipti. Grup, bu çalışmayı sunduğu turne kapsamında İstanbul ve Ankara?da da konserler verdi.\r\n\r\nAvrupa?da gösterime giren ve başrollerini Jason Patric, Ben Stiller ve Nastassja Kinski?nin paylaştığı "Your Friends and Neighbours" filminde, ilk albümden üç parçaları kullanılan grup, böylece ilk ?gümüş ekran? denemelerini de yapmış oldu. 2000 yılı çıkışlı "Cult" albümü ise Eicca Toppinen?in besteci yönünün gitgide geliştiğinin göstergesiydi.\r\n\r\nSonrasında grubu, Şebnem Ferah?ın "Perdeler" şarkısına eşlik ederken dinledik. Ferah?ın albümünde biri orijinal, diğeri Apocalyptica düzenlemesi olan iki sürüm yer aldı. Bu arada grupta eleman değişiklikleri de oldu. Antero Manninen?in yerini Helsinki Flarmoni Orkestrası?nın metalci çello sanatçısı Perttu Kivilaakso alırken Max Lilja gruptan ayrıldı.\r\n\r\nKayıt firması Universal bu dönemde boş durmayarak son albümleri olan "Cult"ın çift cdlik özel baskısını piyasaya sürdü. Sunulan özel çalışmada, "Cult" albümündeki çalışmaların yanısıra; Guano Apes solisti Sandra Nasic?in vokal yaptığı "Path Vol.2" ve Farmer Boys?dan Matthias Sayer?in sesiyle eşlik ettiği "Hope Vol.2" ile "Harmageddon", "Nothing Else Matters" ve "Inquisition Symphony"nin canlı kayıtları da yer aldı.\r\n\r\n"Vidocq" adlı filmde müzikleriyle yer almaları, durgun oldukları bu arada dikkat çeken çalışmalarından biriydi. Antero Mannien?in de ayrılması ldağılma korkusu yaratsa da grup sessiz sedasız çalışmalarına devam etti. Beklenen "Reflections" albümünde, usta davulcu Dave Lombardo?nun da konuk olarak yer alması herkes için tam bir sürpriz oldu. Tamamı kendi bestelerinden oluşan 10 Şubat 2003 çıkışlı bu albümleriyle yeni bir tarzı, çello-rockı yarattıklarını belirten grup üyeleri, sürekli gelişerek yollarına devam ediyorlar. Eğitimli oluşlarının yarattığı farkı koruyan, çalışkan ve özgün çizgileriyle bu işin üstesinden geliyorlar. 2005 te çıkardıkları Apocalyptica albümleri ile yine kendilerinden oldukça söz ettirdiler.2007 yazında çıkardıkları yeni albümleri ile ilk çıkardıkları video klip apocalyptica ft. corey taylor: i''m not jesus büyük beğeni topladı. Özellikle bu klipe corey taylor''ın o üstün vokalinin birleşimi şarkıya ayrı bir hava katmış. Grup şu an yeni albüm konserlerine yeni başlamıştır. Son olarak Nisan ayında; plak şirketi olan Sony BMG ve Poem Organizasyon iş birliği ile Apocalyptica Türkiye Turnesi 2008 kapsamında Ankara, İzmir ve İstanbul konser vermişlerdir.', 'xi1ArEPKlu0'),
(98, 'Epica', 'Symphonic Metal', 'Hollanda', 'Dünyanın dört bir yanını dolaşmak ve diğer kültürlerle tanışmak... Bunlar hem bir müzisyen hem bir insan olarak şarkıcı, şarkı sözü yazarı, besteci ve gitarist Mark Jansen?in başarısının temel kaynaklarının özetidir. Çevresindeki dünyaya duyduğu sınırsız ilginin en son kanıtı, son zamanlarda keşfedilen Hollandalı grup Epica?nın rengarenk ilk albümüdür.\r\n\r\nEpica?nın içinde birçok çeşitlilik barındıran müziği tam anlamıyla bunu yansıtıyor. Aynı zamanda, dünyanın Güney Amerikayı da içine alan diğer kısımlarının etkileri de tarzlarını, kendilerini ifade eden bu ilk albümdeki şarkılarda bulurlar. Grup, müziklerine mümkün olduğu kadar çeşitli deneyim ve izlenim ekleyebilmek için, birçok gezinti yapmak niyetinde..\r\n\r\nBaşarılı Hollandalı grup After Forever?ın yaratıcı kanatlarından biri olarak geçirdiği kısa ve fırtınalı bir süreçten sonra, Mark Jansen kendini son olarak yine yeni bir başlangıç yapmaya zorlanmış gibi hissetti. Bunu sezdiği gün artık eski grubuyla bir gelecekleri olmadığını düşündü ve bu düşünce yeni bir meydan okuma, hesaplaşma şeklinde olgunlaştı. Görüşmeler yapıldı, yeni grup için seçmeler gerçekleştirildi ve grup için bir isim düşünüldü..Önceleri grup ismi olarak Sahara Dust kullanıldı; fakat 2003?ün ilk haftalarında bu isim, kesin bir şekilde Epica olarak değiştirildi. Embriyonik aşamada grup, Trail of Tears?ın solisti Norveçli şarkıcı Helena Michaelsen ile çalışsa da sonraları belirleyici seçim Hollandalı genç yetenek Simone Simons?dan yana oldu.Grup daha sonra, Coen Jansen (klavye), Ad Sluijter (gitar), Jeroen Simons (davul) ve her ikisi de Axamenta grubundan alınan Cassiopeia (bas) ve Yves Huts (bas) ile kalıcı üyelerine kavuşturuldu. İlk albüm ünlü yayıncı ve teknik sorumlu Sacha Paeth?in uzman rehberliği eşliğinde, Almanya?nın Wolsfburg kentinde, Gate Stüdyo?da kaydedildi. Materyaldeki çeşitlilik daha Cddeki ilk şarkıda kendisini gösteriyordu. Adyta; alışıldık şekilde hafifçe renklendirilmiş, Latince söylenmiş bir girişti.\r\n\r\nGrup, klasik müzik eğitimi almış bir koro ile birlikte çalışıyordu; çünkü bu, müziğe ayrı bir renk katıyordu. Sekiz yaylıya teşekkürler: 3 viyolonsel, 2 keman, 2 çello ve bir ikili davul. En önemli konu, materyalin zirvesinde duran, klasik müzik eğitimi almış opera sanatçısı tarzıyla mezzo-soprano Simone Simons?dur.\r\n\r\nEpica, karşıtlıkların düşkünü bir gruptur. Sert gitarlar, koroca söylemeye ve yaylı gruplarına karşı... Simone Simons?un harikulade yorumu keskin bir acı veren Mark Jansen?in hırıltılarına karşı... Bütün bu tarafları büyüleyici bir birlikteliğe kavuşturan şarkılardan biri ?Sensorium?dur. Klasiğin ve aşırılığın bu birleşimi nadiren böyle inandırıcı olabilmiştir. The Phantom Agony?i yaparken grup çizgileriyle oldukça başarılıydı. Duyguları şarkı sözleri ve ezgilerin içine yerleştirmek ve sonrasında bunu dinleyiciye aktarmak Epica?nın bir tutkusuydu. Grubun dinleyiciye vermek istediği o duyguyu dinleyiciye tüm şiddetiyle ve karmaşıklığı ile yaşatmaktı; bunu ne kadar çok verebilirlerse, kendilerini o kadar başarılı buluyorlardı.\r\n\r\nŞarkı isimleri, grubun altı üyesinin o etkiyi hedefleyerek yaptıkları katkılarla belirlendi. Şarkı sözlerini kendilerince algılamak kendilerince yorumlamak, dinleyicinin yalnız kendisini bağlayan bir konuydu. Bununla beraber The Phantom Agony şunu açıklığa kavuşturur ki Epica günümüz gerçeklerini görmezden gelen bir grup değildir. ?Façade of Reality? Amerika Birleşik Devletlerine yapılan 11 Eylül saldırısının öncesi, sonrası ve bu süreçte değişenler hakkındadır..Bu nedenden ötürü, bu şarkı grup için de çok büyük anlam ifade eden bir şarkıdır..\r\n\r\nSon olarak grubun ismi... Grup için önceleri bu, iki özel anlama sahipti. Her şeyden önce, bu isim, tüm grup üyelerinin sıkı hayranı oldukları grup Kamelot?a bir övgüydü. Epica, Kamelot''ın 2003 yılında çıkardığı albümünün ismiydi. Buna ek olarak Epica, tüm gerekli, can alıcı soruların yanıtlarının bulunduğu bir evrendir. Şarkı sözlerinin genel yapısına fevkalade uyan bir anlam... Son zamanlarda buna bir başka anlam da katıldı. Öyle çok eski değil, yakın bir geçmişte Epica bir dinleti veriyordu. Her şey harika gidiyordu. İlerleyen zamanda, bir anda sahne ve seyirci arasında bir şey oldu. Dinletinin sonunda, seyirciler Epica?nın ismini haykırıp duruyordu: E-pi-ca...E-pi-ca... Bu isim kulağa mükemmel geliyordu..Orada ve ondan sonra, grup, Epica?nın doğru bir seçim olmuş olduğuna karar verdi.', 'Dys1_TuUmI4'),
(99, 'Annihilator', 'Thrash Metal', 'Amerika', 'Kanadalı gitarist Jeff Waters tarafından 1984 te kuruldu ve ilk albümleri ''Alice in Hell'' ile -başta prodüksiyon şirketleri olmak üzere- tüm dikkatleri üzerine topladı. Bu albümle thrash metal dünyasındaki yerini hala koruyor.\r\n\r\nBir yıl aradan sonra 2. albümlerini; ''Never, Neverland''ı çıkardı. Gruptaki pek çok üye değişikliğinin ve 3 yılın ardından vokalde Aaron Randall, basta Wayne Darley, bateride Mike Mangini, gitarda Neil Goldberg ve Jeff ile ''Set the World on Fire'' albümleri 93''te piyasaya çıktı. 94 gitarların yanında vokalde de Jeff Waters''ın olduğu ''King of the Kill'' ve Phantasmagoria ve The Fun Palace gibi parçalarında da içinde bulunduğu ''Bag of Tricks'' albümleri çıktı. 96''da yine iki albümle geldi. Bunlardan biri ''Refresh the Demon'' diğeri ise 89-90''da çıktığı turne kayıtlarının olduğu ''In Command''(live 1989-1990).\r\n\r\nBunu takip eden yıllarda ise grup 1997''de ''Remains'', 1999''da ''Criteria for a Black Widow'', 2001''de ''Carnival Diablos'', 2002''de ''Waking the Fury'', 2003''de ''Annihilation(live)'', 2004''te ''The One(EP) ve ''All for You'', 2005''te ''Schizo Deluxe'' albümlerini piyasaya çıkardı.\r\n\r\nÖzellikle son çalışmalarında thrash metalden çok Thrash/core a yakın oldular. ''Alice in Hell''den beri sürekli bir kadro deişikliği yaşandı ve neredeyse her albümde farklı elemanlarla çaldılar.', 'Py5h80QI3hE'),
(100, 'Anthrax', 'Thrash Metal', 'Amerika', 'Anthrax, Amerikan thrash metal grubu. 1981 Yılında heavy metal, punk ve çizgi roman hastası dört lise arkadaşı, Scott Ian (gitar), Danny Lilker(gitar), Dave Weiss(davul) ve John Connely(vokal)tarafından kurulmuştur. Scott ve Danny grubun beste ve söz yükünü üstlenir ve provalara başlanır. İlk konserleri bir kilisenin bodrumunda gerçekleşir. Yine aynı yerde verilen bir kaç konserle adlarını, eyalet çapında duyurmaya başarırlar. ?83 yılına kadar bir dizi eleman değişikliği ve underground piyasada kazanılan ün dışında pek birşey olmaz.Yıl ortasında, o sıralar Manowar ile yaptıklarıyla adını duyuran Ross The Boss prodüktörlüğünde bir demo kaydederler. Demoda Scott yine gitarlardadır ama geri kalan elemanlar bir hayli değişmiştir. Danny basa geçmiş onun boşluğunu Greg Walls doldurmuş, davula da Charlie Benante alınmıştır.\r\n\r\nDemo, o yıllarda bir çok grubu keşfetmesiyle bir hayli sevap kazanan Jon Zazula?nın ilgisi çeker. Böylece Megaforce rec. kapıları Anthrax?a ardına kadar açılır. Eylül ayında ilk 45?lik ?Soldiers Of Metal? piyasaya sürülür. 3000 adet basılan plak gruba yeni bir eleman kazandırır, bu Overkill gitaristi Dan Spitz olacaktır. İlk albüm ''Fistful Of Metal'' in çıkışı bir dizi sorunuda beraberinde getirir. Vokaldeki Ned Turbin ile Danny arasındaki tatsızlık Danny?nin ayrılması ile sonuçlanır. Basa Charlie?nin kuzeni Frank Bello alınır. Ned ile de işler yine de iyi gitmez ve yeni şarkılar vokalsiz olarak prova yapılır. Sonuçta Ned gruptan atılır ve Bible Black?ten Joey Belladona gruba dahil olur. Böylece grubun kariyerinde yepyeni bir dönem başlar.\r\n\r\nGrup, ?Armed And Dangerous? adında bir EP kaydeder bu hem Joey?e ısınma hem de Avrupa piyasasına girme amacı taşıyan akıllıca bir harekettir. EP de Joey ?le yapılan provalarda kaydedilmiş , ?Metal Trashing Mad? ,?Panic?, Sex Pistols coverı ?God Save The Queen? ve ?Raise Hell? bulunmaktadır.\r\n\r\nBeş aylık bir kayıt aşamasından sonra ikinci albüm ''Spreading The Disease'' piyasaya çıkar. Scott ,bu zaman dilimine bir başka grupla yaptığı çalışmaları da sığdırır. Scott , Danny Lilker ve Billy Milano ile efsanevi S.O.D.(stormtroopers of death) i kurar ve Megaforce Rec.''ten ilk albüm ?Speak English Or Die ? ı çıkartır. Ekim?85 te çıkan ?Spreading the Disease? sonrası Scorpions?ın alt grubu olarak birleşik devletleri turlarlar. Ardından da headliner turneler gelir. Albümden ''Madhouse'' u 45lik olarak seçerler. Şarkı Avrupada iyi iş yapar ama Amerika daki radyo istasyonları şarkıyı çok saldırgan buldukları gerekçesiyle yayınlamazlar. Black Sabbath ve WASP ile bir amerika turnesine başlarlar ancak tur o yıllardaki Black Sabbath?ın popülarite fakirliği nedeniyle yarıda kesilmek zorunda kalır. Bu işin yatmasını fırsat bilerek Metallica ile avrupa yollarına düşerler hatta sonradan onlara Slayer da katılır (rüya gibi geliyor insana üçü bi arada hem de en iyi zamanlarında).\r\n\r\n?Spreading The Disease? , 100 binlik satışıyla ABD?de hatırı sayılır bir başarı kazanır bu gazla grup kasım ?86 da Eddie Kramer prodüktörlüğünde stüdyoya girer. ??I am the Law?? ilk 45?lik olarak Şubat 87 de piyasaya çıkar. Şarkı , grubun favori çizgi roman karakteri Judge Dredd hakkındadır. Hatta Judge Dredd?i çizen Brian Bolland 45?liğin kapağınıda çizerek gruba destek verir. 45?liğin b yüzünde ise ilk rap-metal denemeleri ?I?m the Man? yer alır. Bir ay kadar sonra albüm piyasaya çıkar ve gruba büyük bir başarı kazandırır . Stephen King romanlarından esinlenerek yazılan ?Among the living? ve ?Skeleton In The Closet? , uyuşturucunun insanı ne hale getirdiğini anlatan ?NFL(efilnikufesin)?, Joey Belladona?nın atalarına adanan ?Indians? gibi şarkılar birer trash-speed klasiği olarak tarihteki yerlerini alır. Belki benimde grupla ilk tanışmamı sağlayan albüm olmasındandır ama gerçekten de başından sonuna kadar hiç aralıksız kendini dinleten , dönemin soundunu çok iyi yansıtan bir albümdür ''Among The Living''.\r\n\r\n''I am the Law'' Avrupa''da büyük bir hit olur. Yoğun istek üzerine grup Amerikada ''I''m The Man'' isimli bir EP çıkartır. Sonrasında da Metal Church ile bir ABD turuna çıkarlar. EP altın plak kazanır-ki bu bir thrash grubu için büyük başarıdır o zamanlar için- ve Donington festivaline davet edilirler.\r\n\r\nArtık grup Slayer ve Metallica ile birlikte thrash kulvarının en büyükleri haline gelmiştir. Bu başarının ateşi sönmeden hemen stüdyoya kapanırlar ve dördüncü albüm ?State Of Europia? nın kaydına girişirler. İlk 45?lik aslen Charlie?nin çok tuttuğu fransız grup Trust?ın olan ?Antisocial? olarak seçilir. Şarkının klibi Mtv de bir hite dönüşür ve en çok yayınlanan beşinci klip olarak o yıla damgasını vurur. Şarkılar yine konuları bakımından büyük bir çeşitlilik göstermektedir. "Make Me Laugh" , televangelizm hakkındadır ve ikinci 45?lik olarak piyasaya çıkar. David Lynch?in kült filmi ?Blue Velvet ? tan etkilenerek yazılan ?Now it?s Dark? , yine Stephen King romanı ?Misery? üzerine yazılan ?Misery loves Company? , New York?taki evsizleri konu alan ?Who Cares Wins " üç aydaki satışlarıyla platin plak almaya hak kazanan albümdeki öne çıkan şarkılardır. ?Antisocial? klibinde de görünen Ozzy Osbourne ile bir Amerika turuna çıkılır. Yine MTV destekli ?Headbanger?s Ball? turnesine headliner olarak Exodus ve Helloween ile katılan grup yılın geri kalanını dünyayı dolaşarak geçirir.Turne sürerken ''penikufesin'' EP si çıkar ki bu gruba nefes alma fırsatı verecektir yeni albüme kadar.\r\n\r\nYeni albüm kayıtları olaylı başlar. Bir yangın ve bir de deprem geçirirler ama doğanın tüm çabalarına rağmen grup albümü kaydeder. Albüm, Ağustos?90 da piyasaya çıkar. İlk 45?lik buram buram punk kokan ?Got The Life? tır. ?Persistance Of Time? önceki iki albüme göre çok daha sönüktür ama yine de grubun popülerliğini arttırmasını engellemez ve ikinci kez düzenlenen ?Clash Of Titans? turuna Megadeth ve Slayer ile katılırlar.\r\n\r\n91 yılına gelindiğinde grup hayranlarını arayıp da bulamadığı şarkıları da içeren ''Attack of the Killer B''s? EP sini çıkartır. Her ne kadar EP olarak piyasa sürülmüş olsa da süresi normal bir albüm kadardır. EP?nin bombası Public Enemy ile ortaklaşa kotardıkları ?Bring the Noise? şarkısıdır. Şarkı sayesinde metalin yeni bir yüzüyle karşı karşıya kalan fanlar epey bir şaşırırlar. Bir kısmı şarkıyı bağırlarına basarken bir kısmı da davayı satmakla suçlar Anthrax?ı. Bu EP aynı zamanda Island Rec. ile olan kontratı doldurmak için yapılmıştır. Metallica ile büyük işler başaran Elektra Rec. ile anlaşan grup o yılın Grammy?lerine de işbu EP ile aday olur. Ödül töreni sonrası müzikal farklılıklar gerekçesiyle Joey Belladona gruptan atılır.\r\n\r\nUzun süredir devam eden anlaşmazlıklar da böylece sona erer.\r\n\r\nBir süre solist arayan grup, Jon Zazula?nın tavsiyesiyle Armored Saint?ten John Bush kadrosuna dahil eder. Beste aşamasında da çok faydalı olan John Bush grubun güvenini boşa çıkarmaz. Ve Nisan?93 te merakla beklenen yeni albüm "Sound of White Noise" çıkar. Sözler bakımından iyice kişisel ve epeyce de karanlık bir albümdür "S.O.W.N.". Müzikal olarakta grubun hız kestiği ve yeni bir sayfa açtığının da ilanıdır. ?Only? albümün hiti olarak beklenen patlamayı yapar. Elektra şirketi de üstüne düşeni yaparak çok yoğun bir promosyon dönemi yaşatır gruba ancak zaman değişmiştir ve artık Amerikan müzik medyasının yeni göz bebeği alternatif akımlar olmuştur. Yine de grup 45?likleriyle adından söz ettirir, özellikle de David Lynch filmlerinin müzikleri yapan Angelo Badalamenti ile beraber kotardıkları ?Black Lodge? ile olur bu.\r\n\r\n93 ve 94 yıllarını konser ve film müzikleriyle geçirirler. ''Last Action Hero'' için ''Poison My Eyes'', ''Airheads'' filmi için bir Smiths coverı olan ?London? ?ı ve Beavis ve Butthead için de ?Looking Down The Barrel Of A Gun? ı kaydederler. Yine 94 te büyük hayranlık duydukları KISS için hazırlanan tribute albüme ?She? ile destek verirler. Island Rec. ise grubun kendilerine bağlı olduğu yıllarda kaydedilen birkaç konserden derlediği ?live Island Years? adlı konser albümünü piyasaya sürerek pastadan pay almayı ihmal etmez.\r\n\r\n?Sound Of White Noise? kayıtları sırasında iyice belirginleşen Danny Spitz?in ilgisizliği , yeni albüm kayıtlarına başlanırken artık dayanılmaz hale gelir. Grup kayıtlarda Pantera?dan Dimebag Darrell ve grubun gitar teknisyeni Paul Crook?a gitar çaldırarak, ayrılma sürecini mümkün olduğunca geciktirmeye çalışır.?Stomp 442? Ekim?95 te çıkar. Albüm günün trendlerine uymama konusunda grubun tavrını açıkça ortaya koyar ("Tester" buna güzel bir örnektir.). Ancak zaman artık KORN çocuklarının zamanıdır ve radyolar metali görmezden gelmeye başlamıştır. Deftones ve Life Of Agony ile çıkılan turnede pek tat vermez. Turnede solo gitarı Paul Crook çalar, ki bu Dan Spitz?in ayrıldığının açık bir kanıtıdır. İşler iyi gitmez Elektra işini yapmaz ve grubu promosyon olaylarında yüz üstü bırakır. Böylece endüstri bir başka köklü grubunda kuyusunu kazmış olarak gurur tablosuna bir çentik daha atar.\r\n\r\nS.O.D. ile verilen konserler ve yan projeler derken grup Ekim?97 ye kadar oyalanır. Ancak bu tarihte yeni albüm için kayda girmeyi becerebilirler. Albümü kendi şirketleri ?Skism? den çıkarmayı planlarlar. Paul Crook albümde hem gitar çalarak hem de prodüktörlük yaparak kendini gruba ve fanlara kabul ettirir. Yıllar önce destek verdikleri Pantera?nın alt grubu olarak katıldıkları bir aylık bir turdan sonra kaydı bitirmek için stüdyoya dönerler ve "Stomp 442" den çok daha sert ve saldırgan olan ?Volume 8? raflardaki yerini alır. Böylece 98 yılı turnelerde geçer. Ancak artık hayranları gruba olan ilgisini kaybetmiştir.\r\n\r\nZor dönemi aşmak için aralarında ?universal sodier II? nin de bulunduğu birkaç filmin müziklerine şarkı verirler. ?Her popülerlik kaybeden grubun yapması gereken 10 şey? el kitaplarının ilk maddesi olan ?hemen bir best of yapıp ah neydi o günner ? tadını yakalama taktiğine başvururlar ve Kasım?99 da ?Return of the Killer A?s? piyasaya çıkar. ?Metal Thrashing Mad?, ?I am The Law? , ?Antisocial? gibi thrash marşlarını ve 90?lı yılların düşüş zamanlarını yansıtan ?Only?, ?Crush?, ?Fueled? ve ?Room for One More? gibi şarkıları içeren bu albüm eksiklerine rağmen faydalı ve güzel bir toplama olmayı başarır. Albümün süprizi ise eski vokalist, Joey Belladona ve John Bush''un düet yaptıkları ?Ball Of Confusion? adlı şarkıdır.\r\n\r\nBu toplama albüm sonrası John Bush bir kereliğe mahsus olmak üzere eski grubu Armored Saint ile kayda girer ve turnelerine katılmayı planlar ama turne gerçekleşmez çünkü Anthrax, tekrar toparlanan Mötley Crüe ile turneye katılmak için davet alır.\r\n\r\n2000 yazı bu konserlerle geçecek ve turne bitiminde yeni albüm için kayda girecekler. Bakalım, ?Fueled? de dedikleri gibi : "What doesn''t kill me, makes me stronger!" ( beni öldürmeyen, daha da güçlü kılar) mı olacak, hep beraber göreceğiz....\r\n\r\n2003 senesinde "We''ve Come For U All" albümü çıkar. Albüm, 80''lerdeki Anthrax albümlerinin kalitesinden ve tarzından uzak olsa da özellikle albüme isim veren We''ve Come For You All şarkısı çok tutar. Grup, yeniden adından söz ettirir hale gelir.\r\n\r\n2004 senesinin sonunda grup içi huzursuzluklar sonunda radikal değişklikler olur. Eski efsane dönemlerindeki soundlarına geri dönmeyi hedefleyen topluluk reunion''a gider. Efsanevi vokalist Joey Belladona ve gitarist Dan Spitz gruba geri dönmüştür. Bu birleşme tüm dünyada büyük yankı bulmuştur. Anthrax, Maiden ve Priest''ten sonra bu büyük değişimle gündeme oturmuştur. Bir çoklarına göre bu reuinon diğer gruplardan çok daha verimli ve başarılı olacaktır.\r\n\r\n2005 ylında "Alive 2" adlı canlı performanslarını live album olarak yayımlarlar. Konserde John Bush(1992-2004) döneminden hiçbir şarkının yer almaması ve Spreading The Disease albümünün çok da ön plana çıkmamış "Medusa" şarkısının inanılmaz bir başarıyla yorumu dikkat çekmektedir. Joey''nin dönüşü gerçek Anthrax hayranlarını oldukça sevindirmiştir. Grup yeniden eski havasını yakalamış gibi gözüküyordu.\r\n\r\n2007 yılının başında stüdyoya girmişlerdir. Herkes yeni albümün çıkış tarihini beklerken şok bir haber gelir Gitarist Scott Ian''dan: Joey Belladona Anthrax''la yeniden yollarını ayırmıştır. Onun peşinden Danny Spitz de gruptan ayrıldığını açıklamıştır.\r\n\r\nBunun hemen ardından John Bush''la yeniden anlaşmaya açlışılır ama Bush çok kırılmış olacak ki(Özellikle Joey geri döndüğünde John hakkındaki ağır açıklamalardan sonra) bu isteği geri çevirir.\r\n\r\nYaklaşık bir yıla yakın gitar ve vokal arayan grup, sonunda eski gitaristlerinden Rob Caggiago(2001-2005 Anthrax) ve "Devilsize and Me" ve "My Enemy" eski vokalisti Dan Nelson''la anlaşırlar. Dan''in vokali John Bush''a aşırı benzerlik göstermektedir. Dan Nelson da John Bush''a olan hayranlığını gizlememektedir zaten. Bu değişiliklerle eski thrash sounduna döneceği tahmin edlien Anthrax yeniden büyük bir düşüş yaşayacak gibi gözüküyor.', 'RzpRU347BDU'),
(101, 'Artillery', 'Thrash Metal', 'Danimarka', 'Artillery, Danimarkalı bir thrash metal grubudur. Thrash tarzının oluşumunda büyük bir yere sahiptirler ve son derece enerjik, kısa temalı rifler, hızlı adımlanan müzikleriyle Slayer ve Megadeth stiline oldukça benzeyen bir müzik ortaya koymuşlardır.\r\n\r\nGrup, 1982 yılında Kopenhag''da kuruldu. Grubun ilk üyeleri vokalde Per Willem Onink, gitarlarda Jørgen Sandau ve Michael Stützer, bassta Morten Stützer, davulda ise Carsten Nielsen''di. Grup bu kadro ile 1984 yılında Shellshock ve Deeds of Darkness demolarını kaydetti. Ardından Onink gruptan ayrıldı ve Artillery vokaliyle bir efsaneye dönüşen Flemming Rönsdorf''u gruba kattı.\r\n\r\nArtillery ilk çıkışını 1985 yılında New Renaissance Records tarafından piyasaya sürülen ?Speed Metal Hell? isimli derleme albümde yer alan ?Hey Woman? adlı şarkısıyla yakaladı. Aynı yıl içinde Artillery Fear of Tomorrow isimli üçüncü demosunu kaydetti ve Neat Records ile anlaştı. 1986 yılıdan Fear of Tomorrow ismiyle ilk albümlerini yayınladılar. Grup albümden sonra Slayer ve King Diamond ile birlikte Belçika ve Hollanda''da başarılı bir tura imza attı ve Dynamo festivalinde yer aldı.\r\n\r\nGene aynı yıl Bathory grubu, Artillery''nin bateristi Cartsen Nielsen''i gruba katmak için teklif götürdü. Ancak Nielsen bu öneriyi kabul etmeyerek Bathory''den çok daha büyük bir grubun doğmasında büyük pay sahibi oldu.\r\n\r\nGrup ikinci albümünü 1987 yılında "Terror Squad" adıyla kaydetti. Albüm tam anlamıyla bir hüsrandı (albümün daha sonra yeniden kaydedilmiştir), zira yayınlanması oldukça uzun bir zaman aldı. Ardından gitarist Jørgen Sandau inancını kaybettiği gerekçesiyle 1989''da gruptan ayrıldı ve yerini Basçı Morten Stützer aldı. Stützer bası acemi Peter Thorslund''a ödünç veriyordu bu arada.\r\n\r\nArdından 1990 yılında by Roadrunner Records etiketiyle, Metallica prodüktürü Flemming Rasmussen prodüktörlüğünde grubun 3 albümü "By Inheritance" geldi. Büyük yankı uyandıran bu albümden sonra, 1991 yılında, grup üyelerinin birçoğu kendi müzikal projelerini takip etmek üzere dağıldılar.\r\n\r\n1998 yılında Mighty Music tarafından Deadly Relics adıyla çıkan toplama albümde 2 şarkıyla yer alan grup tekrar dönüşünün sinyallerini verdi. 1999 yılında ise Die Hard Music etiketiyle çıkan B.A.C.K. albümü geldi.\r\n\r\nBüyük bir geri dönüş yaptıkları bu albümden sonra grup devamını getiremedi ve tekrar sessizliğe büründü.\r\n\r\n2007 yılında ?Through the Years" adıyla, grubun 4 stüdyo albüm kaydını ve tüm görsel materyallerini içere 4 CD''lik sınırlı basım bir boxset çıkardılar. 6 Kasım 2007''de grubun beyni Michael Stützer, resmi Artillery sitesinde tekrar aktif olduklarını onayladı ve birçok konserde yer alacaklarını duyurdu. 2008 içinde birçok festival programında yer alan grubun efsane ismi Flemming, artık inancını kaybettiği gerekçesiyle grupta yer almadığını açıkladı. Grup yeni bir vokalistle ''''When Death Comes'''' adlı albümü 2009 yılında piyasaya sürdü.', 'TaNRi8puEjg'),
(102, 'Death Angel', 'Thrash Metal', 'Amerika', 'Death Angel özellikle eski Heavy Metal kitlesi tarafından daha çok bilinen ve dinlenen bir gruptur...\r\n\r\nDeath Angel macerası Filipinli beş kuzenin Amerika ya göç etmesinden sonra 1982 yılında başlamıştır. Bay Area Thrash Metal denildiği zaman akla gelen ilk gruplardan biri olan Death Angel "Heavy Metal Insanity" isimli ilk demosunu 1983 yılında yayınlamıştır. Bu demoda Metallica grubundan Kirk Hammett ta gruba yardımcı olmuştur.\r\n\r\nİkinci demo "Kill As One" sonrası ise Enigma Records tarafından keşfedilen grup The Ultra Violence isimli ilk albümünü 1987 yılında yayınlamıştır. Death Angelın Thrash Metalin önde gelen grupları arasında yer almasını sağlayan bu ilk albüm sonrası grup uzun bir Avrupa turnesine çıktılar.\r\n\r\n1988 yılında ikinci albümleri Frolic Through The Parkı yine Enigma etiketiyle piyasaya sürdüler. 1989 yılında Motörhead ile beraber turneye çıktılar ve Geffen Records firması ile anlaştılar. Ve bu albümle grubun adı artık iyice Thrash Metal devleri arasında anılmaya başladı. Death Angel bu albümünde bir de Kiss coverı olan Cold Gin parçasına yer vermiştir. Bu ikinci albümü yine geniş çaplı bir Avrupa turnesi takip etti.\r\n\r\n1990 yılında Geffen firmasından çıkardıkları üçüncü albümleri Act III ile grup başarılarını sürdürdüler ama albüm sonrası grupta ayrılıklar baş gösterdi ve 1992 yılında grubun adı "The Organization" olarak değişti. Dennis ise gruptan ayrılarak Punk soundlu bir grup kurdu. Grup "The Organization" adıyla 1993 yılında yine kendi adını taşıyan "The Organization" ve 1995 yılında Savor The Flavor adıyla 2 albüm yayınlamıştır.\r\n\r\nAndy, Rob ve Mark "Swarm" olarak yollarına devam ederler ve 1999 yılında "Swarm", 2002 yılında ise "Beyond The End" isimli 2 albüm yaparlar. Death Angel kansere yakalanan Testament grubunun vokalisti Chuck Billy için 2001 yılında San Francisco da düzenlenen konserde sahne almak üzere yeniden biraraya gelmiştir. Nuclear Blast ile anlaşan grup yeni ritm gitarist Ted Aguiları da yanlarına alarak 2004 yılında dördüncü albümleri olan "The Art Of Dying" i yayınlamıştır', 'sWy1kFe2oCs'),
(103, 'Dublin Death Patrol', 'Thrash Metal', 'Amerika', 'Andy Billy, Eddie Billy, ve Chuck Billy kardeştirler.John ve Steve Souza da öyle.', 'ZUW2UlxbvXw'),
(104, 'F5', 'Thrash Metal', 'Amerika', 'Tanım yok', 'AqI5XKsP_3o'),
(105, 'Grip Inc', 'Thrash Metal', 'Amerika', 'Tanım yok.', 'UfvHBeBSM24');
INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(106, 'Kreator ', 'Thrash Metal', 'Almanya', '1984 yılında Almanya, Essen''de gitar ve vokalde Mille Petroza, basta Rob ve davulda Ventor tarafından Tormentor adıyla kurulan grup Essen, Ruhr ırmagı gibi noktalarda meydana gelen sanayi kirliliğini şarkılarına konu edinmişti.Thrash metal''e yakın çizgisiyle oldukça sert ve süratli bir müzik yapıyordu ve giderek yerel kirliliğin yanı sıra genel olarak çevre sorunları üzerine yoğunlasmaya başladı.İsimlerini Kreator olarak değiştirdikten sonra ilk albumleri "Endless Pain"i yayınladılar ve underground piyasada büyük bir ilgi gördüler.İkinci albümleri "Pleasure to Kill" ile Avrupa''nın genelinde tanınmaya başladılar ve thrash metal''e iyice yaklaştılar, ancak müziklerine death metal unsurlarını da katmışlardı.İki albüm daha yaptıktan sonra "Extreme Aggression"da son derece kaliteli bir çalışma ortaya koydular ve "Coma of Souls"da da bu kaliteyi korudular.Sözlerinde yaşamın karanlık ve acılı yanını, yok edilen çevreyi, ırkçılığı, insanlığın doğaya ve birbirlerine karşı uyguladığı vahşeti işlerken, müzikal olarak bu dehşet dolu konuları sesle desteklediler ve sert bir protestonun başını çektiler.Ancak Almanya''nın ırkçı kesimi neonazilerin de tepkileriyle karşılaştılar. Fakat heavy metalin genel yapısı içinde bu ırkçı saldırılara karşı arkalarında daima destek buldular.Kreator yaptığı müzikle politika ve çevre konusunda en sert söylemi kullanan grup oldu ve hardcore gruplarının usluplarını oluşturmada örnek aldıkları bir grup haline geldi.', 'dR7xBj0bDD8'),
(107, 'Machine Head', 'Thrash Metal', 'Amerika', ' 1993 yılında Adam Duce ve Robb Flynn''in önderliğinde kurulmuştur.\r\n\r\n1994 yılında Burn My Eyes Metal dünyasına bomba gibi düşer.Albümdeki her parça o kadar iyidir ki Slayer''ın gitaristi Kerry King''e " Sizce gelmiş geçmiş en iyi Thrash metal albümü Reign In Blood olabilirmi? Diye sorulduğunda cevabı "Hayır, ama Burn My Eyes Olabilir" şeklinde olmuştur.\r\n\r\nMachine Head''in müziğinde bu kadar üstün kılan şey o zamanlar için birazda ileri uç sayılabilecek kadar açık seçik nefret dolu şarkı sözleri, vokaldeki asabiyet ile kendini kontrol arasındaki denge, gitar partisyonlarının yazılımındaki ustalık ve en önemlisi gruptaki herkesin şarkılar içinde gösterdikleri uyumdur. Daha sonra Logan Mader daha büyük bir grupta çalmak istediğini söyleyerek Sepultura''dan ayrılan Max Cavalera''nın kurduğu Soulfly?a geçer. Ardından baterist Chris Kontos Konkhra grubuna katılır. Kontos''un yerine Davula Dave Mcclain gelir. Grubun ikinci albümü The More Things Change yeni kadrolarıyla 25 Mart 1997?de çıkar.Çok iyi bir albüm olmasına rağmen Burn My Eyes''ın gölgesinde kalır ve o zamanlardaki Nu-metal akımındaki artış sebebiyle çok ilgi görmez.\r\n\r\n10 Ağustos 1999?da Gitara Ahrue Luster gelir ve çıkan Burning Red albümünde Robb Flynn artık rap vocalleride kullanmaya başlamıştır ve grup Nu-metal tarzına doğru kayar.Bu albüm asıl hayranları tarafından beğenilmemesine rağmen gruba yeni bir dinleyici kitlesi kazandırır.Çünkü albüm kendi tarzında yine çok başarılı şarkılardan oluşmaktadır.\r\n\r\nTüm tepkilerden sonra Machine Head 2001 yılında "Supercharger" albümünü yayınlar.Albüm 250.000 satmasına rağmen grubun o güne kadar en az satan albümü olarak kayıtlara geçer.Basından Gelen Tepkiler Dahada artmıştır ve grup turne sonrası RoadRunner Records''s ile yolalrını ayırır.\r\n\r\n2002''de Hellalive isimli bir albüm yayınlanır. Bu albüm şarkıların canlı performanslarının yer aldığı bir toplama albümdür.\r\n\r\nBu arada Ahrue Luster gruptan ayrılır ve grubun şuanki gitaristi olan daha önce Robb Flynn ile Vio-Lence grubunda beraber çalan Phil Demmel gruba dahil olur.\r\n\r\n2004 yılında Through The Ashes Of Empire albümü Roadrunner Records İngiltere firmasından, Amerika dışında tüm dünyada yayınlanır albüme olan olumlu eleştiriler sayesinde Roadrunner Records Amerika Firmasından gruba teklif gelir ve bu albümün Amerika baskısı için Imperium şarkısı kaydedilir ve Machine Head tekrar metal müziğin zirvesine yerleşir.Imperium bir dönüş şarkısı olarak görülür.Machine Head tekrar eski tadını vermeye başlar.\r\n\r\n2007 yılında ise grubun The Blackening Albümü yayınlanır bu albüm uzun süredir piyasaya çıkan en iyi metal albümlerinden biridir.Uzun süreli melodik sololardan ve akılda kalıcı sert riff''lerden oluşan 8 şarkılık bu albüm eleştirmenlerden çok iyi not alır.Bu albümde bulunan ve Pantera''nın cinayete kurban giden gitaristi Dimebag Darrell için yazılan şarkı Aesthetics Of Hate ile Grammy ödüllüne aday olmuştur.', 'zPFPRSZDXp0'),
(108, 'Megadeth', 'Thrash Metal', 'Amerika', '1981 senesinde Metallica?ya katılan fakat çeşitli anlaşmazlıklar sonucu gruptan çıkartılan Dave Mustaine (gitar, vokal), yanına David Ellefson (bas gitar), Greg Handevidt (gitar) ve Dijon Carruthers (davul)?ı da alarak Megadeth?i oluşturdu. Metallica?dan kovulmayı kendisine yapılan bir haksızlık olarak nitelendiren Mustaine, yeni grubuyla Metallica?dan daha hızlı bir sounda sahip olmak için çalışmalara başladı. Metallica daha tam kurulmadan evvel 1982''de çıkardığı demo albümü olan ?No Life ''Til Leather? albümünde yer alan ve sözlerin çoğu Dave Mustaine''e ait olan ?The Mechanix? parçasını yeniden derledi. (tabi bu parça 1984 yılında Metallica, sözlerini ve adını ?The Four Horsemen? olarak değiştirerek parça bu şekilde Kill Em''All albümünde yer aldı.) Bu parça sonrasında davulcu Dijon Carruthers yerine Lee Rausch?ı kadroya ekledi. 1983 senesinde ise gitarist Greg Handevidt gruptan ayrılırken, geriye kalan üçlü ?Last Rites/Loved To Death?, ?Skull Beneath The Skin? ve ?Mechanix? parçalarının bulunduğu üç parçalık bir demo hazırladı. Slayer?dan tanıdığımız Kerry King (gitar)?i ikinci gitarist olarak gruba dahil eden topluluk, böylece ilk canlı performanslarını sergilemeye başladı.\r\n\r\n1984 senesinde davulcu Lee Rausch Megadeth?den ayrılma kararı alırken, gruba fusion davulcusu Gar Samuelson dahil oldu. Hazırladıkları demo ile müzik eleştirmenlerinin ilgisini çekmeyi başaran Megadeth, aynı sene bağımsız plak şirketi Combat Records ile anlaşmaya vardı. Kerry King ile sadece canlı performanslarda biraraya gelen grup, bu boşluğu Samuelson?un yakın arkadaşı Chris Poland ile kapattı.\r\n\r\n1985 senesinde ?Killing Is My Business... And Business Is Good!? adlı ilk albümünü yayınlayan Megadeth, albümün soundunda speed metal?den örnekler sergiledi. Nancy Sinatra parçası ?These Boots Are Made For Walkin??i farklı bir yorumla albüme ekleyen grup, albüm sonrasında Exciter grubuyla birlikte Amerika ve Kanada?da performanslarda bulundu. Turne sırasında Chris Poland gruptan ayrılırken, gruba turne gitaristi Mike Albert eşlik etti. Ne var ki Poland 1985 senesinde gruba geri döndü ve topluluk 2. albüm üzerinde çalışmaya başladı.\r\n\r\n1986 senesinde ?Peace Sells... But Who?s Buying?? adlı 2. albümünü hazır eden ancak plak şirketinin bütçesinden dolayı istediği sounda ulaşamayan Megadeth, bu sorunu Capital Records ile anlaşarak çözdü. Albümün miksajında prodüktör Andy Somers ile biraraya gelen grup, Kasım ayında albümünü piyasaya sürdü. Albümle birçok müzik eleştirmeninden olumlu puan toplayan topluluk, özellikle albüme adını veren ?Peace Sells? parçasıyla büyük ilgiyle karşılandı. Parçaya bir de video klip çeken grup, bu kliple MTV?nin Headbangers Ball programında sıkça yer almaya başladı. Ayrıca parçanın bas partisyonu MTV News?in tema müziği olarak kullanılırken, grup 1987 senesinde Alice Cooper?ın ?Constrictor? turnesine dahil oldu. Bu turne sonrasında Mercyful Fate ile Amerika turnesine katılan dörtlü, Mart ayında ise ilk kez dünya turnesine çıkarak İngiltere?de Overkill ve Necros ile performanslarda bulundu. Konserler sonrasında grup içerisinde gerilimler başlarken, Chris Poland ve Gar Samuelson gruptan kovuldu. Gruba davul teknisyeni Chuck Behler ve Malice grubundan Jay Reynolds gitarist olarak eklendi, ancak Reynolds ile de sorunlar yaşayan grup üyeleri bu boşluğu Reynolds?ın hocası Jeff Young ile tamamladı.\r\n\r\n1988 senesinde ?So Far, So Good... So What!? adlı 3. albümünü yayınlayan Megadeth, albümün prodüksiyonunda ilk başta Paul Lani ile biraraya geldi. Ancak albüm kayıtları sırasında Mustaine ile Lani arasında başlayan gerginlik tırmandı ve albümün miksajını Michael Wagener tamamladı. Albümle soundunu devam ettiren grup, albümde Sex Pistols parçası ?Anarchy In The U.K.?yi farklı bir versiyonla albüme dahil etti. Albümle Amerika listelerinde 28 numara olmayı başaran topluluk, aynı sene Penelope Spheeris?in belgesel filmi ?The Decline Of Western Civilization II: The Metal Years?da yer aldı. Ayrıca ?So Far, So Good... So What!? albümünün tanıtımı için Dio ile birlikte Avrupa?da konserler gerçekleştiren grup, bu konserlerin sonrasında Iron Maiden?ın ?Seventh Son Of A Seventh Son? turnesine dahil oldu. KISS, Iron Maiden, Guns N? Roses ve David Lee Roth ile ?Monsters Of Rock? Avrupa turnesinde de yer alan dörtlü, bu turneyi ilk konser sonrasında bıraktı.\r\n\r\nYoğun bir tempoda geçen konser serileri sonrasında Chuck Behler ve Jeff Young gruptan kovulurken, gruba Behler?in davul teknisyeni Nick Menza eklendi. Bir süre ikinci gitarist olmadan çalışmalarına devam eden Megadeth, 1989 senesinde Wes Craven?ın ?Shocker? filminin soundtrack?ine Alice Cooper?ın ?No More Mr. Nice Guy? parçasını baştan yorumlayarak katıldı. 1990 senesinde gitar virtüözü Jason Becker ile Cacophony grubunda çalan ve ?Dragon?s Kiss? (1988) adlı bir tane de solo albümü bulunan gitarist Marty Friedman?ı kadrosuna ekleyen grup, yeni kadrosuyla 4. albümün çalışmalarına başladı.\r\n\r\n1990 senesinin sonunda ?Rust In Peace? adlı 4. albümünü piyasaya süren Megadeth, albümün prodüksiyonunda Mike Clink ile biraraya geldi. Albümün sözlerinde politik tavrını gösteren grup, özellikle Friedman?ın gitar soloları ve Menza?nın davul tekniğiyle zamanın en önemli thrash metal albümlerinden birine imza attı. Amerika listelerinde grubu 22 numaraya yerleştiren albüm, İngiltere listelerinde ise 8 numaraya yerleşti. Albümden ?Holy Wars... The Punishment Due? ve ?Hangar 18? adlı parçaları single olarak yayınlayan topluluk, parçalara çektiği video kliplerle de müzikseverlerden beğeni topladı. ?RustIn Peace? albümü sonrası Slayer, Testament ve Suicidal Tendencies ile birlikte ?Clash Of The Titans? adlı Avrupa turnesine çıkan dörtlü, aynı zamanda Judas Priest ile de performanslarda bulundu.\r\n\r\n1991 senesinde ?Clash Of The Titans? Amerika turnesine Slayer, Anthrax ve Alice In Chains ile başlayan Megadeth, aynı sene ?Rust In Peace? albümüyle Grammy?lere ?En İyi Metal Performansı? dalında aday olarak gösterildi. Aynı zamanda ?Bill And Ted?s Bogus Journey? adlı filmin soundtrack?ine ?Go To Hell? adlı parçayla katılan grup, ayrıca ?Super Mario Bros? filminin soundtrack?ine de ?Breakpoint? adlı parçasıyla yer aldı. Aynı sene ?Rusted Pieces? adlı videoyu hayranlarına ulaştıran topluluk, videonun içerisinde video klipleri ve grupla yapılmış olan uzun bir röportajı bulundurdu.\r\n\r\n1992 senesinin sonunda ?Countdown To Extinction? adlı 5. albümünü hayranlarına sunan Megadeth, albümün prodüksiyonunda Max Norman ile biraraya geldi. Albümün soundunda heavy metal kökenlerine dönen grup, albümle Amerika listelerinde 2 numara olurken, İngiltere listelerinde 5 numara olmayı başardı. Albümden ?Foreclosure Of A Dream?, ?Symphony Of Destruction?, ?Skin O? My Teeth? ve ?Sweating Bullets? parçalarını single olarak yayınlayan topluluk, 1993 senesinde bir kez daha Grammy?lere ?En İyi Metal Performansı? dalında aday olarak gösterildi. Megadeth hayranlarına göre grubun en başarılı albümü olarak kabul edilen ?Countdown To Extinction? sonrası dörtlü, 1992 senesinde ?Exposure Of A Dream? adlı 2. videosunu hayranlarına sundu.\r\n\r\n?Countdown To Extinction? sonrası Suicidal Tendencies ve Pantera ile dünya turnesine çıkan Megadeth, 1993 senesinin başında da Stone Temple Pilots ile performanslarda bulundu. Aynı sene ?Angry Again? adlı parçayı ?Last Aciton Hero? adlı filmin soundtrack?ine ekleyen grup, senenin sonunda ilk kez Metallica ile aynı sahneyi paylaştı. Ayrıca Aerosmith?le de konserler gerçekleştiren grup, seneyi ?Beavis And Butt-head Experience? adlı filmin soundtrack?ine ?99 Ways To Die? adlı parçayı ekleyerek kapattı.\r\n\r\n1994 senesinin Kasım ayında Max Norman prodüktörlüğünde ?Youthanasia? adlı 6. albümünü piyasaya süren Megadeth, albümüyle Amerika listelerinde 4 numaraya yerleşti. Albümün sözlerinde mitoloji, nükleer savaş, tecavüz, kumar ve hayatı sorgulayan grup, albümün soundunda ise diğer albümlere göre daha melodik parçalara imza attı. Ekim ayında MTV stüdyolarında bir performans gerçekleştiren topluluk, burada albümden ?Train Of Consequences? adlı parçanın video klibini hayranlara tanıttı. Albümden ayrıca ?A Tout le Monde? adlı parçayı da single olarak yayınlayan dörtlü, albüm sonrasında ilk önce Corrosion Of Conformity ile Avrupa?da, ertesinde de Flotsam And Jetsam, Korn ve Fear Factory ile Amerika?da performanslarda bulundu. Bu konserler sonrasında Brezilya?ya geçerek Alice Cooper ve Ozzy Osbourne ile aynı sahneyi paylaşan topluluk, 1995 senesinde ?Tales From The Crypt Presents: Demon Knight? adlı filmin soundtrack?ine ?Diadems? adlı parçayla ve efsanevi topluluk Black Sabbath için hazırlanan saygı albümüne grubun ?Paranoid? parçasını baştan yorumlayarak katıldı.\r\n\r\n1995 senesinin Mart ayında ?Youthanasia? albümünü ?Hidden Treasures? adlı albümü dahil ederek yeniden yayınlayan Megadeth, bu albümün içerisinde soundtrack?ler ve diğer derleme albümler için hazırlanan parçalarını bulundurdu. Ayrıca Sex Pistols parçası ?Problems?i baştan yorumlayarak albüme ekleyen grup, senenin sonunda ?Hidden Treasures? kaydını EP olarak Amerika ve Japonya?da hayranlarına ulaştırdı.\r\n\r\n?Youthananasia? albümü sonrası dünya turnesine çıkan Megadeth, turne sonrasında Dave Mustaine?nin MD.45 adlı yan projesine yönelmesiyle bir süreliğine dinlenmeye çekildi. Foreigner ve Bad Company gruplarının menajerliğini yapmış olan Bud Prager?ı grubun menajerliğine getiren grup, 1996 senesinin sonuna doğru 7. albümün çalışmalarına yöneldi.\r\n\r\n1997 Haziran ayında ?Cryptic Writings? adlı albümünü piyasaya süren Megadeth, albümde sert parçaların yanısıra melodik ve oryantal hisli parçalar da bulundurdu. Albümün prodüksiyonunda Dann Huff ile çalışan grup, albümüyle Amerika listelerinde 10 numaraya yerleşti. Albümün sözlerinde politik görüşlerden uzaklaşan topluluk, albümde daha kişisel sözlere yer verdi. Albümden ?Almost Honest?, ?Trust?, ?Use The Man? ve ?A Secret Place? parçalarını single olarak yayınlayan dörtlü, ?Trust? ile Amerika Modern Rock listelerinde zirveye yerleşti. Haziran ayında The Misfits ile dünya turnesine çıkan grup, Amerika?da ise Life Of Agony ve Coal Chamber ile performanslarda bulundu. Bu konserlerin ertesinde 1998 senesinde Ozzfest?e dahil olan topluluk, ne var ki davulcu Nick Menza?nın dizinde tümör olması sebebiyle turneyi Suicidal Tendencies davulcusu Jimmy DeGrasso ile tamamladı. Ayrıca Grammy?lere ?Trust? parçasıyla ?En İyi Metal Performansı? dalında aday olarak gösterilen dörtlü, aynı sene ?Duke Nukem? adlı bilgisayar oyunun müziklerinde ?Grabbag? ve ?New World Order? adlı parçalarla yer aldı.\r\n\r\n1999 senesinde ?Risk? adlı 8 stüdyo albümünü hayranlarına ulaştıran Megadeth, ?Cryptic Writings? albümünün başarısıyla bu albümde de prodüktör olarak Dann Huff ile yeniden çalıştı. Nick Menza?nın yer almadığı albümde davul görevini Jimmy DeGrasso üstlenirken, albüm Amerika listelerinde 16 numarada kaldı. Albümün soundunda önceki albümlere göre değişiklik gösteren grup, bu yeni soundla bazı hayranlarını hayal kırıklığına uğrattı. Ne var ki bazı müzik kriterlerince albümün soundunda değişikliğe gittiği için beğeniyle karşılanan topluluk, albümden ?Crush?Em?, ?Breadline? ve ?Insomnia? parçalarını single olarak piyasaya sürdü.\r\n\r\n1999 senesinin sonuna doğru ?Risk? albümünün tanıtımı için Iron Maiden ile Avrupa?da performanslar gerçekleştirmeye başlayan Megadeth, turnenin ikinci ayında müzikal farklılıklardan dolayı Marty Friedman ile yollarını ayırdı. Kadroya Savatage gitaristi Al Pitrelli dahil olurken, yeni kadro ilk çalışmasını ikinci Black Sabbath saygı albümü ?Nativity In Black II?da yer alan ?Never Say Die? adlı parçayla gerçekleştirdi.\r\n\r\n2000 senesinde ?Capitol Punishment: The Megadeth Years? adlı derleme albümü yayınlayan Megadeth, albümde ?Kill The King? ve ?Dread And The Fugitive Mind? adlı iki tane yeni parça bulundurdu. Aynı sene Anthrax ve Mötley Crüe ile birlikte ?Maximum Rock? adlı turneye katılan grup, aynı zamanda Capitol Records ile olan anlaşmasını bitirerek Sanctuary Records ile anlaşma sağladı. ?Risk? albümüyle istediği beklentiyi yakalayamayan topluluk, böylece yeni albüm öncesi menajer Bud Prager?ın da görevini sonlandırdı.\r\n\r\n2001 senesinde ?The World Needs A Hero? adlı 9. albümünü yayınlayan Megadeth, albümün prodüksiyonunda Bill Kennedy ile birlikte çalıştı. Albümün sounduyla heavy metal kökenlerine geri dönen grup, albümle Amerika listelerinde 16 numara oldu. Albümden ?Moto Psycho? adlı parçayı single olarak yayınlayan topluluk, albüm sonrasında AC/DC ile birlikte Avrupa?da, Iced Earth ve Endo ile birlikte de Amerika?da performanslarda bulundu. Aynı sene içinde Megadeth, Avrupa turnesine kapsamında Türkiye''de ilk konserini verdi.\r\n\r\nArizona?da gerçekleştirdikleri bir konseri ?Rude Awakening? adlı konser albümünde toplayan grup, albümü 2002 senesinin Mart ayında piyasaya sürdü. Aynı sene içerisinde Megadeth ilk albümü olan ?Killing Is My Business... And Business Is Good? albümünü dijitalleştirilerek, albüm daha iyi bir sounda ulaştı.(aynı anda albüm kapağıda değişti) Ancak Dave Mustaine?in sağlık problemleri yüzünden neredeyse dağılma aşamasına gelen dörtlü, ne var ki Mustaine?in tedavisi bitiminde aynı sene ?Still Alive... And Well?? adlı derleme albümü hayranlara ulaştırdı.\r\n\r\nSağlık problemlerini 2003 senesinde çözen Mustaine, 2004 senesinde yeni Megadeth albümünün çalışmalarına başlama kararı aldı. ?Rust In Peace? albümünün kadrosunu biraraya getirmeyi planlayan müzisyen, ne var ki Dave Ellefson ve Marty Friedman?dan gelen red cevabından sonra bu projeden vazgeçerek eski Megadeth gitaristi Chris Poland?ı yanına alarak yeni albümün çalışmalarına başladı.\r\n\r\nVinnie Colaiuta (davul) ve Jimmy Sloas (bas gitar)?ın da dahil olduğu ?The System Has Failed? adlı albüm 2004 senesinin sonuna doğru yayınlanırken, grup albümün prodüksiyonunda Jeff Balding ile çalıştı. Albümün soundunda thrash metal?den örnekler sergileyerek hayranlarını mutlu eden grup, albümle Amerika listelerinde 18 numara oldu. Albümden ?Die Dead Enough? ve ?Of Mice And Men? parçaları single olarak piyasaya sürüldü ve 2004 senesinde kadroya James McDonough (bas gitar) ve Glen Drover (gitar) eklenerek turneye çıkıldı. Davulculuk görevini ilk başta Nick Menza?ya devretmeyi düşünen Mustaine, ne var ki Menza?nın yetersiz kalması sebebiyle gruba Glen Drover?ın kardeşi Shawn Drover dahil oldu.\r\n\r\n2004 senesinde Megadeth ?Killing Is My Business? albümünden sonra bu sefer ?Peace Sells...But Who''s Buying?? albümünden ?Risk? albümüne kadar olan (?Risk? dahil) bütün Megadeth albümlerini dijitalleştirerek daha iyi bir sounda ulaştırdı ve aynı zamanda albümlerde hiç duyulmamış olan şarkılar ve kültleşmiş Megadeth şarkılarının demo versiyonları içeriyor.\r\n\r\nYeni kadrosuyla 2005 senesinde Exodus ile Amerika turnesine çıkan Megadeth, Avrupa?da ise Diamond Hed ve Dungeon ile performanslarda bulunan grup, Avrupa turnelerinde Rock Istanbul Festivali kapsamında Türkiye''de 2. konserlerini verdi.\r\n\r\nAynı sene Mustaine?in organize ettiği ?Gigantour? adlı festivalde Dream Theater, Anthrax, Fear Factory, Dillinger Escape Plan, Nevermore, Life Of Agony, Symphony X, Dry Kill Logic ve Bobaflex ile sahne alan grup, aynı senede Megadeth kendi web sayfasında hazırladığı ankette hayranların oylarına göre en iyi şarkılardan oluşan ?Greatest Hits: Back To The Start? adlı derleme albümü hayranlarına sundu. Daha sonra bu derleme albüme 27/12/1999 tarihinde Denver, Colorado da verdikleri konseri içeren bir DVD eklendi. Albüm için 2000 yılında ?Capitol Punishment: The Megadeth Years? albümünde yer alan ?Kill The King? parçasını single olarak seçtiler.\r\n\r\n2006 senesinde bas gitarist James MacDonough ile müzikal farklılıklardan dolayı yollarını ayıran Megadeth, kadroya Black Label Society basçısı James Lomenzo?yu ekledi. Mart ayında Testament ve 3 Doors Down ile birlikte Birleşik Arap Emirlikleri?nde bir festivale katılan grup, aynı sene 2001 senesinde Boston?da gerçekleştirmiş olduğu unplugged konserini ?Unplugged In Boston? ismi altında sadece özel hayranların ulaşabileceği bir şekilde yayınladı.\r\n\r\nEn son 2006 senesinde ?Arsenal of Megadeth? adlı DVD?yi piyasaya süren Megadeth, 15 Mayıs 2007 tarihinde yeni Megadeth albümü ?United Abominations?ı yayınladı. Albüm, politk olmasıyla Birleşik Devletler''de tepki almış olmasına rağmen, Amerika''da 8. sıraya, Kanada''da 5. sıraya ve İngiltere''de 22. sıraya yükselerek grup yeni bir kadroyla eski başarısını yeniden elde etmiş oldu. Albümün prodüksiyonunda Jeff Balding ve Andy Sneap ile çalışan grup, albüme ?Youthanasia? albümünde yer alan ?A Tout Le Monde? parçasını Lacuna Coil?den Cristina Scabbia?nın vokali eşliğinde ?Set Me Free? ismi altında dahil etti. Ayrıca albümde Led Zeppelin parçası ?Out On The Tiles?ı da baştan yorumlayan grup, albümden ilk single?ı olarak ?Set Me Free? parçasını seçti.\r\n\r\nMegadeth''in 2005 senesinde ?Pepsi Music Festival? kapsamında Arjantin''in başkenti Buenos Aires''de 25.000 fanın karşısında verdikleri konser, 6 Mart 2007 tarihinde ?That One Night? adında DVD olarak piyasaya sürüldü.\r\n\r\n9 Ekim 2007 tarihinde Megadeth, ?Warchest? adlı 1 DVD ve 4 CD den oluşan bir koleksiyon albümü yayınladı. Albümde, Megadeth''in 1984 yılından bu yana yaptığı bir kaç canlı performans ve Megadeth albümlerinde yer almayan parçalar var. Bunların yanında sevilen Megadeth parçalarıda yer alıyor.\r\n\r\n2008 yılında Megadeth, Avrupa turnelerine başlamadan grubun gitaristi Glen Dorver gruptan ayrılıp yerine ?Nevermore? ve ?Jag Panzer? grubunun gitaristi Chris Broderick gruba dahil ederek turnelerine devam ettiler. Ve halen devam ediyor. Glen Drover''ın ayrılma gerekçesi ise ailesine daha çok odaklanmak istemesi.\r\n\r\n2009 yılında Endgame isimli stüdyo albümünün yayınlanmasından sonra grubun bas gitaristi James Lomenzo gruptan ayrıldı ve yerine grubun eski basçısı David Ellefson geri geldi .', 'PRJ99wuV1ng'),
(109, 'Metallica ', 'Thrash Metal', 'Amerika', '1981 yılında Lars Ulrich (davul), Los Angeles''da yayınlanan Recycler adlı müzik dergisine ilan vererek birlikte müzik yapabileceği kişilerle görüşmek istediğini belirtir. İlk telefon, bir basımevinde çalışan 18 yaşlarında lise mezunu bir gençten, James Alan Hetfield?dan gelir ve 1 Mayıs 1981''de Lars ve James tanışır. Sert sesi, farklı armonisi ve yeniliğe açık gitar virtiözitesiyle James Hetfield (gitar, vokal) grubun vokal ve gitaristliğini üstlenir ve grubun temelleri atılır...\r\n\r\nLos Angeles?da kurulan heavy metal grubu Metallica?nın ilk kadrosunda Ron McGovney (bas gitar) ve Lloyd Grant (gitar) bulunuyordu. İsmini ilk başta ?Metal Mania? olarak belirleyen grup, müzikal tarz olarak Black Sabbath, Diamond Head, Motörhead, Saxon, Thin Lizzy ve Judas Priest gibi dönemin metal gruplarından etkilenirken, aynı zamanda Misfits, The Ramones ve Discharge gibi punk gruplarını da kendisine örnek aldı.\r\n\r\nİlk kayıt ?Hit The Lights?ı 1982 senesinde Metal Blade Records?un yayınladığı derleme albüm ?Metal Massacre?a eklemeyi başaran Metallica, aynı dönemde gitarist değişikliğine gitmek amacıyla yerel bir gazeteye ilan verdi. Bu ilana o zamanlar ?Panic? adlı grupta çalan Dave Mustaine cevap verdi ve denemelerin ardından Mustaine gruba katıldı. Aynı sene basçı McGovney?in garajında bir demo kaydeden grup, bu demoyu ?Ron McGovney?s 82 Garage Demo? adı altında çevreye dağıttı. Bu demo içerisinde 7 tane yorum parçasına yer veren topluluk, iki bestesini de demoya ekledi. Bir diğer demo ?Power Metal Demo?da aynı sene kaydedilirken, bir kaç ay sonra ?No Life ?Til Leather? adlı demo piyasaya sürüldü ve grubun ismi yavaş yavaş müzik çevresinde duyulmaya başlandı.\r\n\r\n1982 senesinin sonuna doğru ?Metal Up Your Ass? adlı konser demosunu yayınlayan Metallica, 1983 senesinde kadro değişikliğine gitti. Basçı Ron McGovney gruptan ayrılırken, ?Trauma? basçısı Cliff Burton kadroya eklendi. Burton?ın San Francisco?da olması sebebiyle buraya geçen grup, bu kadroyla aynı sene ?Megaforce Demo? adlı demoyu hazırladı ve Metallica artık dönemin ?Bay Area Thrash Metal? grupları arasında sayılıyordu. New York?a geçen ve Megaforce Records ile anlaşma imzalayan topluluk, anlaşmadan kısa bir süre sonra yine kadro değişikliğine gitti. Alkol ve uyuşturucu problemleri yaşayan Mustaine, Ulrich ve Hetfield tarafından kadrodan çıkartılırken, ?Exodus? grubunun gitaristi Kirk Hammett grubun yeni gitaristi oldu.\r\n\r\n1983 senesinde ?Kill?Em All? adlı ilk albümünü piyasaya süren Metallica, bu albümle oldukça sert ve hızlı bir sounda bürünüyordu. Özellikle albümdeki ?Seek & Destroy?, ?Jump In The Fire? ve ?The Four Horsemen? ile dikkat çeken grup, ?Anesthesia (Pulling Teeth)? parçasındaki Burton?un bas solosuyla da müzikseverleri etkilemeyi başardı. Albümün sözlerinde dünyada süre gelen baskılara tepki gösteren topluluk, bu albümle dönemin klasiklerinden birine imza atıyordu.\r\n\r\n1984 senesinde ?Ride The Lightning? adlı 2. albümünü piyasaya süren Metallica, bu albümde bir önceki albüm gibi yine sert ve hızlı parçalara yer verdi. Aynı zamanda ?Fade to Black? ve ?The Call of Ktulu? gibi temposu düşük parçaları da albüme ekleyen grup, ?Creeping Death? ve ?For Whom The Bell Tolls? gibi parçalarla da döneme damgasını vuruyordu. Bu albümle hayran kitlesini genişleten topluluk, albüm sonrasında plak şirketlerinin dikkatini çekti ve Elektra Records ile anlaşmaya vardı.\r\n\r\n1986 senesinde ?Master Of Puppets? adlı 3. albümünü yayınlayan Metallica, bu albümle gerçek çıkışını yakaladı. Özellikle albümde yer alan ?Master Of Puppets? ve ?Welcome Home (Sanitarium)? ile dikkat çeken grup, bu albümle Amerika listelerine girdi ve 29 numara oldu. Tüm zamanların en iyi heavy metal albümlerinden birisi olarak kabul edilen ?Master Of Puppets? sonrası grup, Cliff Burton?ın aynı sene İsveç?de bir otobüs kazası sonrası ölmesiyle sarsıldı. Burton?ın ölümüyle yeni basçı arayışına geçen topluluk, ilk denemelerden sonra ?Flotsam And Jetsam? basçısı Jason Newsteed?i kadrosuna ekledi.\r\n\r\n1987 senesinde ?The $5.98 EP: Garage Days Re-Revisited? adlı EP?yi piyasaya süren Metallica, bu EP ile yeni basçı Jason Newsteed?i hayranlara tanıttı. Altı gün içerisinde kaydedilen EP?de Diamond Head, Holocaust, Killing Joke, Budgie ve The Misfits?e ait beş tane şarkıyı baştan yorumlayan grup, 1988 senesinde 4. stüdyo albümünü yayınladı.\r\n\r\n1988 senesinde piyasaya sürülen ?...And Justice For All? ile politik ve sosyal konulara dikkat çeken Metallica, sound olarak ise bir önceki albümlerindeki ?thrash metal?in özelliklerini bu albüme de yansıttı. Uzun süreli parçaların yer aldığı albüm, özellikle davul ve gitar riffleriyle beğeni toplarken, bas soundu çoğu eleştirmence beğenilmedi. Bunun sebebi Newsteed?in grupta yeni olması ve bas bölümlerinin istenildiği gibi hazırlanamaması olarak açıklandı. Amerika listelerinde 6, İngiltere listelerinde 4 numara olan albümden iki tane single yayınlandı; ?One? ve ?Harvester Of Sorrow?. ?One? parçasına çekilen ilk video klipleriyle MTV?de sıkça ekrana gelmeye başlayan grup, 1989 senesinde Grammy?lere ?En İyi Hard Rock/Metal Performansı? dalında aday olarak gösterildi. Albüm sonrası çıktığı ?Damaged Justice? turnesini 1989 senesinde bitiren topluluk, 1990 senesinde ise Grammy?lerden ?En İyi Metal Performansı? ödülünü ?One? şarkısıyla kazandı.\r\n\r\n1991 senesine gelindiğinde kendi isimleriyle aynı ismi taşıyan 5. stüdyo albümünü yayınlayan Metallica, bu albümle artık tüm Dünya?da tanınan bir grup haline geldi. ?The Black Album? olarak da kabul edilen albüm, her ne kadarda ticari amaçlı yapılan bir albüm gibi eleştiriler alsada Amerika listelerinde 1 numaraya oturdu. Şu ana kadar sadece Amerika?da 14 milyon kopya satarak gruba 14 kez platin plak kazandırdı. Prodüksiyonu Bob Rock tarafından yapılan albümle sound olarak yeni bir yola giren grup, albümde yer alan ?Nothing Else Matters? ve ?The Unforgiven? gibi balladlarla kendi hayranlarının yanısıra geniş kitlelere ulaştı. Albümden yayınlanan ilk single ?Enter Sandman?a çekilen video kliple müzikal tarzını belirten grup, albümden ayrıca ?The Unforgiven?, ?Nothing Else Matters?, ?Wherever I May Roam? ve ?Sad But True? single olarak yayınladı.\r\n\r\n1991 senesinde Queen klasiği ?Stone Cold Crazy?nin baştan yorumu ile Grammy?lerden ?En İyi Metal Performansı? ödülüne layık görülen Metallica, ertesi sene ?Metallica? albümüyle ödüllerden ?En İyi Vokal Metal Performansı? ödülüyle geri döndü. Sonraki üç yıl boyunca ?Wherever We May Roam Tour? ve ?Nowhere Else To Roam Tour? tunesine çıkan grup, bu turneleri 1993 senesinde yayınlanan ?Live Shit: Binge & Purge? adlı box setle hayranlara ulaştırdı.\r\n\r\n1994 senesinde Woodstock?da sahne alan Metallica, bu konser sonrası yeni albüm için stüdyoya kapandı. 1995 senesinde kayıtlara ara vererek Slayer, Skid Row, Slash?s Snakepit, Therapy? ve Corrosion of Conformity ile ?Escape From the Studio? adlı turneye çıkan grup, 1996 senesinde yaklaşık 30 parça hazırladı ve bu parçalardan seçilen şarkıların bir kısmı 6. stüdyo albümü ?Load?un piyasaya sürülmesini sağladı.\r\n\r\n?Load? ile birlikte birçok müzik eleştirmenince Metallica?nın artık eskisi gibi olmadığı belirtilirken, bu albümle birlikte grup çoğu fanını da kaybetti. Sound olarak thrash metal soundundan uzaklaşan grup, albümle birlikte imaj değişikliğine de gitti. Saçlarını kesen grup üyeleri, aynı zamanda grubun logosuyla da grubun imajını farklılaştırdı. Sanki yeniden bir doğuş olarak görülen albüm, Amerika listelerinde grubu bir kez daha zirveye yerleştirdi. Sound olarak blues tonlarına dayanan albüm, liriksel olarak ise daha kişisel sözleri barındırıyordu. Albümden çıkan ilk single ?Until It Sleeps? ile Amerika listelerinde 10 numara olan Metallica, parçaya çekilen video klip ile de beğeni topladı. Albümden ayrıca ?Ain?t My Bitch?, ?Mama Said?, ?King Nothing?, ?Hero Of the Day? ve ?Bleeding Me?i single olarak yayınlayan grup, 1997 senesinde geriye kalan parçaları bir araya getirerek ?Reload? adlı 7. stüdyo albümünü piyasaya sürdü.\r\n\r\n?Reload? ile ?Load?daki tarzını ve stilini devam ettiren Metallica, bu albümle de Amerika listelerinde zirvedeydi. Albümden yayınlanan ilk single ?Memory Remains? ile Amerika listelerinde 28 numara olan grup, bu parçada Marianne Faithfull?u konuk müzisyen olarak parçaya davet etti. Albümde ?Metallica? albümünde yer alan ?The Unforgiven?ın devamı niteliğinde ?The Unforgiven II? adlı parçayı da bulunduran topluluk, albümden bu parçayla birlikte ?Fuel? ve ?Better Than You?yu single olarak piyasaya sürdü.\r\n\r\n1998 senesinde ?Garage Inc.? adlı çift CD?lik albümü yayınlayan Metallica, bu albümde şu ana konserlerde yorumladıkları ve saygı duydukları grupların parçalarını baştan yorumladı. Albümün ikinci tarafında 1987 senesinde yayınlanan ?The $5.98 EP: Garage Days Re-Revisited?deki parçaları da ekleyen grup, bu albümle Amerika listelerinde 2 numara oldu ve albümden üç tane single piyasaya sürüldü; ?Turn The Page?, ?Whiskey In The Jar? ve ?Die, Die My Darling?. 1999 senesinde Grammy?lerden ?Reload? albümünde yer alan ?Better Than You? ile ?En İyi Metal Performansı? ödülüne layık görülen topluluk, 2000 senesinde ise ?Garage Inc.? albümünde yer alan ?Whiskey In The Jar? ile ?En İyi Hard Rock Performansı? ödülünü kazandı.\r\n\r\n7 Mart 1999 tarihinde San Francisco?daki ?Walk Of Fame?e eklenen Metallica, bir ay sonra Michael Kamen yönetimindeki San Francisco Senfoni Orkestrası?yla iki tane performans gerçekleştirdi. Bu performanslarda ?No Leaf Clover? ve ?Minus Human? adlı iki tane de yeni parça çalan grup, bu konseri aynı sene ?S&M? adı altında albüm olarak yayınladı. Amerika listelerinde 2 numara olan albüm, aynı zamanda DVD olarak da piyasaya sürüldü.\r\n\r\n2000 senesinde internet paylaşım programı Napster?ı parçalarını izinsiz dağıtılmasından dolayı dava eden Metallica, bu olayla birlikte birçok müzikseverin tepkisini topladı. Müzikal felsefeleri ile birçok müzikseveri kendisine bağlayan grup, bu dava ile birlikte eleştirilerin temel hedefi oldu. Bunlar sürerken grup 2001 senesinde yeniden stüdyoya geçme kararı aldı. Ancak stüdyo öncesi Jason Newsteed, James Hetfield ile düştüğü anlaşmazlıklar ve kendi albümünü yapma isteğinin grup üyeleri tarafından kabul görmemesi yüzünden, 30 Kasım 2000''de gerçekleştirdikleri son performastan sonra 17 Ocak 2001''de gruptan ayrıldı ve kendi solo albümü "Echo Brain" i çıkardı. Diğer yandan James Hetfield''ın, Rusya''da katıldığı bir av gezisinden döndüğünde, Rusya''da edindiği alkol alışkanlıklarını sürdürmeye devam etmesi, alkol bağımlılığı yüzünden rehabilitasyon merkezine yatmasına neden oldu. Tarihinde ilk kez bu kadar ciddi bir dağılma durumu yaşayan topluluk, ne var ki Hetfield?in kendisini çabuk toparlamasıyla birlikte kendisine geldi.\r\n\r\n2001 senesinde ?S&M? albümündeki ?The Call Of Ktulu? parçasıyla Grammy?lerden ?En İyi Enstrümental Rock Performansı? ödülüne layık görülen Metallica, aynı zamanda üç kişi olarak bestelerini yazmaya devam etti ve bas partisyonlarında grup, prodüktör Bob Rock?dan destek aldı. Albümün kayıtları devam ederken bunu belgeselleştirmek isteyen Metallica, ?Some Kind Of Monster? adlı belgeselle kayıt aşamasında yaşananları hayranlara ulaştırma kararı aldı. Bu arada basçı arayışlarına devam eden üçlü, 2003 senesinde Suicidal Tendencies ve Ozzy Osbourne basçısı Robert Trujillo?yu kadrosuna ekledi.\r\n\r\nHaziran 2003?de ?St. Anger? adlı 9. stüdyo albümünü yayınlayan Metallica, albümün çıkışıyla birlikte Amerika listelerinde zirveye yerleşti. Kayıtları kiralanan bir garajda yapılan albüm, sound olarak grubun tüm agresifliğini lanse ediyordu. Gerek gitar riffleriyle olsun gerek davul tonlarıyla olsun eski albümlerden tamamen farklı bir stile sahip olan ?St. Anger?, grubu müzikal çağa uygun düşürüyordu. Albümden ?St. Anger?, ?Frantic?, ?The Unnamed Feeling? ve ?Some Kind Of Monster? single olarak yayınlanırken, albüm grubun şu ana kadar en az satan albümü oldu.\r\n\r\n?St. Anger? albümü sonrası ?Summer Sanitarium Tour 2003? ve ?Madly In Anger With The World Tour? adlı turnelere çıkan Metallica, bu turnede zaman zaman son albümden hiç bir parçaya yer vermedi. 2004 senesinde biten turnenin ardından ?Some Kind Of Monster? adlı EP?yi piyasaya süren grup, bu EP ile birlikte ?St. Anger? kayıtları döneminde kaydedilen EP ile aynı ismi taşıyan belgeseli hayranlara ulaştırdı. Aynı sene grup, Grammy?lerden ?St. Anger? ile ?En İyi Metal Performansı? ödülüne layık görüldü.\r\n\r\n2005 senesini aileleriyle ve arkadaşlarıyla geçiren Metallica üyeleri, Şubat 2006?da resmi internet sitesinden yapılan açıklamayla yayınlanacak yeni albümde prodüktör Bob Rock ile çalışmayacaklarını ve Rage Against The Machine, Red Hot Chili Peppers, Slayer, Slipknot ve AC/DC gibi gruplarla çalışmış olan Rick Rubin?in grubun yeni prodüktörü olacağını açıkladılar. Aralık 2006?da ?The Videos 1989 ? 2004? adlı DVD?yi yayınlayan grup, bu DVD içerisine grubun bütün video kliplerini hayranlara ulaştırdı.\r\n\r\nAynı yıl içinde Iron Maiden''e saygı amaçlı yapılan ?Maiden Heaven: A Tribute To Iron Maiden? albümünde ?Remember Tomorrow? adlı parçayı yeniden çaldılar.\r\n\r\nAyrıca Metallica 25 Haziran 1993''te İnönü Stadyumunda 48.000 kişinin karşısında verdiği konser ve ardından 13 Haziran 1999 yılında Ali Sami Yen Stadyumunda 46.530 kişinin karşısında verdiği konserden sonra bu kez 27 Temmuz 2008 tarihinde bir kez daha Ali Sami Yen Stadyumunda konser vermek üzere Türkiye''ye geri döndü ve hayranlarına yeniden unutulmaz bir an yaşattı. Konsere Türkiye''den başka Romanya''dan 2 bin kişi, Yunanistan ve Bulgaristan ülkelerinden otobüslerle yüzlerce kişi, orta doğudan yüzlerce kişi katıldı.\r\n\r\nMetallica, 2003 yılından bu yana 5 yıllık bir aradan sonra yeni albümü ?Death Magnetic?i Eylül 2008 tarihinde piyasaya sürdü. Black albümünden St. Anger albümüne kadar bütün Metallica albümlerinin prodüksiyonluğunu üstlenen Bob Rock yeni albümde yer almayarak yerine Rick Rubin geldi. Albüm, St. Anger albümünden çok daha farklı bir sound a sahip olarak herkes tarafından Kirk Hammett''ın dediği gibi ?...And Justice For All albümünün modern versiyonu? olarak tanımlanıyor. Albümün ilk videosu olan "The Day That Never Comes" adlı parçaya çekildi ve yine aynı tarihlerde yayımladı. 8 dakika 25 saniye süren ve kısa bir filmi andıran klip, Thomas Vinterberg yönetmenliğinde Los Angeles yakınlarındaki bir çölde çekildi.İkinci video ise ''''Tunguska Olayı''''nı içeren bir konuyla başlayıp 60''lı yılların korku öğelerini içeren b filmi tadında ''''All Nightmare Long'''' parçasına çekildi. 3. video klip ''Broken, Beat & Scarred''a çekildi. Bu klipte World Magnetic Tour''dan görüntüler kullanıldı.\r\n\r\nMart 2009''da ise grubun şarkılarını içerdiği ''''Guitar Hero: Metallica'''' adlı oyun PlayStation 2, PlayStation 3, Wii, Xbox 360 platformları üzerinden piyasaya sürüldü.\r\n\r\nDünya?nın en önemli heavy metal gruplarından biri olarak kabul edilen Metallica, yıllardır süren müzik kariyerini hala devam ettiriyor...', 'EzgGTTtR0kc'),
(110, 'Roadrunner United', 'Thrash Metal', 'Amerika', 'RoadRunner United RoadRunner Records''un sanatçılarının içinde bulunduğu metal grubudur. Bu grubun içinde 4 grup kaptanı, 56 sanatçı, 45 tane grup mevcuttur. Kurucuları: Joey Jordison (Slipknot - bateri), Matthew Heafy (Trivium - vokal, ritim gitar), Dino Cazares (Fear Factory - solo gitar), Robert Flynn (Machine Head - vokal).', '2XqRQmGoaB4'),
(111, 'Slayer', 'Thrash Metal', 'Amerika', '1982?de gitarist Jeff Hanneman ve Kerry King tarafından Los Angeles?ta kurulan efsanevi thrash metal grubu Slayer, kadroya Tom Araya ve Dave Lombardo?yu da aldıktan sonra yaklaşık 1 sene boyunca yerel klüplerde sahne aldı. Grubu küçük sahnelerden çıkarıp isimlerini cd kapaklarına taşıyan kişi Metal Blade Stüdyolarının sahibi Brian Slagel oldu. O sıralarda Iron Maiden ve Judas Priest şarkılarını coverlayan grup, Bitch grubunun Woodstock klübündeki performansından önce sahne aldı. Grubun Iron Maiden?dan ?Phantom of the Opera?yı çalarken sergilediği performanstan etkilenen Slagel, toplama bir albüme dahil olmaları için Slayer''a teklif götürdü. Metal Massacre adını taşıyan bu toplama albüm için kaydedilen ?Aggressive Perfector? metal camiasında az sayıda dinleyiciye ulaşabilmesine rağmen grubun Metal Blade ile anlaşma imzalamasını sağladı.\r\n\r\nGrubun ilk albümü 1983?te ?Show No Mercy? adıyla piyasaya sürüldü. Kerry King?in babasından alınan borçlara Tom Araya?nın kenardaki parası eklenerek kaydedilen albüm, eleştirmenler tarafından pek olumlu değerlendirilmese de 1984?te gerçekleştirilen turne sayesinde gruba belli sayıda hayran kitlesi kazandırdı. Aynı sene ?Haunting the Chapel? ep?sini piyasaya süren Slayer, öncekine göre thrash havası daha fazla olan ve yine öncekine göre daha karanlık bir sound?la yoluna devam ediyordu. Bu ep?de yer alan ?Chemical Warfare? şarkısı günümüzde metal müzik çatısı altında yapılan en ünlü çalışmalardan biri olarak kabul ediliyor.\r\n\r\nHaunting the West turnesinden sonra evine dönen grup elemanlarından Kerry King, o dönemde yeni kurulmuş olan Megadeth?e dahil olmak üzere gruptan ayrıldı. 5 konserden sonra Slayer?a geri dönen King, yaptığı açıklamalarla Dave Mustaine?i kızdırmış ve iki grup arasında yıllarca devam edecek olan analaşmazlığın tohumlarını ekmişti. King?in dönüşünden sonra Combat Tour bünyesinde Venom ve Exodus?la sahne alan grup, 1984?ün sonlarına doğru Live Undead adlı canlı performans albümünü piyasaya sürdü. Bu arada ?Show No Mercy? albümü bazı sorunlar yüzünden ancak 1984 senesinde Avrupa?daki dinleyicilere ulaşabildi. Slayer, ilk albümü maddi zorluklara göğüs gererek tamamlamıştı; fakat bu sefer Meta Blade kayıtlar için gruba destek vermeye hazırdı. Böylelikle Brian Slagel ?in prodüktörlüğünü üstlendiği ?Hell Awaits? albümü kaydedildi. "At Dawn They Sleep", "Kill Again", "Necrophilliac" ve "Hell Awaits" gibi klasikleşmiş parçaları içeren albüm, eleştirmenler tarafından olumlu değerlendirildi ve efsanevi metal albümleri arasındaki yerini aldı.\r\n\r\nHell Awaits?in başarısından sonra Def Jam Records?un demirbaşlarından anlaşma teklifi alan grup bunu kabul etti. Her ne kadar Def Jam rap/hip-hop tabanlı bir plak şirketi olsa da kayıt için önemli bir bütçe ayıran büyük şirketlerden biriydi. Speed metal?den thrash?e geçiş yapan Slayer, tarihinin en önemli albümlerinden birini hazırladı. Gelmiş geçmiş en iyi thrash metal albümleri sıralamasında en üstte olan ?Reign in Blood? Dej Jam?in dağıtımcısı tarafından kapak tasarımı ve sakıncalı sözleri nedeniyle reddedildi. En sonunda Geffen?den çıkan albüm, bir aksilik nedeniyle radyolarda çalınmadı; fakat grubun Billboard 200 listesine 94 numaradan girmesini sağladı. Albüm tanıtımı için düzenlenen turneden sonra Dave Lombardo gruptan ayrıldı; fakat ısrarlar üzerine 1987?de gruba döndü. Aynı sene içinde Slayer, Iron Butterfly''ın "In A Gadda Da Vidda" şarkısını "Less Then Zero" filmi için cover?ladı. Grup, kaydın sonucundan memnun kalmamıştı.\r\n\r\n1988 tarihli ?South of Heaven? önceki albümlere göre daha düşük tempoya sahipti. Gruba o zaman dek en yüksek ticari başarıyı getiren albüm, Billboard 200 listesinde 57 numaraya çıktı. 1990 tarihli "Seasons In The Abyss" ise 92?de Altın Plak ödünülü aldı. 1990?da Clash of the Titans turnesinde metal devleriyle aynı sahneyi paylaşan Slayer, 91?de Decade of Aggression adını taşıyan iki cd?lik bir konser albümü hazırladı. Slayer başarıdan başarıya koşuyordu, çünkü thrash metal o sıralar altın devrini yaşamaktaydı. 1992?de Lombardo grubu yine bıraktı ve onun yerine Paul Bostaph geçti. Sıradaki turne "Monsters Of Rock" turnesi idi, Çek Cumhuriyeti, Almanya, Polonya ve İngiltere ayaklarından oluşan bu turnede Slayer''a, Iron Maiden, Skid Row ve WASP eşlik etti. Thrash metal yavaş yavaş ölmeye başlamıştı.Thrash grupları ya yumuşayıp heavy metal, glam, power metale kayıyor ya da sertleşip dark, doom, death metalle devam ediyordu. Bu süreçte ayakta kalabilen çok az grup vardı.\r\n\r\nReign In Blood albümündeki sertlik 1994 tarihli yeni albüm ?Divine Intervention?da tekrarlandı. Albüme Killing Fields, Dittohead, Divine Intervention gibi klasik şarkılar dahil edilmişti. Albüm, Billboard listesine 8 numaradan giriş yaparak grubun o zamana kadarki en yüksek liste başarısını beraberinde getirdi. Uzun süren bir turneden sonra ?Undisputed Attitude? adlı punk cover albümü hazırlayan grup, bu albümde Minor Threat, T.S.O.L., D.R.I., D.I., Verbal Abuse, Dr. Know ve The Stooges gibi grupların şarkılarına yer verdi. Albümün yayımlanmasından kısa bir süre önce Bostaph gruptan ayrıldı ve yerine Testament?in davulcusu Jon Dette geçti. Grup, 1996?da Ozzfest?te Ozzy Osbourne, Danzig, Sepultura ve Fear Factory ile birlikte sahne aldıktan sonra Jon Dette?i kovarak yerine çıktıkları turneyi kurtarması için Bostaph?a bıraktı.\r\n\r\nGrup, 1998?de ?Diabolus in Musica?yı yayımladı. Nu-metal etkileşimleri barındırdığına yönelik eleştiriler alan albüm, Billboard listesine 31 numaradan giriş yaptı. Aynı sene Berlinli dijital hardcore grubu Atari Teenage Riot ve Slayer, Spawn filminin soundtrack?i için ?No Remorse (I Wanna Die) parçasını hazırladılar. Buna ek olarak bir de Black Sabbath cover?ı kaydeden grup, 2001?de ?God Hates Us All? albümünü hayranlarının beğenisine sundu. Albümün çıkış parçası ?Disciple? ile Grammy?ye aday ilk kez olan Slayer, ödülü Tool?a kaptırdı. 11 Eylül olaylarından sonra ortalık iyice karışmıştı. Turneler iptal ediliyor, gruplar konser vermeye ya çekiniyor ya da konserleri mümkün olduğunca ertelemeye çalışıyorlardı. Bu olayların yaşandığı ve grubun da turnede olduğu sırada Bostaph gruptan ayrıldığını açıkladı. Slayer yine davulsuz kalmıştı. Turneyi tamamlaması için Dave Lombardo?ya teklif götürüldü. Teklifi kabul eden Lombardo bir süre sonra grubun kadrosuna tekrar dahil oldu. 2006?da piyasaya sürülen ?Christ Illusion?, 1990 tarihli ?Seasons in the Abyss?ten beri Lombardo?nun dahil olduğu ilk albümdü. İlk haftasında 62.000 kopyası satılan albüm Billboard listesine 5 numaradan giriş yaptı. Grup böylece daha önce 8 numaradan giriş yapan Divine Intervention?ın başarısını sollamış oldu. Albümden çıkan ilk single ?Eyes of the Insane? parçasına seçildi. Aynı zamanda Saw III filminin soundtrack?ine dahil edilen parça, gruba 49ncu Grammy Ödülleri?nde En İyi Metal Performans ödülünü kazandırdı. Christ Illusion?ı yeni kapak tasarımı ve ekstradan eklenmiş bir şarkıyla tekrar piyasaya süren grup, ?Final Six? çalışmasıyla 50. Grammy Ödülleri?nde bir ödülün daha sahibi oldu.\r\n\r\nSlayer, plak şirketiyle yaptıkları anlaşmada geçen albüm sayısını bir sonraki albümle birlikte doldurmuş olacak. Geçtiğimiz aylarda yapılan bir röportajda Tom Araya grubun geleceğinin belirsiz olduğunu açıkladı. Müzisyen, kendisini iyice yaşlandığında hala bu işi yapıyor olarak düşünemediğini, önümüzdeki albümden sonra grubun oturup gelecek üzerine düşünmesi gerekeceğini sözlerine ekledi.', 'BwLtTa2trRs');
INSERT INTO `muzik` (`grupID`, `grupAd`, `tur`, `memleket`, `tanim`, `grupClip`) VALUES
(112, 'Sepultura', 'Thrash Metal', 'Brezilya', '1984?te Belo Horizonte, Brezilya''da Igor Cavalera, Max Cavalera Paulo Pinto, Wagner Lamounier ve Jairo Guedes tarafından kuruldu. İlk birkaç sene sadece konserler vermekle yetinen grup bir süre sonra Cogumelo Records ile anlaştı. Lamounier''in ideoloji farklılıklarını ileri sürerek gruptan ayrılmasıyla yerine Max geçti. Bu sayede "Bestial Devastation" isimli ilk çalışmalarının kaydı gecikmemiş oldu. İlk albüm denemesi olan "Morbid Visions" bir sene sonra geldi. Bu iki çalışma da o zamanın şartlarına göre oldukça kötü kayıtlardı ve dinleyici kitlesi açısından dar bir alanı aşamamışlardı. Buna rağmen, yıllar sonra death metal''in oluşumunda atılmış en önemli adımlardan biri olarak kabul edileceklerdi. Sonraki albümün yayımlanmasından önce Jairo Guedes, grubu bırakarak yerini Andreas Kisser''a devretti. İkinci albüm olan "Schizophrenia"nın başarısı Roadrunner Records''un ilgisini çekerek grubun sıçramasında önemli bir etken oldu. O döneme kadar Brezilya sınırlarını aşmakta zorlanan Sepultura, Roadrunner''ın albümü dünya çapında dağıtması sayesinde yeni bir dinleyici kitlesine ulaştı. Topluluk üyelerinin daha önceki yaşantıları, yaşadıkları yerdeki sosyal sıkıntı ve zayıflıklar müziklerine de hız ve öfke dolu bir dinamizm katıyordu. Genişleyen dinleyici kitlesi de bu dinamizmden etkilenmişti. 1989''da yayımlanan "Beneath The Remains" albümü 80lerin en başarılı thrash albümlerinden biri oldu ve grubun çıkmayı planladığı Avrupa-Amerika turnesine zemin hazırladı.\r\n\r\nAvrupa ve Amerika?daki başarılara rağmen Sepultura kendi yurdu Brezilya?yı terketmedi. Yine 1990?da Rio?da Rock Şenliklerinde sahne aldılar. 1991?deki "Arise" plak şirketlerinin kısa tarihindeki en yüksek satış rakamlarına ulaştı. 1993''de çıkan "Chaos A.D." ise topluluğun kendi müziğine olan yaklaşımının değiştiğini ortaya koyuyordu. Geleneksel thrash köklerinden kopan grup, 1996 tarihli "Roots" ile en başarılı albümlerine ve hala dinlenen efsanevi Roots parçasına imza attı. 1994?te Cavalera, Alex Newport ile Nailbomb adı altında yaptığı kayıt çalışmalarının sonuncunda Point Blank CD?sini yayıma hazırladı. Bir doruk noktası olarak görülen Roots''un başarısını daha yeni yeni yaşamaya başlayan grup üyeleri, dumur edici bir olayla karşılaştırlar. Grubun vokalisti Max Cavalera, yeni grubu "Soulfly"ı kurmak üzere topluluktan ayrılıyordu. Cavalera''nın yerine Amerikalı Derrick Green geldiğinde işler bir süre yolunda gitmeyecekti. Hayran kitlesi Sepultura''nın Cavalera''sız olamayacağını düşünüyordu. 1998?de yayımlanan "Against" ve sonrasında gelen "Nation" albümleri öncekilere göre çok az sattı. Derrick''in gruba gelmesiyle birlikte sound''da yaşanan değişimin de bunda rolü vardı. Öte yandan, 2003 tarihli "Roorback" yeni Sepultura''nın kabuğundan sıyrıldığını gösteren başarılı bir çalışma oldu. 2006''da yayımlanan "Dante XXI" ise hayranlar tarafından beğeniyle karşılandı ve Derrick Green''in dahil olduğu en iyi Sepultura çalışması olarak kabul edildi.\r\n\r\nMax ve Igor yıllar sonra tekrar biraraya gelip "Cavalera Conspiracy" adında yeni bir grup kurdular. Sepultura üyelerinden Andreas Kisser yakın bir süre önce yaptığı açıklamada 2008 tarihli "A-Lex" adlı yeni albümün Cavalera kardeşlerden hiçbirinin yer almadığı ilk Sepultura çalışması olacağını belirtti. Böylelikle Cavalera kardeşlerle başlayan ve yıllarca öyle anılan Sepultura, bu geleneği devam ettiren Igor''u da kaybetmiş oldu.', '_hUM2YH41jE'),
(113, 'Testament', 'Thrash Metal', 'Amerika', '1980?li yıllarda San Fransisco Bay Area bölgesinden yayılan Thrash Metal akımının en ünlü gruplarından biri olan Testament ilk olarak 1983?te vokalist Steve Souza, gitaristler Eric Peterson ve Derrick Ramirez, bas gitarist Greg Christian, ve davulcu Louie Clemente tarafından ?Legacy? adıyla kuruldu. Grup, daha sonraları tam bir gitar efsanesine dönüşecek olan Alex Skolnick?in katılımıyla adını Testament olarak değiştirdi. 1986 yılında plak şirketlerinin dikkatini çekmeyi başaran grup, ilk vokalist Souza?nın yine bir diğer Bay Area efsanesi olan Exodus?a katılması ve yerine Chuck Billy?in katılmasıyla ideal kadrosuna ulaştı. Megaforce Records ile bir albüm anlaşması imzalayan grup bir sonraki yıl debut albümü ?The Legacy?yi yayınladı. Bugün thrash metal sahnesinde bir klasik olarak kabul edilen albüm içerdiği sert gitar riffleri ve harmonik öğeleriyle Testament?ı Metallica ile karşılaştırılır bir duruma getirdi. Testament daha sonra Anthrax?ın ön grubu olarak Amerika ve Avrupa turnesine çıktı. Bu turne sırasında kaydedilen ?Live at Eindhoven? EP?si Testament''in konumunu sağlamlaştırdı.\r\n\r\nTestament 1989 yılında Practice What You Preach albümünü yayınladı. Grup bu albümle, sert ve agresif soundundan taviz vermeden melodik anlamda oldukça ileri bir noktaya ulaştı. Savatage ve Wrathchild ile birlikte bir yıl boyunca Amerika?yı turlayan grup MTV tarafından büyük destek gördü.\r\n\r\n90?lı yıllarda kadrosunda birçok değişiklik gören grup ilk kaybı gitarist Skolnick?in Savatage?a geçmesiyle yaşadı. Yine yakın dönemde davulcu Clemente?nin yerini bir dönem Slayer ile de çalan ünlü davulcu Paul Bostaph aldı. 1994?te Low albümünü yayınlayan Testament, Atlantic Records tarafından yayınlanan bu albümde gitarda James Murphy (Death, Obituary) ve davulda John Tempesta ile çalıştı. Daha sonra Tempesta ayrılarak White Zombie?ye katıldı. İlerleyen dönemde sırayla Live at the Fillmore (1995) ve Demonic (1997) albümlerini yayınlayan Testament 1999 yılında efsanevi bas gitarist Steve DiGiorgio?nun ve davulcu Dave Lombardo (Slayer) katılımıyla The Gathering albümünü yayınladı. Yine aynı dönemde vokalist Chuck Billy?ye kanser teşhisi konuldu. Kısa sürede iyileşen Billy, kurucu üyeler Steve Souza ve Alex Skolnick?in de gruba dönmesiyle birlikte 2001 yılında en sevilen şarkılarını First Strike Still Deadly albümünde topladı.\r\n\r\nTestament ülkemizde 14 Mart 2004''te İstanbul Yeni Melek Gösteri Merkezi''nde sahne aldı. ', '09rHDabBQfA'),
(114, 'Trivium', 'Thrash Metal', 'Amerika', '2000''li yıllarda Florida, ABD''de kurulan bir metalcore grubudur.Kelime, Latincede "üç yol ağzı" anlamına gelir. Roadrunner Records''dan "Ember to Inferno", "Ascendancy" ,"The Crusade"ve''''Shogun'''' adıyla 4 albümleri çıkmıştır.Grubun Vokal-Gitarı Matt Heafy genç yaşında bir çok metal üstadının gözüne girmeyi başarmıştır.', 'Lp8p5OPtEe0');

-- --------------------------------------------------------

--
-- Table structure for table `muzik_rss_items`
--

CREATE TABLE IF NOT EXISTS `muzik_rss_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` text collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `link` text collate utf8_unicode_ci,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `muzik_rss_items`
--

INSERT INTO `muzik_rss_items` (`id`, `title`, `description`, `link`, `date`) VALUES
(1, 'Hammerfall - Power Metal', 'Gitarist Oscar Dronjak, 1993?te başka bir death metal grubu olan Ceremonial Oath?tan ayrılıp yanına Jesper Strömblad?ı da alarak HammerFall?ı kurdu. Bu fikir Oscar?ın aklına düştüğünde aslında grubun tüm altyapısı hazırdı; grubun adı, yapısı hatta birkaç parça.. Fakat Jesper ve Oscar çaldıkları diğer gruplar Crystal Age ve In Flames?e duydukları saygıdan ötürü bu projeyi daha ileri bir tarihe ertelediler. İkilinin en büyük avantajı ise death metal aleminin büyükleriyle zamanında çok yakın arkadaş olmalarıydı ki, ilk kurdukları kadro içerisinde Niklas Sundin, Mikael Stanne ve Johan Larsson gibi isimler vardı.Bu ekip her sene iki kere bir araya gelip bölgesel bir yarışma olan ?Rockslaget?e katıldılar. Zaman ilerlerken Niklas ve Johan yerlerini, Glenn Ljungström(In Flames) ve Fredrik Larsson?a bıraktı. ?Steel Meets Steel? ve ?HammerFall? gibi HammerFall ezgilerinden çok uzak oalrak grup Alice Cooper?ın ?Red, Hot and Heavy?sini de çaldı.1996?ya zıplayalım hemen. Grup, ?Steel Meets Steel?, ?Unchained? ve Judas Priest milli marşı haline gelen ?Breaking The Law? ile ?Rockslaget?te ilk defa yarı finale kaldı. Kutlamaların ortasında vokalist Mikael?in artık grupta kalmayacağı anlaşıldı ve bu nedenle gerçekleşen küçük bir araştırma sonucu gruba yeni vokalist olarak Joacim Cans getirildi.Yarışmada çok başarılı performans göstermelerine karşın, HammerFall asla finallere ulaşamadı ki bu da jürinin son dakikada HammerFall?ı elemesiyle gerçekleşti. Belki de Heavy Metal?in dünyada tekrar yükselişinden korktular.Herneyse, grup iki canlı performansının görüntülerini Hollanda?lı müzik şirketi Vic Records?a gönderdi. Firma HammerFall?ın performansından oldukça etkilendi ve akabinde hemen kontrat imzaladılar. Yılın yaz ve sonbahar ayları, parça yazarak, prova yaparak ve müzik kalitesini arttırmaya çalışarak geçirildi. Nihayetinde grubun çıkış albümü olan ?Glory To The Brave? 1997 başlarında piyasaya çıktı.', 'http://tasdemir.0fees.net/main/muzik.php', '2010-08-29 19:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `oneri`
--

CREATE TABLE IF NOT EXISTS `oneri` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `oneri` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `oy_iyi` int(6) unsigned NOT NULL default '0',
  `oy_kotu` int(6) unsigned NOT NULL default '0',
  `rating` int(6) NOT NULL default '0',
  `tarih` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `rating` (`rating`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oneri`
--

INSERT INTO `oneri` (`id`, `oneri`, `oy_iyi`, `oy_kotu`, `rating`, `tarih`) VALUES
(6, 'Giriş sayfası iyi olmuş.', 5, 1, 4, '2010-08-20 09:39:30'),
(7, 'Müzik sayfası iyi olmuş.', 6, 0, 6, '2010-08-20 09:57:28'),
(10, 'Bu sayfa güzel olmamış.', 3, 2, 1, '2010-09-20 17:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `oneri_oy`
--

CREATE TABLE IF NOT EXISTS `oneri_oy` (
  `oneri_id` int(10) unsigned NOT NULL default '0',
  `ip` int(10) unsigned NOT NULL default '0',
  `gun` date NOT NULL default '0000-00-00',
  `oy` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`oneri_id`,`ip`,`gun`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oneri_oy`
--

INSERT INTO `oneri_oy` (`oneri_id`, `ip`, `gun`, `oy`) VALUES
(7, 1319138324, '2010-08-20', 1),
(6, 1319138324, '2010-08-20', 1),
(6, 1491107084, '2010-08-21', 1),
(7, 1319138324, '2010-08-23', 1),
(6, 1319690548, '2010-08-24', 1),
(7, 1319134281, '2010-08-29', 1),
(6, 1319808085, '2010-09-16', 1),
(7, 1319808085, '2010-09-16', 1),
(6, 1320465832, '2010-09-20', 1),
(7, 1320465832, '2010-09-20', 1),
(10, 1320465832, '2010-09-20', -1),
(7, 1320465832, '2010-09-21', 1),
(10, 1320465832, '2010-09-21', 1),
(6, 1320465832, '2010-09-21', 1),
(10, 1432937992, '2010-09-27', 1),
(6, 1432937992, '2010-09-27', -1),
(7, 1432937992, '2010-09-27', 1),
(10, 1319625361, '2010-09-29', 1),
(10, 1594882539, '2010-10-06', -1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `content` text collate utf8_unicode_ci NOT NULL,
  `author` varchar(128) collate utf8_unicode_ci NOT NULL,
  `permalink` varchar(128) collate utf8_unicode_ci default NULL,
  `root_id` bigint(20) default NULL,
  `lft` bigint(20) default NULL,
  `rgt` bigint(20) default NULL,
  `level` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `date`, `content`, `author`, `permalink`, `root_id`, `lft`, `rgt`, `level`) VALUES
(2, '2010-09-27 11:52:28', 'Forum sayfamız hayırlı olsun. Sayfa herkese açıktır. Üyelik gerektirmez.', 'İbrahim Taşdemir', 'Forum Hayırlı Olsun', 2, 1, 6, 0),
(3, '2010-09-27 11:52:28', 'Sayfada avatarlar görünmüyor. Tasarım iğrenç.', 'Demigod', NULL, 2, 2, 3, 1),
(4, '2010-10-07 14:51:38', 'Sen ne anlarsın site yapmaktan', 'Zenci dudaklı', NULL, 2, 4, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) collate utf8_unicode_ci NOT NULL default '',
  `modified` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `data` text collate utf8_unicode_ci,
  `name` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `session`
--


-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ip` varchar(20) collate utf8_unicode_ci NOT NULL,
  `country` text collate utf8_unicode_ci NOT NULL,
  `city` text collate utf8_unicode_ci NOT NULL,
  `query_string` text collate utf8_unicode_ci NOT NULL,
  `http_referer` text collate utf8_unicode_ci NOT NULL,
  `http_user_agent` text collate utf8_unicode_ci NOT NULL,
  `isbot` int(1) NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`date`, `time`, `ip`, `country`, `city`, `query_string`, `http_referer`, `http_user_agent`, `isbot`) VALUES
('2010-08-30', '14:56:13', '78.160.100.73', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-30', '23:30:27', '66.249.71.195', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-08-09', '10:34:42', '64.255.180.21', 'Norway', 'Oslo', '', 'Unknown', 'Opera/9.80 (Windows NT 5.1; U; tr) Presto/2.6.30 Version/10.60', 0),
('2010-11-10', '09:22:12', '204.236.181.128', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-11-07', '18:22:50', '184.72.0.132', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-11-08', '12:58:19', '204.236.151.176', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-08-10', '05:54:42', '88.251.179.195', 'Turkey', 'Denizli', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.125 Safari/533.4', 0),
('2010-08-12', '13:08:04', '66.249.71.166', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-06', '12:45:09', '66.249.71.228', 'United States', 'Mountain View', '', 'Unknown', 'Mediapartners-Google', 1),
('2010-09-06', '14:30:18', '174.143.213.49', 'United States', 'San Antonio', '', 'http://twitturls.com/', 'Mozilla/5.0 (compatible; Twitturls; +http://twitturls.com)', 1),
('2010-08-12', '13:08:05', '66.249.71.165', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-08-14', '03:05:07', '85.110.18.167', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-15', '06:55:10', '64.255.180.84', 'Norway', 'Oslo', '', 'Unknown', 'Opera/9.80 (Windows NT 5.1; U; tr) Presto/2.6.30 Version/10.60', 0),
('2010-11-02', '09:50:21', '128.30.52.80', 'United States', 'Cambridge', '', 'Yok', 'Java/1.6.0_20', 1),
('2010-11-07', '14:49:18', '128.30.52.71', 'United States', 'Cambridge', '', 'Yok', 'W3C_Validator/1.1', 1),
('2010-11-07', '14:49:18', '128.30.52.94', 'United States', 'Cambridge', '', 'Yok', 'FeedValidator/1.3', 1),
('2010-11-07', '14:48:40', '128.30.52.72', 'United States', 'Cambridge', '', 'Yok', 'Jigsaw/2.2.5 W3C_CSS_Validator_JFouffa/2.0', 1),
('2010-11-07', '14:49:16', '128.30.52.93', 'United States', 'Cambridge', '', 'Yok', 'Java/1.6.0_20', 1),
('2010-08-15', '10:38:52', '128.30.52.17', 'United States', 'Cambridge', '', 'Unknown', 'W3C-mobileOK/DDC-1.0 (see http://www.w3.org/2006/07/mobileok-ddc)', 0),
('2010-11-01', '11:07:18', '128.30.52.73', 'United States', 'Cambridge', '', 'Yok', 'W3C_Validator/1.1', 1),
('2010-11-02', '09:55:12', '128.30.52.70', 'United States', 'Cambridge', '', 'Yok', 'W3C_Validator/1.1', 1),
('2010-11-07', '14:48:45', '128.30.52.65', 'United States', 'Cambridge', '', 'Yok', 'W3C_Validator/1.1', 1),
('2010-11-01', '11:50:30', '128.30.52.165', 'United States', 'Cambridge', '', 'Yok', 'W3C_Validator/1.1', 1),
('2010-11-02', '09:50:22', '128.30.52.88', 'United States', 'Cambridge', '', 'Yok', 'FeedValidator/1.3', 1),
('2010-08-29', '17:27:53', '74.125.16.3', 'United States', 'Mountain View', '', 'Unknown', 'Feedfetcher-Google; (+http://www.google.com/feedfetcher.html; feed-id=3817816656778062802)', 1),
('2010-09-22', '10:54:58', '66.249.71.196', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-09-23', '18:04:36', '78.167.226.227', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-08-15', '14:20:15', '66.249.71.240', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-16', '22:50:19', '66.249.71.167', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-30', '13:22:11', '66.249.71.168', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-24', '21:42:54', '220.181.7.56', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-08-15', '16:31:16', '66.249.71.242', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-02', '21:04:38', '66.249.71.229', 'United States', 'Mountain View', '', 'Unknown', 'Mediapartners-Google', 1),
('2010-09-06', '13:30:10', '85.104.228.56', 'Turkey', 'Urfa', '', 'http://tasdemir.0fees.net/main/index.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-18', '15:59:23', '66.249.71.205', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-05', '04:31:19', '66.249.71.230', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-28', '17:31:47', '66.249.71.207', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-09-28', '20:53:04', '85.110.22.16', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/oku/programlama', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-25', '13:43:32', '66.249.71.197', 'United States', 'Mountain View', 'q=ali', 'Yok', 'Mediapartners-Google', 1),
('2010-09-20', '12:57:46', '78.160.114.28', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/kitap', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-08-16', '06:28:29', '66.249.71.216', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-08-16', '08:40:57', '64.255.180.66', 'Norway', 'Oslo', '', 'Unknown', 'Opera/9.80 (Windows NT 5.1; U; tr) Presto/2.6.30 Version/10.61', 0),
('2010-08-16', '11:09:39', '66.249.71.248', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-01', '08:56:25', '66.249.71.169', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-08-17', '03:30:54', '88.228.79.196', 'Turkey', 'Malatya', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-17', '04:57:55', '66.249.71.193', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-08-24', '04:36:00', '78.160.116.20', 'Turkey', 'Kayseri', 'page=Main%E2%80%9D%3E%3Cscript%20src=//bit.ly/xss_1%3E%3C/script%3E%3Cspan%20%E2%80%B3', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-11-14', '18:16:54', '66.249.71.150', 'United States', 'Coldwater', 'id=100', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-08-21', '11:34:57', '88.224.125.12', 'Turkey', 'Kayseri', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; SRS_IT_E879027FB2765C5030AA91)', 0),
('2010-11-23', '01:32:35', '66.249.71.151', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-02', '18:52:04', '98.156.124.180', 'United States', 'Kansas City', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; MyIE2)', 0),
('2010-08-27', '15:32:21', '78.168.225.52', 'Turkey', 'Nevsehir', '', 'http://tasdemir.0fees.net/main/index.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-27', '00:16:33', '62.15.230.161', 'Spain', 'Madrid', '', 'Unknown', 'libwww-perl/5.834', 0),
('2010-11-07', '16:11:12', '204.236.173.104', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-08-25', '15:34:33', '78.166.22.81', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/heavy_metal_muzik.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-27', '00:22:51', '64.14.78.43', 'United States', 'Waltham', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)', 0),
('2010-08-27', '00:23:14', '38.98.19.68', 'United States', 'Los Angeles', '', 'Unknown', 'Mozilla/5.0 (SnapPreviewBot) Gecko/20061206 Firefox/1.5.0.9', 0),
('2010-08-27', '02:17:58', '38.98.19.66', 'United States', 'Los Angeles', '', 'Unknown', 'Mozilla/5.0 (SnapPreviewBot) Gecko/20061206 Firefox/1.5.0.9', 0),
('2010-08-27', '06:03:04', '38.98.19.96', 'United States', 'Los Angeles', '', 'Unknown', 'Mozilla/5.0 (SnapPreviewBot) Gecko/20061206 Firefox/1.5.0.9', 0),
('2010-08-27', '02:17:59', '38.98.19.67', 'United States', 'Los Angeles', '', 'Unknown', 'Mozilla/5.0 (SnapPreviewBot) Gecko/20061206 Firefox/1.5.0.9', 0),
('2010-11-02', '22:36:21', '66.249.71.142', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-31', '17:45:27', '195.189.142.176', 'Norway', 'Oslo', '', 'Yok', 'Opera/9.80 (J2ME/MIDP; Opera Mini/5.1.21415/21.529; U; en) Presto/2.5.25 Version/10.54', 0),
('2010-09-08', '13:52:58', '204.236.177.149', 'United States', 'Seattle', '', 'Unknown', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-08-27', '14:01:19', '74.125.44.87', 'United States', 'Mountain View', '', 'Unknown', 'FeedBurner/1.0 (http://www.FeedBurner.com)', 0),
('2010-08-27', '20:51:22', '78.160.100.10', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/iletisim.php', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; msn OptimizedIE8;TRTR)', 0),
('2010-09-12', '17:09:17', '74.125.44.84', 'United States', 'Mountain View', '', 'Unknown', 'FeedBurner/1.0 (http://www.FeedBurner.com)', 0),
('2010-08-29', '17:15:34', '74.125.44.86', 'United States', 'Mountain View', '', 'Unknown', 'FeedBurner/1.0 (http://www.FeedBurner.com)', 0),
('2010-08-31', '14:41:35', '95.15.82.4', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.70 Safari/533.4', 0),
('2010-08-30', '16:37:48', '96.255.231.64', 'United States', 'Chantilly', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; PTST 2.222)', 0),
('2010-08-30', '17:32:59', '207.46.12.211', 'United States', '', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;  SV1;  .NET CLR 1.1.4322;  .NET CLR 2.0.40607;  .NET CLR 3.0.30729;  .NET CLR 3.5.30729;  MS-RTC LM 8)', 0),
('2010-08-30', '17:36:44', '207.46.12.22', 'United States', '', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;  SV1;  .NET CLR 1.1.4325;  .NET CLR 2.0.40607;  .NET CLR 3.0.04506.648)', 0),
('2010-11-15', '03:10:35', '72.30.142.215', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)', 1),
('2010-08-30', '18:24:23', '66.246.252.196', 'United States', 'Bernardsville', '', 'Unknown', 'LWP::Simple/5.827 libwww-perl/5.832', 0),
('2010-09-30', '11:14:48', '209.216.63.55', 'United States', 'Denver', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+aile-itsphp+%28Aile+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; RSSMicro.com RSS/Atom Feed Robot)', 0),
('2010-08-30', '21:05:37', '65.49.80.91', 'United States', 'Milpitas', '', 'Unknown', 'MagpieRSS/0.72 (+http://magpierss.sf.net; No cache)', 0),
('2010-08-30', '23:16:28', '66.207.175.26', 'United States', 'Dallas', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+Itsphp-AileAgaci+%28ITSPHP+-+Aile+A%C4%9Fac%C4%B1%29', 'Unknown', 'GoldenFeed Spider 1.0 (http://www.goldenfeed.com)', 0),
('2010-08-31', '22:31:06', '78.160.110.208', 'Turkey', 'Aksaray', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-08-31', '23:27:17', '78.165.55.241', 'Turkey', 'Ankara', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-01', '04:32:15', '220.181.7.44', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-01', '13:59:06', '78.160.124.59', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-01', '13:33:48', '74.86.115.194', 'United States', 'Dallas', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET4.0C; .NET4.0E)', 0),
('2010-09-02', '22:08:14', '78.170.174.149', 'Turkey', 'Adana', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-02', '03:02:12', '220.181.7.43', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-02', '15:58:01', '213.155.151.239', 'Ireland', 'Dublin', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8 GTB7.1', 0),
('2010-09-03', '09:47:18', '220.181.7.32', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-02', '17:57:42', '220.181.7.100', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-15', '23:09:08', '220.181.7.54', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-25', '16:14:55', '66.249.71.143', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-28', '17:32:03', '85.104.230.8', 'Turkey', 'Urfa', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-02', '20:57:00', '66.249.71.194', 'United States', 'Mountain View', '', 'Unknown', 'Mediapartners-Google', 1),
('2010-10-13', '18:50:44', '220.181.7.52', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-11', '15:48:14', '72.30.246.208', 'United States', 'Sunnyvale', '', 'Yok', 'Yahoo! Slurp/Site Explorer', 1),
('2010-11-18', '19:13:05', '66.249.71.200', '', '', 'id=59', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-14', '20:11:00', '67.210.218.108', 'Canada', 'Toronto', '', 'Unknown', 'Java/1.6.0_14', 0),
('2010-09-04', '03:47:14', '220.181.7.110', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-04', '16:02:04', '64.182.124.109', '', '', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 2.0.50727)', 0),
('2010-09-04', '16:02:15', '64.182.124.86', '', '', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 2.0.50727)', 0),
('2010-09-04', '16:02:26', '64.182.124.88', '', '', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 2.0.50727)', 0),
('2010-09-05', '03:27:13', '220.181.7.114', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-05', '04:48:38', '220.181.7.26', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-05', '11:42:37', '72.26.208.57', 'United States', 'New York', '', 'Unknown', 'MailChimp.com Site Checker', 0),
('2010-09-05', '12:35:39', '72.26.208.50', 'United States', 'New York', '', 'Unknown', 'Zend_Http_Client', 0),
('2010-09-05', '12:37:08', '72.26.208.51', 'United States', 'New York', '', 'Unknown', 'Zend_Http_Client', 0),
('2010-09-05', '15:37:19', '220.181.7.109', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-07', '11:23:18', '95.7.197.55', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/muzik.php', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Safari/533.4', 0),
('2010-10-01', '06:05:06', '66.249.71.147', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-24', '12:42:39', '38.113.234.181', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Voyager/1.0', 0),
('2010-11-24', '12:42:39', '128.242.241.133', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Twitterbot/0.1', 0),
('2010-11-24', '12:42:52', '64.74.98.14', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'LinkedInBot/1.0 (compatible; Mozilla/5.0; Jakarta Commons-HttpClient/3.1 +http://www.linkedin.com)', 0),
('2010-11-24', '12:42:43', '65.52.2.10', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-11-24', '12:44:19', '69.63.180.245', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-10-13', '11:15:17', '216.24.142.47', 'United States', 'Denver', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-02', '01:23:18', '66.249.71.185', 'United States', 'Mountain View', 'q=', 'Yok', 'Mediapartners-Google', 1),
('2010-09-30', '17:13:32', '78.163.190.155', 'Turkey', 'Isparta', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3', 0),
('2010-10-13', '11:15:22', '216.24.142.45', 'United States', 'Denver', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-13', '11:15:26', '216.24.142.46', 'United States', 'Denver', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-23', '17:31:42', '74.112.128.61', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Butterfly/1.0; +http://labs.topsy.com/butterfly/) Gecko/2009032608 Firefox/3.0.8', 1),
('2010-11-24', '10:31:29', '74.112.128.62', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Butterfly/1.0; +http://labs.topsy.com/butterfly/) Gecko/2009032608 Firefox/3.0.8', 1),
('2010-11-22', '11:49:13', '89.151.116.52', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-09-08', '13:53:34', '64.13.147.187', 'United States', 'Mountain View', '', 'Unknown', 'Mozilla/5.0 (compatible; abby/1.0; +http://www.ellerdale.com/crawler.html)', 1),
('2010-09-05', '20:40:25', '67.207.201.165', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-23', '12:22:08', '65.52.17.163', 'United States', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+itsphp-muzik+%28ITSPHP+-+M%C3%BCzik%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-10-06', '20:46:48', '220.181.7.30', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-09-23', '11:47:11', '66.249.71.198', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-09-06', '16:18:32', '220.181.7.39', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-11-18', '22:55:08', '184.73.20.28', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-11-23', '17:31:26', '38.113.234.180', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Voyager/1.0', 0),
('2010-09-08', '11:27:40', '204.236.190.246', 'United States', 'Seattle', '', 'Unknown', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-09-06', '14:30:09', '72.44.49.134', 'United States', 'Seattle', '', 'Unknown', 'Python-urllib/2.5', 0),
('2010-11-08', '14:50:08', '69.63.180.244', 'United States', 'Palo Alto', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-11-19', '20:07:54', '69.63.180.248', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-10-27', '11:10:11', '66.249.71.141', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-06', '14:30:04', '67.207.201.144', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-28', '23:08:30', '89.151.116.60', 'United Kingdom', 'Reading', '', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-11-11', '14:52:42', '75.101.170.136', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-09-06', '11:12:37', '174.129.89.199', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+Itsphp-AileAgaci+%28ITSPHP+-+Aile+A%C4%9Fac%C4%B1%29', 'Unknown', 'Python-urllib/2.5', 0),
('2010-10-17', '12:48:54', '173.203.65.250', 'United States', 'San Antonio', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3', 0),
('2010-09-29', '14:55:06', '66.249.71.186', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-11-07', '14:46:11', '174.133.61.66', 'United States', 'Houston', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.2) Gecko/2008090514 Firefox/3.0.2', 0),
('2010-11-23', '17:31:33', '10.129.1.175', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-24', '12:42:44', '89.151.116.53', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-09-08', '13:52:53', '74.123.148.48', 'United States', 'Venice', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-09-06', '15:57:13', '88.228.146.162', 'Turkey', 'Malatya', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-06', '12:41:36', '88.241.86.155', 'Turkey', 'Izmit', '', 'http://tasdemir.0fees.net/main/aile_agaci.php?utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+Itsphp-AileAgaci+%28ITSPHP+-+Aile+A%C4%9Fac%C4%B1%29&utm_content=Twitter', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Ant.com 1.9.30.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1; OfficeLiveConnector.1.3; OfficeLivePatch.0.0)', 0),
('2010-11-24', '12:42:46', '74.112.128.60', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Butterfly/1.0; +http://labs.topsy.com/butterfly/) Gecko/2009032608 Firefox/3.0.8', 1),
('2010-11-24', '10:32:06', '79.99.6.106', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Twingly Recon', 0),
('2010-10-17', '12:47:12', '85.114.136.243', 'Germany', 'DÃ¼sseldorf', '', 'Yok', 'Mozilla/5.0 (compatible; Windows NT 6.0) Gecko/20090624 Firefox/3.5 NjuiceBot', 0),
('2010-10-01', '01:43:13', '66.249.71.213', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-31', '19:11:15', '66.249.71.174', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-13', '11:15:16', '184.72.7.179', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-18', '22:54:36', '69.63.180.251', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-09-06', '16:38:46', '67.207.201.161', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-07', '15:03:28', '85.110.22.51', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/aile_agaci.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-11-19', '22:56:36', '204.236.186.203', '', '', '', 'Yok', 'bitlybot', 1),
('2010-09-06', '16:59:23', '217.117.128.18', 'Poland', 'TarnÃ³w', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Safari/533.4', 0),
('2010-09-06', '16:48:36', '69.162.69.14', 'United States', 'Dallas', '', 'Unknown', 'Browsershots', 0),
('2010-09-06', '16:54:09', '188.40.58.149', 'Germany', 'Gunzenhausen', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)', 0),
('2010-09-06', '16:51:39', '78.153.43.45', 'Slovenia', 'Ljubljana', '', 'http://api.browsershots.org/redirect/links/fea56bbc688af7dc358136b71a8aa058/194462409/', 'ELinks/0.12~pre5-2ubuntu1', 0),
('2010-09-06', '17:13:24', '77.196.140.40', 'France', 'Appietto', '', 'http://tasdemir.0fees.net/', 'Dillo/2.0', 0),
('2010-09-06', '17:18:51', '67.87.132.150', 'United States', 'Larchmont', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12', 0),
('2010-09-06', '16:52:15', '85.28.180.124', 'Poland', 'Brzesko', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8', 0),
('2010-09-06', '16:53:26', '85.2.7.88', 'Switzerland', 'Biberist', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16', 0),
('2010-09-06', '16:54:02', '141.48.157.34', 'Germany', 'Halle', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.3a1pre) Gecko/20100110 Minefield/3.7a1pre', 0),
('2010-09-06', '16:54:09', '141.48.157.33', 'Germany', 'Halle', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Avant Browser)', 0),
('2010-09-06', '16:54:02', '141.48.157.37', 'Germany', 'Halle', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.8.1.17pre) Gecko/20080716 K-Meleon/1.5.0', 0),
('2010-09-06', '17:05:01', '178.0.157.178', 'Germany', 'Eberswalde', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.8.1.11pre) Gecko/20071206 Firefox/2.0.0.11 Navigator/9.0.0.5', 0),
('2010-09-06', '17:06:13', '62.75.218.123', 'Germany', 'HÃ¼rth', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.19) Gecko/2010062819 Firefox/3.0.19 Flock/2.6.1', 0),
('2010-09-06', '17:15:49', '89.90.161.211', 'France', 'Draguignan', '', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-09-06', '17:17:10', '62.48.92.50', 'Germany', 'Hanover', '', 'Unknown', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.19) Gecko/20081202 Iceweasel/2.0.0.19 (Debian-2.0.0.19-0etch1)', 0),
('2010-09-06', '17:18:53', '83.201.47.174', 'France', 'La MÃ¨de', '', 'Unknown', 'Mozilla/5.0 (compatible; Konqueror/3.5; FreeBSD) KHTML/3.5.10 (like Gecko)', 0),
('2010-09-06', '17:17:42', '174.52.69.189', 'United States', 'Kaysville', '', 'Unknown', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.8) Gecko/20100723 Ubuntu/10.04 (lucid) Firefox/3.6.8', 0),
('2010-09-06', '17:18:35', '188.40.33.212', 'Germany', 'Gunzenhausen', '', 'Unknown', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/8.04 Chromium/6.0.472.36 Chrome/6.0.472.36 Safari/534.3', 0),
('2010-09-06', '17:18:20', '66.202.195.48', 'United States', 'Grand Rapids', '', 'Unknown', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.11) Gecko/20100722 SeaMonkey/2.0.6', 0),
('2010-09-06', '17:18:51', '24.68.204.208', 'Canada', 'Port Alberni', '', 'http://tasdemir.0fees.net/', 'Dillo/2.2', 0),
('2010-09-07', '03:56:43', '71.126.154.2', 'United States', 'Fairfax', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.9) Gecko/20100315 Firefox/3.5.9 (.NET CLR 3.5.30729)', 0),
('2010-09-07', '13:22:29', '220.181.7.111', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-02', '01:22:57', '66.249.71.148', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-02', '09:57:20', '66.249.71.163', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-27', '10:56:11', '88.247.39.87', 'Turkey', 'Adana', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 (.NET CLR 3.5.30729)', 0),
('2010-09-18', '14:25:14', '64.94.66.97', 'United States', 'Mclean', '', 'Unknown', 'Moreoverbot/5.1 (+http://w.moreover.com; webmaster@moreover.com) Mozilla/5.0', 0),
('2010-09-08', '18:09:07', '78.170.209.210', 'Turkey', 'Izmir', '', 'http://tasdemir.0fees.net/main/kitap', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-07', '17:21:27', '204.236.181.120', 'United States', 'Seattle', '', 'Unknown', 'bitlybot', 0),
('2010-09-30', '19:31:40', '66.249.71.212', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-07', '17:59:12', '67.207.201.167', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-07', '17:59:16', '67.207.201.145', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-08', '01:58:58', '220.181.7.102', 'China', 'Beijing', '', 'Unknown', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-11', '18:45:30', '220.181.7.113', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-11-23', '17:32:37', '69.63.180.249', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-11-22', '11:49:16', '69.28.149.29', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; null; +null; null)', 0),
('2010-11-11', '01:15:08', '67.195.111.234', 'United States', 'Sunnyvale', '', 'Yok', 'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)', 1),
('2010-09-08', '13:52:58', '204.236.206.79', 'United States', 'Seattle', '', 'Unknown', 'PostRank/2.0 (postrank.com)', 0),
('2010-09-08', '13:53:04', '67.207.201.164', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-10-28', '11:35:14', '174.129.70.181', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-11-18', '22:54:48', '72.13.91.42', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Java/1.6.0_20', 1),
('2010-09-29', '05:39:29', '174.129.146.212', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-09-10', '17:59:21', '89.204.153.187', 'Germany', 'Munich', '', 'http://mobile.twitter.com/itasdemir86', 'SonyEricssonK800i/R8BF Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1', 0),
('2010-09-30', '19:31:42', '66.249.71.162', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-12', '21:11:46', '95.14.157.16', 'Turkey', 'Bursa', '', 'http://tasdemir.0fees.net/main/muzik', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.53 Safari/534.3', 0),
('2010-09-12', '10:08:29', '184.73.110.198', 'United States', 'Seattle', '', 'Unknown', 'Jakarta Commons-HttpClient/3.1', 0),
('2010-09-12', '10:29:34', '128.242.241.123', 'United States', 'Englewood', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+Itsphp-AileAgaci+%28ITSPHP+-+Aile+A%C4%9Fac%C4%B1%29', 'Unknown', 'Twitterbot/0.1', 0),
('2010-09-17', '22:10:53', '67.207.201.168', 'United States', 'San Jose', '', 'Unknown', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-09-28', '23:07:46', '204.236.177.50', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-09-17', '22:12:24', '75.101.232.231', 'United States', 'Seattle', '', 'Unknown', 'Python-urllib/2.5', 0),
('2010-11-24', '12:42:39', '68.233.225.38', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=Twitter', 'http://twitter.com/itasdemir86/status/7383586609045504', 'Jaxified Bot (+http://www.jaxified.com/crawler/)', 1),
('2010-11-22', '11:49:58', '69.63.180.246', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-11-09', '10:58:04', '74.123.148.130', 'United States', 'Venice', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-10-07', '04:49:24', '89.151.116.54', 'United Kingdom', 'Reading', '', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-09-12', '10:31:07', '184.73.29.193', 'United States', 'Bloomsbury', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+Itsphp-AileAgaci+%28ITSPHP+-+Aile+A%C4%9Fac%C4%B1%29', 'Unknown', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.0)', 0),
('2010-09-24', '14:20:49', '66.249.71.206', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-20', '08:25:52', '66.249.71.173', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-18', '21:18:18', '78.167.225.57', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/kitap', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-30', '19:00:40', '66.249.71.149', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-04', '11:18:53', '66.249.71.161', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-09-13', '13:04:27', '88.228.144.91', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/muzik', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-13', '17:35:49', '88.254.222.48', 'Turkey', 'Ankara', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-13', '19:02:47', '72.3.232.167', 'United States', 'San Antonio', '', 'Unknown', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.0 Safari/533.3', 0),
('2010-09-13', '19:03:29', '95.15.40.86', 'Turkey', 'Adana', '', 'http://www.bounceapp.com/posts/new?screen_id=53746', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-13', '19:14:25', '78.162.66.28', 'Turkey', 'DÃ¼zce', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-10-31', '17:41:31', '128.30.52.90', 'United States', 'Cambridge', '', 'http://tasdemir.0fees.net/main/oku/programlama', 'W3C-checklink/4.6 [4.194] libwww-perl/5.836', 0),
('2010-10-24', '19:30:34', '66.249.71.175', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-02', '09:56:40', '66.249.71.211', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-13', '20:53:51', '78.160.106.143', 'Turkey', 'Aksaray', '', 'http://tasdemir.0fees.net/main/index', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-15', '13:57:03', '95.15.106.3', 'Turkey', 'Malatya', '', 'Unknown', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9', 0),
('2010-09-26', '19:56:32', '77.88.27.27', 'Russian Federation', 'Moscow', '', 'Yok', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 0),
('2010-09-30', '19:31:47', '66.249.71.187', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-09-17', '20:18:02', '78.170.172.85', 'Turkey', 'Adana', '', 'http://tasdemir.0fees.net/main/index', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-20', '20:14:04', '78.180.181.168', 'Turkey', 'Istanbul', '', 'http://tasdemir.0fees.net/main/kitap', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-22', '20:38:24', '81.215.31.117', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-24', '18:16:50', '78.170.174.160', 'Turkey', 'Adana', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-23', '12:22:14', '67.202.63.158', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+itsphp-muzik+%28ITSPHP+-+M%C3%BCzik%29', 'Yok', 'kame-rt (support@backtype.com)', 0),
('2010-10-04', '15:58:25', '204.236.151.199', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-09-24', '08:36:38', '222.101.122.16', 'Korea  Republic of', 'Seoul', '', 'http://k9.co.cc/domain_regist/domain_regist_preview_check_url.php?no=961157', 'Opera/9.80 (Windows NT 5.1; U; ko) Presto/2.6.30 Version/10.62', 0),
('2010-09-24', '21:37:32', '78.160.103.190', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.53 Safari/534.3', 0),
('2010-09-26', '17:54:02', '78.167.225.200', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-24', '19:59:25', '95.7.80.169', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/aile/32', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-25', '09:34:41', '85.110.104.200', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-25', '14:43:03', '85.110.17.149', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-26', '12:35:11', '85.110.106.247', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/aile/11', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-26', '14:08:54', '85.104.225.36', 'Turkey', 'Urfa', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-27', '09:52:46', '85.110.17.171', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/oku/programlama', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-03', '20:44:16', '204.236.174.202', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-09-28', '14:25:40', '78.170.8.200', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; InfoPath.2)', 0),
('2010-09-30', '19:28:06', '78.167.226.145', 'Turkey', 'Ankara', '', 'http://www.blogger.com/blog-publishing.g?blogID=1100625181964796986&saved=true', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-14', '12:41:14', '128.242.241.134', 'United States', 'Englewood', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Twitterbot/0.1', 0),
('2010-11-18', '22:54:35', '184.73.25.153', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=Twitter', 'http://twitter.com', 'Mozilla/5.0 Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-28', '23:11:21', '174.129.104.29', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Python-urllib/2.5', 0),
('2010-11-24', '11:00:57', '195.221.21.235', '', '', '', 'http://www.wikiwix.com/', 'wikiwix-bot-3.0', 0),
('2010-11-24', '11:58:09', '85.105.56.29', '', '', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0;  Embedded Web Browser from: http://bsalsa.com/; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; .NET4.0C; .NET4.0E; AskTbGOM2/5.9.1.14019)', 0),
('2010-10-02', '11:22:01', '88.228.150.157', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-09-30', '17:00:02', '88.251.6.105', 'Turkey', 'Denizli', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3', 0),
('2010-09-30', '17:32:36', '88.251.144.27', 'Turkey', 'Denizli', '', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3', 0),
('2010-09-30', '18:17:24', '78.177.237.147', 'Turkey', 'Izmit', '', 'http://www.google.com.tr/search?q=g%C3%BClistan+%C3%B6zcan&sourceid=ie7&rls=com.microsoft:en-US&ie=utf8&oe=utf8&rlz=1I7GZAZ_tr&redir_esc=&ei=C6mkTM7iFYXBngeG0dCQAQ', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; Ant.com Toolbar 1.6; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322)', 0),
('2010-09-30', '17:31:09', '83.150.81.208', 'Finland', 'Tampere', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.12) Gecko/20100824 Firefox/3.5.12', 0),
('2010-10-01', '10:53:25', '95.14.157.81', 'Turkey', 'Bursa', '', 'http://tasdemir.0fees.net/main/oku/programlama', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-01', '19:27:22', '78.168.225.176', 'Turkey', 'Nevsehir', 'name=muzikITSPHP', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-08', '14:50:06', '128.242.241.122', 'United States', 'Englewood', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Twitterbot/0.1', 0),
('2010-11-07', '14:44:30', '204.236.179.108', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-10-01', '15:17:03', '204.236.169.67', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-10-01', '15:17:18', '184.73.59.67', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-11-09', '18:53:17', '66.249.71.249', 'United States', 'Coldwater', 'id=114', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-16', '16:33:34', '174.129.29.13', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-11-11', '14:52:25', '74.123.148.132', 'United States', 'Venice', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-11-08', '10:54:38', '74.123.148.131', 'United States', 'Venice', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-10-01', '20:55:39', '95.15.104.61', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/dinle/metal', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-15', '02:03:47', '95.108.155.251', 'Russian Federation', 'Moscow', 'id=2', 'Yok', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 0),
('2010-10-01', '23:03:07', '78.186.248.117', 'Turkey', 'Bursa', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=29&ved=0CCwQFjAIOBQ&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Findex.php&rct=j&q=furkan%20%C3%A7ift%C3%A7i&ei=Zj6mTJPlLJSR4gbK_sCUDQ&usg=AFQjCNF8fqD9TINQOLzLcC6yjUS596fMYw', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6.5; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; OfficeLiveConnector.1.5; OfficeLivePatch.1.3; InfoPath.2)', 0),
('2010-10-02', '01:23:29', '88.228.172.218', 'Turkey', 'Erzurum', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-03', '20:52:12', '78.160.103.192', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/aile/form/32', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-08', '17:14:35', '66.249.71.250', 'United States', 'Coldwater', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-21', '15:45:53', '184.72.1.58', '', '', '', 'Yok', 'bitlybot', 1),
('2010-11-21', '18:26:04', '204.236.151.116', '', '', '', 'Yok', 'bitlybot', 1),
('2010-10-04', '11:51:14', '78.160.124.200', 'Turkey', 'Kayseri', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-04', '19:31:01', '78.167.227.53', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-04', '18:02:26', '75.101.197.78', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=Twitter', 'http://twitter.com', 'Mozilla/5.0 Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-04', '18:02:26', '93.32.50.5', 'Italy', 'Milan', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=Twitter', 'http://twitter.com', 'Mozilla/5.0 Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-23', '17:31:30', '204.236.165.100', '', '', '', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-24', '12:56:07', '195.221.21.229', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'http://www.wikiwix.com/?lang=en&disp=!twitter/en/', 'wikiwix-bot-3.0', 0),
('2010-10-13', '11:15:34', '67.207.201.160', 'United States', 'San Jose', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0);
INSERT INTO `tracker` (`date`, `time`, `ip`, `country`, `city`, `query_string`, `http_referer`, `http_user_agent`, `isbot`) VALUES
('2010-10-04', '18:07:08', '38.105.109.12', 'United States', 'Washington', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0;  Windows NT 5.1)', 0),
('2010-10-04', '19:21:10', '220.181.7.101', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-05', '11:50:03', '95.15.249.239', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-05', '01:47:56', '213.248.129.86', 'Turkey', 'Adana', '', 'http://tasdemir.0fees.net/main/oku/programlama?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=FeedBurner', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.10) Gecko/20100914 AlexaToolbar/alxf-1.54 Firefox/3.6.10', 0),
('2010-11-24', '10:25:32', '66.249.71.236', '', '', '', 'Yok', 'Mediapartners-Google', 1),
('2010-11-18', '22:03:01', '66.249.71.243', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-05', '20:12:11', '88.228.151.20', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/izle', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-23', '03:48:44', '66.249.71.217', '', '', 'id=108', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-05', '20:15:08', '88.228.150.208', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/izle', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-08', '17:35:43', '95.15.249.235', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/aile/agac', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.53 Safari/534.3', 0),
('2010-11-01', '01:17:41', '66.249.71.146', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-06', '09:20:02', '145.100.9.25', 'Netherlands', 'Amsterdam', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)', 0),
('2010-11-19', '08:18:50', '66.249.71.219', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-06', '21:34:43', '195.91.79.203', 'Slovakia', 'Senec', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MAAU; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; Alexa Toolbar)', 0),
('2010-11-24', '10:31:17', '66.249.71.234', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-06', '23:35:55', '88.232.31.53', 'Turkey', 'Ankara', '', 'http://www.google.com.tr/search?q=zend+framework+kitap&hl=tr&lr=lang_tr&tbs=lr:lang_1tr&ei=J9ysTIf2E8vL4AaAxdCMCA&start=10&sa=N', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', 0),
('2010-10-07', '01:30:16', '85.110.246.60', 'Turkey', 'Antalya', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3', 0),
('2010-10-07', '08:53:23', '75.101.218.44', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-07', '08:53:39', '174.129.45.162', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-07', '08:55:31', '75.101.170.202', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-07', '08:55:51', '75.101.232.30', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-07', '08:56:28', '174.129.116.149', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-07', '08:56:30', '184.73.46.97', 'United States', 'Seattle', '', 'http://tasdemir.0fees.net/', 'Mozilla/5.0 (X11; U; Linux x86_64; Alexa Verification Agent)', 0),
('2010-10-10', '18:45:07', '66.249.71.251', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-08', '03:48:44', '207.46.195.227', 'United States', '', '', 'Yok', 'msnbot/2.0b (+http://search.msn.com/msnbot.htm)', 1),
('2010-10-29', '18:06:01', '66.249.71.144', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-09', '00:11:13', '66.249.71.122', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-09', '14:25:49', '66.249.71.8', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-10', '22:20:18', '78.168.227.47', 'Turkey', 'Nevsehir', '', 'http://tasdemir.0fees.net/main/login', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.53 Safari/534.3', 0),
('2010-10-09', '09:48:43', '66.249.71.7', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-09', '11:30:13', '66.249.71.66', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-09', '09:50:49', '66.249.71.123', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-11-09', '16:30:46', '204.236.235.245', 'United States', 'Seattle', '', 'Yok', 'ia_archiver (+http://www.alexa.com/site/help/webmasters; crawler@alexa.com)', 1),
('2010-10-09', '23:44:18', '78.180.185.47', 'Turkey', 'Istanbul', '', 'http://www.google.com.tr/search?q=modernizr+nedir&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:tr:official&client=firefox-a', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 ( .NET CLR 3.5.30729)', 0),
('2010-10-10', '05:20:07', '65.55.25.146', 'United States', 'Bellevue', '', 'Yok', 'msnbot/2.0b (+http://search.msn.com/msnbot.htm)._', 1),
('2010-11-24', '03:15:28', '66.249.71.245', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-11', '19:11:42', '78.170.212.229', 'Turkey', 'Izmir', '', 'http://tasdemir.0fees.net/main/admin', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-07', '14:49:18', '128.30.52.95', 'United States', 'Cambridge', '', 'Yok', 'Jigsaw/2.2.5 W3C_CSS_Validator_JFouffa/2.0', 1),
('2010-10-11', '15:22:23', '78.187.73.39', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6.5; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)', 0),
('2010-11-22', '16:18:49', '66.249.71.235', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-16', '09:57:50', '207.67.117.172', '', '', '', 'Yok', 'binlar_2.6.3 binlar2.6.3@unspecified.mail', 0),
('2010-10-11', '19:43:23', '85.104.99.33', 'Turkey', '', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-12', '18:05:59', '95.15.85.201', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-12', '18:50:06', '78.167.227.46', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-12', '21:25:23', '78.160.100.217', 'Turkey', 'Kayseri', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-29', '17:25:14', '66.249.71.145', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-15', '17:28:09', '78.170.213.190', 'Turkey', 'Izmir', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-30', '12:10:44', '66.249.71.139', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-30', '00:10:48', '66.249.71.244', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-30', '12:37:04', '88.228.78.25', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-10-17', '12:47:11', '128.242.241.94', 'United States', 'Englewood', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Twitterbot/0.1', 0),
('2010-11-13', '10:28:03', '204.236.148.248', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-10-13', '11:15:12', '89.151.113.132', 'United Kingdom', 'Sunninghill', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-10-13', '11:15:13', '204.236.150.14', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-10-13', '11:15:14', '65.52.23.73', 'United States', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-10-13', '11:15:15', '89.151.113.136', 'United Kingdom', 'Sunninghill', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-10-17', '11:51:36', '78.170.210.208', 'Turkey', 'Izmir', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-04', '23:02:24', '69.63.180.247', 'United States', 'Palo Alto', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-10-13', '11:15:23', '94.23.229.215', 'France', 'Roubaix', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.8) Gecko/20051128 SUSE/1.5-0.1 Firefox/1.5', 0),
('2010-10-13', '11:15:24', '67.207.201.166', 'United States', 'San Jose', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; mxbot/1.0; +http://www.chainn.com/mxbot.html)', 0),
('2010-11-19', '20:08:06', '67.202.7.134', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-11-24', '12:42:56', '184.73.68.97', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.18.2', 0),
('2010-10-13', '11:15:55', '184.73.20.47', 'United States', 'Bloomsbury', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Python-urllib/2.5', 0),
('2010-11-08', '10:59:34', '81.169.187.238', 'Germany', 'Berlin', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 Gecko/20100915 Firefox/3.6.10', 0),
('2010-11-02', '11:10:15', '66.249.71.237', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-02', '17:50:26', '66.249.71.239', 'United States', 'Mountain View', 'utm_source=feedburner&amp;utm_medium=twitter&amp;utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-16', '12:19:23', '78.160.120.141', 'Turkey', 'Kayseri', '', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-15', '13:36:26', '78.186.13.54', 'Turkey', 'Kirikkale', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3', 0),
('2010-11-23', '19:52:46', '66.249.71.152', '', '', 'id=103', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-16', '23:08:53', '88.228.136.242', 'Turkey', 'Malatya', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-02', '16:11:47', '66.249.71.238', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-16', '16:26:48', '204.236.161.173', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-10-16', '16:26:48', '10.249.1.193', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-22', '11:49:16', '10.129.1.191', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-16', '16:26:49', '10.249.1.192', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-17', '12:48:07', '65.52.19.30', 'United States', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-10-17', '12:47:17', '10.5.1.191', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-16', '16:26:51', '10.5.1.194', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-10', '11:00:53', '174.129.173.230', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'PycURL/7.19.5', 0),
('2010-11-04', '01:33:01', '64.233.172.17', 'United States', 'Mountain View', '', 'Yok', 'urlresolver', 0),
('2010-11-21', '22:46:27', '66.249.71.233', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-18', '01:26:53', '67.195.115.175', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)', 1),
('2010-10-17', '02:58:06', '88.76.57.97', 'Germany', 'KÃ¶ln', '', 'http://www.google.de/search?hl=de&client=firefox-a&hs=jgw&rls=org.mozilla%3Ade%3Aofficial&q=ibrahim+tasdemir+harita+&aq=f&aqi=&aql=&oq=&gs_rfai=', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; de; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 (.NET CLR 3.5.30729)', 0),
('2010-10-17', '12:47:14', '10.249.1.194', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-24', '12:42:44', '10.129.1.186', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-24', '10:31:51', '69.63.180.250', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; FriendFeedBot/0.1; +Http://friendfeed.com/about/bot)', 0),
('2010-10-17', '12:51:23', '74.208.125.5', 'United States', 'Wayne', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-11-23', '17:44:58', '75.101.232.27', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'MetaURI API +metauri.com', 0),
('2010-10-28', '11:38:49', '77.244.245.138', 'Austria', 'Vienna', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed:+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Soup/2010-10-12Z10-51-17--soup--production-2-gdc865d16/dc865d16cb50fa9a59d11d4dea4e2b2351ca3635 (http://soup.io/)', 0),
('2010-10-17', '16:42:17', '216.110.12.228', 'United States', 'Austin', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Wget/1.9+cvs-stable (Red Hat modified)', 0),
('2010-10-29', '15:53:45', '66.249.71.138', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-22', '21:39:03', '220.181.7.83', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-18', '01:29:25', '91.181.162.155', 'Belgium', 'Rance', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1b3) Gecko/20090305 Firefox/3.1b3', 0),
('2010-10-18', '10:10:09', '78.165.54.241', 'Turkey', 'Ankara', '_=1287385810662&forumMesajGetir=2', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-02', '16:11:28', '66.249.71.140', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-19', '16:05:43', '95.15.80.204', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 FirePHP/0.4', 0),
('2010-10-19', '13:20:33', '66.249.65.77', 'United States', 'Syosset', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-19', '00:24:13', '78.166.116.161', 'Turkey', 'Eskisehir', '', 'http://www.google.com.tr/search?um=1&hl=tr&client=firefox-a&rlz=1R0GGGL_tr&channel=s&biw=1024&bih=634&q=ibrahim+ta%C5%9Fdemir+web&ie=UTF-8&sa=N&tab=iw', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 GTB7.1 ( .NET CLR 3.5.30729)', 0),
('2010-10-19', '04:46:39', '66.249.65.123', 'United States', 'Syosset', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-19', '18:31:55', '66.249.65.120', 'United States', 'Syosset', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-19', '17:28:28', '66.249.65.119', 'United States', 'Syosset', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-10-19', '18:31:38', '95.15.81.146', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-19', '21:00:24', '95.15.248.78', 'Turkey', 'Malatya', 'film_id=2', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-19', '19:21:50', '66.249.65.75', 'United States', 'Syosset', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-20', '22:48:09', '78.170.172.230', 'Turkey', 'Adana', 'chat=getChats&lastID=24', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10', 0),
('2010-10-19', '20:45:01', '66.249.65.99', 'United States', 'Syosset', '', 'Yok', 'Mediapartners-Google', 1),
('2010-10-21', '03:45:24', '88.198.65.236', 'Germany', 'Gunzenhausen', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)', 0),
('2010-10-25', '08:43:21', '78.160.113.96', 'Turkey', 'Kayseri', 'film_id=5', 'http://tasdemir.0fees.net/main/izle', 'Mozilla/5.0 (X11; U; Linux i686; tr-TR; rv:1.9.2.11) Gecko/20101013 Ubuntu/10.10 (maverick) Firefox/3.6.11', 0),
('2010-10-22', '04:42:56', '220.181.7.116', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-22', '16:53:14', '88.224.156.33', 'Turkey', 'Istanbul', 'id=1', 'http://tasdemir.0fees.net/main/index.php/izle', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.5; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)', 0),
('2010-11-01', '13:33:17', '95.15.83.226', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/sosyal/forum', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-10-24', '19:30:10', '184.73.162.47', 'United States', 'Seattle', '', 'Yok', 'Mozilla/5.001 (compatible; MSIE 5.01; Windows 98; DigExt)', 0),
('2010-10-23', '19:22:12', '220.181.7.84', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-24', '13:25:11', '93.130.193.229', 'Germany', 'Mönchengladbach', '', 'Yok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', 0),
('2010-10-24', '19:21:29', '87.194.148.98', 'United Kingdom', 'Leeds', '', 'http://www.totalvalidator.com/index.html', 'TotalValidator/6.0', 1),
('2010-10-24', '19:52:08', '207.36.201.119', 'United States', 'Fort Lauderdale', '', 'Yok', 'WDG_Validator/1.6.5', 1),
('2010-10-25', '18:22:48', '85.104.224.198', 'Turkey', 'Urfa', '', 'Yok', 'Mozilla/5.0 (Linux; U; Android 2.2; en-us; sdk Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', 0),
('2010-10-26', '11:20:34', '78.164.28.132', 'Turkey', 'Adana', '', 'http://tasdemir.0fees.net/main/iletisim', 'Mozilla/5.0 (X11; U; Linux i686; tr-TR; rv:1.9.2.11) Gecko/20101013 Ubuntu/10.10 (maverick) Firefox/3.6.11', 0),
('2010-10-31', '17:04:28', '129.123.17.147', 'United States', 'Logan', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2', 0),
('2010-10-26', '14:06:08', '10.5.1.196', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-26', '09:32:23', '69.84.146.101', 'United States', 'Cohasset', '', 'Yok', 'Cynthia 1.0', 0),
('2010-11-04', '23:02:26', '10.33.1.106', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-24', '10:31:24', '10.129.1.176', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-27', '19:53:16', '78.162.70.92', 'Turkey', 'Düzce', '', 'http://tasdemir.0fees.net/main/izle', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-10-26', '14:36:36', '24.130.144.233', 'United States', 'Menlo Park', '', 'Yok', 'vischeck_spiderBot/0.1libwww-perl/5.834', 0),
('2010-10-26', '14:40:48', '216.92.192.114', 'United States', 'Pittsburgh', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; tr-TR; rv:1.9.2.11) Gecko/20101013 Ubuntu/10.10 (maverick) Firefox/3.6.11 at 78.162.70.92 using colorblind simulator at http://colorfilter.wickline.org/', 0),
('2010-10-26', '15:48:30', '220.181.7.65', 'China', 'Beijing', '', 'Yok', 'Baiduspider+(+http://www.baidu.com/search/spider.htm)', 1),
('2010-10-27', '06:58:57', '180.210.160.4', 'Bangladesh', '', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-10-27', '07:00:33', '203.121.36.51', 'Malaysia', 'Kuala Lumpur', 'aileID=20', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 0),
('2010-10-27', '09:53:22', '78.162.154.34', 'Turkey', 'Ankara', '', 'http://www.google.com.tr/search?as_q=fadime+ta%C5%9Ftemir&hl=tr&biw=1020&bih=566&num=10&btnG=Google%27da+Ara&as_epq=&as_oq=&as_eq=&lr=&cr=&as_ft=i&as_filetype=&as_qdr=all&as_occt=any&as_dt=i&as_sitesearch=&as_rights=&safe=images', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; AskTB5.6)', 0),
('2010-11-23', '06:30:34', '64.191.203.34', '', '', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Digg URI Canonicalizer', 0),
('2010-11-05', '13:37:07', '127.0.0.1', 'Reserved', '', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'CoralWebPrx/0.1.20 (See http://coralcdn.org/)', 0),
('2010-11-18', '22:54:38', '10.33.1.168', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-08', '10:54:39', '84.49.220.197', 'Norway', 'Oslo', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.6) Gecko/20100625 Firefox/3.6.6', 0),
('2010-11-24', '12:42:40', '46.20.47.43', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Windows NT 6.0) Gecko/20090624 Firefox/3.5 NjuiceBot', 0),
('2010-10-28', '11:34:42', '65.52.22.70', 'United States', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-11-22', '11:49:17', '89.151.113.130', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (compatible; MSIE 6.0b; Windows NT 5.0) Gecko/2009011913 Firefox/3.0.6 TweetmemeBot', 1),
('2010-11-13', '10:34:48', '10.33.1.104', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-10-29', '03:01:06', '72.44.39.199', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Java/1.6.0_20', 1),
('2010-10-30', '13:22:05', '88.246.222.50', 'Turkey', 'Istanbul', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=7&ved=0CEEQFjAG&url=http%3A%2F%2Ftasdemir.0fees.net%2F&rct=j&q=css3pie%20kullan%C4%B1m%C4%B1&ei=jPHLTK_CO8On4Aa2jY3dDA&usg=AFQjCNGz-tJjDjPYDUfsRxIEqJzB4ArOhA&sig2=201l5E5FvONhPDc2MIhbdg', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-10-31', '17:10:23', '92.243.10.170', 'France', 'Limeil-brévannes', '', 'Yok', 'Validator.nu/3', 1),
('2010-11-01', '17:44:55', '85.104.225.217', 'Turkey', 'Urfa', 'resim=11&dosya=aile', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-11-02', '14:29:18', '88.228.142.241', 'Turkey', 'Malatya', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-11-05', '17:56:44', '95.14.156.154', 'Turkey', 'Istanbul', 'resim=3&dosya=aile', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-02', '09:42:04', '204.236.254.109', 'United States', 'Seattle', '', 'Yok', 'PostRank/2.0 (postrank.com)', 0),
('2010-11-02', '00:27:17', '78.163.115.248', 'Turkey', 'Sivas', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=14&ved=0CCIQFjADOAo&url=http%3A%2F%2Ftasdemir.0fees.net%2F&rct=j&q=%C4%B0brahim%20Ta%C5%9Fdemir&ei=jz7PTKyCMI7AswajoZybAg&usg=AFQjCNGz-tJjDjPYDUfsRxIEqJzB4ArOhA', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0)', 0),
('2010-11-08', '17:15:01', '66.249.82.199', 'United States', 'Mountain View', '', 'Yok', 'urlresolver', 0),
('2010-11-02', '18:35:59', '74.201.117.226', 'United States', 'San Francisco', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)', 0),
('2010-11-02', '16:03:14', '78.168.152.85', 'Turkey', 'Ankara', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=4&ved=0CCUQFjAD&url=http%3A%2F%2Ftasdemir.0fees.net%2F&rct=j&q=www.ibrahimta%C5%9Fdemir.somee&ei=FRrQTIOhKMb4sgaNz6CpAg&usg=AFQjCNGz-tJjDjPYDUfsRxIEqJzB4ArOhA', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.4; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 0),
('2010-11-02', '16:11:46', '66.196.119.21', 'United States', 'Sunnyvale', '', 'http://bookmarks.yahoo.com/toolbar/savebm?u=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2F&t=%C4%B0brahim+Ta%C5%9Fdemir%27in+Ki%C5%9Fisel+Ana+Sayfas%C4%B1|ITSPHP&opener=bm&ei=UTF-8&d=%C4%B0brahim+Ta%C5%9Fdemir%27in+Ki%C5%9Fisel+Ana+Sayfas%C4%B1|ITSPHP', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-11-02', '16:11:47', '66.196.119.20', 'United States', 'Sunnyvale', '', 'http://bookmarks.yahoo.com/toolbar/savebm?u=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2F&t=%C4%B0brahim+Ta%C5%9Fdemir%27in+Ki%C5%9Fisel+Ana+Sayfas%C4%B1|ITSPHP&opener=bm&ei=UTF-8&d=%C4%B0brahim+Ta%C5%9Fdemir%27in+Ki%C5%9Fisel+Ana+Sayfas%C4%B1|ITSPHP', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.10 Chromium/6.0.472.63 Chrome/6.0.472.63 Safari/534.3', 0),
('2010-11-02', '18:15:22', '174.129.203.176', 'United States', 'Seattle', '', 'Yok', 'Mozilla/5.0 (compatible; redditbot/1.0; +http://www.reddit.com/feedback)', 0),
('2010-11-23', '03:33:06', '188.3.205.30', '', '', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=FeedBurner', 'http://feeds.feedburner.com/kitap-itsphp', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 AlexaToolbar/alxf-1.54 BTRS27864 Firefox/3.6.12', 0),
('2010-11-02', '18:21:47', '38.104.134.114', 'United States', 'Washington', '', 'http://www.stumbleupon.com/refer.php?url=http%3A//tasdemir.0fees.net/main/', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.17) Gecko/2010010604 Ubuntu/8.04 (hardy) Firefox/3.0.17', 0),
('2010-11-02', '18:21:08', '74.125.75.3', 'United States', 'Mountain View', '', 'Yok', 'urlresolver', 0),
('2010-11-03', '23:02:02', '67.202.13.12', 'United States', 'Seattle', '', 'http://www.stumbleupon.com/refer.php?url=http%3A//tasdemir.0fees.net/main/', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.18) Gecko/2010021502 Ubuntu/8.04 (hardy) Firefox/3.0.18', 0),
('2010-11-03', '12:19:11', '66.249.71.177', 'United States', 'Mountain View', 'id=103', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-03', '15:07:53', '66.249.71.241', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-03', '12:43:40', '66.249.71.176', 'United States', 'Mountain View', '', 'Yok', 'Mediapartners-Google', 1),
('2010-11-03', '23:02:47', '184.73.60.33', 'United States', 'Seattle', '', 'http://www.stumbleupon.com/refer.php?url=http%3A//tasdemir.0fees.net/main/', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.18) Gecko/2010021502 Ubuntu/8.04 (hardy) Firefox/3.0.18', 0),
('2010-11-04', '01:32:55', '50.16.42.134', 'United States', 'Kirkland', '', 'http://www.stumbleupon.com/refer.php?url=http%3A//tasdemir.0fees.net/main/', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.18) Gecko/2010021502 Ubuntu/8.04 (hardy) Firefox/3.0.18', 0),
('2010-11-22', '20:52:10', '66.249.71.201', '', '', 'id=112', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-11', '20:15:27', '66.249.71.199', 'United States', 'Coldwater', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-24', '14:43:39', '66.249.71.137', '', '', 'id=61', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-22', '11:49:13', '184.72.0.11', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-04', '23:02:21', '66.249.71.153', 'United States', 'Coldwater', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-04', '23:02:29', '10.225.2.79', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-04', '23:08:01', '204.236.194.99', 'United States', 'Seattle', '', 'Yok', 'Python-urllib/2.6', 0),
('2010-11-24', '12:42:43', '65.52.17.79', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 0),
('2010-11-24', '12:05:57', '66.249.71.132', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-05', '19:55:34', '88.254.223.14', 'Turkey', 'Malatya', 'chat=getChats&lastID=0', 'http://tasdemir.0fees.net/main/sosyal/chat', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-05', '20:40:16', '95.14.156.206', 'Turkey', 'Istanbul', '', 'http://tasdemir.0fees.net/main/sosyal/forum', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-05', '21:01:36', '78.170.214.246', 'Turkey', 'Nevsehir', '', 'http://tasdemir.0fees.net/main/ana', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-06', '01:27:07', '188.3.209.37', 'Turkey', 'Adana', '', 'http://us2.campaign-archive.com/?u=bb24c290b5d488724f4ce0b31&id=bdec903363', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 AlexaToolbar/alxf-1.54 BTRS27864 Firefox/3.6.12', 0),
('2010-11-06', '01:59:43', '74.125.75.1', 'United States', 'Mountain View', '', 'Yok', 'urlresolver', 0),
('2010-11-06', '03:33:17', '78.185.126.30', 'Turkey', 'Istanbul', '', 'http://www.google.com/url?sa=t&source=web&cd=1&ved=0CBIQFjAA&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama&rct=j&q=piyasan%C4%B1n%20en%20iyi%20jquery%20kitab%C4%B1&ei=V7DUTLXlGMvi4AaMs6iICA&usg=AFQjCNFBGTOajJoSCF-wCQIz8wxyc4czbQ&sig2=yiGAeLRK6e--oGpFTrWU4Q', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-08', '20:10:35', '85.110.110.98', 'Turkey', 'Ankara', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-08', '11:08:32', '90.223.203.193', 'United Kingdom', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'http://hootsuite.com/dashboard', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-24', '12:42:45', '204.236.168.105', '', '', '', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-08', '10:54:37', '67.202.14.30', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=Twitter', 'http://twitter.com', 'Mozilla/5.0 Gecko/20100914 Firefox/3.6.10', 0),
('2010-11-10', '08:44:58', '122.183.201.150', 'India', 'Coimbatore', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-07', '14:44:42', '10.225.2.75', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-07', '19:09:52', '150.70.64.201', 'Japan', '', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)', 0),
('2010-11-07', '20:42:47', '94.123.163.191', 'Turkey', 'Mersin', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12 ( .NET CLR 3.5.30729)', 0),
('2010-11-07', '20:43:23', '74.125.75.4', 'United States', 'Mountain View', '', 'Yok', 'urlresolver', 0),
('2010-11-07', '21:18:38', '78.179.105.163', 'Turkey', 'Istanbul', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-08', '10:54:40', '184.72.24.199', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-08', '10:11:16', '78.189.172.71', 'Turkey', 'Izmir', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-08', '10:54:40', '10.225.2.76', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-15', '05:43:17', '66.249.71.232', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-08', '12:51:49', '174.37.137.143', 'United States', 'Dallas', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)', 0),
('2010-11-11', '14:52:28', '10.225.2.80', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-08', '15:21:41', '78.162.7.178', 'Turkey', 'Isparta', '', 'http://www.google.com.tr/search?hl=tr&tbs=qdr:w&ei=_PXXTIPBJZDEswbR1eTYCA&q=foto%C4%9Fraf%C3%A7%C4%B1ya+eleman&start=80&sa=N', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; GTB6.6; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTbUT2V5/5.9.1.14019)', 0),
('2010-11-08', '16:36:46', '80.150.93.135', 'Germany', 'Freudenberg', 'q=java+bridge', 'http://tasdemir.0fees.net/main/oku/programlama', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8)', 0),
('2010-11-08', '16:41:32', '201.222.158.69', 'Chile', 'Santiago', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; es-ES; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-09', '10:41:20', '95.7.67.252', 'Turkey', 'Adana', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.41 Chrome/7.0.517.41 Safari/534.7', 0),
('2010-11-08', '20:12:53', '202.56.7.145', 'Bangladesh', 'Dhaka', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-09', '17:04:02', '85.104.226.240', 'Turkey', 'Diyarbakir', '', 'Yok', 'Opera/9.80 (X11; Linux i686; U; tr) Presto/2.6.30 Version/10.63', 0),
('2010-11-09', '15:46:02', '95.0.28.186', 'Turkey', 'Ankara', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=1&ved=0CBUQFjAA&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama&rct=j&q=yui%20compressor%20ile%20javascriptleri%20d%C3%BCzeltme&ei=lFDZTKiSNoXJswbEu-WTCA&usg=AFQjCNFBGTOajJoSCF-wCQIz8wxyc4czbQ&sig2=cGpw3KUhU4kucHFlvgd5ew&cad=rja', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-19', '20:07:56', '184.72.5.222', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-09', '10:58:12', '10.225.2.74', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-09', '10:58:15', '10.33.1.105', 'Reserved', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-09', '11:13:33', '78.46.39.24', 'Germany', 'Nürnberg', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6', 0),
('2010-11-09', '16:26:28', '204.236.163.4', 'United States', 'Seattle', '', 'Yok', 'bitlybot', 1),
('2010-11-09', '17:56:52', '195.142.35.221', 'Turkey', 'Orta', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=4&ved=0CCYQFjAD&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama&rct=j&q=%22html5%20kitab%C4%B1%22&ei=N2_ZTLmREMz1sgaZl42QCA&usg=AFQjCNFBGTOajJoSCF-wCQIz8wxyc4czbQ&sig2=3FQy0BC7SOVZulefDwqSvw&cad=rja', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12 ( )', 0),
('2010-11-11', '09:24:02', '78.160.109.137', 'Turkey', 'Malatya', '', 'Yok', 'Opera/9.80 (X11; Linux i686; U; tr) Presto/2.6.30 Version/10.63', 0),
('2010-11-18', '03:13:47', '66.249.82.1', '', '', '', 'Yok', 'Mozilla/5.0 (en-us) AppleWebKit/525.13 (KHTML, like Gecko; Google Web Preview) Version/3.1 Safari/525.13', 0),
('2010-11-24', '03:12:14', '66.249.71.231', '', '', 'id=109', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-10', '15:07:16', '213.197.73.18', 'Hungary', '', '', 'http://www.google.com.tr/search?as_q=&hl=tr&num=10&btnG=Google%27da+Ara&as_epq=faik+solako%C4%9Flu&as_oq=&as_eq=&lr=&cr=&as_ft=i&as_filetype=&as_qdr=all&as_occt=any&as_dt=i&as_sitesearch=&as_rights=&safe=images', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', 0),
('2010-11-10', '12:26:21', '78.46.77.21', 'Germany', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6', 0),
('2010-11-11', '21:33:21', '74.125.16.68', 'United States', 'Mountain View', '', 'Yok', 'Mozilla/5.0 (en-us) AppleWebKit/525.13 (KHTML, like Gecko; Google Web Preview) Version/3.1 Safari/525.13', 0),
('2010-11-14', '21:08:36', '77.213.212.210', 'Denmark', 'Pandrup', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; da; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-11', '14:50:14', '78.167.224.6', 'Turkey', 'Mersin', '', 'http://tasdemir.0fees.net/main/ana', 'Opera/9.80 (X11; Linux i686; U; tr) Presto/2.6.30 Version/10.63', 0),
('2010-11-15', '03:11:43', '66.249.71.135', '', '', 'id=110', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-11', '14:23:09', '194.27.38.240', 'Turkey', 'Menderes', '', 'http://www.google.com.tr/search?q=max-width+komutu+explorerda+%C3%A7al%C4%B1%C5%9F%C4%B1yor&hl=tr&rlz=1T4GZEZ_trTR284TR308&ei=8d7bTLeQJsuWOqigtcQJ&start=10&sa=N', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1)', 0),
('2010-11-11', '14:52:25', '184.72.7.8', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-11', '15:42:02', '62.219.135.48', 'Israel', 'Gedera', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.43 Safari/532.5', 0),
('2010-11-13', '11:45:21', '95.15.85.212', 'Turkey', 'Ankara', '', 'http://tasdemir.0fees.net/main/dinle/metal', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.44 Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-11', '18:01:45', '78.183.81.111', 'Turkey', 'Kirklareli', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12', 0),
('2010-11-11', '18:01:50', '85.98.208.232', 'Turkey', 'Izmir', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.6; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 0),
('2010-11-11', '18:06:06', '88.247.40.115', 'Turkey', 'Antalya', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MRSPUTNIK 2, 3, 0, 228; MRA 5.7 (build 03672); .NET CLR 2.0.50727; InfoPath.2; AskTbCS2/5.8.0.12304)', 0),
('2010-11-12', '10:03:17', '88.249.18.174', 'Turkey', 'Ankara', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=6&ved=0CEoQFjAF&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama&rct=j&q=dojo%20zend&ei=ufTcTLegGdHu4gaA9eGsDQ&usg=AFQjCNFBGTOajJoSCF-wCQIz8wxyc4czbQ&cad=rja', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-12', '09:04:47', '66.249.65.169', 'United Kingdom', 'Newcastle', 'id=103', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-12', '12:05:32', '66.249.65.180', 'United Kingdom', 'Newcastle', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-12', '12:54:29', '66.249.65.154', 'United Kingdom', 'Newcastle', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-12', '18:00:12', '85.189.219.178', 'United Kingdom', 'Ashbourne', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-12', '15:36:57', '66.249.65.140', 'United Kingdom', 'Newcastle', 'utm_source=feedburner&amp;utm_medium=twitter&amp;utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-13', '12:54:21', '74.53.86.114', 'United States', 'Houston', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'WordPress/2.9.1; http://makeownwebsite.net', 0),
('2010-11-14', '22:18:47', '85.104.227.138', 'Turkey', 'Diyarbakir', '', 'Yok', 'Opera/9.80 (X11; Linux i686; U; tr) Presto/2.6.30 Version/10.63', 0),
('2010-11-13', '10:28:01', '66.249.65.172', 'United Kingdom', 'Newcastle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-24', '10:31:27', '10.225.2.119', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0);
INSERT INTO `tracker` (`date`, `time`, `ip`, `country`, `city`, `query_string`, `http_referer`, `http_user_agent`, `isbot`) VALUES
('2010-11-13', '23:32:37', '66.249.65.165', 'United Kingdom', 'Newcastle', 'id=107', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-22', '20:14:03', '78.168.225.165', '', '', '', 'http://tasdemir.0fees.net/main/aile/resim', 'Mozilla/5.0 (X11; U; Linux i686; tr-TR; rv:1.9.2.12) Gecko/20101027 Ubuntu/10.10 (maverick) Firefox/3.6.12', 0),
('2010-11-14', '12:41:16', '184.72.6.103', 'United States', 'Seattle', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-19', '20:10:53', '10.225.2.129', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-16', '03:34:23', '94.34.190.70', '', '', '', 'Yok', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)', 0),
('2010-11-16', '20:12:10', '78.167.227.141', '', '', '', 'Yok', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.44 Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-20', '01:48:57', '92.45.255.174', '', '', 'utm_source=feedburner&amp%3Butm_medium=twitter&amp%3Butm_campaign=Feed%3A+kitap-itsphp+(Kitap+-+ITSPHP)', 'http://www.google.com.tr/url?sa=t&source=web&cd=19&ved=0CEkQFjAIOAo&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama%3Futm_source%3Dfeedburner%26amp%3Butm_medium%3Dtwitter%26amp%3Butm_campaign%3DFeed%253A%2Bkitap-itsphp%2B(Kitap%2B-%2BITSPHP)&ei=qQznTKeqOcvqOaukkKYK&usg=AFQjCNFlfSx7R-YlSWCLvea3kCenoyzZEw', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr-TR) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4', 0),
('2010-11-24', '12:43:11', '85.214.151.180', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'http://feeds.feedburner.com/~r/kitap-itsphp/~3/kNFQNd8FKyw/programlama?utm_source=feedburner&utm_medium=twitter&utm_campaign=itasdemir86', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.0.11) Gecko/2009060215 Firefox/3.0.11 (.NET CLR 3.5.30729)', 0),
('2010-11-24', '12:42:52', '10.225.2.127', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-18', '23:58:59', '173.203.212.134', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Ruby', 0),
('2010-11-22', '19:58:45', '66.249.71.134', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-24', '11:07:35', '78.166.159.79', '', '', '', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-19', '20:10:41', '10.33.1.170', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-20', '13:13:56', '95.15.211.60', '', '', '', 'http://tasdemir.0fees.net/main/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-20', '17:10:27', '46.106.8.128', '', '', '', 'http://www.google.com.tr/search?hl=tr&rlz=1G1SMSN_TRTR407&q=mehmet+ozan+tasdemir&aq=f&aqi=&aql=&oq=&gs_rfai=', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0)', 0),
('2010-11-21', '18:17:21', '46.1.19.40', '', '', '', 'http://www.google.com.tr/search?q=Java:+A+Beginner%27s%E2%80%99+Guide+kitab%C4%B1&hl=tr&biw=1040&bih=631&ei=V0XpTKPiNZCVswbmp_COCQ&start=10&sa=N', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1045 Safari/532.5', 0),
('2010-11-20', '23:48:30', '78.180.80.53', '', '', '', 'http://tasdemir.0fees.net/main/', 'Opera/9.80 (Windows NT 6.1; U; tr) Presto/2.6.30 Version/10.63', 0),
('2010-11-22', '07:35:01', '66.249.71.136', '', '', '', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-23', '17:31:33', '10.33.1.171', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-22', '11:49:16', '184.72.26.167', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0),
('2010-11-24', '12:42:46', '10.33.1.172', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 OneRiot/1.0 (http://www.oneriot.com)', 0),
('2010-11-22', '20:52:12', '130.209.249.32', '', '', 'utm_source=feedburner&utm_medium=twitter&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29', 'Yok', 'Jakarta Commons-HttpClient/3.0.1', 0),
('2010-11-23', '13:40:24', '95.15.52.202', '', '', '', 'http://tasdemir.0fees.net/main/oku/programlama', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.44 Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-23', '03:33:21', '184.73.29.230', '', '', 'utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+kitap-itsphp+%28Kitap+-+ITSPHP%29&utm_content=FeedBurner', 'Yok', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 AlexaToolbar/alxf-1.54 BTRS27864 Firefox/3.6.12 SmartLinksAddon', 0),
('2010-11-23', '04:22:02', '88.253.41.20', '', '', '', 'http://www.google.com.tr/search?sourceid=navclient&hl=tr&ie=UTF-8&rlz=1T4SUNC_trTR402TR403&q=facebook+ibrahim+ta%c5%9fdemir', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.1; OfficeLiveConnector.1.3; OfficeLivePatch.0.0)', 0),
('2010-11-23', '15:44:28', '88.246.244.8', '', '', '', 'http://www.google.com.tr/url?sa=t&source=web&cd=10&ved=0CEkQFjAJ&url=http%3A%2F%2Ftasdemir.0fees.net%2Fmain%2Foku%2Fprogramlama&rct=j&q=zend%20framework%20kitap&ei=LcXrTOuNCMaRswboluyRDw&usg=AFQjCNFBGTOajJoSCF-wCQIz8wxyc4czbQ&cad=rja', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-24', '15:46:38', '88.228.137.116', '', '', '', 'http://tasdemir.0fees.net/main/aile/form/63', 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/7.0.517.44 Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-23', '18:47:01', '85.97.90.108', '', '', '', 'http://www.google.com.tr/search?q=.0fees.net&hl=tr&client=firefox-a&rls=org.mozilla:tr:official&channel=s&ei=yu_rTLyjK5HFswayiLGlDw&start=70&sa=N', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 0),
('2010-11-23', '22:57:24', '85.103.65.117', '', '', '', 'http://tutorialzine.com/2010/11/better-select-jquery-css3/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 0),
('2010-11-23', '19:31:47', '66.249.71.218', '', '', 'id=66', 'Yok', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1),
('2010-11-24', '00:10:58', '85.104.7.147', '', '', '', 'http://tasdemir.0fees.net/main/aile', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; iOpus-Web-Automation; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; OfficeLiveConnector.1.5; OfficeLivePatch.1.3; .NET4.0C)', 0),
('2010-11-24', '10:31:21', '204.236.152.171', '', '', '', 'Yok', 'JS-Kit URL Resolver, http://js-kit.com/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `webchat_lines`
--

CREATE TABLE IF NOT EXISTS `webchat_lines` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `author` varchar(255) collate utf8_unicode_ci NOT NULL,
  `gravatar` varchar(255) collate utf8_unicode_ci NOT NULL,
  `text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `ts` (`ts`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `webchat_lines`
--


-- --------------------------------------------------------

--
-- Table structure for table `webchat_users`
--

CREATE TABLE IF NOT EXISTS `webchat_users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `gravatar` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_activity` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `webchat_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `yorumlar`
--

CREATE TABLE IF NOT EXISTS `yorumlar` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aileID` int(10) unsigned NOT NULL,
  `commentName` varchar(255) collate utf8_unicode_ci NOT NULL,
  `commentUrl` varchar(255) collate utf8_unicode_ci NOT NULL,
  `commentEMail` varchar(255) collate utf8_unicode_ci NOT NULL,
  `commentBody` text collate utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `yorumlar`
--

INSERT INTO `yorumlar` (`id`, `aileID`, `commentName`, `commentUrl`, `commentEMail`, `commentBody`, `dt`) VALUES
(4, 11, 'o''connor', '', 'tasdemiribrahim@mynet.com', 'üğişçöıĞÜİŞÇÖ', '2010-10-23 09:01:01'),
(7, 60, 'İbrahim Taşdemir', '', 'tasdemiribrahim@mynet.com', 'Mükemmel bir insan. Biraz kansız. Fazla cadı. Ama bir hıhhhhhhhhhhh dedi mi hepsini unutursunuz. Onu sevmeyeni Pavlov''un köpeği yesin.', '2010-11-24 09:26:50');
