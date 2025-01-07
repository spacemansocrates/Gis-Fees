-- GIS Database Backup
-- Generated: 2025-01-06 06:02:27

SET FOREIGN_KEY_CHECKS=0;



CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `payments_ibfk_1` (`student_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `payments` VALUES('5', '1', '500.00', '2025-01-06 00:03:04');
INSERT INTO `payments` VALUES('24', '0', '200.00', '2025-01-06 00:45:31');



CREATE TABLE `students` (
  `student_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `class` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `parent_phone` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `students` VALUES('0', 'tim brooke', '4', '2011-10-13', 'Male', '58655465', '2025-01-06 00:04:25');
INSERT INTO `students` VALUES('1', 'Grace Gumbo', '8', '2010-06-10', 'Female', '088835656', '2025-01-05 23:40:25');


SET FOREIGN_KEY_CHECKS=1;