-- GIS Database Backup
-- Generated: 2025-01-07 16:43:30

SET FOREIGN_KEY_CHECKS=0;



CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `payments_ibfk_1` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `payments` VALUES('25', '1', '50000.00', '2025-01-06 10:36:32');
INSERT INTO `payments` VALUES('26', '65', '50000.00', '2025-01-06 10:36:45');
INSERT INTO `payments` VALUES('27', '18', '50000.00', '2025-01-06 10:37:05');
INSERT INTO `payments` VALUES('28', '51', '50000.00', '2025-01-06 10:37:24');
INSERT INTO `payments` VALUES('29', '13', '20000.00', '2025-01-06 10:37:38');
INSERT INTO `payments` VALUES('30', '36', '16000.00', '2025-01-06 10:40:31');
INSERT INTO `payments` VALUES('31', '17', '50000.00', '2025-01-06 10:40:48');
INSERT INTO `payments` VALUES('32', '56', '20000.00', '2025-01-06 10:41:10');
INSERT INTO `payments` VALUES('33', '14', '18000.00', '2025-01-06 10:41:38');
INSERT INTO `payments` VALUES('34', '8', '10000.00', '2025-01-06 10:43:54');
INSERT INTO `payments` VALUES('35', '2', '10000.00', '2025-01-06 10:49:31');
INSERT INTO `payments` VALUES('36', '23', '15000.00', '2025-01-06 10:49:42');
INSERT INTO `payments` VALUES('37', '25', '50000.00', '2025-01-06 10:49:54');
INSERT INTO `payments` VALUES('38', '19', '50000.00', '2025-01-06 10:50:07');
INSERT INTO `payments` VALUES('39', '9', '20000.00', '2025-01-06 10:50:20');
INSERT INTO `payments` VALUES('40', '31', '50000.00', '2025-01-06 10:50:37');
INSERT INTO `payments` VALUES('41', '6', '20000.00', '2025-01-06 10:50:51');
INSERT INTO `payments` VALUES('42', '66', '20000.00', '2025-01-06 10:51:03');
INSERT INTO `payments` VALUES('43', '49', '10000.00', '2025-01-06 10:51:12');
INSERT INTO `payments` VALUES('44', '59', '25000.00', '2025-01-06 10:51:25');
INSERT INTO `payments` VALUES('45', '67', '30000.00', '2025-01-06 10:51:38');
INSERT INTO `payments` VALUES('46', '60', '50000.00', '2025-01-06 10:51:55');
INSERT INTO `payments` VALUES('47', '20', '20000.00', '2025-01-06 11:01:31');
INSERT INTO `payments` VALUES('48', '16', '50000.00', '2025-01-06 13:56:02');
INSERT INTO `payments` VALUES('49', '21', '20000.00', '2025-01-07 07:30:06');
INSERT INTO `payments` VALUES('50', '21', '20000.00', '2025-01-07 08:58:23');
INSERT INTO `payments` VALUES('51', '83', '60000.00', '2025-01-07 08:59:18');
INSERT INTO `payments` VALUES('52', '107', '15000.00', '2025-01-07 09:00:00');
INSERT INTO `payments` VALUES('53', '68', '20000.00', '2025-01-07 09:00:18');
INSERT INTO `payments` VALUES('54', '69', '20000.00', '2025-01-07 09:00:35');
INSERT INTO `payments` VALUES('55', '50', '20000.00', '2025-01-07 09:00:45');
INSERT INTO `payments` VALUES('56', '94', '20000.00', '2025-01-07 09:00:59');
INSERT INTO `payments` VALUES('57', '79', '25000.00', '2025-01-07 09:01:12');
INSERT INTO `payments` VALUES('58', '78', '25000.00', '2025-01-07 09:01:24');
INSERT INTO `payments` VALUES('59', '102', '30000.00', '2025-01-07 09:01:35');
INSERT INTO `payments` VALUES('60', '92', '25000.00', '2025-01-07 09:01:50');
INSERT INTO `payments` VALUES('61', '101', '15000.00', '2025-01-07 09:02:10');
INSERT INTO `payments` VALUES('62', '11', '20000.00', '2025-01-07 09:02:27');
INSERT INTO `payments` VALUES('63', '64', '20000.00', '2025-01-07 09:02:50');
INSERT INTO `payments` VALUES('64', '96', '30000.00', '2025-01-07 09:03:02');
INSERT INTO `payments` VALUES('65', '97', '30000.00', '2025-01-07 09:03:11');
INSERT INTO `payments` VALUES('66', '108', '30000.00', '2025-01-07 09:05:15');
INSERT INTO `payments` VALUES('67', '86', '20000.00', '2025-01-07 09:05:27');
INSERT INTO `payments` VALUES('68', '100', '20000.00', '2025-01-07 09:05:41');
INSERT INTO `payments` VALUES('69', '75', '40000.00', '2025-01-07 09:06:02');
INSERT INTO `payments` VALUES('70', '76', '30000.00', '2025-01-07 09:06:16');
INSERT INTO `payments` VALUES('71', '12', '20000.00', '2025-01-07 09:06:30');
INSERT INTO `payments` VALUES('72', '77', '25000.00', '2025-01-07 09:06:59');
INSERT INTO `payments` VALUES('73', '72', '25000.00', '2025-01-07 09:07:09');
INSERT INTO `payments` VALUES('74', '109', '20000.00', '2025-01-07 09:08:06');
INSERT INTO `payments` VALUES('75', '58', '15000.00', '2025-01-07 09:08:19');



CREATE TABLE `students` (
  `student_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `parent_phone` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `students` VALUES('1', 'Patuma Afick', '8', '2009-01-01', 'Female', '1', '2025-01-06 08:46:31');
INSERT INTO `students` VALUES('2', 'Chifuniro Alfred', '8', '2010-05-29', 'Male', '0888729381', '2025-01-06 09:04:07');
INSERT INTO `students` VALUES('3', 'Mevis Kwenje', '7', '2010-10-10', 'Female', '0998070604', '2025-01-06 09:06:21');
INSERT INTO `students` VALUES('4', 'Samson Linje ', '7', '2013-01-01', 'Male', '1', '2025-01-06 09:07:13');
INSERT INTO `students` VALUES('5', 'Sophie Yotum ', '7', '2010-04-20', 'Female', '0992436379', '2025-01-06 09:08:20');
INSERT INTO `students` VALUES('6', 'Mercy Kachingwe', '3', '2017-01-22', 'Female', '1', '2025-01-06 09:09:28');
INSERT INTO `students` VALUES('7', 'Blessings Khuoge', '3', '2019-01-19', 'Male', '0882649581', '2025-01-06 09:10:33');
INSERT INTO `students` VALUES('8', 'Trust Mpoto', '3', '2018-06-29', 'Male', '1', '2025-01-06 09:11:15');
INSERT INTO `students` VALUES('9', 'Shamim Kawisa', '3', '2017-01-06', 'Female', '1', '2025-01-06 09:12:20');
INSERT INTO `students` VALUES('10', 'Success Subili', '3', '2017-02-07', 'Female', '0992436379', '2025-01-06 09:13:19');
INSERT INTO `students` VALUES('11', 'Hannah Batton ', '6', '2014-01-17', 'Female', '0988472772', '2025-01-06 09:15:56');
INSERT INTO `students` VALUES('12', 'Chisomo Chiputula', '6', '2011-09-21', 'Male', '0998212303', '2025-01-06 09:16:49');
INSERT INTO `students` VALUES('13', 'Shazel Savala ', '6', '2012-12-12', 'Female', '0888738404', '2025-01-06 09:17:46');
INSERT INTO `students` VALUES('14', 'Francis Macroon ', '6', '2011-01-01', 'Male', '1', '2025-01-06 09:18:53');
INSERT INTO `students` VALUES('15', 'Rashida Chibisa', '6', '2016-01-11', 'Female', '1', '2025-01-06 09:19:29');
INSERT INTO `students` VALUES('16', 'George Rashid ', '6', '2013-01-02', 'Male', '0881964168', '2025-01-06 09:20:18');
INSERT INTO `students` VALUES('17', 'Henry Chapola', '6', '2012-01-01', 'Male', '0990970704', '2025-01-06 09:21:24');
INSERT INTO `students` VALUES('18', 'Amidu Sedreck ', '5', '2013-01-15', 'Male', '1', '2025-01-06 09:22:32');
INSERT INTO `students` VALUES('19', 'Miracle Yusuf', '5', '2015-04-20', 'Female', '0993820731', '2025-01-06 09:23:19');
INSERT INTO `students` VALUES('20', 'Charity Kamwendo ', '5', '2015-03-07', 'Female', '0884344497', '2025-01-06 09:23:50');
INSERT INTO `students` VALUES('21', 'Aubrey John ', '5', '2014-08-09', 'Male', '0996379292', '2025-01-06 09:25:31');
INSERT INTO `students` VALUES('22', 'Potential Subili', '5', '2014-01-08', 'Female', '0992436379', '2025-01-06 09:27:46');
INSERT INTO `students` VALUES('23', 'Favour Malijani ', '5', '2015-08-09', 'Female', '1', '2025-01-06 09:41:38');
INSERT INTO `students` VALUES('24', 'Stain Kwenje ', '5', '2012-05-12', 'Male', '0998070604', '2025-01-06 09:42:24');
INSERT INTO `students` VALUES('25', 'Royce Yusuf ', '5', '2015-01-26', 'Female', '0993820731', '2025-01-06 09:43:13');
INSERT INTO `students` VALUES('26', 'Ivy Chizombe ', '5', '2013-11-21', 'Female', '1', '2025-01-06 09:43:37');
INSERT INTO `students` VALUES('27', 'Imran Yusuf', '6', '2013-09-15', 'Male', '0993820731', '2025-01-06 09:45:05');
INSERT INTO `students` VALUES('28', 'Jamil Alan ', 'nurs', '2020-01-01', 'Male', '1', '2025-01-06 09:51:14');
INSERT INTO `students` VALUES('31', 'Rita Majawa ', 'rec', '2020-01-01', 'Female', '1', '2025-01-06 09:53:49');
INSERT INTO `students` VALUES('32', 'Temwanani Luhanga ', 'rec', '2019-09-08', 'Female', '0888870911', '2025-01-06 09:55:12');
INSERT INTO `students` VALUES('33', 'Mundiwa Yobe ', 'rec', '2019-01-01', 'Female', '1', '2025-01-06 09:55:43');
INSERT INTO `students` VALUES('34', 'Linry Phiri', 'rec', '2019-01-01', 'Female', '1', '2025-01-06 09:56:07');
INSERT INTO `students` VALUES('35', 'Kelvin Maganga ', 'rec', '2019-01-01', 'Male', '1', '2025-01-06 09:56:27');
INSERT INTO `students` VALUES('36', 'Felix Kananji', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:56:52');
INSERT INTO `students` VALUES('37', 'Priscilla Matekenya ', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:57:23');
INSERT INTO `students` VALUES('38', 'Annie Rich ', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:57:45');
INSERT INTO `students` VALUES('39', 'Patience Mphaya ', '1', '2019-11-01', 'Male', '1', '2025-01-06 10:00:28');
INSERT INTO `students` VALUES('40', 'Jonathan Chapola ', '1', '2019-01-01', 'Male', '1', '2025-01-06 10:01:20');
INSERT INTO `students` VALUES('41', 'Afrahim Omar', '1', '2019-01-01', 'Male', '1', '2025-01-06 10:01:40');
INSERT INTO `students` VALUES('42', 'Shabil Samson ', '1', '2019-01-01', 'Male', '1', '2025-01-06 10:02:10');
INSERT INTO `students` VALUES('43', 'Tryness Luwanda ', '1', '2019-01-01', 'Female', '1', '2025-01-06 10:02:25');
INSERT INTO `students` VALUES('44', 'Same Witness ', '1 ', '2019-01-01', 'Male', '1', '2025-01-06 10:02:57');
INSERT INTO `students` VALUES('45', 'Peace Banda ', '1', '2019-01-01', 'Female', '1', '2025-01-06 10:03:21');
INSERT INTO `students` VALUES('46', 'Rose Akim ', '1', '2019-01-01', 'Female', '1', '2025-01-06 10:03:37');
INSERT INTO `students` VALUES('47', 'Faith Mawindo ', '1', '2019-01-01', 'Female', '1', '2025-01-06 10:03:54');
INSERT INTO `students` VALUES('48', 'Noel Chalo', '1', '2019-01-01', 'Male', '1', '2025-01-06 10:04:22');
INSERT INTO `students` VALUES('49', 'Tendai Maxuel ', '2', '2019-08-29', 'Female', '1', '2025-01-06 10:05:36');
INSERT INTO `students` VALUES('50', 'Tasmim Taimu ', '2', '2018-07-01', 'Female', '1', '2025-01-06 10:06:24');
INSERT INTO `students` VALUES('51', 'Husain Sidreck ', '2', '2016-01-01', 'Male', '1', '2025-01-06 10:07:09');
INSERT INTO `students` VALUES('52', 'Patience Banda ', '2', '2017-01-01', 'Female', '1', '2025-01-06 10:07:34');
INSERT INTO `students` VALUES('53', 'Mike Umali ', '2', '2017-01-01', 'Male', '1', '2025-01-06 10:08:01');
INSERT INTO `students` VALUES('54', 'Caefas Bester ', '2', '2018-01-01', 'Male', '1', '2025-01-06 10:08:58');
INSERT INTO `students` VALUES('55', 'Prince Mlenga ', '4', '2016-01-06', 'Male', '1', '2025-01-06 10:20:28');
INSERT INTO `students` VALUES('56', 'Reshima Alan ', '4', '2015-04-03', 'Female', '1', '2025-01-06 10:21:30');
INSERT INTO `students` VALUES('57', 'Glory Chokani', '4', '2016-04-11', 'Female', '1', '2025-01-06 10:21:56');
INSERT INTO `students` VALUES('58', 'Vanessa Yusuf ', '4', '2016-12-02', 'Female', '1', '2025-01-06 10:22:26');
INSERT INTO `students` VALUES('59', 'Promise Mlanje ', '4', '2017-07-05', 'Male', '1', '2025-01-06 10:23:04');
INSERT INTO `students` VALUES('60', 'Grym Namacha ', '4 ', '2016-03-04', 'Male', '1', '2025-01-06 10:24:15');
INSERT INTO `students` VALUES('61', 'Tadala Jamson ', '4', '2016-01-21', 'Female', '1', '2025-01-06 10:24:45');
INSERT INTO `students` VALUES('62', 'Talandira Jamson ', '4', '2016-01-21', 'Female', '1', '2025-01-06 10:25:27');
INSERT INTO `students` VALUES('63', 'Shalom Mukalipa', '4', '2016-10-16', 'Female', '1', '2025-01-06 10:25:58');
INSERT INTO `students` VALUES('64', 'Veronica Davie ', '4', '2015-08-04', 'Female', '1', '2025-01-06 10:26:58');
INSERT INTO `students` VALUES('65', 'Trust Wilson ', '4', '2015-09-27', 'Male', '1', '2025-01-06 10:27:40');
INSERT INTO `students` VALUES('66', 'Praise Kachingwe ', '4', '2015-09-22', 'Female', '1', '2025-01-06 10:28:37');
INSERT INTO `students` VALUES('67', 'Happiness Jafali ', '2', '2017-04-05', 'Female', '0998008209', '2025-01-06 10:29:24');
INSERT INTO `students` VALUES('68', 'Victor Vaslatos ', '7 ', '2011-12-08', 'Male', '0999203856', '2025-01-07 07:38:58');
INSERT INTO `students` VALUES('69', 'Yousra Taimu', '7', '2018-02-13', 'Female', '1', '2025-01-07 07:42:14');
INSERT INTO `students` VALUES('70', 'Thandiwe Paliyani', '7', '2012-01-06', 'Female', '0888469444', '2025-01-07 08:07:40');
INSERT INTO `students` VALUES('71', 'Rhoda Phiri', '7', '2011-05-19', 'Female', '1', '2025-01-07 08:08:07');
INSERT INTO `students` VALUES('72', 'Safwani Samson', '7', '2010-06-03', 'Male', '1', '2025-01-07 08:09:15');
INSERT INTO `students` VALUES('73', 'Triphonia Liwaya ', '6', '2014-01-01', 'Female', '0888187865', '2025-01-07 08:11:21');
INSERT INTO `students` VALUES('74', 'Favoured Liwaya ', '3', '2016-09-29', 'Male', '0888187865', '2025-01-07 08:12:11');
INSERT INTO `students` VALUES('75', 'Faith Robson ', '3', '2014-10-01', 'Female', '0883067281', '2025-01-07 08:15:13');
INSERT INTO `students` VALUES('76', 'Ethan Robson ', 'nurs', '2020-06-30', 'Male', '0888729381', '2025-01-07 08:19:09');
INSERT INTO `students` VALUES('77', 'Sumaya Samson ', '5', '2014-05-04', 'Female', '1', '2025-01-07 08:25:56');
INSERT INTO `students` VALUES('78', 'Ireen Kubwalo', '7', '2011-05-11', 'Female', '1', '2025-01-07 08:32:46');
INSERT INTO `students` VALUES('79', 'Glory Mulumbe', '2', '2017-12-07', 'Female', '1', '2025-01-07 08:33:46');
INSERT INTO `students` VALUES('80', 'Brenda Paka', '7', '2011-09-10', 'Female', '1', '2025-01-07 08:35:32');
INSERT INTO `students` VALUES('81', 'Ethel Magombo', '7', '2012-12-15', 'Female', '0881630331', '2025-01-07 08:36:24');
INSERT INTO `students` VALUES('82', 'Chrispin Lyton ', '7', '2011-09-30', 'Male', '0883111445', '2025-01-07 08:37:11');
INSERT INTO `students` VALUES('83', 'Favour Sichinga', '8', '2009-07-23', 'Female', '1', '2025-01-07 08:38:47');
INSERT INTO `students` VALUES('84', 'James Imran ', '8', '2010-06-20', 'Male', '1', '2025-01-07 08:39:15');
INSERT INTO `students` VALUES('85', 'Shalika Palilani', '3', '2014-03-05', 'Female', '1', '2025-01-07 08:40:31');
INSERT INTO `students` VALUES('86', 'Silaj Shadreck', '3', '2016-02-22', 'Male', '1', '2025-01-07 08:41:03');
INSERT INTO `students` VALUES('87', 'Miracle Muliya ', '3', '2016-02-06', 'Male', '0881254494', '2025-01-07 08:42:06');
INSERT INTO `students` VALUES('88', 'Vanessa Rodrick', '3', '2016-12-24', 'Female', '1', '2025-01-07 08:42:50');
INSERT INTO `students` VALUES('89', 'Cronix Kasanga', '3', '2016-06-05', 'Male', '1', '2025-01-07 08:43:25');
INSERT INTO `students` VALUES('90', 'Regina Kafisi', '5', '2013-12-11', 'Female', '1', '2025-01-07 08:44:56');
INSERT INTO `students` VALUES('91', 'Sumaya Samson ', '5', '2014-05-04', 'Female', '1', '2025-01-07 08:45:26');
INSERT INTO `students` VALUES('92', 'Beatrice William ', '5', '2015-06-05', 'Female', '1', '2025-01-07 08:46:03');
INSERT INTO `students` VALUES('93', 'Praise Mbungo', '5', '2013-06-19', 'Male', '1', '2025-01-07 08:46:31');
INSERT INTO `students` VALUES('94', 'Benjamin Kabango ', '5', '2011-02-13', 'Male', '1', '2025-01-07 08:47:20');
INSERT INTO `students` VALUES('95', 'Victor Mandeule', '6', '2013-06-16', 'Male', '0886958797', '2025-01-07 08:49:38');
INSERT INTO `students` VALUES('96', 'Kenn Kalulu', '6', '2013-04-27', 'Male', '0885715859', '2025-01-07 08:50:18');
INSERT INTO `students` VALUES('97', 'Kelvin Kalulu', '6', '2010-12-15', 'Male', '0885715859', '2025-01-07 08:51:01');
INSERT INTO `students` VALUES('98', 'Latif Cassim ', '6', '2012-10-19', 'Male', '0882023713', '2025-01-07 08:51:45');
INSERT INTO `students` VALUES('99', 'Grey Nkosi', '6', '2012-11-08', 'Male', '0999966390', '2025-01-07 08:52:16');
INSERT INTO `students` VALUES('100', 'Sandra Mphande ', '6', '2012-12-25', 'Male', '1', '2025-01-07 08:52:54');
INSERT INTO `students` VALUES('101', 'Prisca Banda', '6', '2014-02-25', 'Female', '1', '2025-01-07 08:53:21');
INSERT INTO `students` VALUES('102', 'Miracle Mponda', '6', '2015-03-15', 'Female', '0882753275', '2025-01-07 08:53:52');
INSERT INTO `students` VALUES('103', 'Fatima Aufi ', '6', '2013-01-31', 'Female', '1', '2025-01-07 08:54:20');
INSERT INTO `students` VALUES('104', 'Stella Masakatira ', '6', '2013-06-16', 'Female', '1', '2025-01-07 08:55:01');
INSERT INTO `students` VALUES('105', 'Prince Thom ', '6', '2013-12-05', 'Male', '0881846317', '2025-01-07 08:55:58');
INSERT INTO `students` VALUES('106', 'Joshua Mbungo ', '6', '2010-06-17', 'Male', '1', '2025-01-07 08:56:24');
INSERT INTO `students` VALUES('107', 'Leticia Martin ', '2', '2019-02-12', 'Female', '1', '2025-01-07 08:59:48');
INSERT INTO `students` VALUES('108', 'Katrina Kalulu', '4', '2016-05-06', 'Female', '0885715859', '2025-01-07 09:04:49');
INSERT INTO `students` VALUES('109', 'Martha Story ', '4', '2015-12-25', 'Female', '1', '2025-01-07 09:07:56');


SET FOREIGN_KEY_CHECKS=1;