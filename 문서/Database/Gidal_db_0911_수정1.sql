CREATE TABLE `USER` (
	`user_email`	varchar(50)	NOT NULL,
	`user_phoneNum`	varchar(20)	NOT NULL,
	`user_name`	varchar(20)	NOT NULL,
	`user_password`	varchar(50)	NOT NULL,
	`user_passwordConfirm`	varchar(50)	NOT NULL,
	`user_gender`	varchar(10)	NOT NULL,
	`user_phoneNumCertification`	varchar(50)	NULL	COMMENT '미정'
);

CREATE TABLE `ZIPCODE` (
	`z_id`	int	NOT NULL	COMMENT 'auto_crement',
	`z_zipCode`	number(6)	NOT NULL,
	`z_sido`	varchar(50)	NOT NULL,
	`z_sigungu`	varchar(50)	NOT NULL,
	`z_dong`	varchar(50)	NOT NULL,
	`z_ri`	varchar(50)	NULL,
	`z_addrs`	varchar(50)	NULL
);

CREATE TABLE `REVIEW` (
	`review_code`	VARCHAR(255)	NOT NULL,
	`enterprise_code`	varchar(50)	NOT NULL,
	`user_email`	varchar(50)	NOT NULL,
	`review_scope`	int	NOT NULL,
	`review_text`	varchar(1000)	NOT NULL,
	`review_count`	int	NOT NULL,
	`review_commandText`	varchar(1000)	NULL,
	`review_ref`	int	NOT NULL,
	`review_lev`	int	NOT NULL,
	`review_seq`	int	NOT NULL
);

CREATE TABLE `RESERVE` (
	`reserve_code`	varchar(50)	NOT NULL,
	`enterprise_code`	varchar(50)	NOT NULL,
	`user_phoneNum`	varchar(20)	NOT NULL,
	`reserve_personnel`	int	NULL,
	`reserve_date`	varchar(50)	NULL,
	`reserve_time`	varchar(50)	NULL
);

CREATE TABLE `ENTERPRISE` (
	`enterprise_email`	varchar(50)	NOT NULL,
	`enterprise_code`	varchar(50)	NOT NULL,
	`enterprise_password`	varchar(50)	NOT NULL,
	`enterprise_passwordConfirm`	varchar(50)	NOT NULL,
	`enterprise_name`	varhcar(10)	NOT NULL,
	`enterprise_gender`	varchar(10)	NOT NULL,
	`enterprise_phoneNum`	varchar(20)	NOT NULL,
	`enterprise_businessName`	varchar(50)	NOT NULL,
	`enterprise_phone`	varchar(20)	NOT NULL,
	`enterprise_sectors`	varchar(50)	NOT NULL,
	`enterprise_service`	varchar(1000)	NOT NULL,
	`enterprise_mainImg`	varchar(1000)	NOT NULL,
	`enterprise_img1`	varchar(1000)	NULL,
	`enterprise_img2`	varchar(1000)	NULL,
	`enterprise_img3`	varchar(1000)	NULL,
	`enterprise_img4`	varchar(1000)	NULL,
	`enterprise_adress`	varchar(100)	NOT NULL,
	`enterprise_adressDetail`	varchar(100)	NOT NULL,
	`enterprise_operationTime`	varchar(100)	NOT NULL,
	`enterprise_breakTime`	varchar(100)	NULL,
	`enterprise_closed`	varchar(100)	NOT NULL,
	`z_id`	int	NOT NULL	COMMENT 'auto_crement'
);

CREATE TABLE `WAITING` (
	`waiting_code`	varchar(50)	NOT NULL,
	`user_phoneNum`	varchar(20)	NOT NULL,
	`enterprise_code`	varchar(50)	NOT NULL,
	`waiting_personnel`	int	NOT NULL,
	`waiting_date`	varchar(50)	NULL	COMMENT '현재시간',
	`waiting_time`	varchar(50)	NULL	COMMENT '현재시간'
);

CREATE TABLE `JJIM` (
	`user_email`	varchar(50)	NOT NULL,
	`enterprise_code`	varchar(50)	NOT NULL,
	`jjim_count`	int	NULL
);

ALTER TABLE `USER` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_email`,
	`user_phoneNum`
);

ALTER TABLE `ZIPCODE` ADD CONSTRAINT `PK_ZIPCODE` PRIMARY KEY (
	`z_id`
);

ALTER TABLE `REVIEW` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_code`
);

ALTER TABLE `RESERVE` ADD CONSTRAINT `PK_RESERVE` PRIMARY KEY (
	`reserve_code`,
	`enterprise_code`,
	`user_phoneNum`
);

ALTER TABLE `ENTERPRISE` ADD CONSTRAINT `PK_ENTERPRISE` PRIMARY KEY (
	`enterprise_email`,
	`enterprise_code`
);

ALTER TABLE `WAITING` ADD CONSTRAINT `PK_WAITING` PRIMARY KEY (
	`waiting_code`,
	`user_phoneNum`,
	`enterprise_code`
);

ALTER TABLE `JJIM` ADD CONSTRAINT `PK_JJIM` PRIMARY KEY (
	`user_email`,
	`enterprise_code`
);

ALTER TABLE `RESERVE` ADD CONSTRAINT `FK_ENTERPRISE_TO_RESERVE_1` FOREIGN KEY (
	`enterprise_code`
)
REFERENCES `ENTERPRISE` (
	`enterprise_code`
);

ALTER TABLE `RESERVE` ADD CONSTRAINT `FK_USER_TO_RESERVE_1` FOREIGN KEY (
	`user_phoneNum`
)
REFERENCES `USER` (
	`user_phoneNum`
);

ALTER TABLE `WAITING` ADD CONSTRAINT `FK_USER_TO_WAITING_1` FOREIGN KEY (
	`user_phoneNum`
)
REFERENCES `USER` (
	`user_phoneNum`
);

ALTER TABLE `WAITING` ADD CONSTRAINT `FK_ENTERPRISE_TO_WAITING_1` FOREIGN KEY (
	`enterprise_code`
)
REFERENCES `ENTERPRISE` (
	`enterprise_code`
);

ALTER TABLE `JJIM` ADD CONSTRAINT `FK_USER_TO_JJIM_1` FOREIGN KEY (
	`user_email`
)
REFERENCES `USER` (
	`user_email`
);

ALTER TABLE `JJIM` ADD CONSTRAINT `FK_ENTERPRISE_TO_JJIM_1` FOREIGN KEY (
	`enterprise_code`
)
REFERENCES `ENTERPRISE` (
	`enterprise_code`
);

