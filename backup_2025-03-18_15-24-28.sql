-- GIS Database Backup
-- Generated: 2025-03-18 15:24:28

SET FOREIGN_KEY_CHECKS=0;



CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expense_date` date NOT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `expenses` VALUES('1', 'Mr Nasho ', '100000.00', 'Salaries', '2025-01-07', 'paid mr nasho his salary', '2025-01-08 00:03:24', '2025-01-08 00:03:24');
INSERT INTO `expenses` VALUES('2', 'chalk', '3000.00', 'Supplies', '2025-01-07', '', '2025-01-08 00:08:01', '2025-01-08 00:08:01');
INSERT INTO `expenses` VALUES('3', 'Mr Evason ', '185000.00', 'Salaries', '2025-01-06', 'to his school fees, paid 120 fees + 65 advance', '2025-01-08 00:09:59', '2025-01-08 00:09:59');
INSERT INTO `expenses` VALUES('4', 'Mr Kwenje ', '185000.00', 'Salaries', '2025-01-06', '185 to fees ', '2025-01-08 00:10:36', '2025-01-08 00:12:20');
INSERT INTO `expenses` VALUES('5', 'Mr Kwenje ', '55000.00', 'Salaries', '2025-01-07', 'paid 15 salary 40 advance ', '2025-01-08 00:11:46', '2025-01-08 00:11:46');
INSERT INTO `expenses` VALUES('6', 'Madam Mlanga ', '65000.00', 'Salaries', '2025-01-06', 'deducted 35 for advance ', '2025-01-08 00:14:14', '2025-01-08 00:14:14');
INSERT INTO `expenses` VALUES('7', 'Madam Mlanga ', '15000.00', 'Salaries', '2025-01-07', 'requested advance delay ', '2025-01-08 00:14:40', '2025-01-08 00:14:40');
INSERT INTO `expenses` VALUES('8', 'Mr Moyo', '100000.00', 'Salaries', '2025-01-06', 'salary', '2025-01-08 00:15:06', '2025-01-08 00:15:06');
INSERT INTO `expenses` VALUES('9', 'madam kachare ', '80000.00', 'Salaries', '2025-01-06', 'just salary', '2025-01-08 00:15:57', '2025-01-08 00:15:57');
INSERT INTO `expenses` VALUES('10', 'Mrs Chokani ', '90000.00', 'Salaries', '2025-01-06', '', '2025-01-08 00:16:23', '2025-01-08 00:16:23');
INSERT INTO `expenses` VALUES('11', 'Mr Kwenje transport ', '4000.00', 'Supplies', '2025-01-06', 'went to leave money at his school in soche 2k to 2k from ', '2025-01-08 00:17:21', '2025-01-08 00:17:21');
INSERT INTO `expenses` VALUES('12', 'Okolopa ', '5000.00', 'Maintenance', '2025-01-06', 'mr gideons wife to kolopa ', '2025-01-08 00:18:06', '2025-01-08 00:18:06');
INSERT INTO `expenses` VALUES('13', 'mr gideon ', '18000.00', 'Maintenance', '2025-01-06', 'wood and nails for desk maintenance', '2025-01-08 00:19:02', '2025-01-08 00:19:02');
INSERT INTO `expenses` VALUES('14', 'gideon ', '10000.00', 'Maintenance', '2025-01-06', 'nails and salary for maintenance ', '2025-01-08 00:20:06', '2025-01-08 00:20:06');
INSERT INTO `expenses` VALUES('15', 'Gideon nails ', '1500.00', 'Maintenance', '2025-01-07', 'needed 1500 for nails for the desks\r\n', '2025-01-08 00:20:54', '2025-01-08 00:20:54');
INSERT INTO `expenses` VALUES('16', 'Mr Gideon Salary ', '30000.00', 'Salaries', '2025-01-07', 'his salary', '2025-01-08 00:21:35', '2025-01-08 00:21:35');
INSERT INTO `expenses` VALUES('17', 'Mr Kwenje to send to inspector ', '45000.00', 'Utilities', '2025-01-08', 'he said it is for registration to get a center \r\n', '2025-01-08 18:09:00', '2025-01-08 18:09:00');
INSERT INTO `expenses` VALUES('18', 'Supplies for teachers ', '30000.00', 'Supplies', '2025-01-09', 'bought 3 chalks, 6 lesson plans, 5 schemes', '2025-01-09 14:51:14', '2025-01-09 14:51:14');
INSERT INTO `expenses` VALUES('19', 'Advance madam chokani ', '30000.00', 'Salaries', '2025-01-14', 'asked for an advance, to be deducted at january month end', '2025-01-14 10:03:56', '2025-01-14 10:03:56');
INSERT INTO `expenses` VALUES('20', 'Advance for mr evason', '10000.00', 'Salaries', '2025-01-15', 'mr evason requested an advance\r\n', '2025-01-16 10:43:25', '2025-01-16 10:43:25');
INSERT INTO `expenses` VALUES('21', 'Mr Moyo advance', '45000.00', 'Salaries', '2025-01-15', 'asked for advance that will be deducted at january month\'s end ', '2025-01-16 10:44:48', '2025-01-16 10:44:48');
INSERT INTO `expenses` VALUES('22', 'Madam Mlanga ', '15000.00', 'Salaries', '2025-01-20', 'she took an advance and should be taxed at the end of january ', '2025-01-20 08:48:17', '2025-01-20 08:48:17');
INSERT INTO `expenses` VALUES('23', '2books, 8copies, 2 chalks', '15000.00', 'Supplies', '2025-01-21', 'books for mr kwenje and evason, chalk and books for teachers to write lesson concepts they plan to teach for the week ', '2025-01-21 11:04:42', '2025-01-21 11:04:42');
INSERT INTO `expenses` VALUES('24', 'getting table fixed by mr gideon ', '10000.00', 'Maintenance', '2025-01-22', 'paid mr gideon 1500, supplies such as nails and wood cost 8500', '2025-01-22 08:50:18', '2025-01-22 08:50:18');
INSERT INTO `expenses` VALUES('25', 'books ', '4000.00', 'Supplies', '2025-01-22', 'two books teacher\'s guides ', '2025-01-22 11:23:41', '2025-01-22 11:23:41');
INSERT INTO `expenses` VALUES('26', 'chalk', '3000.00', 'Supplies', '2025-01-30', 'mr kwenje bought chalk ', '2025-01-30 11:42:49', '2025-01-30 11:42:49');
INSERT INTO `expenses` VALUES('27', 'Receipt book ', '8000.00', 'Supplies', '2025-02-03', 'gave it to mr kwenje to buy the receipt book, will be ready by tomorrow ', '2025-02-03 10:08:26', '2025-02-03 10:08:26');
INSERT INTO `expenses` VALUES('28', 'mrs kachare ', '70000.00', 'Salaries', '2025-02-04', 'was supposed to be paid 50, but salary increased by 20000', '2025-02-05 15:49:27', '2025-02-05 15:49:27');
INSERT INTO `expenses` VALUES('29', 'Mr Evason ', '95000.00', 'Salaries', '2025-02-03', 'was supposed to get 65 but salary increased by 20000\r\n', '2025-02-05 15:50:11', '2025-02-05 15:50:11');
INSERT INTO `expenses` VALUES('30', 'Mr Kwenje ', '175.00', 'Salaries', '2025-02-03', 'salary increased by 20', '2025-02-05 15:51:07', '2025-02-05 15:51:07');
INSERT INTO `expenses` VALUES('31', 'Mrs Mlanga', '90000.00', 'Salaries', '2025-02-03', 'salary increased by 20', '2025-02-05 15:51:36', '2025-02-05 15:51:36');
INSERT INTO `expenses` VALUES('32', 'Mrs Chokani ', '80000.00', 'Salaries', '2025-02-03', 'salary increased by 20', '2025-02-05 15:52:00', '2025-02-05 15:52:00');
INSERT INTO `expenses` VALUES('33', 'mr gideon ', '50000.00', 'Salaries', '2025-02-03', 'paid at home by mom', '2025-02-05 15:52:19', '2025-02-05 15:52:19');
INSERT INTO `expenses` VALUES('34', 'chalk', '6200.00', 'Supplies', '2025-02-10', 'bought two boxes, second box was found at 3200', '2025-02-10 09:29:53', '2025-02-10 09:29:53');
INSERT INTO `expenses` VALUES('35', 'mr kwenje tpt to soche to mr moyo', '2000.00', 'Utilities', '2025-02-09', 'he went to collect books mr moyo had taken that belong to the school\r\n', '2025-02-10 12:30:46', '2025-02-10 12:30:46');
INSERT INTO `expenses` VALUES('36', 'photocopy standard 1 books', '17000.00', 'Supplies', '2025-02-10', 'two books 8500 each ', '2025-02-10 12:31:19', '2025-02-10 12:31:19');
INSERT INTO `expenses` VALUES('37', 'mrs chokani', '50000.00', 'Salaries', '2025-03-05', 'remaining 60', '2025-03-05 10:44:10', '2025-03-05 10:44:10');
INSERT INTO `expenses` VALUES('38', 'Mrs Mlanga', '50000.00', 'Salaries', '2025-03-05', 'remaining 60\r\n', '2025-03-05 10:44:31', '2025-03-05 10:44:31');
INSERT INTO `expenses` VALUES('39', 'mr evason', '50000.00', 'Salaries', '2025-03-05', 'remaining ', '2025-03-05 10:44:56', '2025-03-05 10:44:56');
INSERT INTO `expenses` VALUES('40', 'mrs kachare ', '44000.00', 'Salaries', '2025-03-05', 'remaining', '2025-03-05 10:46:06', '2025-03-05 10:46:06');
INSERT INTO `expenses` VALUES('41', 'Mr Kwenje ', '69000.00', 'Salaries', '2025-03-07', 'more to come\r\n', '2025-03-07 14:13:00', '2025-03-07 14:13:00');
INSERT INTO `expenses` VALUES('42', 'mr kwenje trip to nanjiriri', '2000.00', 'Supplies', '2025-03-18', 'to find out about mocks', '2025-03-18 09:47:49', '2025-03-18 09:47:49');



CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `given_by` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comments` text COLLATE utf8mb4_general_ci,
  `date` date NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int unsigned DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `payments_ibfk_1` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `payments` VALUES('76', '35', '25000.00', '2025-01-08 18:02:28');
INSERT INTO `payments` VALUES('77', '110', '20000.00', '2025-01-08 18:05:49');
INSERT INTO `payments` VALUES('78', '38', '10000.00', '2025-01-08 18:06:20');
INSERT INTO `payments` VALUES('79', '53', '10000.00', '2025-01-08 18:06:38');
INSERT INTO `payments` VALUES('80', '112', '20000.00', '2025-01-08 18:06:49');
INSERT INTO `payments` VALUES('81', '90', '10000.00', '2025-01-08 18:13:35');
INSERT INTO `payments` VALUES('82', '93', '50000.00', '2025-01-08 22:17:45');
INSERT INTO `payments` VALUES('83', '106', '50000.00', '2025-01-08 22:17:56');
INSERT INTO `payments` VALUES('84', '113', '50000.00', '2025-01-08 22:20:40');
INSERT INTO `payments` VALUES('85', '114', '15000.00', '2025-01-08 22:25:06');
INSERT INTO `payments` VALUES('86', '115', '50000.00', '2025-01-08 22:29:22');
INSERT INTO `payments` VALUES('87', '111', '20000.00', '2025-01-08 22:40:42');
INSERT INTO `payments` VALUES('88', '95', '15000.00', '2025-01-08 22:41:52');
INSERT INTO `payments` VALUES('89', '116', '20000.00', '2025-01-09 08:22:18');
INSERT INTO `payments` VALUES('90', '84', '20000.00', '2025-01-09 08:22:28');
INSERT INTO `payments` VALUES('91', '63', '10000.00', '2025-01-09 08:22:40');
INSERT INTO `payments` VALUES('92', '117', '15000.00', '2025-01-09 08:24:57');
INSERT INTO `payments` VALUES('93', '118', '15000.00', '2025-01-09 08:26:03');
INSERT INTO `payments` VALUES('94', '103', '15000.00', '2025-01-09 08:42:00');
INSERT INTO `payments` VALUES('95', '26', '50000.00', '2025-01-09 08:54:13');
INSERT INTO `payments` VALUES('96', '120', '25000.00', '2025-01-09 09:00:12');
INSERT INTO `payments` VALUES('97', '81', '15000.00', '2025-01-10 17:58:18');
INSERT INTO `payments` VALUES('98', '7', '25000.00', '2025-01-13 08:09:09');
INSERT INTO `payments` VALUES('99', '107', '5000.00', '2025-01-13 08:10:10');
INSERT INTO `payments` VALUES('100', '128', '20000.00', '2025-01-13 08:13:17');
INSERT INTO `payments` VALUES('101', '132', '25000.00', '2025-01-13 08:35:05');
INSERT INTO `payments` VALUES('102', '131', '25000.00', '2025-01-13 08:35:14');
INSERT INTO `payments` VALUES('103', '28', '15000.00', '2025-01-13 08:45:11');
INSERT INTO `payments` VALUES('104', '89', '10000.00', '2025-01-13 08:46:27');
INSERT INTO `payments` VALUES('105', '99', '15000.00', '2025-01-13 08:47:25');
INSERT INTO `payments` VALUES('106', '119', '15000.00', '2025-01-13 08:48:35');
INSERT INTO `payments` VALUES('107', '104', '20000.00', '2025-01-13 08:50:20');
INSERT INTO `payments` VALUES('108', '52', '20000.00', '2025-01-13 08:50:27');
INSERT INTO `payments` VALUES('109', '133', '20000.00', '2025-01-13 08:57:41');
INSERT INTO `payments` VALUES('110', '27', '50000.00', '2025-01-13 08:58:40');
INSERT INTO `payments` VALUES('111', '33', '15000.00', '2025-01-14 08:19:56');
INSERT INTO `payments` VALUES('112', '61', '25000.00', '2025-01-14 08:25:40');
INSERT INTO `payments` VALUES('113', '62', '25000.00', '2025-01-14 08:25:47');
INSERT INTO `payments` VALUES('114', '37', '25000.00', '2025-01-14 08:26:29');
INSERT INTO `payments` VALUES('115', '135', '15000.00', '2025-01-14 08:27:12');
INSERT INTO `payments` VALUES('116', '15', '25000.00', '2025-01-14 08:30:55');
INSERT INTO `payments` VALUES('117', '130', '20000.00', '2025-01-14 08:37:10');
INSERT INTO `payments` VALUES('118', '98', '15000.00', '2025-01-14 09:04:20');
INSERT INTO `payments` VALUES('119', '71', '30000.00', '2025-01-14 09:05:08');
INSERT INTO `payments` VALUES('120', '129', '50000.00', '2025-01-16 10:39:10');
INSERT INTO `payments` VALUES('121', '136', '50000.00', '2025-01-16 10:40:17');
INSERT INTO `payments` VALUES('122', '137', '50000.00', '2025-01-16 10:41:22');
INSERT INTO `payments` VALUES('123', '138', '15000.00', '2025-01-16 10:42:13');
INSERT INTO `payments` VALUES('124', '69', '30000.00', '2025-01-17 10:29:38');
INSERT INTO `payments` VALUES('125', '50', '30000.00', '2025-01-17 10:29:45');
INSERT INTO `payments` VALUES('126', '105', '20000.00', '2025-01-17 10:30:53');
INSERT INTO `payments` VALUES('127', '149', '30000.00', '2025-01-20 08:09:58');
INSERT INTO `payments` VALUES('128', '122', '20000.00', '2025-01-20 08:10:09');
INSERT INTO `payments` VALUES('129', '58', '5000.00', '2025-01-20 08:20:43');
INSERT INTO `payments` VALUES('130', '150', '20000.00', '2025-01-20 08:22:31');
INSERT INTO `payments` VALUES('131', '80', '20000.00', '2025-01-20 08:23:30');
INSERT INTO `payments` VALUES('132', '78', '25000.00', '2025-01-20 08:25:09');
INSERT INTO `payments` VALUES('133', '79', '25000.00', '2025-01-20 08:25:15');
INSERT INTO `payments` VALUES('134', '82', '20000.00', '2025-01-20 08:25:54');
INSERT INTO `payments` VALUES('135', '99', '5000.00', '2025-01-20 08:26:51');
INSERT INTO `payments` VALUES('136', '117', '5000.00', '2025-01-20 08:47:03');
INSERT INTO `payments` VALUES('137', '118', '5000.00', '2025-01-20 08:48:40');
INSERT INTO `payments` VALUES('138', '135', '5000.00', '2025-01-21 09:10:05');
INSERT INTO `payments` VALUES('139', '151', '30000.00', '2025-01-21 09:32:16');
INSERT INTO `payments` VALUES('140', '34', '20000.00', '2025-01-21 09:32:50');
INSERT INTO `payments` VALUES('141', '49', '10000.00', '2025-01-21 09:33:08');
INSERT INTO `payments` VALUES('142', '8', '10000.00', '2025-01-21 09:33:21');
INSERT INTO `payments` VALUES('143', '73', '14000.00', '2025-01-21 09:33:35');
INSERT INTO `payments` VALUES('144', '74', '14000.00', '2025-01-21 09:33:47');
INSERT INTO `payments` VALUES('145', '36', '4000.00', '2025-01-22 08:12:44');
INSERT INTO `payments` VALUES('146', '90', '20000.00', '2025-01-22 08:47:17');
INSERT INTO `payments` VALUES('147', '138', '15000.00', '2025-01-22 08:51:27');
INSERT INTO `payments` VALUES('148', '144', '20000.00', '2025-01-24 17:08:48');
INSERT INTO `payments` VALUES('149', '12', '10000.00', '2025-01-24 17:09:09');
INSERT INTO `payments` VALUES('150', '70', '20000.00', '2025-01-24 17:09:31');
INSERT INTO `payments` VALUES('151', '143', '20000.00', '2025-01-24 17:09:44');
INSERT INTO `payments` VALUES('152', '85', '20000.00', '2025-01-24 17:09:58');
INSERT INTO `payments` VALUES('153', '152', '10000.00', '2025-01-27 09:50:42');
INSERT INTO `payments` VALUES('154', '8', '10000.00', '2025-01-27 09:51:11');
INSERT INTO `payments` VALUES('155', '153', '20000.00', '2025-01-27 09:51:55');
INSERT INTO `payments` VALUES('156', '142', '20000.00', '2025-01-27 09:52:12');
INSERT INTO `payments` VALUES('157', '141', '20000.00', '2025-01-27 09:52:22');
INSERT INTO `payments` VALUES('158', '146', '15000.00', '2025-01-27 10:42:33');
INSERT INTO `payments` VALUES('159', '121', '20000.00', '2025-01-30 07:17:50');
INSERT INTO `payments` VALUES('160', '154', '40000.00', '2025-01-30 07:18:58');
INSERT INTO `payments` VALUES('161', '28', '15000.00', '2025-01-30 11:39:51');
INSERT INTO `payments` VALUES('162', '56', '15000.00', '2025-01-30 11:39:59');
INSERT INTO `payments` VALUES('163', '110', '15000.00', '2025-01-30 11:40:08');
INSERT INTO `payments` VALUES('164', '86', '20000.00', '2025-01-30 11:40:18');
INSERT INTO `payments` VALUES('165', '6', '20000.00', '2025-01-30 11:40:27');
INSERT INTO `payments` VALUES('166', '49', '20000.00', '2025-01-30 11:40:35');
INSERT INTO `payments` VALUES('167', '66', '20000.00', '2025-01-30 11:40:44');
INSERT INTO `payments` VALUES('168', '146', '5000.00', '2025-02-03 09:16:18');
INSERT INTO `payments` VALUES('169', '64', '15000.00', '2025-02-03 09:16:41');
INSERT INTO `payments` VALUES('170', '11', '15000.00', '2025-02-03 09:16:51');
INSERT INTO `payments` VALUES('171', '95', '20000.00', '2025-02-03 09:17:06');
INSERT INTO `payments` VALUES('172', '94', '30000.00', '2025-02-03 09:17:22');
INSERT INTO `payments` VALUES('173', '20', '15000.00', '2025-02-03 09:17:33');
INSERT INTO `payments` VALUES('174', '111', '10000.00', '2025-02-03 09:17:46');
INSERT INTO `payments` VALUES('175', '105', '15000.00', '2025-02-03 09:18:00');
INSERT INTO `payments` VALUES('176', '10', '25000.00', '2025-02-03 09:18:24');
INSERT INTO `payments` VALUES('177', '22', '25000.00', '2025-02-03 09:18:55');
INSERT INTO `payments` VALUES('178', '5', '25000.00', '2025-02-03 09:19:40');
INSERT INTO `payments` VALUES('179', '89', '20000.00', '2025-02-03 09:19:57');
INSERT INTO `payments` VALUES('180', '156', '20000.00', '2025-02-03 09:33:37');
INSERT INTO `payments` VALUES('181', '23', '17500.00', '2025-02-03 09:34:00');
INSERT INTO `payments` VALUES('183', '4', '30000.00', '2025-02-03 09:35:15');
INSERT INTO `payments` VALUES('184', '36', '20000.00', '2025-02-03 09:36:23');
INSERT INTO `payments` VALUES('185', '88', '16000.00', '2025-02-03 09:37:50');
INSERT INTO `payments` VALUES('186', '157', '20000.00', '2025-02-03 09:38:46');
INSERT INTO `payments` VALUES('187', '158', '20000.00', '2025-02-03 09:40:02');
INSERT INTO `payments` VALUES('188', '2', '30000.00', '2025-02-03 09:40:52');
INSERT INTO `payments` VALUES('189', '21', '15000.00', '2025-02-04 08:21:33');
INSERT INTO `payments` VALUES('190', '109', '20000.00', '2025-02-04 08:21:41');
INSERT INTO `payments` VALUES('191', '12', '20000.00', '2025-02-04 08:22:09');
INSERT INTO `payments` VALUES('192', '150', '15000.00', '2025-02-04 08:36:44');
INSERT INTO `payments` VALUES('193', '117', '15000.00', '2025-02-04 08:43:12');
INSERT INTO `payments` VALUES('194', '118', '15000.00', '2025-02-04 08:43:20');
INSERT INTO `payments` VALUES('195', '58', '15000.00', '2025-02-04 08:43:44');
INSERT INTO `payments` VALUES('196', '146', '10000.00', '2025-02-04 09:21:29');
INSERT INTO `payments` VALUES('197', '59', '25000.00', '2025-02-04 09:36:35');
INSERT INTO `payments` VALUES('198', '130', '15000.00', '2025-02-04 09:36:59');
INSERT INTO `payments` VALUES('199', '116', '20000.00', '2025-02-05 11:16:55');
INSERT INTO `payments` VALUES('200', '62', '12500.00', '2025-02-05 11:17:03');
INSERT INTO `payments` VALUES('201', '61', '12500.00', '2025-02-05 11:17:28');
INSERT INTO `payments` VALUES('202', '114', '20000.00', '2025-02-05 11:17:38');
INSERT INTO `payments` VALUES('203', '103', '15000.00', '2025-02-05 11:17:48');
INSERT INTO `payments` VALUES('205', '97', '20000.00', '2025-02-05 11:18:30');
INSERT INTO `payments` VALUES('206', '96', '20000.00', '2025-02-05 11:18:48');
INSERT INTO `payments` VALUES('207', '108', '20000.00', '2025-02-05 11:19:01');
INSERT INTO `payments` VALUES('208', '74', '15000.00', '2025-02-05 11:19:16');
INSERT INTO `payments` VALUES('209', '73', '15000.00', '2025-02-05 11:19:31');
INSERT INTO `payments` VALUES('210', '99', '10000.00', '2025-02-05 11:19:40');
INSERT INTO `payments` VALUES('211', '15', '10000.00', '2025-02-05 11:19:50');
INSERT INTO `payments` VALUES('212', '92', '25000.00', '2025-02-05 11:20:03');
INSERT INTO `payments` VALUES('213', '159', '25000.00', '2025-02-06 08:16:58');
INSERT INTO `payments` VALUES('214', '67', '20000.00', '2025-02-06 08:33:11');
INSERT INTO `payments` VALUES('215', '53', '15000.00', '2025-02-06 08:33:35');
INSERT INTO `payments` VALUES('216', '99', '10000.00', '2025-02-06 08:33:59');
INSERT INTO `payments` VALUES('217', '80', '10000.00', '2025-02-06 09:01:37');
INSERT INTO `payments` VALUES('218', '101', '35000.00', '2025-02-06 09:03:14');
INSERT INTO `payments` VALUES('219', '63', '10000.00', '2025-02-06 09:03:24');
INSERT INTO `payments` VALUES('220', '34', '15000.00', '2025-02-07 10:23:50');
INSERT INTO `payments` VALUES('221', '152', '10000.00', '2025-02-07 10:24:08');
INSERT INTO `payments` VALUES('222', '104', '20000.00', '2025-02-07 10:27:18');
INSERT INTO `payments` VALUES('223', '52', '20000.00', '2025-02-07 10:27:28');
INSERT INTO `payments` VALUES('224', '81', '15000.00', '2025-02-08 12:42:18');
INSERT INTO `payments` VALUES('225', '145', '25000.00', '2025-02-08 12:43:09');
INSERT INTO `payments` VALUES('226', '38', '15000.00', '2025-02-10 09:06:26');
INSERT INTO `payments` VALUES('227', '135', '15000.00', '2025-02-10 09:11:34');
INSERT INTO `payments` VALUES('228', '9', '10000.00', '2025-02-10 09:11:43');
INSERT INTO `payments` VALUES('229', '13', '30000.00', '2025-02-10 09:12:08');
INSERT INTO `payments` VALUES('230', '107', '15000.00', '2025-02-10 09:12:17');
INSERT INTO `payments` VALUES('231', '84', '20000.00', '2025-02-10 09:12:29');
INSERT INTO `payments` VALUES('232', '153', '15000.00', '2025-02-10 09:12:38');
INSERT INTO `payments` VALUES('233', '141', '15000.00', '2025-02-10 09:12:49');
INSERT INTO `payments` VALUES('234', '142', '15000.00', '2025-02-10 09:13:00');
INSERT INTO `payments` VALUES('235', '160', '30000.00', '2025-02-10 09:14:39');
INSERT INTO `payments` VALUES('236', '77', '25000.00', '2025-02-10 09:31:09');
INSERT INTO `payments` VALUES('237', '72', '25000.00', '2025-02-10 09:31:17');
INSERT INTO `payments` VALUES('238', '15', '7000.00', '2025-02-10 09:36:19');
INSERT INTO `payments` VALUES('239', '132', '25000.00', '2025-02-10 11:56:16');
INSERT INTO `payments` VALUES('240', '131', '25000.00', '2025-02-10 11:56:27');
INSERT INTO `payments` VALUES('241', '120', '25000.00', '2025-02-12 10:09:19');
INSERT INTO `payments` VALUES('242', '111', '10000.00', '2025-02-12 10:09:29');
INSERT INTO `payments` VALUES('243', '133', '15000.00', '2025-02-12 10:09:37');
INSERT INTO `payments` VALUES('244', '90', '15000.00', '2025-02-12 10:16:04');
INSERT INTO `payments` VALUES('245', '119', '10000.00', '2025-02-13 09:33:40');
INSERT INTO `payments` VALUES('246', '8', '10000.00', '2025-02-19 11:12:11');
INSERT INTO `payments` VALUES('247', '153', '15000.00', '2025-02-19 11:12:27');
INSERT INTO `payments` VALUES('248', '142', '15000.00', '2025-02-19 11:12:47');
INSERT INTO `payments` VALUES('249', '141', '15000.00', '2025-02-19 11:12:59');
INSERT INTO `payments` VALUES('250', '162', '10000.00', '2025-02-19 11:14:47');
INSERT INTO `payments` VALUES('251', '161', '10000.00', '2025-02-19 11:14:53');
INSERT INTO `payments` VALUES('252', '145', '15000.00', '2025-03-03 19:04:46');
INSERT INTO `payments` VALUES('253', '81', '20000.00', '2025-03-04 08:49:56');
INSERT INTO `payments` VALUES('254', '144', '15000.00', '2025-03-04 08:51:03');
INSERT INTO `payments` VALUES('255', '154', '20000.00', '2025-03-04 08:52:34');
INSERT INTO `payments` VALUES('256', '23', '20000.00', '2025-03-04 08:57:32');
INSERT INTO `payments` VALUES('257', '157', '10000.00', '2025-03-04 08:57:52');
INSERT INTO `payments` VALUES('258', '99', '10000.00', '2025-03-04 09:02:27');
INSERT INTO `payments` VALUES('259', '105', '15000.00', '2025-03-04 09:02:41');
INSERT INTO `payments` VALUES('260', '95', '15000.00', '2025-03-04 09:03:19');
INSERT INTO `payments` VALUES('261', '14', '30000.00', '2025-03-04 09:03:40');
INSERT INTO `payments` VALUES('262', '104', '10000.00', '2025-03-04 09:04:38');
INSERT INTO `payments` VALUES('263', '52', '10000.00', '2025-03-04 09:04:48');
INSERT INTO `payments` VALUES('264', '21', '15000.00', '2025-03-04 12:42:39');
INSERT INTO `payments` VALUES('265', '109', '10000.00', '2025-03-04 12:44:14');
INSERT INTO `payments` VALUES('266', '159', '20000.00', '2025-03-04 12:44:29');
INSERT INTO `payments` VALUES('267', '62', '12500.00', '2025-03-04 19:29:45');
INSERT INTO `payments` VALUES('268', '61', '12500.00', '2025-03-04 19:29:51');
INSERT INTO `payments` VALUES('269', '49', '10000.00', '2025-03-04 19:30:15');
INSERT INTO `payments` VALUES('270', '6', '10000.00', '2025-03-04 19:30:25');
INSERT INTO `payments` VALUES('271', '66', '10000.00', '2025-03-04 19:30:39');
INSERT INTO `payments` VALUES('272', '9', '15000.00', '2025-03-04 19:30:49');
INSERT INTO `payments` VALUES('273', '150', '15000.00', '2025-03-04 19:31:01');
INSERT INTO `payments` VALUES('274', '102', '20000.00', '2025-03-05 09:38:22');
INSERT INTO `payments` VALUES('275', '117', '15000.00', '2025-03-05 09:40:11');
INSERT INTO `payments` VALUES('276', '58', '15000.00', '2025-03-05 09:40:53');
INSERT INTO `payments` VALUES('277', '110', '15000.00', '2025-03-05 09:41:13');
INSERT INTO `payments` VALUES('278', '116', '10000.00', '2025-03-05 09:42:39');
INSERT INTO `payments` VALUES('279', '73', '15000.00', '2025-03-05 09:44:00');
INSERT INTO `payments` VALUES('280', '74', '15000.00', '2025-03-05 09:44:07');
INSERT INTO `payments` VALUES('281', '70', '10000.00', '2025-03-05 09:47:33');
INSERT INTO `payments` VALUES('282', '143', '10000.00', '2025-03-05 09:47:41');
INSERT INTO `payments` VALUES('283', '85', '10000.00', '2025-03-05 09:47:48');
INSERT INTO `payments` VALUES('284', '86', '10000.00', '2025-03-05 09:49:44');
INSERT INTO `payments` VALUES('285', '8', '10000.00', '2025-03-05 09:50:42');
INSERT INTO `payments` VALUES('286', '118', '15000.00', '2025-03-05 09:52:01');
INSERT INTO `payments` VALUES('287', '133', '15000.00', '2025-03-05 09:53:38');
INSERT INTO `payments` VALUES('288', '76', '10000.00', '2025-03-05 09:54:08');
INSERT INTO `payments` VALUES('289', '75', '10000.00', '2025-03-05 09:54:21');
INSERT INTO `payments` VALUES('290', '64', '15000.00', '2025-03-05 09:54:31');
INSERT INTO `payments` VALUES('291', '11', '15000.00', '2025-03-05 09:54:43');
INSERT INTO `payments` VALUES('292', '63', '10000.00', '2025-03-05 09:54:56');
INSERT INTO `payments` VALUES('293', '151', '20000.00', '2025-03-05 09:56:09');
INSERT INTO `payments` VALUES('294', '151', '20000.00', '2025-03-05 09:57:33');
INSERT INTO `payments` VALUES('295', '119', '10000.00', '2025-03-05 10:17:50');
INSERT INTO `payments` VALUES('296', '36', '10000.00', '2025-03-06 09:35:07');
INSERT INTO `payments` VALUES('297', '159', '5000.00', '2025-03-06 09:35:36');
INSERT INTO `payments` VALUES('298', '80', '15000.00', '2025-03-06 09:42:43');
INSERT INTO `payments` VALUES('299', '84', '20000.00', '2025-03-06 09:44:17');
INSERT INTO `payments` VALUES('300', '152', '15000.00', '2025-03-06 09:45:05');
INSERT INTO `payments` VALUES('301', '107', '15000.00', '2025-03-06 09:48:22');
INSERT INTO `payments` VALUES('302', '114', '15000.00', '2025-03-06 09:48:39');
INSERT INTO `payments` VALUES('303', '88', '15000.00', '2025-03-06 09:48:57');
INSERT INTO `payments` VALUES('304', '38', '10000.00', '2025-03-06 09:49:19');
INSERT INTO `payments` VALUES('305', '156', '15000.00', '2025-03-06 10:08:58');
INSERT INTO `payments` VALUES('306', '111', '5000.00', '2025-03-06 10:13:56');
INSERT INTO `payments` VALUES('307', '161', '10000.00', '2025-03-06 10:15:43');
INSERT INTO `payments` VALUES('308', '162', '10000.00', '2025-03-06 10:15:51');
INSERT INTO `payments` VALUES('309', '2', '20000.00', '2025-03-07 13:03:50');
INSERT INTO `payments` VALUES('310', '149', '15000.00', '2025-03-10 22:04:11');
INSERT INTO `payments` VALUES('311', '103', '20000.00', '2025-03-14 09:51:33');
INSERT INTO `payments` VALUES('312', '20', '15000.00', '2025-03-14 09:51:51');
INSERT INTO `payments` VALUES('313', '33', '15000.00', '2025-03-17 08:05:08');
INSERT INTO `payments` VALUES('314', '128', '25000.00', '2025-03-17 08:05:25');
INSERT INTO `payments` VALUES('315', '89', '5000.00', '2025-03-17 08:16:06');
INSERT INTO `payments` VALUES('316', '130', '15000.00', '2025-03-17 08:16:27');
INSERT INTO `payments` VALUES('317', '56', '10000.00', '2025-03-17 08:19:05');
INSERT INTO `payments` VALUES('318', '28', '10000.00', '2025-03-17 08:19:18');
INSERT INTO `payments` VALUES('319', '157', '20000.00', '2025-03-17 08:21:37');
INSERT INTO `payments` VALUES('320', '160', '20000.00', '2025-03-17 08:52:44');
INSERT INTO `payments` VALUES('321', '73', '6000.00', '2025-03-18 09:42:25');
INSERT INTO `payments` VALUES('322', '74', '6000.00', '2025-03-18 09:42:31');
INSERT INTO `payments` VALUES('323', '63', '10000.00', '2025-03-18 09:42:46');
INSERT INTO `payments` VALUES('324', '135', '15000.00', '2025-03-18 09:42:59');
INSERT INTO `payments` VALUES('325', '138', '18000.00', '2025-03-18 09:43:19');
INSERT INTO `payments` VALUES('326', '90', '4000.00', '2025-03-18 09:43:31');
INSERT INTO `payments` VALUES('327', '4', '15000.00', '2025-03-18 09:43:41');
INSERT INTO `payments` VALUES('328', '34', '15000.00', '2025-03-18 09:43:50');
INSERT INTO `payments` VALUES('329', '14', '2000.00', '2025-03-18 10:12:00');



CREATE TABLE `student_assessments` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `student_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `assessment_date` date NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `plan_id` (`plan_id`),
  KEY `student_id` (`student_id`),
  KEY `fk_student_assessments_subject` (`subject_id`),
  CONSTRAINT `fk_student_assessments_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  CONSTRAINT `student_assessments_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `weekly_plans` (`plan_id`),
  CONSTRAINT `student_assessments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_general_ci NOT NULL,
  `parent_phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `students` VALUES('1', 'Patuma Afick', '8', '2009-01-01', 'Female', '1', '2025-01-06 08:46:31');
INSERT INTO `students` VALUES('2', 'Chifuniro Alfred', '8', '2010-05-29', 'Male', '0888729381', '2025-01-06 09:04:07');
INSERT INTO `students` VALUES('3', 'Mevis Kwenje', '7', '2010-10-10', 'Female', '0998070604', '2025-01-06 09:06:21');
INSERT INTO `students` VALUES('4', 'Samson Linje ', '7', '2013-01-01', 'Male', '1', '2025-01-06 09:07:13');
INSERT INTO `students` VALUES('5', 'Sophie Yotum ', '7', '2010-04-20', 'Female', '0992436379', '2025-01-06 09:08:20');
INSERT INTO `students` VALUES('6', 'Mercy Kachingwe', '3', '2017-01-22', 'Female', '1', '2025-01-06 09:09:28');
INSERT INTO `students` VALUES('7', 'Blessings Khuoge', '3', '2019-01-19', 'Male', '0882649581', '2025-01-06 09:10:33');
INSERT INTO `students` VALUES('8', 'Trust Mpoto', '3', '2018-06-29', 'Male', '0982540199', '2025-01-06 09:11:15');
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
INSERT INTO `students` VALUES('23', 'Favour Malijani ', '5', '2015-08-09', 'Female', '0888711108', '2025-01-06 09:41:38');
INSERT INTO `students` VALUES('24', 'Stain Kwenje ', '5', '2012-05-12', 'Male', '0998070604', '2025-01-06 09:42:24');
INSERT INTO `students` VALUES('25', 'Royce Yusuf ', '5', '2015-01-26', 'Female', '0993820731', '2025-01-06 09:43:13');
INSERT INTO `students` VALUES('26', 'Ivy Chizombe ', '5', '2013-11-21', 'Female', '1', '2025-01-06 09:43:37');
INSERT INTO `students` VALUES('27', 'Imran Yusuf', '6', '2013-09-15', 'Male', '0993820731', '2025-01-06 09:45:05');
INSERT INTO `students` VALUES('28', 'Jamil Alan ', 'nurs', '2020-01-01', 'Male', '0991850902', '2025-01-06 09:51:14');
INSERT INTO `students` VALUES('31', 'Rita Majawa ', 'rec', '2020-01-01', 'Female', '1', '2025-01-06 09:53:49');
INSERT INTO `students` VALUES('32', 'Temwanani Luhanga ', '1', '2019-09-08', 'Female', '0888870911', '2025-01-06 09:55:12');
INSERT INTO `students` VALUES('33', 'Mundiwa Yobe ', 'rec', '2019-01-01', 'Female', '1', '2025-01-06 09:55:43');
INSERT INTO `students` VALUES('34', 'Linry Phiri', 'rec', '2019-01-01', 'Female', '1', '2025-01-06 09:56:07');
INSERT INTO `students` VALUES('35', 'Kelvin Maganga ', 'rec', '2019-01-01', 'Male', '1', '2025-01-06 09:56:27');
INSERT INTO `students` VALUES('36', 'Felix Kananji', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:56:52');
INSERT INTO `students` VALUES('37', 'Priscilla Matekenya ', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:57:23');
INSERT INTO `students` VALUES('38', 'Annie Rich ', 'nurs', '2020-01-01', 'Female', '1', '2025-01-06 09:57:45');
INSERT INTO `students` VALUES('39', 'Patience Mphaya ', '1', '2019-11-01', 'Male', '1', '2025-01-06 10:00:28');
INSERT INTO `students` VALUES('40', 'Jonathan Chapola ', '1', '2019-01-01', 'Male', '1', '2025-01-06 10:01:20');
INSERT INTO `students` VALUES('41', 'Afrahim Omar', '1', '2019-01-01', 'Female', '1', '2025-01-06 10:01:40');
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
INSERT INTO `students` VALUES('54', 'Caefas Bester ', '2', '2018-01-01', 'Male', '1111', '2025-01-06 10:08:58');
INSERT INTO `students` VALUES('56', 'Reshima Alan ', '4', '2015-04-03', 'Female', '0991850902', '2025-01-06 10:21:30');
INSERT INTO `students` VALUES('57', 'Glory Chokani', '4', '2016-04-11', 'Female', '1', '2025-01-06 10:21:56');
INSERT INTO `students` VALUES('58', 'Vanessa Yusuf ', '4', '2016-12-02', 'Female', '1', '2025-01-06 10:22:26');
INSERT INTO `students` VALUES('59', 'Promise Mlanje ', '4', '2017-07-05', 'Male', '1', '2025-01-06 10:23:04');
INSERT INTO `students` VALUES('60', 'Grym Namacha ', '4 ', '2016-03-04', 'Male', '1', '2025-01-06 10:24:15');
INSERT INTO `students` VALUES('61', 'Tadala Jamson ', '4', '2016-01-21', 'Female', '111', '2025-01-06 10:24:45');
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
INSERT INTO `students` VALUES('90', 'Regina Kafisi', '5', '2013-12-11', 'Female', '0888522001', '2025-01-07 08:44:56');
INSERT INTO `students` VALUES('92', 'Beatrice William ', '5', '2015-06-05', 'Female', '1', '2025-01-07 08:46:03');
INSERT INTO `students` VALUES('93', 'Praise Mbungo', '5', '2013-06-19', 'Male', '1', '2025-01-07 08:46:31');
INSERT INTO `students` VALUES('94', 'Benjamin Kabango ', '5', '2011-02-13', 'Male', '1', '2025-01-07 08:47:20');
INSERT INTO `students` VALUES('95', 'Victor Mandeule', '6', '2013-06-16', 'Male', '0886958797', '2025-01-07 08:49:38');
INSERT INTO `students` VALUES('96', 'Kenn Kalulu', '6', '2013-04-27', 'Male', '0885715859', '2025-01-07 08:50:18');
INSERT INTO `students` VALUES('97', 'Kelvin Kalulu', '6', '2010-12-15', 'Male', '0885715859', '2025-01-07 08:51:01');
INSERT INTO `students` VALUES('99', 'Grey Nkosi', '6', '2012-11-08', 'Male', '0999966390', '2025-01-07 08:52:16');
INSERT INTO `students` VALUES('100', 'Sandra Mphande ', '6', '2012-12-25', 'Male', '0992267999', '2025-01-07 08:52:54');
INSERT INTO `students` VALUES('101', 'Prisca Banda', '6', '2014-02-25', 'Female', '1', '2025-01-07 08:53:21');
INSERT INTO `students` VALUES('102', 'Miracle Mponda', '6', '2015-03-15', 'Female', '0882753275', '2025-01-07 08:53:52');
INSERT INTO `students` VALUES('103', 'Fatima Aufi ', '6', '2013-01-31', 'Female', '1', '2025-01-07 08:54:20');
INSERT INTO `students` VALUES('104', 'Stella Masakatira ', '6', '2013-06-16', 'Female', '0999759053', '2025-01-07 08:55:01');
INSERT INTO `students` VALUES('105', 'Prince Thom ', '6', '2013-12-05', 'Male', '0881846317', '2025-01-07 08:55:58');
INSERT INTO `students` VALUES('106', 'Joshua Mbungo ', '6', '2009-07-19', 'Male', '088900465', '2025-01-07 08:56:24');
INSERT INTO `students` VALUES('107', 'Leticia Martin ', '2', '2019-02-12', 'Female', '1', '2025-01-07 08:59:48');
INSERT INTO `students` VALUES('108', 'Katrina Kalulu', '4', '2016-05-06', 'Female', '0885715859', '2025-01-07 09:04:49');
INSERT INTO `students` VALUES('109', 'Martha Story ', '4', '2015-12-25', 'Female', '1', '2025-01-07 09:07:56');
INSERT INTO `students` VALUES('110', 'Agness Kumba ', '5', '2013-03-28', 'Female', '0999279754', '2025-01-08 07:54:06');
INSERT INTO `students` VALUES('111', 'clever Ntakanya ', '5', '2014-05-06', 'Male', '1', '2025-01-08 08:11:19');
INSERT INTO `students` VALUES('112', 'Happy Ntakanya ', '5', '2010-04-05', 'Male', '1', '2025-01-08 08:11:44');
INSERT INTO `students` VALUES('113', 'Kefasi Peter', '2', '2019-05-06', 'Male', '0888900461', '2025-01-08 22:20:28');
INSERT INTO `students` VALUES('114', 'Keith Chiwaya', '4', '2017-05-06', 'Male', '0884860544', '2025-01-08 22:24:51');
INSERT INTO `students` VALUES('115', 'Shalif Yusuf', '4', '2014-12-04', 'Male', '1', '2025-01-08 22:29:04');
INSERT INTO `students` VALUES('116', 'Royce Chikalemba', '3', '2015-06-10', 'Female', '0999279754', '2025-01-09 08:11:26');
INSERT INTO `students` VALUES('117', 'Pemphero Yusuf', '4', '2015-03-22', 'Female', '0991652257', '2025-01-09 08:24:47');
INSERT INTO `students` VALUES('118', 'Praise Yusuf', 'rec', '2019-02-04', 'Male', '0991652257', '2025-01-09 08:25:49');
INSERT INTO `students` VALUES('119', 'Manuel Kasongo', '5', '2011-05-06', 'Male', '1', '2025-01-09 08:39:52');
INSERT INTO `students` VALUES('120', 'Joshua Tengatenga ', '2', '2017-02-22', 'Male', '1', '2025-01-09 09:00:00');
INSERT INTO `students` VALUES('121', 'Acram Yusuf Ahmad', '3', '2014-02-06', 'Male', '1', '2025-01-10 10:16:26');
INSERT INTO `students` VALUES('122', 'Tumero Kokota', '3', '2014-02-22', 'Male', '0882676939', '2025-01-10 10:16:51');
INSERT INTO `students` VALUES('123', 'Emmanuel Muliya', '1', '2018-04-05', 'Male', '12', '2025-01-10 10:22:44');
INSERT INTO `students` VALUES('124', 'Nedson Gama ', '1', '2018-07-05', 'Male', '1', '2025-01-10 10:26:14');
INSERT INTO `students` VALUES('125', 'Alinafe Zembesani', '1', '2018-04-21', 'Female', '1010', '2025-01-10 10:26:49');
INSERT INTO `students` VALUES('126', 'Razak Niks', '1', '2018-05-06', 'Male', '1', '2025-01-10 10:28:35');
INSERT INTO `students` VALUES('127', 'Royce Chisoso', '1', '2018-02-04', 'Female', '1', '2025-01-10 10:29:09');
INSERT INTO `students` VALUES('128', 'Avia Malodza', 'rec', '2019-08-23', 'Female', '088845866', '2025-01-13 08:12:10');
INSERT INTO `students` VALUES('129', 'Princess Stolo', '7', '2010-09-13', 'Female', ' 0880865783', '2025-01-13 08:18:12');
INSERT INTO `students` VALUES('130', 'Cliff Kasenda ', '7', '2010-09-02', 'Male', '0884418364', '2025-01-13 08:26:47');
INSERT INTO `students` VALUES('131', 'Muhammad sayeed', '5', '2012-05-06', 'Male', '0888805867', '2025-01-13 08:30:17');
INSERT INTO `students` VALUES('132', 'Raheem Chiwala', '5', '2012-02-05', 'Male', '0885959726', '2025-01-13 08:31:24');
INSERT INTO `students` VALUES('133', 'Arthur Majawa', '6', '2012-10-10', 'Male', '0988957776', '2025-01-13 08:57:27');
INSERT INTO `students` VALUES('134', 'Alvin Mlombwa', '1', '2018-05-04', 'Male', '111', '2025-01-14 08:21:13');
INSERT INTO `students` VALUES('135', 'Kelvin Adam ', '4', '2015-04-06', 'Male', '1', '2025-01-14 08:25:01');
INSERT INTO `students` VALUES('136', 'Rashida Mwasamwa', 'rec', '2018-05-04', 'Female', '1', '2025-01-16 10:40:02');
INSERT INTO `students` VALUES('137', 'Munira Mwasamwa', '4', '2018-04-05', 'Female', '1', '2025-01-16 10:41:03');
INSERT INTO `students` VALUES('138', 'Loveness Fredrick ', '7', '2012-04-05', 'Female', '1', '2025-01-16 10:42:00');
INSERT INTO `students` VALUES('139', 'Innocent Yohane ', '1', '2019-12-21', 'Male', '1', '2025-01-17 10:21:32');
INSERT INTO `students` VALUES('140', 'Favour Makweza', '5', '2014-03-24', 'Male', '1', '2025-01-17 10:33:37');
INSERT INTO `students` VALUES('141', 'Haroon Adam ', '6', '2011-09-20', 'Female', '0888336845', '2025-01-17 10:37:22');
INSERT INTO `students` VALUES('142', 'Rashida Adam ', '6', '2011-09-20', 'Female', '0888336845', '2025-01-17 10:37:54');
INSERT INTO `students` VALUES('143', 'Vincent Paliyani ', '4', '2015-06-16', 'Male', '1', '2025-01-17 10:42:03');
INSERT INTO `students` VALUES('144', 'Mevis Makwapala', '4', '2015-05-04', 'Female', '0884844873', '2025-01-17 10:42:40');
INSERT INTO `students` VALUES('145', 'Trinity Kanene', '4', '2016-05-23', 'Female', '1', '2025-01-17 10:43:19');
INSERT INTO `students` VALUES('146', 'Hope Jubeck', '4', '2016-02-13', 'Male', '0889784520', '2025-01-17 10:44:21');
INSERT INTO `students` VALUES('147', 'Razia Adam', '1', '2018-05-15', 'Female', '1', '2025-01-20 07:39:05');
INSERT INTO `students` VALUES('148', 'Chifundo Faison ', '1', '2018-05-06', 'Male', '11', '2025-01-20 07:41:44');
INSERT INTO `students` VALUES('149', 'Martha July', '6', '2013-05-04', 'Female', '1', '2025-01-20 08:09:03');
INSERT INTO `students` VALUES('150', 'Asha Kayimaima', '3', '2017-07-12', 'Male', '0982819207', '2025-01-20 08:21:30');
INSERT INTO `students` VALUES('151', 'Shamim Majawa', '6', '2012-09-03', 'Female', '1', '2025-01-21 09:31:44');
INSERT INTO `students` VALUES('152', 'Chrispin Amos', '6', '2013-03-30', 'Male', '1', '2025-01-27 09:50:07');
INSERT INTO `students` VALUES('153', 'Miriam Nkuchika', '3', '2015-05-04', 'Female', '1', '2025-01-27 09:51:45');
INSERT INTO `students` VALUES('154', 'Regina Brown ', '8', '2010-06-05', 'Female', '1', '2025-01-30 07:18:33');
INSERT INTO `students` VALUES('155', 'Wonderful Makweza', '1', '2017-06-05', 'Male', '1', '2025-01-30 11:19:43');
INSERT INTO `students` VALUES('156', 'Shamim Kaonjola', '5', '2012-05-04', 'Male', '0982875369', '2025-02-03 09:33:20');
INSERT INTO `students` VALUES('157', 'Lusauyo Nyirenda', '5', '2012-05-04', 'Male', '1', '2025-02-03 09:38:36');
INSERT INTO `students` VALUES('158', 'Asiyatu Cassim Bushiri', '3', '2012-02-05', 'Female', '1', '2025-02-03 09:39:47');
INSERT INTO `students` VALUES('159', 'Shaniza Maiden ', 'nurs', '2019-05-06', 'Female', '0989844954', '2025-02-06 08:16:40');
INSERT INTO `students` VALUES('160', 'Emmanuel Harrison ', 'rec', '2019-10-11', 'Male', '1', '2025-02-10 09:14:31');
INSERT INTO `students` VALUES('161', 'Constance Dzanjalimodzi', '3', '2017-05-12', 'Male', '1', '2025-02-19 11:13:40');
INSERT INTO `students` VALUES('162', 'Comfort Dzanjalimodzi', '3', '2017-05-06', 'Male', '1', '2025-02-19 11:14:17');



CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_name` (`subject_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `subjects` VALUES('1', 'Mathematics');



CREATE TABLE `teacher_attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_attendance_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `teacher_performance` (
  `performance_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `month` date NOT NULL,
  `student_success_rate` decimal(5,2) DEFAULT '0.00',
  `attendance_rate` decimal(5,2) DEFAULT '0.00',
  `parent_feedback_score` decimal(5,2) DEFAULT '0.00',
  `peer_review_score` decimal(5,2) DEFAULT '0.00',
  `student_feedback_score` decimal(5,2) DEFAULT '0.00',
  `professional_development_hours` int DEFAULT '0',
  `extra_activities_conducted` int DEFAULT '0',
  PRIMARY KEY (`performance_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_performance_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `teacher_subjects` (
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`teacher_id`,`subject_id`,`class`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_general_ci NOT NULL,
  `hire_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `teachers` VALUES('1', 'Mr Kwenje', 'frankkwenje@gmail.com', '0998070604', 'Male', '2013-09-30', '2025-01-31 18:55:34');



CREATE TABLE `weekly_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `week_start_date` date NOT NULL,
  `topics` text COLLATE utf8mb4_general_ci NOT NULL,
  `learning_objectives` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`plan_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `weekly_plans_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `weekly_plans_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



SET FOREIGN_KEY_CHECKS=1;