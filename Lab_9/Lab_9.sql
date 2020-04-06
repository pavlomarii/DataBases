SELECT U.id, U.name, U.surname, COUNT(AU.user_id) AS amount
FROM mydb.advertisement A INNER JOIN mydb.advertisement_user AU
	ON A.id = AU.advertisement_id
INNER JOIN mydb.user U
	ON AU.user_id = U.id
GROUP BY U.id
ORDER BY U.id;

SELECT YEAR(pubdate) AS year, MONTHNAME(pubdate) AS month,
COUNT(id) AS advertisement
FROM mydb.advertisement GROUP BY year, month WITH ROLLUP;

SELECT user_id, AVG(CHAR_LENGTH(text))
FROM mydb.comment
GROUP BY user_id
ORDER BY user_id;

SELECT MA.name, COUNT(AD.id) AS amount
FROM mydb.advertisement AD INNER JOIN mydb.auto AU
	ON AD.auto_id = AU.id
INNER JOIN mydb.model MO
	ON AU.model_id = MO.id
INNER JOIN mydb.mark MA
	ON MO.mark_id = MA.id
WHERE MONTH(AD.pubdate) = MONTH(CURRENT_DATE) - 1
GROUP BY MA.id
ORDER BY MA.id;
