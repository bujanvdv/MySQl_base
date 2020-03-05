/*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. 
 * Работаем с БД vk и данными, которые вы сгенерировали ранее:*/
-- ____________________________________________________________________________________________________________
/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
 * который больше всех общался с нашим пользователем.*/


use vk;

SELECT from_user_id, count(*) FROM messages 
  	WHERE to_user_id = 2 
  	GROUP BY from_user_id 
  	ORDER BY count(*) DESC  LIMIT 1
  	
  	
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

SELECT  count(*) AS total_likes 
	FROM likes WHERE user_id IN (SELECT user_id FROM profiles p2 WHERE floor(datediff(curdate(), p2.birthday)/365) < 10 )
	ORDER BY total_likes 
	
	
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

	SELECT count(*) AS total, 
	
	(SELECT CASE (gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender FROM profiles WHERE user_id=likes.id ) AS gender
	
    FROM likes
	GROUP BY gender
  	
  	
  	
  	