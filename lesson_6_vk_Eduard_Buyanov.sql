/*������������ ������� �� ���� ����������, ����������, ���������� � �����������. ��������� �������. 
 * �������� � �� vk � �������, ������� �� ������������� �����:*/
-- ____________________________________________________________________________________________________________
/*����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, 
 * ������� ������ ���� ������� � ����� �������������.*/


use vk;

SELECT from_user_id, count(*) FROM messages 
  	WHERE to_user_id = 2 
  	GROUP BY from_user_id 
  	ORDER BY count(*) DESC  LIMIT 1
  	
  	
-- ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.

SELECT  count(*) AS total_likes 
	FROM likes WHERE user_id IN (SELECT user_id FROM profiles p2 WHERE floor(datediff(curdate(), p2.birthday)/365) < 10 )
	ORDER BY total_likes 
	
	
-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

	SELECT count(*) AS total, 
	
	(SELECT CASE (gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender FROM profiles WHERE user_id=likes.id ) AS gender
	
    FROM likes
	GROUP BY gender
  	
  	
  	
  	