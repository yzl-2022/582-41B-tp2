-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-03-25 23:34:41
-- 服务器版本： 8.0.31
-- PHP 版本： 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `laravel_tp`
--

-- --------------------------------------------------------

--
-- 表的结构 `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `ville_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etudiants_ville_id_foreign` (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `etudiants`
--

INSERT INTO `etudiants` (`id`, `nom`, `adresse`, `telephone`, `email`, `date_de_naissance`, `ville_id`, `created_at`, `updated_at`) VALUES
(1, 'Vance Kreiger I', '54001 Ransom Throughway\nPort Charlie, GA 53895', '917.909.2456', 'dolly60@hotmail.com', '1939-05-19', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(2, 'Prof. Jacklyn Little', '61220 Farrell Club\nWest Kareemfort, WI 68980', '+1-919-663-8816', 'frami.ova@kunze.com', '1983-09-03', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(3, 'Kory Wiegand', '70850 Hoeger Green\nNaomieburgh, TN 63796-2931', '+1-857-305-2001', 'misty09@hammes.org', '1945-06-24', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(4, 'Leta Gorczany', '691 Marks Creek Suite 088\nKatrinaside, WV 92879', '(251) 661-6751', 'okey41@dare.biz', '1957-10-19', 11, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(5, 'Candida Smitham', '1086 Alexander Island\nSouth Judsonside, SC 03707-9277', '(832) 464-3182', 'nolan.lauryn@reichert.com', '1967-09-24', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(6, 'Dr. Mohamed Gibson V', '89304 Kautzer Hills\nNorth Althea, CO 93738', '224-849-9568', 'deckow.reba@schimmel.com', '2010-03-03', 1, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(7, 'Mrs. Meaghan Champlin', '138 Mertz Canyon\nThompsonton, WV 72901-3492', '805.416.9251', 'hettinger.candice@yahoo.com', '2002-08-06', 3, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(8, 'Ike Hermann', '948 Doyle Tunnel\nEdmondberg, HI 37846', '+1-785-706-6438', 'pmills@witting.com', '1985-02-19', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(9, 'Rebeca Wiegand', '66531 Veum Lakes Suite 794\nZiemeshire, TN 15891-1815', '+1-714-864-1415', 'bernier.kelli@gmail.com', '1973-02-10', 6, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(10, 'Barton Rau', '9539 Heller Court Suite 753\nSchulistport, NJ 27091-7854', '+1-838-203-9020', 'demarcus13@reinger.org', '2017-12-17', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(11, 'Estelle Cassin', '5736 Kailee Canyon\nEast Mikelhaven, VT 21726', '(913) 401-1495', 'clay.west@yahoo.com', '1932-10-19', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(12, 'Ms. Dulce Grady', '6220 Bergnaum Corners\nOkunevashire, SC 40267', '+1-234-972-2533', 'ernie72@kirlin.com', '1954-02-25', 1, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(13, 'Prof. Ross Kohler', '8955 Maybell Knolls Apt. 311\nArmstrongstad, OK 99963', '(312) 318-6296', 'estrella09@runte.com', '2004-02-29', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(14, 'Keeley Legros', '3680 Jovani Plains\nSouth Gunnermouth, IA 35434-8885', '551.569.7481', 'zechariah28@hoppe.com', '1969-10-25', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(15, 'Dexter Bailey', '55141 Luisa Fall Apt. 434\nPort Madalyn, NM 09482-5016', '(206) 357-2815', 'claudia.pollich@becker.org', '1997-10-08', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(16, 'Anika Kihn', '74449 Laurianne Burgs Suite 901\nAlanshire, IA 21039-4012', '1-612-897-0296', 'zpouros@stokes.info', '1979-11-16', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(17, 'Mrs. Melisa Wuckert', '3892 Verla Freeway\nKenyafurt, MT 92786', '870-986-5964', 'nconnelly@hotmail.com', '1969-02-09', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(18, 'Noah VonRueden', '91816 Alexandre Ways\nLake Nathanhaven, GA 33912-9362', '+1-475-537-2608', 'coralie46@gmail.com', '1972-01-24', 11, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(19, 'Miss Carlotta Bins', '8310 Skiles Ramp Apt. 960\nPagacshire, MN 86946', '1-217-399-3738', 'bfriesen@heaney.com', '1968-12-22', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(20, 'Loyal Abshire', '114 Spencer Shoal Apt. 483\nRoweberg, WA 77405-3179', '630-702-3305', 'aryanna86@kuhic.info', '2013-01-23', 1, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(21, 'Pete Runolfsdottir', '417 Towne Drives Suite 387\nNew Joelland, MS 01879-0480', '+1 (361) 858-3986', 'nbechtelar@hotmail.com', '1963-11-27', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(22, 'Dejon Luettgen', '2610 Rodger Valleys Suite 547\nLake Francesland, WV 71427', '779.587.7605', 'branson.donnelly@yahoo.com', '1928-04-25', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(23, 'Alyce Von IV', '972 Francesco Fords Suite 512\nSimchester, WA 63863-2507', '(312) 720-0423', 'cremin.jordy@hotmail.com', '1949-12-23', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(24, 'Mrs. Ivory Koelpin DDS', '42696 Caitlyn Valley\nBrandtshire, SD 56386-2354', '520-503-9885', 'deckow.logan@hotmail.com', '1962-03-07', 13, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(25, 'Mrs. Rebeka Dickinson IV', '400 Paucek Drives\nNorth Harry, RI 61083', '352.910.3695', 'zieme.kieran@gmail.com', '1968-11-17', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(26, 'Jed Ondricka', '289 Finn Divide\nStanchester, AR 01273-5088', '838-528-3608', 'wyman.jast@ratke.biz', '1960-05-01', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(27, 'Mr. Zachery Braun II', '395 Collier Ridges Apt. 506\nWest Alverta, SC 90215', '952-847-4727', 'gussie78@yahoo.com', '2014-04-27', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(28, 'Alexander Friesen IV', '4243 Bonita Island Suite 388\nSouth Kenyonbury, AL 41337-0404', '+1 (561) 688-9250', 'hyatt.brannon@konopelski.com', '1994-02-26', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(29, 'Mr. Vidal Schiller II', '83881 Beahan Forks Apt. 332\nKalibury, CO 30852-3787', '463-850-1198', 'fisher.lea@zulauf.com', '1967-05-27', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(30, 'Arden Kuhic', '987 Travis Turnpike Apt. 080\nLake Walterstad, KY 44044', '1-606-880-4567', 'cielo.stokes@smith.biz', '2023-12-16', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(31, 'Nils Zieme', '44506 Lueilwitz Road Apt. 207\nHaleyberg, AL 29425', '+1 (325) 833-6949', 'gwisoky@yahoo.com', '1932-09-09', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(32, 'Joshuah Stamm', '552 Rempel Court Suite 260\nGoyetteport, AL 42017', '(334) 790-5144', 'kacie11@boyle.com', '1993-01-04', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(33, 'Mrs. Athena Nader PhD', '5791 Ibrahim Canyon Suite 985\nNew Sarai, WV 49552-7315', '458.708.5685', 'ohara.louvenia@jones.com', '1945-10-09', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(34, 'Lukas Friesen DVM', '843 Marvin Place Apt. 129\nJarvisberg, CT 49160', '+16789616261', 'keebler.sterling@bashirian.info', '1968-06-29', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(35, 'Mr. Blaze Quitzon', '347 Arturo Ranch Apt. 128\nRempelshire, ME 46840-0917', '361-829-6053', 'anissa83@gmail.com', '2007-01-12', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(36, 'Dr. Amani McGlynn', '41933 Mazie Points\nNorth Greyson, TX 55604', '816-979-4429', 'abshire.madelyn@bosco.biz', '2004-12-09', 11, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(37, 'Vance Koepp', '2236 Adelia Plains Apt. 938\nHowellchester, DE 92882-9504', '+1-332-419-3614', 'dee.ledner@yahoo.com', '2021-01-22', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(38, 'Lina Watsica', '171 Weston River Suite 423\nLindgrenborough, NY 95469-2225', '1-325-737-0553', 'carlotta.toy@gmail.com', '1928-12-27', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(39, 'Aurelie Reichel', '27839 Rogers Ramp Suite 728\nConsidineport, NV 42212-2800', '+1-678-987-4997', 'hudson.davion@kunze.com', '1979-10-21', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(40, 'Miss Herta Fahey III', '30485 Jacobson Springs Apt. 889\nBransonmouth, SD 35557', '1-518-534-6166', 'arlie61@hotmail.com', '1956-10-15', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(41, 'Prof. Andrew Ondricka', '128 Alexa Locks Apt. 416\nLesleytown, WA 98341', '+13605650254', 'deckow.rosario@hotmail.com', '1946-05-03', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(42, 'Ms. Annabelle Strosin', '36805 Stoltenberg Lake\nEvelynside, MA 67005', '+1-240-919-4553', 'rogahn.elisabeth@kertzmann.biz', '1945-04-24', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(43, 'Deanna Schinner III', '362 Tillman Overpass\nGleasonland, SD 91380-9431', '1-858-243-9644', 'zoie.wiza@gmail.com', '1941-02-25', 6, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(44, 'Mrs. Bridgette Schultz', '16300 Conroy Plains Suite 813\nWest Mortimer, RI 97120', '+1.845.881.5229', 'ibartell@lebsack.com', '1967-11-18', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(45, 'Raegan Moen', '63435 Jayme Meadows Suite 806\nKundehaven, CO 54724', '539-431-9595', 'schmidt.santiago@yahoo.com', '1951-10-22', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(46, 'Keara Kihn', '1543 Toy Rest\nWest Norwood, ID 19718', '1-651-208-3438', 'holly04@hotmail.com', '2006-07-19', 3, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(47, 'Dr. Holden Mante', '4198 Morissette Court\nHilpertport, MO 19069-7718', '319-260-3761', 'bartell.marianne@nolan.com', '1933-01-22', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(48, 'Prof. Claudie Stracke DDS', '9688 Fahey Parkway Suite 665\nNorth Rita, FL 82425-7701', '469.481.1007', 'rutherford.lonnie@gerlach.biz', '1932-12-01', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(49, 'Chad Zulauf', '1006 Beahan Mountains\nSolonchester, NV 99758-6838', '931-419-9961', 'lafayette.turcotte@gmail.com', '1931-08-27', 6, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(50, 'Camila Lubowitz', '46459 Daniel Parks\nNew Coby, NH 46086-9199', '+1-803-223-7490', 'louisa.sauer@hotmail.com', '2009-03-22', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(51, 'Claudia Medhurst', '4220 Name Inlet\nWizaland, NJ 00434-8376', '309-294-4147', 'dnikolaus@powlowski.com', '2015-07-11', 6, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(52, 'Tommie Hill DVM', '443 Garnett Summit Apt. 811\nSouth Kattie, MN 61487', '(575) 860-7963', 'faye.rau@gmail.com', '1998-09-03', 13, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(53, 'Melissa Metz', '89050 Helena Roads\nEricashire, AK 73429-2886', '(707) 625-3751', 'wswaniawski@gmail.com', '1925-07-02', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(54, 'Ms. Jaida Bartoletti V', '108 Tate Roads\nKeeblerhaven, DE 58067', '386.568.7595', 'little.jammie@hotmail.com', '1936-08-17', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(55, 'Mateo Hickle I', '581 Estefania Grove Suite 193\nQuincyville, LA 33730', '+17404143020', 'eschuster@gmail.com', '2002-02-27', 6, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(56, 'Miss Emily Ebert', '22544 Hermann Alley Suite 430\nWest Groverbury, CT 18076', '225-970-8055', 'urban.lind@jast.com', '1929-03-13', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(57, 'Miss Darby Lang', '37481 Sylvester Burg Apt. 878\nTorpstad, NY 36122-3756', '+1-678-267-1993', 'wilmer.hegmann@nolan.com', '2007-04-08', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(58, 'Idell Marvin III', '27904 Shanahan Manors Suite 406\nDashawnville, OH 91871', '(657) 855-1707', 'consuelo32@wolf.com', '1925-04-17', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(59, 'Tevin Prosacco DVM', '5724 Kristian Harbor Suite 998\nKutchhaven, DC 03659-0230', '743-215-8644', 'mariela.bernhard@yahoo.com', '1925-10-16', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(60, 'Dannie Labadie Jr.', '5558 Schultz Fork\nMohrhaven, OR 63073', '(743) 608-8875', 'lea73@hotmail.com', '1975-10-22', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(61, 'Katarina Will', '2976 Hessel Knoll Suite 753\nSouth Jayda, ND 07921-3295', '+1 (325) 404-1896', 'gleichner.madaline@hotmail.com', '2001-12-20', 3, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(62, 'Stefan Auer', '952 Rigoberto Wall Apt. 376\nWest Bethany, AL 46316', '+1 (984) 563-2350', 'whickle@gmail.com', '1943-11-27', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(63, 'Curtis Borer', '8989 Iliana Radial Apt. 473\nGermainefort, WV 44244-1818', '+14587663782', 'damaris43@corwin.com', '1971-04-28', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(64, 'Forest Lang', '1134 Hirthe Centers Suite 716\nSouth Jacksonland, WY 82314-5299', '+1.202.361.0683', 'uschmeler@gmail.com', '2010-09-06', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(65, 'Mozell Ziemann', '26690 Kris Groves Apt. 489\nCruzside, TN 97227-5133', '765.949.4430', 'kattie.parisian@hotmail.com', '2000-03-27', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(66, 'Lorena Dooley', '7941 Metz Hollow\nKochport, MT 94996', '+15414308370', 'obeahan@hettinger.net', '1941-06-13', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(67, 'Emerald Towne', '4421 Roxanne Unions\nRempelstad, LA 27660-1347', '757-312-0933', 'santa.zboncak@yahoo.com', '1977-08-03', 2, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(68, 'Percy Zulauf', '81760 Hillard Parkways\nKennychester, MI 12576-2356', '+1-559-418-9075', 'lueilwitz.amber@armstrong.com', '1945-02-25', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(69, 'Dr. Eino Goyette', '95021 Lebsack Burg Apt. 772\nMaiaville, SC 65466', '520.715.4920', 'elian18@hotmail.com', '1960-05-23', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(70, 'Tabitha Schmitt', '3718 Heidenreich Avenue\nWest Brennonborough, UT 12070', '(734) 800-4213', 'jared37@yahoo.com', '2017-01-26', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(71, 'Katherine Daugherty', '19081 Grace Park Suite 150\nBeerport, UT 56917-2002', '(224) 259-1121', 'mosciski.miracle@walker.com', '1984-05-18', 13, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(72, 'Graciela McClure', '33520 Rollin Corner\nLednerfurt, LA 04125', '+1-469-510-8024', 'joshuah.wisoky@hotmail.com', '2019-03-23', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(73, 'Tod Fritsch Jr.', '3976 Jake Turnpike Apt. 902\nDarrylstad, MA 08644', '+1-681-876-3269', 'guadalupe21@yahoo.com', '1959-11-09', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(74, 'Melissa Medhurst', '646 Fisher Fall Suite 695\nNorth Raul, OK 68673-7444', '+18326442002', 'ezekiel90@sipes.com', '2006-03-08', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(75, 'Mrs. Lavonne Wisoky', '290 Baumbach Flats Apt. 290\nNew Cassandra, KY 99719-2693', '(949) 763-4330', 'zbergstrom@gmail.com', '1931-08-18', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(76, 'Dr. Lily Kilback II', '59286 Kristian Key Apt. 673\nLake Rubenshire, IL 86177-2272', '712.443.6661', 'ellen.jacobs@bogan.com', '2018-02-04', 10, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(77, 'Germaine Weber', '4948 Lakin Manors\nLindgrenberg, MO 94173', '669-775-4280', 'brendon.rosenbaum@kiehn.com', '1958-11-14', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(78, 'June Wyman', '56856 Cormier Heights\nFerryburgh, AL 30448', '223.544.2253', 'pablo31@williamson.info', '1970-03-05', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(79, 'Vella Turcotte', '609 Lexus Terrace Apt. 342\nNorth Alejandraburgh, OR 92285-0243', '1-743-534-9208', 'fahey.amber@crooks.org', '2002-01-17', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(80, 'Athena Douglas', '5230 Fahey Drive Apt. 371\nEast Georgiannamouth, VA 70853', '361.783.7819', 'gonzalo.daniel@larkin.com', '1962-09-29', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(81, 'Ms. Rosalee Bruen II', '320 Greenholt Ramp Suite 937\nPort Scarlettside, OK 64129', '878-887-7883', 'edenesik@langosh.com', '1950-09-17', 11, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(82, 'Nasir Hoppe', '33553 Ashton Junctions Apt. 330\nStammmouth, WI 27035', '928.249.1426', 'cbode@gmail.com', '2014-02-04', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(83, 'Otto West', '71168 Alene Ridges Apt. 148\nCormiermouth, KY 28921-9875', '440-237-9789', 'carlee24@bailey.com', '1966-11-12', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(84, 'Rachael Senger', '788 Huels Square\nPort Gaylordport, NH 43894', '716.395.1430', 'allison88@yahoo.com', '1941-10-13', 7, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(85, 'Anthony Brown', '801 Nader Fords\nCreminstad, SD 69989-8028', '1-463-658-3742', 'zjakubowski@quigley.com', '1934-06-15', 13, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(86, 'Mr. Davonte Bernier DVM', '158 Anabelle Course Apt. 330\nJadynshire, NC 36669-8994', '+1.580.520.2789', 'stehr.joy@yahoo.com', '2007-09-03', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(87, 'Jordan Predovic Jr.', '8675 Hahn Trail Suite 240\nHoraceport, HI 59043', '1-458-231-2162', 'rmuller@schowalter.com', '1966-01-13', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(88, 'Drew Spinka', '3312 Johnson Forest\nEast Delphineport, DE 06448-5978', '+18598660518', 'stark.jovan@weber.com', '1972-08-29', 15, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(89, 'Miss Golda Hammes', '8025 Julio Roads\nNorth Theresa, KY 90840', '920-888-8527', 'ulices.tillman@hotmail.com', '1962-12-30', 12, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(90, 'Rod Gulgowski', '39554 Quitzon Throughway\nEast Tevin, MS 44767-3787', '530.349.5469', 'kenyatta82@yahoo.com', '1984-09-10', 8, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(91, 'Kennedi Hermiston', '6923 Williamson Island\nNew Adolphustown, WV 42829', '1-860-546-0637', 'armstrong.chesley@romaguera.info', '2002-08-01', 14, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(92, 'Madison Heaney', '86652 Schiller Stravenue Apt. 113\nNorth Jameltown, FL 22627', '+1-773-202-7628', 'hermiston.eugene@yahoo.com', '2003-11-27', 13, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(93, 'Schuyler Kuhic', '202 Legros Walk\nNew Greenberg, NJ 89083-0487', '(314) 490-5281', 'margarete.deckow@gmail.com', '2018-10-28', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(94, 'Clyde Little', '3120 Valentin Glens\nNorth Gudrun, OK 56971-4864', '(234) 367-5564', 'owelch@rowe.biz', '1938-11-09', 4, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(95, 'Dr. Alexandra Purdy IV', '25084 Skiles Oval Apt. 963\nNew Mekhiview, DC 85057-8759', '(573) 954-0740', 'carmella85@yahoo.com', '2006-09-13', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(96, 'Ms. Maybell Koelpin', '1337 Moen Lodge\nEast Barneyland, MI 87603-3657', '678-221-5695', 'brendan29@daniel.com', '2015-05-22', 7, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(97, 'Prof. Regan Bernhard', '73377 Raleigh Street\nNorth Bennie, WY 83390', '+1-620-337-8233', 'dock25@hotmail.com', '2013-10-10', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(98, 'Brayan Watsica', '913 Rosina Manor Suite 482\nKolefort, NY 97164', '+1-971-632-9146', 'kameron80@schaden.com', '1964-10-24', 5, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(99, 'Cole O\'Kon', '925 Miles Trace\nGloverberg, AL 37048', '(954) 853-9707', 'murphy19@yahoo.com', '1978-09-13', 7, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(100, 'Randal Bergnaum', '6390 Mariam Flat Apt. 829\nLake Alejandrahaven, AL 42815-3758', '661-281-8566', 'jesus.gislason@gmail.com', '1931-03-30', 9, '2024-03-23 03:40:51', '2024-03-23 03:40:51'),
(101, '123', '123', '123-123-1234', '123@123.com', '2023-12-31', 1, '2024-03-25 18:21:16', '2024-03-25 18:21:16');

--
-- 限制导出的表
--

--
-- 限制表 `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_ville_id_foreign` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
