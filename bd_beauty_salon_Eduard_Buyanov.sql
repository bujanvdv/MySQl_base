/* 
Проект: Запись в салон красоты.
Цель  : Идея моего проекта в том, что я дам возможность людям самостоятельно записываться в салон
        красоты к определенному мастеру на различные процедуры.
		Мой сайт будет отличной площадкой для самозанятых парикмахеров, котрые ведут свой бизнес.
*/

DROP DATABASE IF EXISTS beauty_salon; 
CREATE DATABASE beauty_salon;
USE beauty_salon;


-- ----------------------------------------------------------------------------------------
-- Услуги 
DROP TABLE IF EXISTS `services`; 
CREATE TABLE `services` (
  `id` SERIAL PRIMARY KEY,
  `name_services` varchar(50) DEFAULT NULL,
  `body` text
)
;

INSERT INTO services
  (`id`, `name_services`, `body`)
VALUES
  ('1', 'Стрижка','Женская стрижка + укладка'),
  ('2', 'Стрижка челки','Стрижка челки за 10 минут'),
  ('3', 'Укладка','Любая укладка на ваш вкус'),
  ('4', 'Сложное окрашивание','Мелирование, колорирование, шатуш, балаяж'),
  ('5', 'Осветление маслом','Эффект выгоревших волос "Солнечный поцелуй"'),
  ('6', 'Осветление корней и тонирование','Классическое осветление корней'),
  ('7', 'Счастье для волос LEBEL','Японское восстановление волос'),
  ('8', 'Ботокс для волос','BIXYPLASTIA Honma Tokyo');

-- ----------------------------------------------------------------------------------------
-- Категория услуг
DROP TABLE IF EXISTS `categories`; 
CREATE TABLE `categories` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(50) DEFAULT NULL
);

INSERT INTO `categories`
VALUES
('1', 'Окрашивание'),
('2', 'Стрижки'),
('3', 'SPA уход'),
('4', 'Брови');

-- ----------------------------------------------------------------------------------------


-- Мастера
DROP TABLE IF EXISTS `masters`;
CREATE TABLE `masters` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(50) DEFAULT null,
  `surname` varchar(50) DEFAULT NULL
);

INSERT INTO `masters`
  (`id`, `name`, `surname`)
VALUES
	('1', 'Анастасия', 'Буянова'),
	('2', 'Екатерина', 'Сидорова'),
	('3', 'Алина', 'Грицай'),
	('4', 'Светлана', 'Иванова'),
	
-- ----------------------------------------------------------------------------------------

-- Клиенты 
DROP TABLE IF EXISTS client;
CREATE TABLE `client` (
	`id` SERIAL PRIMARY KEY,
	`firstname` varchar(50) DEFAULT NULL,
	`lastname` varchar(50) DEFAULT NULL,
	`birthday` date,
	`email` varchar(120) DEFAULT NULL,
	`phone` bigint DEFAULT NULL,
	KEY index_of_email(email),
	KEY index_of_phone(phone)
);

INSERT INTO `client`
  (`id`, `firstname`, `lastname`, `birthday`, `email`, `phone`)
VALUES
	('1', 'Reuben', 'Nienow','1973-10-17', 'arlo50@example.org', '9374071116'),
	('2', 'Frederik', 'Upton','1976-04-19','terrence.cartwright@example.org', '9127498182'),
	('3', 'Unique', 'Windler','1983-09-07', 'rupert55@example.org', '9921090703'),
	('4', 'Norene', 'West','2014-07-31', 'rebekah29@example.net', '9592139196'),
	('5', 'Frederick', 'Effertz','1975-03-26', 'von.bridget@example.net', '9909791725'),
	('6', 'Victoria', 'Medhurst','1999-03-26', 'sstehr@example.net', '9456642385'),
	('7', 'Austyn', 'Braun', '1978-03-06','itzel.beahan@example.com', '9448906606'),
	('8', 'Jaida', 'Kilback', '1965-09-12','johnathan.wisozk@example.com', '9290679311'),
	('9', 'Mireya', 'Orn','1986-11-07', 'missouri87@example.org', '9228624339'),
	('10', 'Jordyn', 'Jerde','1975-03-26', 'edach@example.com', '9443126821'),
	('11', 'Thad', 'McDermott','1975-03-26', 'shaun.ferry@example.org', '9840726982'),
	('12', 'Aiden', 'Runolfsdottir','1975-03-26', 'doug57@example.net', '9260442904'),
	('13', 'Bernadette', 'Haag','1975-03-26', 'lhoeger@example.net', '9984574866'),
	('14', 'Dedric', 'Stanton','1975-03-26', 'tconsidine@example.org', '9499932439'),
	('15', 'Clare', 'Wolff','1975-03-26', 'effertz.laverna@example.org', '9251665331'),
	('16', 'Lina', 'Macejkovic','1975-03-26','smitham.demarcus@example.net', '9762021357'),
	('17', 'Jerrell', 'Stanton', '1975-03-26','deja00@example.com', '9191103792'),
	('18', 'Golden', 'Wisozk','1975-03-26', 'frida19@example.com', '9331565437'),
	('19', 'Elisa', 'Balistreri','1975-03-26', 'romaine27@example.org', '9372983850'),
	('20', 'Reed', 'Bogan','1975-03-26', 'zhyatt@example.com', '9924753974'),
	('21', 'Gwendolyn', 'McClure','1975-03-26', 'zluettgen@example.net', '9745046704'),
	('22', 'Luz', 'Bailey','1975-03-26', 'tillman.iliana@example.org', '9881942174'),
	('23', 'Alyce', 'Toy','1975-03-26', 'russel.ewell@example.com', '9754884857'),
	('24', 'Oma', 'Ortiz','1975-03-26', 'jailyn.feest@example.com', '9339073755'),
	('25', 'Valentine', 'Goldner','1975-03-26', 'matteo.wiza@example.net', '9803404650'),
	('26', 'Rasheed', 'Ebert','1975-03-26', 'brenden32@example.net', '9924275184'),
	('27', 'Misael', 'Lakin', '1975-03-26','benjamin.hilpert@example.com', '9619165091'),
	('28', 'Shaun', 'Fritsch','1977-09-26', 'wwiegand@example.org', '9231898080'),
	('29', 'Katarina', 'Sipes', '1998-03-21','jenifer.gislason@example.net', '9348426774')
;
-- ----------------------------------------------------------------------------------------

-- Список городов
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
	`id` SERIAL PRIMARY KEY,
	`city_name` varchar(50),
	KEY index_of_city_name(city_name)
);

INSERT INTO `city` 
(`id`, `city_name`) 
VALUES ('8', 'Adamsstad'),
('5', 'Benedictfurt'),
('6', 'Boehmton'),
('7', 'New Kayden'),
('10', 'North Damianstad'),
('9', 'Port Ana'),
('3', 'Port Green'),
('1', 'South Anabelton'),
('2', 'South Claudiehaven'),
('4', 'West Dejuanside');

-- ----------------------------------------------------------------------------------------
-- Почтовый индекс
DROP TABLE IF EXISTS `zip_code`;
CREATE TABLE `zip_code` (
	`id` SERIAL PRIMARY KEY,
	`city_id` bigint unsigned NOT NULL,
	`state_code` int,
	FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
);

INSERT INTO `zip_code` VALUES 
	('1','1', '07302'),
	('2','2','07302'),
	('3','3','07302'),
	('4','4','07302'),
	('5','5','07302'),
	('6','1','07302'),
	('7','1','07302');

-- ----------------------------------------------------------------------------------------
-- Адресса клиентов
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
	`id` SERIAL PRIMARY KEY,
  	`address_from_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`address_to_date` DATETIME DEFAULT NULL,
	`address` varchar(120) DEFAULT NULL,
	`zip_code_id`  bigint unsigned NOT NULL,
	`client_id` bigint unsigned NOT NULL,
	FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`),
	FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
);

INSERT INTO `address` 
VALUES 
	('1','2019-10-30 09:19:58',NULL,'33002 Effertz Grove\nEast Earlland, CA 74915-2644','1','1'),
	('2','2019-10-03 04:06:11',NULL,'79889 Brendan Brook\nSouth Fritz, SD 74067-6221','2','2'),
	('3','2019-06-10 19:30:58',NULL,'59356 Kassandra Well\nPort Frederickfurt, DC 36164','3','3'),
	('4','2019-05-10 08:47:46',NULL,'4125 Hettie Shoals Apt. 775\nDuaneland, ME 21125-5823','4','4'),
	('5','2019-11-28 09:43:40',NULL,'897 Juliana Wells\nEast Dorthaburgh, AZ 43984-9982','5','5'),
	('6','2019-02-14 01:06:38',NULL,'897 Kirlin Extensions\nGrimesburgh, VA 44465-4110','6','6'),
	('7','2019-03-14 08:18:31',NULL,'195 Shaina Street Suite 769\nEleanoramouth, MO 44593','7','7'),
	('8','2019-11-13 12:33:40',NULL,'963 Lowe Well\nNew Mariettafurt, VT 50252','1','8'),
	('9','2019-12-16 15:47:10',NULL,'0670 Salvatore Courts Suite 096\nSouth Anselland, CO 83914-5343','1','9'),
	('10','2019-03-17 06:13:07',NULL,'9157 Terrance Pines\nBradtkeville, NH 94739-8131','2','10'),
	('11','2019-12-24 21:16:48',NULL,'99609 Broderick Throughway Apt. 317\nLennashire, AZ 18842-6020','3','11'),
	('12','2019-03-23 12:34:49',NULL,'27945 Langworth Stream\nGoodwinview, AR 76231','4','12'),
	('13','2019-02-10 12:07:09',NULL,'445 Olaf Fords Suite 958\nNorth Katheryn, OK 77162','5','13'),
	('14','2016-05-23 15:41:32',NULL,'3464 Brekke Shore\nHesselshire, IL 35135','6','14'),
	('15','2019-11-22 07:14:47',NULL,'18697 Nienow Key\nLeannonburgh, AK 79567-2637','7','15'),
	('16','2011-12-18 23:18:53',NULL,'61302 Carli Parkways Apt. 530\nEinofurt, OK 56147-9078','1','16'),
	('17','2019-02-08 10:16:22',NULL,'568 Katelyn Shores\nSouth Herbertstad, ME 61203-5721','1','17'),
	('18','2010-02-03 21:33:50',NULL,'43070 Wilkinson Cape\nWolfview, MS 50394-7410','3','18'),
	('19','2000-12-09 10:43:33',NULL,'185 Reynolds Pines Suite 657\nAldaview, AL 99492','1','20'),
	('20','2019-07-31 16:48:48',NULL,'40941 Kyler Cliff Apt. 890\nLake Devonteville, CO 04256','1','19'),
	('21','2019-06-10 09:18:08',NULL,'1160 Heaney Forest Suite 182\nHaleighton, AR 40376','5','21'),
	('22','2019-10-14 05:02:57',NULL,'045 Yazmin Forges Apt. 641\nEast Devante, OK 61427','1','29'),
	('23','2019-04-15 09:30:28',NULL,'02300 Camila Shoals\nSouth Nat, DC 90076-4402','5','22'),
	('24','2019-08-27 02:42:27',NULL,'18864 Larry Port\nGerlachland, IN 04552-7795','1','23'),
	('25','2018-06-13 23:30:22',NULL,'42249 Welch Cliffs Suite 081\nLake Mortonmouth, IL 06887-4827','1','24'),
	('26','2018-07-10 22:06:17',NULL,'383 Borer Centers Apt. 539\nNorth Roberta, WA 01404','1','25'),
	('27','2018-04-06 03:05:36',NULL,'553 Devonte Court Apt. 318\nSouth Destiny, NE 16100-4950','1','26'),
	('28','2018-05-25 14:04:02',NULL,'20844 Sporer Ports\nPort Demarco, PA 26558','2','27'),
	('29','2018-10-10 16:47:42',NULL,'27046 Jazmyne Ranch\nCurtview, MN 73599-4925','3','28'),
	('30','2008-07-26 15:00:07',NULL,'6860 Lilyan Plains\nNew Millerstad, WI 63189','4','11'),
	('31','2014-12-26 11:59:43',NULL,'9843 Gottlieb Trafficway Suite 290\nLake Shayne, TN 87042','5','7'),
	('32','2014-11-26 18:49:18',NULL,'350 Moore Shores\nSchowalterfurt, SD 50584','1','2'),
	('33','2018-01-15 07:44:33',NULL,'17919 Joesph Extensions\nNew Garnett, RI 22089-0391','1','2'),
	('34','2018-08-22 13:58:10',NULL,'23617 Corene Divide\nWest Nannieview, IL 15659','1','2'),
	('35','2018-05-10 11:35:21',NULL,'9278 Brakus Harbors Suite 278\nBethelfurt, RI 67984','1','2'),
	('36','2018-01-23 04:42:58',NULL,'4291 Noe Plains Suite 406\nChaddmouth, NH 61113','1','2'),
	('37','2012-07-31 02:15:20',NULL,'1689 Mateo Terrace\nEast Marilie, AL 52189','1','2'),
	('38','2018-08-12 14:32:53',NULL,'325 Stokes Field\nWilliamsonland, IA 22094-5730','1','2'),
	('39','2018-02-11 01:15:56',NULL,'788 Melvina Heights Apt. 641\nNew Beverlyland, IL 37968','1','2'),
	('40','2019-02-18 16:53:56',NULL,'2605 Judy Park Suite 266\nPort Candelario, MN 85174','1','2'),
	('41','2018-01-15 11:27:08',NULL,'43720 Kamron Pines\nBalistrerihaven, ME 34785','1','2'),
	('42','2016-12-31 05:04:34',NULL,'9766 Schmitt Ville\nPort Romaineville, MA 65529','1','2'),
	('43','2019-03-20 08:34:54',NULL,'5477 Jamal Burg\nConnellyburgh, NY 52736','1','2'),
	('44','2018-11-22 01:32:35',NULL,'71666 Bette Ford\nSchroederfort, OH 14604-0101','1','2')
;

-- ----------------------------------------------------------------------------------------
-- Статус 
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
	`id` SERIAL PRIMARY KEY,
	`order_status_code` char(10),
	`order_status_description` text
);

INSERT INTO `order_status` 
VALUES
	('1','90438','Новая запись'),
	('2','52997','В процессе'),
	('3','05620','Запись подтверждена'),
	('4','26805','Запись не подтверждена'),
	('5','85387','Клиент выписался');

-- ----------------------------------------------------------------------------------------
-- Заказы
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
	`id` SERIAL PRIMARY KEY,
	`client_id` bigint unsigned NOT NULL,
	`delivery_name` varchar(50),
	`email` varchar(50),
	`purchase_data` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`order_status_id`  bigint unsigned NOT NULL,
	`delivery_address_id` bigint unsigned,
	`total_price` int,
	FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
	FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`),
	FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
	KEY index_of_order_status_id(order_status_id),
	KEY index_of_delivery_address_id(delivery_address_id),
	KEY index_of_client_id(client_id)
);




-- ----------------------------------------------------------------------------------------
-- Запись в салон
DROP TABLE IF EXISTS `sign_up`;
CREATE TABLE `sign_up` (
  `id` SERIAL PRIMARY KEY,
  `order_id` bigint unsigned NOT NULL, 
  `masters_type_id` bigint unsigned NOT NULL,  
  `categories_id` bigint unsigned NOT NULL, 
  `name_services_id` bigint unsigned NOT NULL, 
  `name` varchar(50) DEFAULT NULL,
  `count` int NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int,
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`masters_type_id`) REFERENCES `masters` (`id`),
  FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  FOREIGN KEY (`name_services_id`) REFERENCES `services` (`id`)
);

INSERT INTO `sign_up` 
(`id`, `order_id`, `masters_type_id`, `categories_id`, `name_services_id`, `name`, `count`, 
`body`, `created_at`, `updated_at`, `price`)
VALUES 
('1', '1', '1', '1', '1', 'quis', 3, 'Ducimus aut quia ut sit aut voluptatibus odio. Aliquid animi aut ut alias sit. At odio necessitatibus dignissimos veritatis sed ullam velit. Quo dolor sint sapiente incidunt itaque quas non.', '2011-08-20 01:38:26', '1973-10-24 02:20:06', 6798317),
('2', '2', '2', '2', '2', 'qui', 4080599, 'Dolores officia est voluptatem voluptate libero. Voluptatem fugiat numquam expedita beatae consequatur. Similique delectus soluta omnis voluptas. Quia dolore est omnis qui aut excepturi.', '1976-07-27 09:52:35', '2019-03-27 04:26:34', 1575673),
('3', '3', '3', '3', '3', 'ullam', 9, 'Explicabo deserunt aspernatur consequatur sequi accusantium atque voluptatum. Voluptatem aut mollitia ut qui voluptatem. Numquam eum est totam mollitia voluptatum sunt sunt. Delectus qui sit eum vel.', '2013-12-12 02:17:49', '2009-10-08 22:52:36', 166959384),
('4', '4', '4', '4', '4', 'exercitationem', 5754802, 'Aliquam repudiandae soluta quis explicabo. Non in ut placeat quae cumque assumenda corporis et. Id similique laborum qui. Est sint enim consequatur aut natus iure.', '1970-10-29 16:58:15', '2012-05-21 13:51:56', 297457),
('5', '5', '5', '5', '5', 'harum', 24890187, 'Quia natus id distinctio nihil deleniti optio. Explicabo omnis voluptas voluptatem ipsa. Veritatis quia similique consequatur quod non expedita.', '1989-12-07 14:06:43', '2009-11-08 09:48:08', 7),
('6', '6', '1', '1', '6', 'et', 45214105, 'Officia expedita voluptatum rerum consectetur molestias. Quos vel architecto nostrum in fugit inventore rem ut. Voluptatum facilis excepturi nostrum aliquid.', '1977-11-19 22:43:45', '2001-05-15 02:45:07', 0),
('7', '7', '2', '2', '7', 'et', 8377967, 'Mollitia qui ut fugit facilis minima voluptatem magni. Fugit explicabo autem expedita facilis.', '1981-04-24 15:09:45', '2016-06-09 18:23:25', 0),
('8', '8', '3', '3', '8', 'alias', 72590, 'Atque reiciendis architecto est repudiandae. Suscipit ut similique sequi sit odit at. Molestiae corporis explicabo accusamus vitae porro sequi iste. Voluptatem atque pariatur quia commodi.', '1990-09-11 12:06:09', '2018-02-19 11:50:12', 5),
('9', '9', '4', '4', '9', 'voluptatem', 0, 'Reiciendis et et corrupti occaecati totam quia. Quia ut sit similique porro aperiam unde. Nihil voluptatem nam ea libero et doloribus fuga. Et corporis quia sapiente voluptatem quae.', '1972-03-13 11:58:44', '2019-01-08 00:15:48', 286074342),
('10', '10', '5', '5', '10', 'tenetur', 1983830, 'Possimus dolor reprehenderit aperiam. Quasi aliquid magni sunt impedit temporibus. Aperiam eos aut vel voluptatibus a.', '1994-05-12 01:48:15', '2001-03-02 01:46:32', 25948),
('11', '1', '1', '1', '1', 'exercitationem', 88140, 'Consectetur voluptatem id facilis quidem vel id praesentium eaque. Nostrum cum in ad est commodi totam. Et quos quis culpa aut similique eius. Et sit facilis aliquid similique ea modi.', '1986-05-05 07:26:18', '1997-10-29 16:57:50', 1248050),
('12', '2', '2', '2', '2', 'adipisci', 304514411, 'Sint voluptatem non incidunt beatae. Maiores neque officia ullam assumenda quasi. Nihil aspernatur expedita veniam est sequi nostrum.', '1997-11-22 00:28:41', '1984-09-16 06:49:59', 0),
('13', '3', '3', '3', '3', 'odio', 281, 'Omnis impedit voluptatum aut esse aut. Porro facilis saepe occaecati voluptatem ex quia mollitia. Et inventore ipsam ea non quas quia voluptatum. Sit neque rerum doloremque ut est. Pariatur nihil maiores velit voluptatem magnam et.', '1991-03-07 20:43:29', '2003-12-23 11:27:03', 0),
('14', '4', '4', '4', '4', 'aspernatur', 2695860, 'Occaecati numquam eveniet quasi eligendi eos dignissimos a ea. Est dolorem et et molestias quo. Quo illum est eos ex nam. Occaecati sit dolore sapiente ea.', '2017-05-31 12:06:47', '1990-10-08 23:23:47', 97),
('15', '5', '5', '5', '5', 'labore', 581398, 'Amet autem et omnis. Ex velit necessitatibus ullam ut sint quia aut dolorem. Repudiandae quae mollitia qui fuga pariatur. Sed et voluptas quia saepe et ea.', '1982-10-04 06:23:20', '1977-10-02 05:41:36', 131884),
('16', '6', '1', '1', '6', 'sunt', 482724, 'Minima aut earum quia qui officia sit molestiae. Totam vitae et ut temporibus mollitia. Totam autem repellat consequatur facere blanditiis. Non et dignissimos aut vitae dicta.', '1994-04-30 17:33:59', '2001-10-05 09:48:22', 314805),
('17', '7', '2', '2', '7', 'fugit', 28745, 'Doloremque provident nihil autem explicabo non eius dolore ex. Nisi eum rem incidunt saepe non reprehenderit. Numquam quis minus et repudiandae quia repellendus rerum. Consectetur necessitatibus temporibus quod ut sit laborum aliquam.', '2009-04-22 06:25:45', '1970-07-24 19:11:10', 3539),
('18', '8', '3', '3', '8', 'voluptas', 2497684, 'Non ex sit facere animi sapiente nesciunt optio. Quod repellat voluptate at itaque molestiae unde porro totam. Quasi illo omnis ut. Nulla voluptate dolorem quaerat. Neque voluptates esse consectetur ut et aut rem voluptates.', '2008-06-17 11:48:01', '1971-11-07 12:55:46', 89520198),
('19', '9', '4', '4', '9', 'odio', 0, 'Voluptatum voluptas maxime ea esse asperiores. Ipsam doloremque eos qui aut quasi sit. Voluptas omnis minus in.', '1972-08-12 14:15:42', '2014-08-07 00:22:40', 3138070),
('20', '10', '5', '5', '10', 'assumenda', 488634543, 'Quas et error sapiente. Exercitationem voluptatibus ipsa animi qui. Sunt dolore numquam nobis et voluptatem et. Architecto culpa consequatur et distinctio veritatis.', '2012-03-25 16:06:06', '1996-08-18 22:54:00', 9359)
;




