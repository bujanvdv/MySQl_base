/* #1 ����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� 
�������� ����� � ��������.*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = '����������';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('��������', '1990-10-05', NULL, NULL),
  ('�������', '1984-11-12', NULL, NULL),
  ('���������', '1985-05-20', NULL, NULL),
  ('������', '1988-02-14', NULL, NULL),
  ('����', '1998-01-12', NULL, NULL),
  ('�����', '1992-08-29', NULL, NULL);

SELECT * FROM users;

UPDATE users SET created_at= now(), updated_at=now()

SELECT * FROM users;
-- ___________________________________________________________________________________________________________

/* #2 ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� 
VARCHAR � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� 
���� � ���� DATETIME, �������� �������� ����� ��������.*/


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(100),
  updated_at VARCHAR(100)
) COMMENT = '����������';

INSERT INTO users (name, birthday_at, created_at, updated_at ) VALUES
  ('��������', '1990-10-05', '01.01.2000 11:11', '01.01.2000 11:11'),
  ('�������', '1984-11-12', '02.02.2000 22:22', '02.02.2000 22:22'),
  ('���������', '1985-05-20', '03.03.2000 13:22', '03.03.2000 13:22'),
  ('������', '1988-02-14','03.03.2000 13:22', '03.03.2000 13:22'),
  ('����', '1998-01-12','03.03.2000 13:22', '03.03.2000 13:22'),
  ('�����', '1992-08-29', '03.03.2000 13:22', '03.03.2000 13:22');

SELECT * FROM users;

UPDATE users SET 
	created_at =STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"),
	updated_at =STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i");

ALTER TABLE users MODIFY created_at DATETIME
ALTER TABLE users MODIFY updated_at DATETIME

DESCRIBE users; 

-- ___________________________________________________________________________________________________________
/* #3 � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ 
����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ 
���������� � �����, ����� ���� �������. */

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';


INSERT INTO storehouses_products(storehouse_id, product_id,value)
VALUES
	(1,2,0),
	(1,22,2500),
	(1,344, 0),
	(1, 567,30),
	(1, 9222,500),
	(1, 333, 1);

SELECT id, value, if(value>0,0,1) AS sort FROM storehouses_products sp ORDER BY sort, value;

SELECT * FROM storehouses_products;