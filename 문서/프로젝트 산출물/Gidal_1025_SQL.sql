CREATE TABLE `enterprise` (
	`enterprise_code` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`enterprise_email` VARCHAR(50) NOT NULL,
	`enterprise_password` VARCHAR(70) NOT NULL,
	`enterprise_name` VARCHAR(50) NOT NULL DEFAULT '0',
	`enterprise_businessName` VARCHAR(50) NOT NULL DEFAULT '0',
	`enterprise_phone` VARCHAR(50) NOT NULL DEFAULT '0',
	`enterprise_sectors` VARCHAR(30) NOT NULL DEFAULT '0',
	`enterprise_service` VARCHAR(30) NOT NULL DEFAULT '0',
	`enterprise_mainImg` VARCHAR(100) NOT NULL DEFAULT '0',
	`enterprise_add1` VARCHAR(50) NULL DEFAULT '0',
	`enterprise_add2` VARCHAR(50) NULL DEFAULT '0',
	`enterprise_add3` VARCHAR(50) NULL DEFAULT '0',
	`enterprise_operatingOpenTime` VARCHAR(50) NULL DEFAULT '0',
	`enterprise_operatingCloseTime` VARCHAR(50) NULL DEFAULT '0',
	`enterprise_closed` VARCHAR(20) NULL DEFAULT '0',
	PRIMARY KEY (`enterprise_code`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=165
;


CREATE TABLE `event` (
	`event_no` INT(11) NOT NULL AUTO_INCREMENT,
	`event_title` VARCHAR(100) NOT NULL,
	`event_startDate` DATE NOT NULL,
	`event_endDate` DATE NOT NULL,
	`event_image` VARCHAR(200) NULL DEFAULT NULL,
	`event_content` VARCHAR(1000) NULL DEFAULT NULL,
	PRIMARY KEY (`event_no`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;


CREATE TABLE `reserve` (
	`reserve_code` INT(11) NOT NULL AUTO_INCREMENT,
	`enterprise_code` INT(11) NOT NULL DEFAULT '0',
	`reserve_personnel` INT(11) NULL DEFAULT NULL,
	`reserve_date` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`reserve_time` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`user_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`user_phoneNum` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`reserve_yn` VARCHAR(3) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`reserve_comfirmation` VARCHAR(3) NULL DEFAULT NULL COLLATE 'utf8_bin',
	PRIMARY KEY (`reserve_code`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=82
;


CREATE TABLE `review` (
	`review_code` INT(11) NOT NULL AUTO_INCREMENT,
	`enterprise_code` INT(11) NOT NULL DEFAULT '0',
	`reserveAndWaiting_code` VARCHAR(50) NULL DEFAULT NULL,
	`review_text` VARCHAR(1000) NOT NULL DEFAULT '0',
	`user_email` VARCHAR(50) NOT NULL DEFAULT '0',
	`review_scope` INT(11) NOT NULL,
	`enterprise_text` VARCHAR(1000) NULL DEFAULT NULL,
	PRIMARY KEY (`review_code`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=47
;


CREATE TABLE `user` (
	`user_phoneNum` VARCHAR(50) NOT NULL,
	`user_email` VARCHAR(50) NOT NULL,
	`user_name` VARCHAR(20) NOT NULL,
	`user_password` VARCHAR(70) NOT NULL,
	`user_gender` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`user_email`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `waiting` (
	`waiting_code` INT(11) NOT NULL AUTO_INCREMENT,
	`enterprise_code` INT(11) NULL DEFAULT NULL,
	`waiting_personnel` INT(11) NULL DEFAULT NULL,
	`user_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`user_phoneNum` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`waiting_now` TIMESTAMP NOT NULL DEFAULT '',
	`waiting_yn` VARCHAR(3) NULL DEFAULT NULL COLLATE 'utf8_bin',
	PRIMARY KEY (`waiting_code`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=71
;





