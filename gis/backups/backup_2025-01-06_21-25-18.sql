-- GIS Database Backup
-- Generated: 2025-01-06 21:25:18

SET FOREIGN_KEY_CHECKS=0;



CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `payments_ibfk_1` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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



CREATE TABLE `students` (
  `student_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `parent_phone` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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


SET FOREIGN_KEY_CHECKS=1;