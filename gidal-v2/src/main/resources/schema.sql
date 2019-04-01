CREATE TABLE `user` (
                        `id` bigint(11) NOT NULL AUTO_INCREMENT,
                        `user_email` varchar(50) NOT NULL DEFAULT '',
                        `user_phoneNum` varchar(50) NOT NULL,
                        `user_name` varchar(20) NOT NULL,
                        `user_password` varchar(70) NOT NULL,
                        `user_gender` varchar(10) NOT NULL,
                        `enterprise_yn` varchar(11) NOT NULL DEFAULT '',
                        `admin_yn` varchar(5) NOT NULL DEFAULT '',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;