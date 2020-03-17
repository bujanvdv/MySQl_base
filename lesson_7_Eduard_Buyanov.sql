/* Для решения заданий 7-го урока,создаем новую БД "shop_2"
 * в которой и будем выполнять задания
 */

DROP DATABASE shop_2;
CREATE DATABASE shop_2;

use shop_2;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` SERIAL PRIMARY KEY,
    `firstname` varchar(50) DEFAULT NULL,
    `lastname` varchar(50) DEFAULT NULL
);

INSERT INTO shop_2.users VALUES
('1', 'Ivanov', 'Ivan'),
('2', 'Petrov', 'Petr'),
('3', 'Sidorov', 'Sidor'),
('4', 'Udachin', 'Ivan');

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `lable` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
);

INSERT INTO shop_2.cities VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights` (
  `id` SERIAL PRIMARY KEY,
  `from` varchar(50) DEFAULT NULL,
  `to` varchar(50) DEFAULT NULL
);

INSERT INTO  `flights` VALUES
('1', 'moscow', 'omsk'),
('2', 'novgorod', 'kazan'),
('3', 'irkutsk', 'moscow'),
('4', 'omsk', 'irkutsk'),
('5', 'moscow', 'kazan');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` SERIAL PRIMARY KEY,
  `user_id`  BIGINT UNSIGNED NOT NULL,
  `flight_id`  BIGINT UNSIGNED NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`)
);

INSERT INTO shop_2.orders (user_id,flight_id,description,created_at) VALUES 
(1,1,'qwertyuiopoi sdfgjk  sdfghj dfvb','2020-03-09 17:43:41'),
(2,2,'qwertyuiopoi sdfgjk  sdfghj dfvb','2020-03-09 17:43:41')
;

/* Задание-1 Составьте список пользователей users, которые осуществили хотя бы один заказ 
 * orders в интернет магазине. 
 */

SELECT 
	`user_id`, 
	(SELECT `firstname` FROM `users` WHERE id=user_id) AS `firstname`, 
	(SELECT `lastname` FROM `users` WHERE id=user_id) AS `lastname`,
	`flight_id`
FROM 
	`orders`;

-- _______________________________________________________________________
	
SELECT 
u.firstname,
u.lastname,
o.flight_id,
o.user_id
FROM 
	orders AS o 
JOIN
	users AS u
USING(id);

-- ___________________________________________________________________________

SELECT * FROM 
orders o2 	
LEFT JOIN users
USING(id);


-- Задание-2 Выведите список товаров products и разделов catalogs, который соответствует товару.

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

 DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);


-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name AS products, c.name catalogs
FROM products AS p
JOIN catalogs AS c
using(id);

